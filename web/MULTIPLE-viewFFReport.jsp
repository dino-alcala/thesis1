<%-- 
    Document   : MULTIPLE-viewProgramReport
    Created on : 06 12, 18, 1:31:18 PM
    Author     : Karl Madrid
--%>

<%@page import="entity.FF"%>
<%@page import="entity.FFreport"%>
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

        <title>FF Completion Report</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/sidebar.css">
        <link rel="stylesheet" type="text/css" href="css/homepagestyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://c dnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

        <style>
            html{
                font-size:14px;
            }
            .navbar{
                height:8%;
            }
            .sidebar-expanded{
                margin-top:0.1%;
            }
            
            #notifsScroll {
                overflow-y: auto; 
                overflow-x: hidden;
                height: 250px;
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
                <form action="viewFFreportphoto" method="post">

                    <%
                        FFreport FFreport = new FFreport();
                        FFreport = UserDAO.retrieveFFreportByFFID(Integer.parseInt(request.getAttribute("ffID").toString()));
                        
                        FF FF = new FF();
                        FF = UserDAO.retrieveFFByFFID(Integer.parseInt(request.getAttribute("ffID").toString()));
                    %>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">

                                <div class="card">
                                    <div class="card-body">
                                        <h3><%=FFreport.getProjectTitle()%></h3>
                                        <p><b>Date of Implementation: </b> <%=FFreport.getImplementationdate()%></p>
                                        <p><b>Address of Implementation: </b> <%=FFreport.getVenue() %></p>
                                        <br>
                                        <p><b>Project Proponents/s:</b> <%=FFreport.getProjectProponent()%></p>
                                        <p><b>Program Head: </b> <%=FF.getProgramHead()%></p>
                                        <p><b>Google Sheets Link: </b> <%=FFreport.getGsheets()%></p>
                                    </div>
                                </div>
                                <br/>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Information Identification</h4>
                                    </div>
                                    <div class="card-body">   
                                        <p><b>List of DLSU Participants:</b></p>
                                        <br/>
                                        <table style="width:100%">
                                            <tr>
                                                <th>Classification</th>
                                                <th>Number of Individuals</th>
                                            </tr>
                                            <tr>
                                                <td>CAP</td>
                                                <td><%=FFreport.getCap()%></td>
                                            </tr>
                                            <tr>
                                                <td>APSP</td>
                                                <td><%=FFreport.getApsp()%></td>
                                            </tr>
                                            <tr>
                                                <td>ASF</td>
                                                <td><%=FFreport.getAsf()%></td>
                                            </tr>
                                            <tr>
                                                <td>Faculty</td>
                                                <td><%=FFreport.getFaculty()%></td>
                                            </tr>
                                            <tr>
                                                <td>Admin</td>
                                                <td><%=FFreport.getAdmin()%></td>
                                            </tr>
                                            <tr>
                                                <td>Direct Hired Contractuals</td>
                                                <td><%=FFreport.getDirecthired()%></td>
                                            </tr>
                                            <tr>
                                                <td>Independent Contractor</td>
                                                <td><%=FFreport.getIndependent()%></td>
                                            </tr>
                                            <tr>
                                                <td>External Service Personnel</td>
                                                <td><%=FFreport.getExternal()%></td>
                                            </tr>
                                            <tr>
                                                <td>Graduate Students:</td>
                                                <td><%=FFreport.getGraduate()%></td>
                                            </tr>
                                            <tr>
                                                <td>Undergraduate Students</td>
                                                <td><%=FFreport.getUndergraduate()%></td>
                                            </tr>
                                            <tr>
                                                <td>Alumni</td>
                                                <td><%=FFreport.getAlumni()%></td>
                                            </tr>
                                            <tr>
                                                <td>Parents</td>
                                                <td><%=FFreport.getParents()%></td>
                                            </tr>
                                        </table>
                                        <br>
                                        <hr/>
                                        <p><b>Amount of Grants Received from <%if (UserDAO.isOVPLMSource(Integer.parseInt(request.getAttribute("ffID").toString()))) {%> OVPLM <%} else {%> Others <%}%> Fund:  </b>&nbsp;&nbsp;₱ <%=FFreport.getAmountReceivedOVPLM()%></p>
                                    </div>
                                </div>
                                <br/>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Executive Summary</h4>
                                    </div>
                                    <div class="card-body">   
                                        <p><%=FFreport.getSignificanceProject()%></p>
                                        <br>
                                        <p><%=FFreport.getHighlightsProject()%></p>
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
                                        for (int i = 0; i < FFreport.getObjectives().size(); i++) {
                                    %>
                                    <tr>
                                        <td><%=FFreport.getObjectives().get(i).getExpectedOutcomes()%></td>
                                        <td><%=FFreport.getObjectives().get(i).getActualAccomplishment()%></td>
                                        <td><%=FFreport.getObjectives().get(i).getHinderingFactors()%></td>
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
                                        <center><p><b>Grant from <%if (UserDAO.isOVPLMSourceFF(Integer.parseInt(request.getAttribute("ffID").toString()))) {%> OVPLM <%} else {%> Others <%}%> Fund</b></p></center>
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
                                                for (int i = 0; i < FFreport.getFunds().size(); i++) {
                                            %>
                                            <tr>
                                                <td><%=FFreport.getFunds().get(i).getLineItem()%></td>
                                                <td>₱ <%=FFreport.getFunds().get(i).getApprovedAmount()%></td>
                                                <td>₱ <%=FFreport.getFunds().get(i).getExpendedAmount()%></td>
                                                <td><%=FFreport.getFunds().get(i).getApprovedAmount() - FFreport.getFunds().get(i).getExpendedAmount()%></td>
                                                <td><%=FFreport.getFunds().get(i).getReasonVariance()%></td>
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
                                        <p><%=FFreport.getMajorProblems()%></p>
                                    </div>
                                </div>
                                <br/>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Other Recommendations</h4>
                                    </div>
                                    <div class="card-body">   
                                        <p><%=FFreport.getOtherRecommendations()%></p>
                                    </div>
                                </div>
                                <br/>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Annexes</h4>
                                    </div>
                                    <div class="card-body">   
                                        <p><button type="submit" name="photo" value="<%=FFreport.getId()%>">View Photo</button></p>
                                        <br>
                                        <p><button type="submit" name="dlsuattendance" value="<%=FFreport.getId()%>">DLSU Participants Attendance Sheets</button></p>
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