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

        <title>FF Program Details</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/sidebar.css">
        <link rel="stylesheet" type="text/css" href="css/homepagestyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

        <style>
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
                font-family: "Arial", Helvetica, sans-serif;
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
                                <%
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
                                        <p><b>Target Date of Implementation: </b> <%=FF.getActualDate()%></p>
                                        <br>
                                        <p><b>Program Head: </b> <%=FF.getProgramHead()%></p>
                                        <p><b>Program Classification: </b> <%=FF.getActivityClassification()%></p>
                                        <p><b>Total Amount Requested:</b> ₱<%=FF.getTotalAmount()%></p>
                                        <br>
                                        <p><b>Venue: </b> <%=FF.getVenue()%></p>
                                        <p><b>Speaker: </b> <%=FF.getSpeaker()%></p>
                                    </div>
                                </div><br>

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
                                        <h4>Breakdown of Expenses (Requested: ₱<%=FF.getTotalAmount()%>)</h4>
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
                                        <td>Total: <%=count%></td>
                                        <td>Total: <%=total%></td>
                                    </tr>
                                </table>
                                <br/>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Source of Funds: </h4>
                                    </div>
                                    <div class="card-body">   
                                        <p><%=FF.getSourceOfFunds()%></p>
                                    </div>
                                </div>
                                <br/>

                                <%
                                    if (FF.getStudentorg() != 1) {
                                %>
                                <div class="card">
                                    <div class="card-header">
                                        <h4>Remarks</h4>
                                    </div>
                                </div>
                                <table style="width:100%">
                                    <tr>
                                        <th style="width:35%">Step</th>
                                        <th style="width:65%">Remarks</th> 
                                    </tr>
                                    <tr>
                                        <td>Assistant Dean for Lasallian Mission</td>
                                        <td><%if (FF.getADLMRemarks() != null) {%><%=FF.getADLMRemarks()%><%}%></td>
                                    </tr>
                                    <tr>
                                        <td>Chairperson/Unit Head</td>
                                        <td><%if (FF.getChairpersonRemarks() != null) {%><%=FF.getChairpersonRemarks()%><%}%> <%if (FF.getUnitheadremarks() != null) {%><%=FF.getUnitheadremarks()%><%}%></td>
                                    </tr>
                                    <tr>
                                        <td>Dean</td>
                                        <td><%if (FF.getDeanRemarks() != null) {%><%=FF.getDeanRemarks()%><%}%> <%if (FF.getDirectorremarks() != null) {%><%=FF.getDirectorremarks()%><%}%></td>
                                    </tr>

                                    <tr>
                                        <td>Evaluation by LSPO</td>
                                        <td><%if (FF.getLspoRemarks() != null) {%><%=FF.getLspoRemarks()%><%}%></td>
                                    </tr>
                                    <tr>
                                        <td>Approval by the Council</td>
                                        <td>
                                            <b>Br. Michael Broughton: </b> <%if (FF.getLmc1Remarks() != null) {%><%=FF.getLmc1Remarks()%><%}%>
                                            <br>
                                            <br>
                                            <b>Ms. Nelca Villarin: </b> <%if (FF.getLmc2Remarks() != null) {%><%=FF.getLmc2Remarks()%><%}%>
                                            <br>
                                            <br>
                                            <b>Ms. Margarita Perdido: </b> <%if (FF.getLmc3Remarks() != null) {%><%=FF.getLmc3Remarks()%><%}%>
                                            <br>
                                            <br>
                                            <b>Ms. Fritzie De Vera: </b> <%if (FF.getLmc5Remarks() != null) {%><%=FF.getLmc5Remarks()%><%}%>
                                            <br>
                                        </td>
                                    </tr>
                                </table>
                                <%
                                    }
                                %>
                                <br>
                                <br>


                                <% if (FF.getStep() == 8) { %>
                                <div>
                                    <center><h2>Project is now ready for implementation</h2></center>
                                </div>
                                <br>
                                <% } %>

                                <% if (FF.getStep() == 0) { %>
                                <div>
                                    <center><h2>Project has been canceled</h2></center>
                                </div>
                                <br>
                                <% } %>

                                <% if (FF.getStep() == -1) { %>
                                <div>
                                    <center><h2>Project has been rejected</h2></center>
                                </div>
                                <br>
                                <% }%>

                                <center><button class='button' style="background-color:dodgerblue" type="submit" name="viewAttendees" value="<%=FF.getId()%>">Attendees List</button></center>
                                <br>
                                <center><button class="button" type="submit" name="auditFF" value="<%=request.getAttribute("ffID")%>">View Audit Trail</button></center>
                                <br>

                                <%
                                    if (!UserDAO.hasFFReport(FF.getId()) && Integer.parseInt(session.getAttribute("userID").toString()) == FF.getUserID()) {
                                %>
                                <div>
                                    <center><button type="submit" value="<%=FF.getId()%>" class="button" name="ffID">Create Accomplishment Report</button></center>
                                </div>
                                <br>

                                <%    } else if (UserDAO.hasFFReport(FF.getId())) {
                                %>
                                <div>
                                    <center><button type="submit" value="<%=FF.getId()%>" name="viewReport" class="button">View Accomplishment Report</button></center>
                                </div>
                                <br>
                                <%
                                    }
                                %>


                                <%
                                    if (!UserDAO.hasFFReport(FF.getId()) && Integer.parseInt(session.getAttribute("userID").toString()) == FF.getUserID() && FF.getStep() > 0) {
                                %>
                                <div>
                                    <center>
                                        <button type="submit" value="<%=FF.getId()%>" name="updateBudget" class="button">Update Budget</button>
                                    </center>
                                </div>
                                <br>
                                <%
                                    }
                                %>


                                <%
                                    if (!UserDAO.hasFFReport(FF.getId()) && Integer.parseInt(session.getAttribute("userID").toString()) == FF.getUserID() && FF.getStep() != 0 && FF.getStep() != -1) {
                                %>

                                <div>
                                    <center><button class='button' style="background-color:red" onclick="return window.confirm('Cancel Program?')" type="submit" value="<%=FF.getId()%>" name="cancelProgram" class="btn-danger">Cancel Program</button></center>
                                </div>
                                <%
                                    }
                                %>

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