<%-- 
    Document   : OVPLM-perCommunityReport
    Created on : 06 18, 18, 8:05:27 PM
    Author     : Karl Madrid
--%>

<%@page import="entity.Unit"%>
<%@page import="entity.SE"%>
<%@page import="java.sql.Date"%>
<%@page import="entity.Community"%>
<%@page import="entity.Notification"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UserDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>Per-community Report</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/sidebar.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
        <script src="https://cdn.rawgit.com/emn178/Chart.PieceLabel.js/master/build/Chart.PieceLabel.min.js"></script>

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

        <style>   
            #myInput, #myInput2, #myInput3{
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
                font-size: 20px;
                text-align: left;
                margin-top: 15px;
                border-bottom: 2px solid green;
                padding-bottom: 5px;
                margin-bottom: 25px;
                font-family: 'Roboto', sans-serif;
            }


            .table{
                margin-bottom: 20px;
            }

            .totalsdiv{
                margin-top: 20px;
                background-color: white;
                padding-bottom: 15px;
                border-style: solid;
                border-color: lightgray;
                border-width: 1px;
                border-radius: 8px;
                align-content: center;
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

            .totaltitle{
                text-align: center;
                font-size: 20px;
            }

            .card-text{
                color: white;
                font-size: 20px;
                font-family: 'Montserrat', sans-serif;
            }

            .kras{
                margin-top: 20px;
                background-color: white;
                padding-bottom: 15px;
                border-style: solid;
                border-color: lightgray;
                border-width: 1px;
                border-radius: 8px;
                margin-bottom: 50px;
            }
            .daterange{
                text-align: right;
                margin-top: 30px;
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

            #notifsScroll {
                overflow: auto; 
                height: 250px;
            }

            .total{
                color: white;
                font-size: 40px;
                font-family: 'Montserrat', sans-serif;
            }

            .total2{
                color: white;
                font-size: 40px;
                font-family: 'Montserrat', sans-serif;
            }

        </style>

        <script>
            function PrintElem(elem)
            {
            var printContents = document.getElementById(elem).innerHTML;
            var originalContents = document.body.innerHTML;
            document.body.innerHTML = printContents;
            window.print();
            document.body.innerHTML = originalContents;
            }

            $(document).ready(function(){
            $("#printreport").hide();
            });
        </script>

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
                    <div class="dropdown">
                        <button type="button" class="btn btn-info navbar-btn-profile" href="#" data-toggle="dropdown">
                            <i class="fa fa-user-circle"></i>
                        </button>
                        <ul class="dropdown-menu">
                            <% UserDAO UserDAO = new UserDAO();%>
                            <div class="col-sm-12">
                                <legend style="font-size:14px;"><b>User ID:</b> <%=Integer.parseInt(session.getAttribute("userID").toString())%></legend>
                                <legend style="font-size:14px;"><b>Name:</b> <br><%=UserDAO.getFirstName(Integer.parseInt(session.getAttribute("userID").toString()))%> <%=UserDAO.getLastName(Integer.parseInt(session.getAttribute("userID").toString()))%></legend>
                                <legend style="font-size:14px;"><b>Unit/Position:</b> <br><%=session.getAttribute("position").toString()%></legend>
                            </div>
                        </ul>
                    </div>
                </div>
                <div class="nav-button">
                    <div class="dropdown">
                        <button type="button" class="btn btn-info navbar-btn-notifications" href="#" data-toggle="dropdown">
                            <span class="badge badge-pill badge-primary" style="background-color:red; color:white; float:right;margin-bottom:-20px;">!</span> 
                            <i class="fa fa-bell"></i>
                        </button>
                        <ul class="dropdown-menu">
                            <div id="notifsScroll">
                                <form action="notifClick">
                                    <%
                                        ArrayList<Notification> n = new ArrayList();
                                        n = UserDAO.retrieveNotificationByUserID(Integer.parseInt(session.getAttribute("userID").toString()));

                                        for (int i = 0; i < n.size(); i++) {
                                    %>
                                    <button type="submit" value="<%=n.get(i).getId()%>" name="redirect" style="width:100%; background-color:white; text-align:left;"> 
                                        <li class="notification-box">
                                            <strong class="notificationBoxHeader"><%=n.get(i).getTitle()%></strong><br>
                                            <%=n.get(i).getBody()%>
                                        </li>
                                    </button>
                                    <%
                                        }
                                    %>
                                </form>
                            </div>
                        </ul>
                    </div>
                </div>
                <div class="nav-button">
                    <form action="logout">
                        <button class="btn btn-info navbar-btn-logout"><i class="fa fa-sign-out"></i></button>
                    </form>
                </div>
            </ul>
        </nav>

        <!-- Bootstrap row -->
        <div class="row" id="body-row">

            <!-- Sidebar -->
            <div class="sidebar-expanded d-none d-md-block">
                <ul id="sidebar-container" class="list-group sticky-top sticky-offset">
                    <script>
                        $("#sidebar-container").load("sidebarmultiple.jsp");
                    </script>
                </ul>
            </div>

            <!-- MAIN -->
            <div class="col py-3">
                <form action="viewCommunityReport" method="post">
                    <div class="container-fluid panels">
                        <%
                            ArrayList<Community> c = new ArrayList();
                            c = UserDAO.retrieveCommunity();
                        %>
                        <p></p>
                        <p>Enter Report Range: From: <input type="date" <%if (request.getAttribute("dated") != null) {%> value="<%=Date.valueOf(request.getAttribute("startDate").toString())%>" <%}%> name="startDate" required> To: <input type="date" <%if (request.getAttribute("dated") != null) {%> value="<%=Date.valueOf(request.getAttribute("endDate").toString())%>" <%}%> name="endDate" required></p>
                        <div class="form-group">
                            <label for="sel1">Choose Community:</label>
                            <select class="form-control" id="type" name="community">
                                <option></option>
                                <%
                                    for (int i = 0; i < c.size(); i++) {
                                %>
                                <option value="<%=c.get(i).getId()%>" <%if (request.getAttribute("dated") != null) {
                                        if (Integer.parseInt(request.getAttribute("communityID").toString()) == c.get(i).getId()) {%> selected="selected"<%}
                                            }%> ><%=c.get(i).getName()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <%
                            if (request.getAttribute("dated") != null) {
                        %>
                            <button type="button" onclick="PrintElem('printreport')" class="btn btn-primary"><span class="glyphicon glyphicon-print"></span>Print Report</button>
                        <%}%>
                        <button class="btn btn-success" type="submit">Submit</button>
                    </div>

                </form>
                <%
                    if (request.getAttribute("dated") != null) {
                %>
                <!--- Totals -->
                <div class="container-fluid totalsdiv">

                    <h2 class="totaltitle"><%=UserDAO.getCommunitynameByID(Integer.parseInt(request.getAttribute("communityID").toString()))%></h2>

                    <div class="card-deck">
                        <div class="card bg-success">
                            <div class="card-body text-center">
                                <p class="card-text"><b>Programs Implemented</b></p>
                                <p class="total"><%=UserDAO.countProgramsCompletedByCommunityID(Integer.parseInt(request.getAttribute("communityID").toString()), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%></p>
                            </div>
                        </div>
                        <div class="card bg-success">
                            <div class="card-body text-center">
                                <p class="card-text"><b>Units Affiliated</b></p>
                                <p class="total"><%=UserDAO.countProgramsUnitAffliatedCompletedByCommunityID(Integer.parseInt(request.getAttribute("communityID").toString()), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%></p>
                            </div>
                        </div> 
                    </div>
                </div>


                <!--- Programs Completed -->
                <div class="container-fluid panels">

                    <h2>Programs Implemented (<%=request.getAttribute("startDate")%> - <%=request.getAttribute("endDate")%>)</h2>

                    <div class="card-deck">
                        <div class="card chartscardslong">
                            <div id="canvas-holder" style="width:60%">
                                <canvas id="chartSE"  width="200" height="80" style="margin-left:115px"></canvas>
                            </div>
                        </div>
                        <script>
                            Chart.defaults.global.legend.display = false;
                            var ctx = document.getElementById('chartSE').getContext('2d');
                            ctx.canvas.width = 35;
                            ctx.canvas.height = 20;
                            var chartSE = new Chart(ctx, {
                            type: 'horizontalBar',
                                    data: {
                                    labels: ["Socially Engaged Research", "Service Learning", "Interdisciplinary Fora", "Direct Service to the Poor and Marginalized", "Issue Awareness and Advocacy", "Public Engagement", "Others"],
                                            datasets: [
                                            {
                                            label: "# of Programs",
                                                    backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                    data: [<%=UserDAO.countProgramsActivityClassificationImplementedByCommunityID(Integer.parseInt(request.getAttribute("communityID").toString()), "Socially Engaged Research", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%>, <%=UserDAO.countProgramsActivityClassificationImplementedByCommunityID(Integer.parseInt(request.getAttribute("communityID").toString()), "Service-Learning", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%>, <%=UserDAO.countProgramsActivityClassificationImplementedByCommunityID(Integer.parseInt(request.getAttribute("communityID").toString()), "Interdisciplinary Fora", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%>, <%=UserDAO.countProgramsActivityClassificationImplementedByCommunityID(Integer.parseInt(request.getAttribute("communityID").toString()), "Direct Service to the Poor and Marginalized", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%>, <%=UserDAO.countProgramsActivityClassificationImplementedByCommunityID(Integer.parseInt(request.getAttribute("communityID").toString()), "Issue Awareness and Advocacy", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%>, <%=UserDAO.countProgramsActivityClassificationImplementedByCommunityID(Integer.parseInt(request.getAttribute("communityID").toString()), "Public Engagement", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%>, <%=UserDAO.countProgramsActivityClassificationImplementedByCommunityID(Integer.parseInt(request.getAttribute("communityID").toString()), "Others", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%>]
                                            }
                                            ]
                                    },
                                    options: {
                                    legend: {display: false},
                                            title: {
                                            display: true,
                                            },
                                            scales: {
                                            yAxes: [{
                                            ticks: {
                                            beginAtZero: true,
                                                    fontSize: 16
                                            }
                                            }],
                                                    xAxes: [{
                                                    ticks: {
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

                    <p></p>

                    <table id="example" class="table table-striped table-bordered" style="width:100%">
                        <%
                            ArrayList<SE> s = new ArrayList();
                            s = UserDAO.retrieveSEProposalCompletedByCommunityID(Integer.parseInt(request.getAttribute("communityID").toString()), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
                        %>
                        <thead class="thead-dark">
                            <tr>
                                <th>Date</th>
                                <th>Program Name</th>
                                <th>Program Head</th>
                                <th>Unit</th>
                                <th>Department</th>
                                <th>Activity Classification</th>
                                <th>Funded By</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (int i = 0; i < s.size(); i++) {
                            %>
                            <tr>
                                <td><%=s.get(i).getDate()%></td>
                                <td><%=s.get(i).getName()%></td>
                                <td><%=s.get(i).getProgramHead()%></td>
                                <td><%=s.get(i).getUnit()%></td>
                                <td><%=s.get(i).getDepartment()%></td>
                                <td><%=s.get(i).getActivityClassification()%></td>
                                <td><%=s.get(i).getSourceOfFunds()%></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>

                </div>

                <!--- Units -->
                <div class="container-fluid panels">
                    <h2 class="kraheading">Programs (<%=request.getAttribute("startDate")%> - <%=request.getAttribute("endDate")%>)</h2>

                    <div class="card-deck">
                        <div class="card chartscards">
                            <div id="canvas-holder" style="width:70%;">
                                <canvas id="chartBPRu"  width="100" height="30" style="margin-left:115px"></canvas>
                            </div>
                        </div>
                        <script>
                            Chart.defaults.global.legend.display = false;
                            var ctx = document.getElementById('chartBPRu').getContext('2d');
                            var chartBPRu = new Chart(ctx, {
                            type: 'bar',
                                    data: {
                            <%
                                ArrayList<Unit> units = UserDAO.retrieveUnitsAcademic();
                            %>

                                    labels: [<%for (int i = 0; i < units.size(); i++) {%>"<%=units.get(i).getAbbrev()%>",<%}%>],
                                            datasets: [
                                            {
                                            label: "Social Engagement",
                                                    backgroundColor: ["#EA7A2D", "#EA7A2D", "#EA7A2D", "#EA7A2D", "#EA7A2D", "#EA7A2D", "#EA7A2D", "#EA7A2D"],
                                                    data: [<%for (int i = 0; i < units.size(); i++) {%> <%=UserDAO.countProgramsUnitImplementedByCommunityID(Integer.parseInt(request.getAttribute("communityID").toString()), units.get(i).getName(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%>, <%}%>]
                                            }]

                                    },
                                    options: {
                                    legend: {
                                    display: false},
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

                <div id="printreport">
                    <legend>Community: <%=UserDAO.getCommunitynameByID(Integer.parseInt(request.getAttribute("communityID").toString()))%></legend>
                    <legend>Report Range: <%=Date.valueOf(request.getAttribute("startDate").toString())%> - <%=Date.valueOf(request.getAttribute("endDate").toString())%> (yyyy-mm-dd)</legend>
                    <br>
                    
                    <div class="container-fluid panels">
                        <h2 class="totaltitle">Programs Implemented</h2>
                        <table class="table table-striped table-bordered" style="width:100%">
                            <tr>
                                <th>SE Type</th>
                                <th># of Programs Implemented</th>
                            </tr>
                            <tr>
                                <td>Socially Engaged Research</td>
                                <td><%=UserDAO.countProgramsActivityClassificationImplementedByCommunityID(Integer.parseInt(request.getAttribute("communityID").toString()), "Socially Engaged Research", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%></td>
                            </tr>
                            <tr>
                                <td>Service Learning</td>
                                <td><%=UserDAO.countProgramsActivityClassificationImplementedByCommunityID(Integer.parseInt(request.getAttribute("communityID").toString()), "Service-Learning", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%></td>
                            </tr>
                            <tr>
                                <td>Interdisciplinary Fora</td>
                                <td><%=UserDAO.countProgramsActivityClassificationImplementedByCommunityID(Integer.parseInt(request.getAttribute("communityID").toString()), "Interdisciplinary Fora", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%></td>
                            </tr>
                            <tr>
                                <td>Direct Service to the Poor and Marginalized</td>
                                <td><%=UserDAO.countProgramsActivityClassificationImplementedByCommunityID(Integer.parseInt(request.getAttribute("communityID").toString()), "Direct Service to the Poor and Marginalized", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%></td>
                            </tr>
                            <tr>
                                <td>Issue Awareness and Advocacy</td>
                                <td><%=UserDAO.countProgramsActivityClassificationImplementedByCommunityID(Integer.parseInt(request.getAttribute("communityID").toString()), "Issue Awareness and Advocacy", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%></td>
                            </tr>
                            <tr>
                                <td>Public Engagement</td>
                                <td><%=UserDAO.countProgramsActivityClassificationImplementedByCommunityID(Integer.parseInt(request.getAttribute("communityID").toString()), "Public Engagement", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%></td>
                            </tr>
                            <tr>
                                <td>Others</td>
                                <td><%=UserDAO.countProgramsActivityClassificationImplementedByCommunityID(Integer.parseInt(request.getAttribute("communityID").toString()), "Others", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%></td>
                            </tr>
                        </table>
                    </div>

                    <div class="container-fluid totalsdiv">

                        <h2 class="totaltitle"><%=UserDAO.getCommunitynameByID(Integer.parseInt(request.getAttribute("communityID").toString()))%></h2>

                        <div class="card-deck">
                            <div class="card bg-success">
                                <div class="card-body text-center">
                                    <p class="card-text"><b>Programs Implemented</b></p>
                                    <p class="total"><%=UserDAO.countProgramsCompletedByCommunityID(Integer.parseInt(request.getAttribute("communityID").toString()), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%></p>
                                </div>
                            </div>
                            <div class="card bg-success">
                                <div class="card-body text-center">
                                    <p class="card-text"><b>Units Affiliated</b></p>
                                    <p class="total"><%=UserDAO.countProgramsUnitAffliatedCompletedByCommunityID(Integer.parseInt(request.getAttribute("communityID").toString()), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%></p>
                                </div>
                            </div> 
                        </div>
                    </div>

                    <div class="container-fluid totalsdiv">
                        <h2 class="totaltitle">Programs</h2>
                        <table class="table table-striped table-bordered" style="width:100%">
                            <tr>
                                <th>Unit</th>
                                <th># of SE Programs Implemented</th>
                            </tr>
                            <%
                                units = UserDAO.retrieveUnits();
                                for (int x = 0; x < units.size(); x++) {
                            %>
                            <tr>
                                <td><%=units.get(x).getName()%></td>
                                <td><%=UserDAO.countProgramsUnitImplementedByCommunityID(Integer.parseInt(request.getAttribute("communityID").toString()), units.get(x).getName(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%></td>
                            </tr>
                            <%}%>
                        </table>
                    </div>
                </div>
                <%
                    }
                %>
                <!--- pie chart-->

            </div>

        </div>

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
            if (links[i].href.indexOf('#') != - 1) {
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
