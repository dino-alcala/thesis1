<%-- 
    Document   : OVPLM-budgetPerformanceReport
    Created on : 06 18, 18, 8:02:54 PM
    Author     : Karl Madrid
--%>
<%@page import="entity.Unit"%>
<%@page import="entity.FF"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.SE"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="entity.Notification"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UserDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>OVPLM Budget Performance Report</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/sidebar2.css">
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
        <script src="https://cdn.rawgit.com/emn178/Chart.PieceLabel.js/master/build/Chart.PieceLabel.min.js"></script>

        <!--datatables-->    

        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
        <style type="text/css" class="init"></style>

        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
        <script type="text/javascript" language="javascript" src="../resources/demo.js"></script>
        <script type="text/javascript" class="init"></script>

        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
            $(document).ready(function () {
                $('#example2').DataTable();
            });
        </script>

        <!--datatables-->   

        <script type="text/javascript">



            $('#body-row .collapse').collapse('hide');

            // Collapse/Expand icon
            $('#collapse-icon').addClass('fa-angle-double-left');

            // Collapse click
            $('[data-toggle=sidebar-colapse]').click(function () {
                SidebarCollapse();
            });

            function SidebarCollapse() {
                $('.menu-collapsed').toggleClass('d-none');
                $('.sidebar-submenu').toggleClass('d-none');
                $('.submenu-icon').toggleClass('d-none');
                $('#sidebar-container').toggleClass('sidebar-expanded sidebar-collapsed');
                // Treating d-flex/d-none on separators with title
                var SeparatorTitle = $('.sidebar-separator-title');
                if (SeparatorTitle.hasClass('d-flex')) {
                    SeparatorTitle.removeClass('d-flex');
                } else {
                    SeparatorTitle.addClass('d-flex');
                }

                // Collapse/Expand icon
                $('#collapse-icon').toggleClass('fa-angle-double-left fa-angle-double-right');
            }

        </script>

        <style>
            #notifsScroll {
                overflow-y: auto; 
                overflow-x: hidden;
                height: 250px;
            }

            .navbar-btn-profile {
                padding-right: 20px;
                padding-left: 20px;
            }

            .navbar-btn-logout {
                padding-right: 20px;
                padding-left: 20px;
            }
            body{
                background-color: whitesmoke;
                padding-top: 56px;
            }

            #myInput{
                margin-bottom: 20px;
            }

            .card-text{
                margin-bottom: 5px;
            }

            .progressnum{
                font-size: 12px;
            }

            .krascards:hover {
                background-color: lightgreen;
            }

            tr:hover {
                background-color: lightgreen;
            }

            h2{
                font-size: 30px;
                text-align: left;
                margin-top: 10px;
                border-bottom: 2px solid green;
                padding-bottom: 10px;
            }

            h3{
                padding-top: 25px;
                text-align: center;
                margin-bottom: 25px;
            }


            .table{
                border-bottom: 2px solid lightgray;
                margin-bottom: 30px;
            }

            .quickhead{
                border-bottom: 1px solid white;
                padding-bottom: 10px; 
                margin-bottom: 20px;

            }

            .quickhead2{
                border-bottom: 1px solid darkgreen;
                padding-bottom: 10px; 
                margin-bottom: 20px;
                color: black;
            }

            .quickview{
                margin-top: 20px;
                background-color: white;
                padding-bottom: 15px;
                border-style: solid;
                border-color: lightgray;
                border-width: 1px;
                border-radius: 8px;
            }

            .panels{
                margin-top: 20px;
                background-color: white;
                padding-bottom: 15px;
                border-style: solid;
                border-color: lightgray;
                border-width: 1px;
                border-radius: 8px;
            }

            .card-text{
                color: white;
            }

            .budget{
                font-size: 70px; 
                text-align: center; 
                font-family: 'Montserrat', sans-serif;
                border-bottom: 1px solid darkgreen;
                padding-bottom: 20px;
                margin-bottom: 20px;
            }

            .daterange{
                text-align: right;
            }

            .button {
                background-color: dodgerblue;
                border: none;
                color: white;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
                padding: 14px 40px;
            }

            .pbutton{
                margin-top: 40px;
                text-align: center;
            }

            .tableHead{
                background-color: darkgreen;
                color: white;
            }
            .tableHead2{
                background-color: darkcyan;
                color: white;
            }
            .card-text2{
                color:  black;
            }

            .card-text3{
                color:  black;
                font-weight: 500;
                margin-bottom: 50px;
            }

            .quickhead3{
                border-bottom: 2px solid black;
                padding-bottom: 10px; 
                margin-bottom: 20px;
                color: black;
            }

            #buttonCED {
                margin: 5px 5px 5px 10px;
                padding-left: 60px;
                padding-bottom: 15px;
                background-color: #008ae6;
            }

            #buttonCCS {
                margin: 5px 5px 5px 30px;
                padding-left: 60px;
                padding-bottom: 15px;
                background-color: #884dff;
            }

            #buttonCOL {
                margin: 5px 5px 5px 10px;
                padding-left: 60px;
                padding-bottom: 15px;
                background-color:  #ff3333;
            }

            #buttonCLA {
                margin: 5px 5px 5px 10px;
                padding-left: 60px;
                padding-bottom: 15px;
                background-color: #ff1a66;
            }

            #buttonCOS {
                margin: 5px 5px 5px 10px;
                padding-left: 60px;
                padding-bottom: 15px;
                background-color: #ffcc00;
            }

            #buttonCOE {
                margin: 5px 5px 5px 10px;
                padding-left: 60px;
                padding-bottom: 15px;
                background-color: #73e600;
            }

            #buttonCOB {
                margin: 5px 5px 5px 10px;
                padding-left: 60px;
                padding-bottom: 15px;
                background-color: #00cc00;
            }

            #buttonSOE {
                margin: 5px 5px 5px 10px;
                padding-left: 60px;
                padding-bottom: 15px;
                background-color: #2eb8b8;
            }

            .tableHead{
                background-color: darkgreen;
                color: white;
            }
            .tableHead2{
                background-color: darkcyan;
                color: white;
            }
            .total{
                text-align: center;
                margin-top: 20px;
                font-size: 40px;
                color: white;
                font-family: 'Montserrat', sans-serif;
            }

            .total2{
                color: white;
                font-size: 30px;
                font-family: 'Montserrat', sans-serif;
            }

            #buttonSE {
                margin: 5px 5px 5px 10px;
                padding-left: 60px;
                padding-bottom: 15px;
                background-color: #cc0099;
            }

            #buttonFF {
                margin: 5px 5px 5px 10px;
                padding-left: 60px;
                padding-bottom: 15px;
                background-color: #00e699;
            }

            #buttonCB {
                margin: 5px 5px 5px 10px;
                padding-left: 60px;
                padding-bottom: 15px;
                background-color: #FFC300;
            }

            .quickhead3{
                border-bottom: 2px solid black;
                padding-bottom: 10px; 
                margin-bottom: 20px;
                color: black;
            }

            .chartscards{
                background-color: white;
                color: black;
            }

            #notifsScroll {
                overflow: auto; 
                height: 250px;
            }
        </style>

    </head>

    <body>

        <!-- Bootstrap NavBar -->
        <nav class="navbar navbar-expand-md fixed-top" id="navbar">
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation" id="smallerscreenmenuButton">
                <span class="fa fa-align-justify"></span>
            </button>
            <a class="navbar-brand" href="#" id="navbar-unit">
                <img src="https://upload.wikimedia.org/wikipedia/en/thumb/c/c2/De_La_Salle_University_Seal.svg/1200px-De_La_Salle_University_Seal.svg.png" width="30" height="30" class="d-inline-block align-top" data-toggle="sidebar-colapse" id="collapse-icon">
                <span class="menu-collapsed">Office of the Vice President for Lasallian Mission</span>
            </a>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown d-sm-block d-md-none">
                        <a class="nav-link" href="OVPLM-home.html" id="smallerscreenmenu">
                            Home
                        </a>
                        <a class="nav-link" href="MULTIPLE-faithFormationProgramsList.html" id="smallerscreenmenu">
                            Programs
                        </a>
                        <a class="nav-link" href="MULTIPLE-unitsList.html" id="smallerscreenmenu">
                            Units
                        </a>
                        <a class="nav-link" href="MULTIPLE-communityList.html" id="smallerscreenmenu">
                            Communities
                        </a>
                        <a class="nav-link" href="MULTIPLE-krasList.html" id="smallerscreenmenu">
                            Key Result Areas
                        </a>
                        <a class="nav-link" href="#" id="smallerscreenmenu">
                            Reports
                        </a>
                        <a class="nav-link" href="#" id="smallerscreenmenu">
                            Evaluation Forms
                        </a>
                    </li>
                </ul>
            </div>
            <ul class="navbar-nav mr auto">
                <div class="nav-button">
                    <button type="button" class="btn btn-info navbar-btn-profile">
                        <i class="fa fa-user-circle"></i>
                    </button>
                </div>
                <div class="nav-button">
                    <div class="dropdown">
                        <button type="button" class="btn btn-info navbar-btn-notifications" href="#" data-toggle="dropdown">
                            <span class="badge badge-pill badge-primary" style="background-color:red; color:white; float:right;margin-bottom:-20px;">!</span> 
                            <i class="fa fa-bell"></i>
                        </button>
                        <ul class="dropdown-menu">
                            <div id="notifsScroll">
                                <%
                                    UserDAO UserDAO = new UserDAO();
                                    ArrayList<Notification> n = new ArrayList();
                                    n = UserDAO.retrieveNotificationByUserID(Integer.parseInt(session.getAttribute("userID").toString()));

                                    for (int i = 0; i < n.size(); i++) {
                                %>
                                <li class="notification-box" href="#">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <strong class="notificationBoxHeader"><%=n.get(i).getTitle()%></strong>
                                            <div class="notificationBoxMessage">
                                                <%=n.get(i).getBody()%>
                                            </div>
                                        </div>    
                                    </div>
                                </li>
                                <%
                                    }
                                %>
                            </div>
                        </ul>
                    </div>
                </div>
                <div class="nav-button">
                    <a href="index.jsp" class="btn btn-info navbar-btn-logout">
                        <i class="fa fa-sign-out"></i>
                    </a>
                </div>
            </ul>
        </nav>
        <!-- NavBar END -->

        <!-- Bootstrap row -->
        <div class="row" id="body-row">

            <!-- Sidebar -->
            <div id="sidebar-container" class="sidebar-expanded d-none d-md-block">
                <script>
                    $("#sidebar-container").load("sidebarovplm.jsp");
                </script>
            </div>
            <!-- sidebar-container END -->

            <!-- MAIN -->
            <div class="col py-3">
                <form action="viewBudgetPerformanceReport" method="post">
                    <div class="container-fluid panels">
                        <p></p>
                        <p>Enter Report Range: From: <input type="date" <%if (request.getAttribute("dated") != null) {%> value="<%=Date.valueOf(request.getAttribute("startDate").toString())%>" <%}%> name="startDate" required> To: <input type="date" <%if (request.getAttribute("dated") != null) {%> value="<%=Date.valueOf(request.getAttribute("endDate").toString())%>" <%}%> name="endDate" required></p>
                        <!--
                        <button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-print"></span>Print Report</button>
                        <button type="button" class="btn btn-success">Download Report</button>
                        -->
                        <button type="submit">Submit</button>
                    </div>
                </form>

                <!---pie chart-->
                <%
                    if (request.getAttribute("dated") != null) {
                %>
                <div class="container-fluid panels">
                    <%
                        DecimalFormat df = new DecimalFormat("#,###,###,###.##");
                    %>

                    <h2 class="kraheading"> Overall Budget Expenses (<%=request.getAttribute("startDate")%> - <%=request.getAttribute("endDate")%>)</h2>

                    <div class="card-deck">
                        <div class="card bg-info">
                            <div class="card-body text-center">
                                <p class="card-text"><b>Initial Budget (as of <%=Date.valueOf(request.getAttribute("startDate").toString())%>)</b></p>
                                <p class="total">PHP <%=df.format(UserDAO.getInitialBudgetByDate(Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString())))%></p>
                            </div>
                        </div>
                        <div class="card bg-info">
                            <div class="card-body text-center">
                                <p class="card-text"><b>Budget Remaining (as of <%=Date.valueOf(request.getAttribute("endDate").toString())%>)</b></p>
                                <p class="total">PHP <%=df.format(UserDAO.getRemainingBudgetByDate(Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString())))%></p>
                            </div>
                        </div> 
                    </div>

                </div>
                <!--- pie chart-->

                <!--- Units -->
                <div class="container-fluid panels">

                    <h2>Unit's Budget Expenses (<%=request.getAttribute("startDate")%> - <%=request.getAttribute("endDate")%>)</h2>

                    <div class="card-deck">
                        <div class="card chartscards">
                            <div id="canvas-holder" style="width:75%;">
                                <canvas id="chartBPRu"  width="100" height="90" style="margin-left:115px"></canvas>
                            </div>
                        </div>
                        <script>
                            <%
                                ArrayList<Unit> units = new ArrayList();
                                units = UserDAO.retrieveUnits();
                                %>
                            Chart.defaults.global.legend.display = false;
                            var ctx = document.getElementById('chartBPRu').getContext('2d');
                            var chartBPRu = new Chart(ctx, {
                                type: 'horizontalBar',
                                data: {
                                    labels: [<%for (int i = 0; i < units.size(); i++) {%>"<%=units.get(i).getName()%>",<%}%>],
                                    datasets: [
                                        {
                                            label: "Social Engagement",
                                            backgroundColor: [<%for (int i = 0; i < units.size(); i++) {%>"#EA7A2D",<%}%>],
                                            data: [<%for (int i = 0; i < units.size(); i++) {%> <%=UserDAO.getIndividualSEBudgetRequestedByUnitDate(units.get(i).getName(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%>, <%}%>]
                                        }
                                        , {
                                            label: "Faith Formation",
                                            backgroundColor: [<%for (int i = 0; i < units.size(); i++) {%>"#2D36EA",<%}%>],
                                            data: [<%for (int i = 0; i < units.size(); i++) {%> <%=UserDAO.getIndividualFFBudgetRequestedByUnitDate(units.get(i).getName(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%>, <%}%>]
                                        }]

                                },
                                options: {
                                    legend: {
                                        display: true,
                                        position: 'top',
                                        labels: {
                                            fontSize: 15
                                        }
                                    },
                                    title: {
                                        display: true,
                                    },
                                    scales: {
                                        yAxes: [{
                                                ticks: {
                                                    fontSize: 16
                                                }
                                            }],
                                        xAxes: [{
                                                ticks: {
                                                    beginAtZero: true,
                                                    fontSize: 16
                                                }
                                            }]
                                    },
                                    tooltips: {
                                        titleFontSize: 18,
                                        bodyFontSize: 18
                                    }
                                }
                            });
                        </script>
                    </div>

                </div>
                <!--- Units -->

                <!--- budget -->
                <div class="container-fluid panels">

                    <h2>Program's Budget Expenses (<%=request.getAttribute("startDate")%> - <%=request.getAttribute("endDate")%>)</h2>

                    <div class="card-deck">
                        <div class="card bg-white">
                            <div class="card-body text-center">
                                <div id="canvas-holder" style="width:50%" >
                                    <canvas id="chartBPRb" style="margin-left:260px"></canvas>
                                </div>
                                <script>
                                    Chart.defaults.global.legend.display = true;
                                    var ctx = document.getElementById('chartBPRb').getContext('2d');
                                    ctx.canvas.width = 35;
                                    ctx.canvas.height = 20;
                                    var chartBPRb = new Chart(ctx, {
                                        type: 'pie',
                                        data: {
                                            labels: ['Programs Funded by OVPLM', 'Programs Funded by Others'],
                                            datasets:
                                                    [{
                                                            data: [<%=UserDAO.countOVPLMPrograms(Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%>, <%=UserDAO.countOtherPrograms(Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%>],
                                                            backgroundColor: ['#5A82B2', '#DCDF01']
                                                        }],
                                        },
                                        options: {
                                            legend: {
                                                display: true,
                                                position: 'bottom',
                                                labels: {
                                                    boxWidth: 60,
                                                    fontSize: 20
                                                }
                                            },
                                            tooltips: {
                                                titleFontSize: 18,
                                                bodyFontSize: 18
                                            }
                                        }

                                    });
                                </script> 
                            </div>
                        </div>
                    </div>

                    <h2></h2>

                    <div class="card-deck">
                        <div class="card bg-success">
                            <div class="card-body text-center">
                                <p class="card-text"><b>Programs Budget Requested (as of <%=Date.valueOf(request.getAttribute("endDate").toString())%>)</b></p>
                                <p class="total2">PHP <%=df.format(UserDAO.getBudgetRequestedByDate(Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString())))%></p>
                            </div>
                        </div>
                        <div class="card bg-success">
                            <div class="card-body text-center">
                                <p class="card-text"><b>Programs Budget Utilized (as of <%=Date.valueOf(request.getAttribute("endDate").toString())%>)</b></p>
                                <p class="total2">PHP <%=df.format(UserDAO.getUtilizedBudgetByDate(Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString())))%></p>
                            </div>
                        </div> 
                        <div class="card bg-success">
                            <div class="card-body text-center">
                                <p class="card-text"><b>Programs Budget Variance (as of <%=Date.valueOf(request.getAttribute("endDate").toString())%>)</b></p>
                                <p class="total2">PHP <%=df.format(UserDAO.getBudgetRequestedByDate(Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString())) - UserDAO.getUtilizedBudgetByDate(Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString())))%></p>
                            </div>
                        </div> 
                    </div>

                    <h2></h2>

                    <h3>Social Engagement Programs</h3>
                    <%
                        ArrayList<SE> seproposal = new ArrayList();
                        seproposal = UserDAO.retrieveSEProposalAmountRequestedByDate(Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
                    %>

                    <table id="example" class="table table-striped table-bordered" style="width:100%">
                        <thead  class="thead-dark">
                            <tr>
                                <th>Program</th>
                                <th>Unit</th>
                                <th>Department</th>
                                <th>Amount Requested</th>
                                <th>Amount Utilized</th>
                                <th>Variance</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (int i = 0; i < seproposal.size(); i++) {
                            %>
                            <tr>
                                <td><%=seproposal.get(i).getName()%></td>
                                <td><%=seproposal.get(i).getUnit()%></td>
                                <td><%=seproposal.get(i).getDepartment()%></td>
                                <td>₱<%=seproposal.get(i).getTotalAmount()%></td>
                                <td>₱<%=UserDAO.getUtilizedBudgetBySEIDDate(seproposal.get(i).getId(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%></td>
                                <td>₱<%=seproposal.get(i).getTotalAmount() - UserDAO.getUtilizedBudgetBySEIDDate(seproposal.get(i).getId(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>

                    <h2></h2>

                    <h3>Faith Formation Programs</h3>
                    <%
                        ArrayList<FF> ffproposal = new ArrayList();
                        ffproposal = UserDAO.retrieveFFProposalAmountRequestedByDate(Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
                    %>

                    <table id="example2" class="table table-striped table-bordered" style="width:100%">
                        <thead  class="thead-dark">
                            <tr>
                                <th>Program</th>
                                <th>Unit</th>
                                <th>Department</th>
                                <th>Amount Requested</th>
                                <th>Amount Utilized</th>
                                <th>Variance</th>
                            </tr>
                        </thead>
                        <tbody>
                              <%
                                for (int i = 0; i < ffproposal.size(); i++) {
                            %>
                            <tr>
                                <td><%=ffproposal.get(i).getProjectName()%></td>
                                <td><%=ffproposal.get(i).getUnit()%></td>
                                <td><%=ffproposal.get(i).getDepartment()%></td>
                                <td>₱<%=ffproposal.get(i).getTotalAmount()%></td>
                                <td>₱<%=UserDAO.getUtilizedBudgetByFFIDDate(ffproposal.get(i).getId(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%></td>
                                <td>₱<%=ffproposal.get(i).getTotalAmount() - UserDAO.getUtilizedBudgetByFFIDDate(ffproposal.get(i).getId(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>

                </div>
                <%
                    }
                %>
                <!--- end of budget -->

            </div>

        </div>
        <!-- body-row END -->

        <script>
            // sandbox disable popups
            if (window.self !== window.top && window.name != "view1") {
                ;
                window.alert = function () {/*disable alert*/
                };
                window.confirm = function () {/*disable confirm*/
                };
                window.prompt = function () {/*disable prompt*/
                };
                window.open = function () {/*disable open*/
                };
            }

            // prevent href=# click jump
            document.addEventListener("DOMContentLoaded", function () {
                var links = document.getElementsByTagName("A");
                for (var i = 0; i < links.length; i++) {
                    if (links[i].href.indexOf('#') != -1) {
                        links[i].addEventListener("click", function (e) {
                            console.debug("prevent href=# click");
                            if (this.hash) {
                                if (this.hash == "#") {
                                    e.preventDefault();
                                    return false;
                                } else {
                                    /*
                                     var el = document.getElementById(this.hash.replace(/#/, ""));
                                     if (el) {
                                     el.scrollIntoView(true);
                                     }
                                     */
                                }
                            }
                            return false;
                        })
                    }
                }
            }, false);
        </script>
        <script>
            // Hide submenus
            $('#body-row .collapse').collapse('hide');
            // Collapse/Expand icon
            $('#collapse-icon').addClass('fa-angle-double-left');
            // Collapse click
            $('[data-toggle=sidebar-colapse]').click(function () {
                SidebarCollapse();
            });
            function SidebarCollapse() {
                $('.menu-collapsed').toggleClass('d-none');
                $('.sidebar-submenu').toggleClass('d-none');
                $('.submenu-icon').toggleClass('d-none');
                $('#sidebar-container').toggleClass('sidebar-expanded sidebar-collapsed');
                // Treating d-flex/d-none on separators with title
                var SeparatorTitle = $('.sidebar-separator-title');
                if (SeparatorTitle.hasClass('d-flex')) {
                    SeparatorTitle.removeClass('d-flex');
                } else {
                    SeparatorTitle.addClass('d-flex');
                }

                // Collapse/Expand icon
                $('#collapse-icon').toggleClass('fa-angle-double-left fa-angle-double-right');
            }
        </script>
    </body>
</html>
