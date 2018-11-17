<%-- 
    Document   : MULTIPLE-viewSEProgramDetails
    Created on : 06 12, 18, 1:31:47 PM
    Author     : Karl Madrid
--%>

<%@page import="entity.Notification"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UserDAO"%>
<%@page import="entity.SE"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>SE Program Details</title>

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
                SE SE = new SE();
                SE = UserDAO.retrieveSEBySEID(Integer.parseInt(request.getAttribute("seID").toString()));

            %>
            <div class="col py-3">
                <form action="createSEreport" method="post">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">

                                <div class="card">
                                    <div class="card-body">
                                        <h3><%=SE.getName()%></h3>
                                        <p><b>Unit: </b> <%=SE.getUnit()%></p>
                                        <p><b>Department: </b> <%=SE.getDepartment()%></p>
                                        <p><b>Target Date of Implementation: </b> <%=SE.getActualDate()%></p>
                                        <p><b>Implementation Address: </b> <%=SE.getImplementationaddress()%></p>
                                        <br>
                                        <p><b>Program Head: </b> <%=SE.getProgramHead()%></p>
                                        <p><b>Program Classification: </b> <%=SE.getActivityClassification()%></p>
                                        <p><b>Total Amount Requested:</b> ₱<%=SE.getTotalAmount()%></p>
                                    </div>
                                </div>
                                <br/>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Targets</h4>
                                    </div>
                                    <div class="card-body">   
                                        <p><b>KRA:</b> <%=UserDAO.getKRAnameByID(SE.getTargetKRA())%></p><br>
                                        <p><b>Goal:</b> <%=UserDAO.getGoalnameByID(SE.getTargetGoal())%></p><br>
                                        <p><b>Measure/s:</b> 
                                            <%
                                                ArrayList<Integer> measures = new ArrayList();
                                                measures = UserDAO.GetMeasures(SE.getId());

                                                for (int x = 0; x < measures.size(); x++) {
                                            %>    
                                        <p><%=UserDAO.GetMeasureObject(measures.get(x)).getMeasure()%> - <%=UserDAO.GetMeasureObject(measures.get(x)).getDescription()%></p>

                                        <%
                                            }
                                        %>
                                        <br>
                                        <p><br><b>Community: </b> <%=UserDAO.getCommunitynameByID(SE.getTargetCommunity())%></p>
                                    </div>  
                                </div>
                                <br/>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Social/Community Problem being Addressed</h4>
                                    </div>
                                    <div class="card-body">   
                                        <p><%=SE.getSocialCommunityProblem()%></p>
                                    </div>
                                </div>
                                <br/>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Social Engagement Partner(s)/Beneficiaries</h4>
                                    </div>
                                    <div class="card-body">   
                                        <p>Name of Partner: <%=SE.getNameSEbeneficiaries()%></p>
                                        <p>Address: <%=SE.getAddressSEbeneficiaries()%></p>
                                        <p>Contact Person: <%=SE.getContactPersonSEbeneficiaries()%></p>
                                        <p>Mobile Number: <%=SE.getMobileSEbeneficiaries()%></p>
                                        <p>Email: <%=SE.getEmailSEbeneficiaries()%></p><br>
                                        <p>Brief Description of Partner: <%=SE.getDescriptionSEbeneficiaries()%></p>
                                    </div>
                                </div>
                                <br>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Measurable Outcomes/Objectives of the Project</h4>
                                    </div>
                                    <div class="card-body">   
                                        <p><%=SE.getObjectives()%></p>
                                    </div>
                                </div>
                                <br/>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Sustainability Component</h4>
                                    </div>
                                    <div class="card-body">
                                        <%
                                            for (int i = 0; i < SE.getComponent().size(); i++) {
                                        %>
                                        <p><%=SE.getComponent().get(i)%></p>

                                        <%
                                            }
                                        %>
                                        <br>
                                        <p>Explanation: <%=SE.getExplanation()%></p>
                                    </div>
                                </div>
                                <br/>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Work Plan</h4>
                                    </div>
                                </div>
                                <table style="width:100%">
                                    <tr>
                                        <th>Date</th>
                                        <th>Activity</th> 
                                        <th>Time Start</th>
                                        <th>Time End</th>
                                        <th>Venue</th>
                                    </tr>
                                    <%
                                        for (int i = 0; i < SE.getWorkplan().size(); i++) {
                                    %>
                                    <tr>
                                        <td><%=SE.getWorkplan().get(i).getDate()%></td>
                                        <td><%=SE.getWorkplan().get(i).getActivity()%></td>
                                        <td><%=SE.getWorkplan().get(i).getTimestarttimeend()%></td>
                                        <td><%=SE.getWorkplan().get(i).getTimestarttimeend2()%></td>
                                        <td><%=SE.getWorkplan().get(i).getVenue()%></td>
                                    </tr>

                                    <%
                                        }
                                    %>

                                </table>

                                <br/>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Breakdown of Expenses (Requested: ₱<%=SE.getTotalAmount()%>)</h4>
                                    </div>
                                </div>
                                <table style="width:100%">
                                    <tr>
                                        <th>Item</th>
                                        <th>Unit Cost</th> 
                                        <th>Quantity</th>
                                        <th>Subtotal</th>
                                        <th>Amount Used: </th>
                                    </tr>
                                    <%
                                        double count = 0;
                                        double total = 0;
                                        for (int i = 0; i < SE.getExpenses().size(); i++) {
                                    %>
                                    <tr>
                                        <td><%=SE.getExpenses().get(i).getItem()%></td>
                                        <td><%=SE.getExpenses().get(i).getUnitcost()%></td>
                                        <td><%=SE.getExpenses().get(i).getQuantity()%></td>
                                        <td><%=SE.getExpenses().get(i).getUnitcost() * SE.getExpenses().get(i).getQuantity()%></td>
                                        <td><%=SE.getExpenses().get(i).getAmountUsed()%></td>
                                    </tr>
                                    <%
                                            count += SE.getExpenses().get(i).getUnitcost() * SE.getExpenses().get(i).getQuantity();
                                            total += SE.getExpenses().get(i).getAmountUsed();
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
                                        <h4>Expected Participants vs. Total Population of the Unit</h4>
                                    </div>
                                </div>
                                <table style="width:100%">
                                    <tr>
                                        <th>Sector</th>
                                        <th>Total Population</th>
                                        <th>Expected Number of Participants</th>
                                    </tr>
                                    <tr>
                                        <td>Academic Staff from Unit</td>
                                        <td><%=SE.getTotalpopulationAcademicStaff()%></td>
                                        <td><%=SE.getExpectedAcademicStaff()%></td>
                                    </tr>
                                    <tr>
                                        <td>Support Staff from Unit</td>
                                        <td><%=SE.getTotalpopulationSupportStaff()%></td>
                                        <td><%=SE.getExpectedSupportStaff()%></td>
                                    </tr>
                                    <tr>
                                        <td>Undergraduate Students</td>
                                        <td><%=SE.getTotalpopulationUndergraduate()%></td>
                                        <td><%=SE.getExpectedUndergraduate()%></td>
                                    </tr>
                                    <tr>
                                        <td>Graduate Students</td>
                                        <td><%=SE.getTotalPopulationGraduate()%></td>
                                        <td><%=SE.getExpectedGraduate()%></td>
                                    </tr>
                                </table>
                                <br/>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Persons Responsible</h4>
                                    </div>
                                </div>
                                <table style="width:100%">
                                    <tr>
                                        <th>Name</th>
                                        <th>Email</th>
                                    </tr>
                                    <%
                                        for (int i = 0; i < SE.getResponsible().size(); i++) {
                                    %>
                                    <tr>
                                        <td><%=SE.getResponsible().get(i).getName()%></td>
                                        <td><%=SE.getResponsible().get(i).getEmail()%></td>
                                    </tr>

                                    <%
                                        }
                                    %>
                                </table>
                                <br/>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Source of Funds: </h4>
                                    </div>
                                    <div class="card-body">   
                                        <p><%=SE.getSourceOfFunds()%></p>
                                    </div>
                                </div>
                                <br/>

                                <%
                                    if (!SE.getUnit().contains("Student Organization")) {
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
                                        <td>Department/Unit Chair</td>
                                        <td><%if (SE.getDeptunitRemarks() != null) {%><%=SE.getDeptunitRemarks()%><%}%><%if (SE.getUnitChairRemarks() != null) {%><%=SE.getUnitChairRemarks()%><%}%></td>
                                    </tr>
                                    <tr>
                                        <td>College ADEALM/SE Director</td>
                                        <td><%if (SE.getExternaldirectorRemarks() != null) {%><%=SE.getExternaldirectorRemarks()%><%}%><%if (SE.getSeDirectorRemarks() != null) {%><%=SE.getSeDirectorRemarks()%><%}%></td>
                                    </tr>
                                    <tr>
                                        <td>College Dean/VP/VC</td>
                                        <td><%if (SE.getDeanRemarks() != null) {%><%=SE.getDeanRemarks()%><%}%><%if (SE.getVpVcRemarks() != null) {%><%=SE.getVpVcRemarks()%><%}%></td>
                                    </tr>
                                    <tr>
                                        <td>Evaluation by COSCA</td>
                                        <td><%if (SE.getCoscaRemarks() != null) {%><%=SE.getCoscaRemarks()%><%}%></td>
                                    </tr>
                                    <tr>
                                        <td>Approval by the Council</td>
                                        <td>
                                            <b>Br. Michael Broughton: </b> <%if (SE.getLmc1Remarks() != null) {%><%=SE.getLmc1Remarks()%><%}%>
                                            <br>
                                            <br>
                                            <b>Ms. Nelca Villarin: </b> <%if (SE.getLmc2Remarks() != null) {%><%=SE.getLmc2Remarks()%><%}%>
                                            <br>
                                            <br>
                                            <b>Ms. Margarita Perdido: </b> <%if (SE.getLmc3Remarks() != null) {%><%=SE.getLmc3Remarks()%><%}%>
                                            <br>
                                            <br>
                                            <b>Mr. James Laxa: </b> <%if (SE.getLmc4Remarks() != null) {%><%=SE.getLmc4Remarks()%><%}%>
                                            <br>
                                            <br>
                                            <b>Ms. Fritzie De Vera: </b> <%if (SE.getLmc5Remarks() != null) {%><%=SE.getLmc5Remarks()%><%}%>
                                            <br>
                                        </td>
                                    </tr>
                                </table>
                                <%
                                    }
                                %>
                                <br/>
                                <br/>         

                                <%
                                    if (SE.getStep() == 8) {
                                %>
                                <div>
                                    <center><h2>Project is now ready for implementation</h2></center>
                                </div>
                                <br>
                                <% } %>

                                <%
                                    if (SE.getStep() == 0) {
                                %>
                                <div>
                                    <center><h2>Project has been canceled</h2></center>
                                </div>
                                <br>
                                <% } %>

                                <%
                                    if (SE.getStep() == -1) {
                                %>
                                <div>
                                    <center><h2>Project has been rejected</h2></center>
                                </div>
                                <br>
                                <% }%>

                                <center><button class="button" type="submit" name="auditSE" value="<%=request.getAttribute("seID")%>">View Audit Trail</button></center>
                                <br>

                                <%
                                    if (!UserDAO.hasSEReport(SE.getId()) && Integer.parseInt(session.getAttribute("userID").toString()) == SE.getUserID() && SE.getStep() == 8) {
                                %>
                                <div>
                                    <center><button type="submit" value="<%=SE.getId()%>" name="seID" class="button">Create Accomplishment Report</button></center>
                                </div>
                                <br>
                                <%
                                } else if (UserDAO.hasSEReport(SE.getId())) {
                                %>
                                <div>
                                    <center><button type="submit" value="<%=SE.getId()%>" name="viewReport" class="button">View Accomplishment Report</button></center>
                                </div>
                                <br>

                                <%
                                    }
                                    if (!UserDAO.hasSEReport(SE.getId()) && Integer.parseInt(session.getAttribute("userID").toString()) == SE.getUserID() && SE.getStep() > 0) {
                                %>
                                <div>
                                    <center>
                                        <button type="submit" value="<%=SE.getId()%>" name="updateBudget" class="button">Update Budget</button>
                                    </center>
                                </div>
                                <br>
                                <%
                                    }

                                    if (!UserDAO.hasSEReport(SE.getId()) && Integer.parseInt(session.getAttribute("userID").toString()) == SE.getUserID() && SE.getStep() != 0 && SE.getStep() != -1) {
                                %>

                                <div>
                                    <center><button type="submit" value="<%=SE.getId()%>" name="cancelProgram" style="background-color:red;" class="button">Cancel Program</button></center>
                                </div>
                                <br>
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