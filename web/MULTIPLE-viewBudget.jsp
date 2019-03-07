<%-- 
    Document   : MULTIPLE-viewBudget
    Created on : 06 18, 18, 7:56:44 PM
    Author     : Karl Madrid
--%>

<%@page import="entity.FF"%>
<%@page import="entity.SE"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="entity.Budget"%>
<%@page import="entity.Notification"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>View Budget</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/sidebar.css">
        <link rel="stylesheet" href="css/homepagestyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

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

        <script type="text/javascript">
            <%
                if (request.getAttribute("updateBudget") != null) {

            %>
            $("document").ready(function () {

                alert("<%=request.getAttribute("updateBudget")%>");
            });

            <%
                }
            %>

        </script>

        <style>
            #myInput {
                background-image: url('/css/searchicon.png'); /* Add a search icon to input */
                background-position: 10px 12px; /* Position the search icon */
                background-repeat: no-repeat; /* Do not repeat the icon image */
                width: 100%; /* Full-width */
                padding: 12px 20px 12px 40px; /* Add some padding */
                border: 1px solid #ddd; /* Add a grey border */
                margin-bottom: 12px; /* Add some space below the input */
                margin-top: 20px; 
            }

            #myTable {
                border-collapse: collapse; /* Collapse borders */
                width: 100%; /* Full-width */
                border: 1px solid #ddd; /* Add a grey border */

            }

            #myTable th, #myTable td {
                text-align: left; /* Left-align text */
                padding: 12px; /* Add padding */
            }

            #myTable tr {
                border-bottom: 1px solid #ddd; 
            }

            #myTable tr.header, #myTable tr:hover {
                background-color: #4CAF50;
            }

            .budget{
                font-size: 70px; 
                text-align: center; 
                font-family: 'Montserrat', sans-serif;
                margin-top: 20px;
            }
            
            .panels{
                margin-top: 15px;
                background-color: white;
                padding-bottom: 15px;
                border-style: solid;
                border-color: lightgray;
                border-width: 1px;
                border-radius: 8px;
            }

            h4{
                font-size: 25px;
                text-align: left;
                margin-top: 20px;
                border-bottom: 2px solid green;
                padding-bottom: 10px;
                margin-bottom: 25px;
            }
            .tableHead{
                background-color: darkgreen;
                color: white;
            }

            .tableHead2{
                background-color: darkcyan;
                color: white;
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
                <span class="menu-collapsed"><%=session.getAttribute("unit")%></span>
            </a>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown d-sm-block d-md-none">
                        <a class="nav-link" href="#" id="smallerscreenmenu">
                            Dashboard
                        </a>
                        <a class="nav-link" href="#" id="smallerscreenmenu">
                            Proposals
                        </a>
                        <a class="nav-link" href="#" id="smallerscreenmenu">
                            Units
                        </a>
                        <a class="nav-link" href="#" id="smallerscreenmenu">
                            Communities
                        </a>
                        <a class="nav-link" href="#" id="smallerscreenmenu">
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
                            <% UserDAO UserDAO = new UserDAO(); %>
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

                <div class="row">
                    <div class="col-lg-12">
                        <%
                            Budget b = new Budget();
                            b = UserDAO.getLatestBudget();

                            DecimalFormat formatter = new DecimalFormat("#,###.00");
                        %>

                        <div class="container-fluid panels">
                            <h4>Total Budget Available</h4>
                            <h1 class="budget">₱ <%=formatter.format(b.getRemainingBudget())%></h1>

                            <%
                                if (Integer.parseInt(session.getAttribute("userID").toString()) == 16) {

                            %>
                            <form action="OVPLM-editOverallBudget.jsp" method="post">
                                <div id="container55">
                                    <center><button type = "submit" class="btn btn-primary btn-sm" onclick="addFields()">Edit Budget Amount</button></center>
                                </div>
                            </form>
                            <%                           }
                            %>
                        </div

                        <!--- budget -->
                        <div class="container-fluid panels">

                            <%
                                ArrayList<SE> seproposal = new ArrayList();
                                seproposal = UserDAO.retrieveSEProposalAmountRequestedByAll();
                            %>

                            <h4>Social Engagement Programs</h4>

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
                                        <td>₱<%=UserDAO.getUtilizedBudgetBySEID(seproposal.get(i).getId())%></td>
                                        <td>₱<%=seproposal.get(i).getTotalAmount() - UserDAO.getUtilizedBudgetBySEID(seproposal.get(i).getId())%></td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>

                        <div class="container-fluid panels">
                            <h4>Faith Formation Programs</h4>
                            <%
                                ArrayList<FF> ffproposal = new ArrayList();
                                ffproposal = UserDAO.retrieveFFProposalAmountRequestedByAll();
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
                                        <td>₱<%=UserDAO.getUtilizedBudgetByFFID(ffproposal.get(i).getId())%></td>
                                        <td>₱<%=ffproposal.get(i).getTotalAmount() - UserDAO.getUtilizedBudgetByFFID(ffproposal.get(i).getId())%></td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>

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