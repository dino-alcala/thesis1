<%-- 
    Document   : MULTIPLE-viewProgramReport
    Created on : 06 12, 18, 1:31:18 PM
    Author     : Karl Madrid
--%>

<%@page import="entity.SEreport"%>
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

        <title>View Accomplishment Report</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/sidebar2.css">
        <link rel="stylesheet" type="text/css" href="css/styles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://c dnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
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
                margin-bottom: 30px;
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

            hr{
                border-color: darkgrey;
            }

            p{
                font-size: 17px;
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
                    $("#sidebar-container").load("sidebarmultiple.jsp");
                </script>
            </div>
            <!-- sidebar-container END -->

            <!-- MAIN -->
            <div class="col py-3">
                <form action="viewSEreportphoto" method="post">

                    <%
                        SEreport SEreport = new SEreport();
                        SEreport = UserDAO.retrieveSEreportBySEID(Integer.parseInt(request.getAttribute("seID").toString()));
                    %>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">

                                <div class="card">
                                    <div class="card-body">
                                        <h3><%=SEreport.getProjectTitle()%></h3>
                                        <p><b>Targeted KRA:</b> <%=SEreport.getTargetKRA()%></p>
                                        <br/>
                                        <p><b>Project Proponents/s:</b> <%=SEreport.getProjectProponent()%></p>
                                        <p><b>Person Responsible: </b> <%=SEreport.getPersonResponsible()%></p>
                                    </div>
                                </div>
                                <br/>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Information Identification</h4>
                                    </div>
                                    <div class="card-body">   
                                        <p><b>Number of Beneficiaries: </b>&nbsp;&nbsp;<%=SEreport.getNumberOfBeneficiaries()%></p>
                                        <hr/>
                                        <p><b>Project Beneficiaries: </b>&nbsp;&nbsp;<%=SEreport.getProjectBeneficiaries()%></p>
                                        <hr/>
                                        <p><b>Address of Beneficiaries: </b>&nbsp;&nbsp;<%=SEreport.getAddressBeneficiaries()%></p>
                                        <hr/>
                                        <p><b>Address of Project Implementation: </b>&nbsp;&nbsp;<%=SEreport.getAddressOfProject()%></p>
                                        <hr/>
                                        <p><b>List of DLSU Participants:</b></p>
                                        <br/>
                                        <table style="width:100%">
                                            <tr>
                                                <th>Classification</th>
                                                <th>Number of Individuals</th>
                                            </tr>
                                            <%
                                                for (int i = 0; i < SEreport.getParticipants().size(); i++) {
                                            %>
                                            <tr>
                                                <td><%=SEreport.getParticipants().get(i).getClassification()%></td>
                                                <td><%=SEreport.getParticipants().get(i).getNumberOfIndividuals()%></td>
                                            </tr>
                                            <%
                                                }
                                            %>

                                        </table>
                                        <br>
                                        <hr/>
                                        <p><b>Amount of Grants Received from <%if (UserDAO.isOVPLMSource(Integer.parseInt(request.getAttribute("seID").toString()))) {%> OVPLM <%} else {%> Others <%}%> Fund:  </b>&nbsp;&nbsp;₱ <%=SEreport.getAmountReceivedOVPLM()%></p>
                                    </div>
                                </div>
                                <br/>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Executive Summary</h4>
                                    </div>
                                    <div class="card-body">   
                                        <p><%=SEreport.getSignificanceProject()%></p>
                                        <br>
                                        <p><%=SEreport.getHappenedImplementationProject()%></p>
                                        <br>
                                        <p><%=SEreport.getWhenwhereProject()%></p>
                                        <br>
                                        <p><%=SEreport.getParticipantsProject()%></p>
                                        <br>
                                        <p><%=SEreport.getHighlightsProject()%></p>
                                    </div>
                                </div>
                                <br/>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Accomplishment of Objectives:</h4>
                                    </div>
                                </div>

                                <table style="width:100%">
                                    <tr>
                                        <th>Expected Outcomes</th>
                                        <th>Actual Accomplishment</th>
                                        <th>Hindering Factors</th>
                                    </tr>
                                    <%
                                        for (int i = 0; i < SEreport.getObjectives().size(); i++) {
                                    %>
                                    <tr>
                                        <td><%=SEreport.getObjectives().get(i).getExpectedOutcomes()%></td>
                                        <td><%=SEreport.getObjectives().get(i).getActualAccomplishment()%></td>
                                        <td><%=SEreport.getObjectives().get(i).getHinderingFactors()%></td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </table>

                                <br/>                       
                                <div class="card">
                                    <div class="card-header">
                                        <h4>Financial Aspect</h4>
                                    </div>
                                    <div class="card-body">
                                        <br>
                                        <center><p><b>Grant from <%if (UserDAO.isOVPLMSource(Integer.parseInt(request.getAttribute("seID").toString()))) {%> OVPLM <%} else {%> Others <%}%> Fund</b></p></center>
                                        <br>
                                        <table style="width:100%">
                                            <tr>
                                                <th>Line Item</th>
                                                <th>Approved Amount</th>
                                                <th>Expended Amount</th>
                                                <th>Variance(Approved minus Expended Amount)</th>
                                                <th>Reason for Variance</th>
                                            </tr>
                                            <%
                                                for (int i = 0; i < SEreport.getFunds().size(); i++) {
                                            %>
                                            <tr>
                                                <td><%=SEreport.getFunds().get(i).getLineItem()%></td>
                                                <td>₱ <%=SEreport.getFunds().get(i).getApprovedAmount()%></td>
                                                <td>₱ <%=SEreport.getFunds().get(i).getExpendedAmount()%></td>
                                                <td><%=SEreport.getFunds().get(i).getApprovedAmount() - SEreport.getFunds().get(i).getExpendedAmount()%></td>
                                                <td><%=SEreport.getFunds().get(i).getReasonVariance()%></td>
                                            </tr>

                                            <%
                                                }
                                            %>
                                        </table>    
                                    </div>
                                </div>
                                <br/>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Major Problems Encountered</h4>
                                    </div>
                                    <div class="card-body">   
                                        <p><%=SEreport.getMajorProblems()%></p>
                                    </div>
                                </div>
                                <br/>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Other Recommendations</h4>
                                    </div>
                                    <div class="card-body">   
                                        <p><%=SEreport.getOtherRecommendations()%></p>
                                    </div>
                                </div>
                                <br/>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Annexes</h4>
                                    </div>
                                    <div class="card-body">   
                                        <p><button type="submit" name="photo" value="<%=SEreport.getId()%>">View Photo</button></p>
                                        <br>
                                        <p><button type="submit" name="beneficiariesattendance" value="<%=SEreport.getId()%>">Beneficiaries Attendance Sheets</button></p>
                                        <br>
                                        <p><button type="submit" name="dlsuattendance" value="<%=SEreport.getId()%>">DLSU Participants Attendance Sheets</button></p>
                                        <br>
                                        <p><button type="submit" name="beneficiariesletters" value="<%=SEreport.getId()%>">Beneficiaries' Letters / Feedbacks</button></p>
                                        <br>
                                    </div>
                                </div>
                                <br/>

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
                for (var i = 0; i < links.length; inung++) {
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