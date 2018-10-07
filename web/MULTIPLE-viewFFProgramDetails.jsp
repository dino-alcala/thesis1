<%-- 
    Document   : MULTIPLE-viewFFProgramDetails
    Created on : 06 12, 18, 1:27:23 PM
    Author     : Karl Madrid
--%>

<%@page import="entity.FF"%>
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

        <title>View FF Program Details</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/sidebar2.css">
        <link rel="stylesheet" type="text/css" href="css/styles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

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

            body {
                padding-top: 56px;
            }

            .sticky-offset {
                top: 56px;
            }

            #body-row {
                margin-left:0;
                margin-right:0;
            }

            #sidebar-container {
                min-height: 100vh;   
                background-color: #333333;
                padding: 0;
            }

            /* Sidebar sizes when expanded and expanded */
            .sidebar-expanded {
                width: 230px;
            }
            .sidebar-collapsed {
                width: 60px;
            }

            /* Menu item*/
            #sidebar-container .list-group a {
                height: 50px;
                color: white;
            }

            /* Submenu item*/
            #sidebar-container .list-group .sidebar-submenu a {
                height: 45px;
                padding-left: 30px;
            }
            .sidebar-submenu {
                font-size: 0.9rem;
            }

            .sidebar-separator {
                background-color: #333333;
                height: 25px;
            }
            .logo-separator {
                background-color: #333333;    
                height: 60px;
            }

            /* Closed submenu icon */
            #sidebar-container .list-group .list-group-item[aria-expanded="false"] .submenu-icon::after {
                content: " \f0d7";
                font-family: FontAwesome;
                display: inline;
                text-align: right;
                padding-left: 10px;
            }
            /* Opened submenu icon */
            #sidebar-container .list-group .list-group-item[aria-expanded="true"] .submenu-icon::after {
                content: " \f0da";
                font-family: FontAwesome;
                display: inline;
                text-align: right;
                padding-left: 10px;
            }

            .nav-link {
                border-bottom: 2px solid green;
            }

            #navbar {
                background-color: #009900;
            }

            #navbar-unit {
                color: white;
            }

            .navbar-toggler-icon {
                background-color: white;
            }

            #smallerscreenmenuButton {
                color: white;
            }

            #smallerscreenmenu {
                color: white;
            }

            #submenuCategoryBox {
                background-color: #d9d9d9;
            }

            #submenuCategoryBox:hover {
                background-color: lightgreen;
            }

            #submenuCategory{
                font-size: 13px;
                color: #4d4d4d;
            }

            #sidebarCategory {
                background-color: #4d4d4d;
            }

            #sidebarCategory:hover {
                background-color: lightgreen;
            }

            #sidebarCategoryActive {
                background-color: lightgreen;
            }

            #sidebarCategoryActive:hover {
                background-color: lightgreen;
            }
            body{
                background-color: whitesmoke;
                padding-top: 56px;
            }

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

            .panel-title{
                font-size: 40px;
                text-align: left;
                margin-top: 20px;
                padding-bottom: 10px;
            }

            p{
                margin-bottom: 0;
                font-size: 15px;
            }

            a:link {
                color: black; 
                background-color: transparent; 
                text-decoration: none;
            }

            table, td, th {
                border: 1px solid black;
                border-collapse: collapse;
                text-align: center;
            }

            h4{
                color: white;
            }

            h3{
                font-size: 40px;   
                border-bottom: 2px solid #4CAF50;
                padding-bottom: 5px;
            }

            .panel-success > .panel-heading {
                background-color: #4CAF50;
                border-color: #ddd;
                border: 1px solid;
            }

            .panel-body{
                border: 1px solid;
            }

            .heading{
                border: 1px solid;
                margin-top: 30px;
                padding-top: 0px;
                margin-bottom: 30px;
            }
            .panel-upper{
                border: 3px solid #4CAF50;
            }

            .button-e {
                background-color: orange;
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
            .button-d {
                background-color: red;
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

            .buttons{
                margin-bottom: 10px;
                align-content: center;
            }

            .card-header{
                background-color: #4CAF50;
            }

            .card-body{
                background-color: whitesmoke;
            }

            .card{
                border: 1px solid black;
            }

            th,tr,td{
                padding:15px;
            }

            .button{
                background-color: #4CAF50;
                border: none;
                color: white;
                padding: 15px 32px;
                text-align: center;
                display: inline-block;
                margin: 4px 2px;
                font-size: 16px;
            }
            .button-red{
                background-color: red;
                border: none;
                color: white;
                padding: 15px 32px;
                text-align: center;
                display: inline-block;
                margin: 4px 2px;
                font-size: 16px;
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
                    <button type="button" class="btn btn-info navbar-btn-logout">
                        <i class="fa fa-sign-out"></i>
                    </button>
                </div>
            </ul>
        </nav>
        <!-- NavBar END -->

        <!-- Bootstrap row -->
        <div class="row" id="body-row">

            <!-- Sidebar -->
            <div id="sidebar-container" class="sidebar-expanded d-none d-md-block">
                <script>
                    $("#sidebar-container").load("sidebar.jsp");
                </script>
            </div>
            <!-- sidebar-container END -->

            <!-- MAIN -->
            <%
                FF FF = new FF();
                FF = UserDAO.retrieveFFByFFID(Integer.parseInt(request.getAttribute("ffID").toString()));
            %>
            <div class="col py-3">
                <form action="createFFreport" method="post">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">

                                <div class="card">
                                    <div class="card-body">
                                        <h3><%=FF.getProjectName()%></h3>
                                        <p><b>Unit: </b> <%=FF.getUnit()%></p>
                                        <p><b>Department: </b> <%=FF.getDepartment()%></p>
                                        <p><b>Program Head: </b> <%=FF.getProgramHead()%></p>
                                        <p><b>Program Classification: </b> <%=FF.getActivityClassification()%></p>
                                        <p><b>Total Amount Requested:</b> ₱<%=FF.getTotalAmount()%></p>
                                        <p><b>Actual Date of Implementation: </b> <%=FF.getActualDate()%></p>
                                        <p><b>Venue: </b> <%=FF.getVenue()%></p>
                                        <p><b>Speaker: </b> <%=FF.getSpeaker()%></p>
                                    </div>
                                </div><br>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Targets</h4>
                                    </div>
                                    <div class="card-body">   
                                        <p><b>KRA:</b> <%=UserDAO.getKRAnameByID(FF.getTargetKRA())%></p><br>
                                        <p><b>Goal:</b> <%=UserDAO.getGoalnameByID(FF.getTargetGoal())%></p><br>
                                        <p><b>Measure:</b> <%=UserDAO.getMeasurenameByID(FF.getTargetMeasure())%></p><br>
                                        <p><b>Community: </b><%=UserDAO.getCommunitynameByID(FF.getTargetCommunity())%></p>
                                    </div>  
                                </div>
                                <br/>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Objectives of the Project</h4>
                                    </div>
                                    <div class="card-body">   
                                        <p><%=FF.getObjectives()%></p>
                                    </div>
                                </div>
                                <br/>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Breakdown of Expenses</h4>
                                    </div>
                                </div>

                                <table style="width:100%">
                                    <tr>
                                        <th>Item</th>
                                        <th>Unit Cost</th> 
                                        <th>Quantity</th>
                                        <th>Subtotal</th>
                                        <th>Amount Expended</th>
                                    </tr>
                                    <%
                                        double total = 0;
                                        double count = 0;
                                        for (int i = 0; i < FF.getExpenses().size(); i++) {
                                    %>
                                    <tr>
                                        <td><%=FF.getExpenses().get(i).getItem()%></td>
                                        <td><%=FF.getExpenses().get(i).getUnitcost()%></td>
                                        <td><%=FF.getExpenses().get(i).getQuantity()%></td>
                                        <td><%=FF.getExpenses().get(i).getUnitcost() * FF.getExpenses().get(i).getQuantity()%></td>
                                        <td><%=FF.getExpenses().get(i).getAmountUsed()%></td>
                                    </tr>
                                    <%
                                            count += FF.getExpenses().get(i).getUnitcost() * FF.getExpenses().get(i).getQuantity();
                                            total += FF.getExpenses().get(i).getAmountUsed();
                                        }
                                    %>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td>Grand Total: <%=count%></td>
                                        <td>Grand Total: <%=total%></td>
                                    </tr>
                                </table>
                                <br/>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Prepared by</h4>
                                    </div>
                                    <div class="card-body">   
                                        <p><%=FF.getProgramHead()%></p>
                                    </div>
                                </div>
                                <br/>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Attendees</h4>
                                    </div>
                                </div>
                                <table style="width:100%">
                                    <tr>
                                        <th>Name</th>
                                        <th>Email</th>
                                    </tr>
                                    <%
                                        for (int i = 0; i < FF.getAttendees().size(); i++) {
                                    %>
                                    <tr>
                                        <td><%=FF.getAttendees().get(i).getName()%></td>
                                        <td><%=FF.getAttendees().get(i).getEmail()%></td>
                                    </tr>

                                    <%
                                        }
                                    %>
                                </table>
                                <br/>

                                <div>
                                    <center><h2>Project is now ready for implementation</h2></center>
                                </div><br>
                                <%
                                    if (!UserDAO.hasFFReport(FF.getId()) && Integer.parseInt(session.getAttribute("userID").toString()) == FF.getUserID()) {
                                %>
                                <div>
                                    <center><button type="submit" value="<%=FF.getId()%>" class="button" name="ffID">Create Accomplishment Report</button></center>
                                </div><br>

                                <%    } else if (UserDAO.hasFFReport(FF.getId())) {
                                %>
                                <div>
                                    <center><button type="submit" value="<%=FF.getId()%>" name="viewReport" class="button">View Accomplishment Report</button></center>
                                </div><br>

                                <%
                                    }

                                    if (!UserDAO.hasFFReport(FF.getId()) && Integer.parseInt(session.getAttribute("userID").toString()) == FF.getUserID()) {
                                %>

                                <div>
                                    <center><button type="submit" value="<%=FF.getId()%>" name="updateBudget" class="button">Update Budget
                                        </button></center>
                                </div><br>

                                <%
                                    }
                                    if (!UserDAO.hasFFReport(FF.getId()) && Integer.parseInt(session.getAttribute("userID").toString()) == FF.getUserID()) {
                                %>

                                <div>
                                    <center><button type="submit" value="<%=FF.getId()%>" name="cancelProgram" class="button-red">Cancel Program</button></center>
                                </div><br><br>
                                <%
                                    }
                                %>

                            </div>

                        </div>

                    </div>
                </form>
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