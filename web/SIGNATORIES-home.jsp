<%-- 
    Document   : SIGNATORIES-home
    Created on : 07 11, 18, 9:36:35 PM
    Author     : Karl Madrid
--%>

<%@page import="entity.KRA"%>
<%@page import="dao.OvplmDAO"%>
<%@page import="dao.TargetDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="entity.FF"%>
<%@page import="entity.SE"%>
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

        <title>Signatories Home</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
        <link rel="stylesheet" href="css/sidebar.css">
        <link rel="stylesheet" href="css/homepagestyle.css">

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
                if (request.getAttribute("successSE1") != null) {
            %>
            $("document").ready(function () {
                alert("<%=request.getAttribute("successSE1")%>");
            });
            <%
                }
                if (request.getAttribute("reviseSE1") != null) {
            %>
            $("document").ready(function () {
                alert("<%=request.getAttribute("reviseSE1")%>");
            });
            <%
                }
                if (request.getAttribute("rejectSE1") != null) {
            %>
            $("document").ready(function () {
                alert("<%=request.getAttribute("rejectSE1")%>");
            });
            <%
                }
            %>

            <%
                if (request.getAttribute("successFF1") != null) {

            %>
            $("document").ready(function () {

                alert("<%=request.getAttribute("successFF1")%>");
            });

            <%
                }

                if (request.getAttribute("reviseFF1") != null) {

            %>
            $("document").ready(function () {

                alert("<%=request.getAttribute("reviseFF1")%>");
            });

            <%
                }

                if (request.getAttribute("rejectFF1") != null) {

            %>
            $("document").ready(function () {

                alert("<%=request.getAttribute("rejectFF1")%>");
            });

            <%
                }
            %>

        </script>

        <style>
            tr:hover {
                background-color: lightgreen;
            }

            h4{
                font-size: 22px;
                text-align: left;
                margin-top: 10px;
                border-bottom: 2px solid green;
                padding-bottom: 7px;
                margin-bottom: 25px;
            }

            .table{
                border-bottom: 2px solid lightgray;
                margin-bottom: 30px;
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

            html{
                font-size:14px;
            }

            .navbar{
                height:8%;
            }

            .sidebar-expanded{
                margin-top: 0%;
            }
            
            .accomplishmentGreen{
                text-align: center;
                font-size: 17px;
                color: white;
                background-color: green;
            }
            
            .accomplishmentYellow{
                text-align: center;
                font-size: 17px;
                color: white;
                background-color: #FFBF00;
            }
            
            .accomplishmentRed{
                text-align: center;
                font-size: 17px;
                color: white;
                background-color: #cc0000;
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
                    <li class="nav-item dropdown d-sm-block d-md-none">*
                        <a class="nav-link" href="#" id="smallerscreenmenu">
                            Home
                        </a>
                        <a class="nav-link" href="#" id="smallerscreenmenu">
                            Proposals
                        </a>
                        <a class="nav-link" href="MULTIPLE-unitsList.jsp" id="smallerscreenmenu">
                            Units
                        </a>
                        <a class="nav-link" href="MULTIPLE-krasList.jsp" id="smallerscreenmenu">
                            Key Result Areas
                        </a>
                        <a class="nav-link" href="#" id="smallerscreenmenu">
                            Reports
                        </a>
                        <a class="nav-link" href="#" id="smallerscreenmenu">
                            Accomplishment
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
                                    <button type="submit" value="<%=n.get(i).getRedirect()%>" name="redirect" style="width:100%; background-color:white; text-align:left;"> 
                                        <li class="notification-box">
                                            <strong class="notificationBoxHeader"><%=n.get(i).getTitle()%></strong><br>
                                            <%=n.get(i).getBody()%>
                                        </li>
                                    </button>

                                    <input type="hidden" name="ID" value="<%=n.get(i).getAttribute()%>"/>

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
            <div id="sidebar-container" class="sidebar-expanded d-none d-md-block">
                <ul class="list-group sticky-top sticky-offset">
                    <!-- Menu with submenu -->
                    <a href="SIGNATORIES-home.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span class="fa fa-home fa-fw mr-2"></span>
                            <span class="menu-collapsed">Home</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>
                    <a href="MULTIPLE-socialEngagementProgramsList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span class="fa fa-check fa-fw mr-2"></span>
                            <span class="menu-collapsed">SE Programs</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>

                    <%
                        if (session.getAttribute("position").equals("CCS - Dean") || session.getAttribute("position").equals("COS - Dean")
                                || session.getAttribute("position").equals("GCOE - Dean") || session.getAttribute("position").equals("RVRCOB - Dean") || session.getAttribute("position").equals("COL - Dean")
                                || session.getAttribute("position").equals("BAGCED - Dean") || session.getAttribute("position").equals("CLA - Dean") || session.getAttribute("position").equals("SOE - Dean")) {
                    %>
                    <a href="MULTIPLE-faithFormationProgramsList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span class="fa fa-check fa-fw mr-2"></span>
                            <span class="menu-collapsed">FF Programs</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>
                    <% } %>

                </ul>
            </div>

            <!-- MAIN -->

            <div class="col py-3">
                <div class="container-fluid panels">
                    <h4>Key Result Areas </h4>
                    <form action="calculateTargets">
                        <%if (session.getAttribute("unit").equals("Office of the Vice President for Lasallian Mission")) {%><center><button class="btn btn-primary btn-sm" type="submit" name="edit" value="1">Edit Total Targets</button></center><%}%>
                            <%
                                DecimalFormat percentage = new DecimalFormat("0.00");
                                TargetDAO TargetDAO = new TargetDAO();
                                OvplmDAO OvplmDAO = new OvplmDAO();
                                ArrayList<KRA> kralist = OvplmDAO.retrieveKRA();
                                for (int x = 0; x < kralist.size(); x++) {
                            %>
                        <h5><%=kralist.get(x).getName()%></h5>
                        <table class="table table-bordered">
                            <thead class="thead-light">
                                <tr>
                                    <th style="width:30%">Goal</th>
                                    <th style="width:30%">Measure</th>
                                    <th style="width:30%">Target</th>
                                    <th style="width:5%">Accomplishment</th>
                                    <th style="width:5%"></th>
                                </tr>
                            </thead>
                            <%
                                KRA kra = OvplmDAO.retrieveKRAByID(kralist.get(x).getId());
                                for (int y = 0; y < kra.getGoals().size(); y++) {
                            %> 
                            <tr>
                                <td><%=kra.getGoals().get(y).getName()%></td>

                                <%
                                    for (int z = 0; z < kra.getGoals().get(y).getMeasures().size(); z++) {
                                %>
                                <%if (kra.getGoals().get(y).getMeasures().get(z).getUntrackable() == 1) {%>
                                <td><%if (z == 0) {%><b><%=kra.getGoals().get(y).getMeasures().get(z).getMeasure()%></b> - <%=kra.getGoals().get(y).getMeasures().get(z).getDescription()%><%}%></td>

                                <td><%if (z != 0) {%><b><%=kra.getGoals().get(y).getMeasures().get(z).getMeasure()%></b> - <%=kra.getGoals().get(y).getMeasures().get(z).getDescription()%><%}%>

                                    <%if (z == 0) {%>Not Trackable</td><%}%>
                                <%if (z != 0) {%><td>Not Trackable</td><%}%>


                                <%if (z != 0) {%><td class="accomplishmentRed">Not Trackable</td><%}%>
                                <%if (z == 0) {%><td class="accomplishmentRed">Not Trackable</td><%}%>

                                <%if (z == 0) {%><td><button class="btn btn-primary btn-sm" type="submit" name="buttonuntrackable" value="<%=kra.getGoals().get(y).getMeasures().get(z).getMeasureID()%>">View</button></td><%}%>                                    
                                <%if (z != 0) {%><td><button class="btn btn-primary btn-sm" type="submit" name="buttonuntrackable" value="<%=kra.getGoals().get(y).getMeasures().get(z).getMeasureID()%>">View</button></td><%}%>
                            </tr>
                            <%} else {%>
                            <td><%if (z == 0) {%><b><%=kra.getGoals().get(y).getMeasures().get(z).getMeasure()%></b> - <%=kra.getGoals().get(y).getMeasures().get(z).getDescription()%><%}%></td>
                            <td><%if (z != 0) {%><b><%=kra.getGoals().get(y).getMeasures().get(z).getMeasure()%></b> - <%=kra.getGoals().get(y).getMeasures().get(z).getDescription()%><%}%>

                                <%if (z == 0) {%><%=kra.getGoals().get(y).getMeasures().get(z).getNumtarget()%><%if (kra.getGoals().get(y).getMeasures().get(z).getNumtypetarget().equals("Count")) {%> <%=kra.getGoals().get(y).getMeasures().get(z).getNumtypetarget()%><%} else {%>%<%}%> of <%= kra.getGoals().get(y).getMeasures().get(z).getUnittarget()%> have undergone/conducted/contains a <%=kra.getGoals().get(y).getMeasures().get(z).getTypetarget()%> program/component <%if (!kra.getGoals().get(y).getMeasures().get(z).getEngagingtarget().equals("N/A")) {%> engaging <%=kra.getGoals().get(y).getMeasures().get(z).getEngagingtarget()%><%}%></td><%}%> 
                            <%if (z != 0) {%><td><%=kra.getGoals().get(y).getMeasures().get(z).getNumtarget()%><%if (kra.getGoals().get(y).getMeasures().get(z).getNumtypetarget().equals("Count")) {%> <%=kra.getGoals().get(y).getMeasures().get(z).getNumtypetarget()%><%} else {%>%<%}%> of <%= kra.getGoals().get(y).getMeasures().get(z).getUnittarget()%> have undergone/conducted/contains a <%=kra.getGoals().get(y).getMeasures().get(z).getTypetarget()%> program/component <%if (!kra.getGoals().get(y).getMeasures().get(z).getEngagingtarget().equals("N/A")) {%> engaging <%=kra.getGoals().get(y).getMeasures().get(z).getEngagingtarget()%><%}%></td><%}%> 

                            <% double percent = TargetDAO.calculateTarget(kra.getGoals().get(y).getMeasures().get(z), TargetDAO.getTotals()); %>
                            <%if(z==0){%><% if(percent >= 0 && percent <= 33.33){ %><td class="accomplishmentRed"><%=percentage.format(percent)%>%<%} else if(percent >= 33.34 && percent <= 66.66){%><td class="accomplishmentYellow"><%=percentage.format(percent)%>%<%} else if(percent >= 66.67 && percent <= 100){%><td class="accomplishmentGreen"><%=percentage.format(percent)%>%<%} else if(percent > 101) {%><td class="accomplishmentGreen">100%</td><%}%><%}%>
                            <%if(z!=0){%><% if(percent >= 0 && percent <= 33.33){ %><td class="accomplishmentRed"><%=percentage.format(percent)%>%<%} else if(percent >= 33.34 && percent <= 66.66){%><td class="accomplishmentYellow"><%=percentage.format(percent)%>%<%} else if(percent >= 66.67 && percent <= 100){%><td class="accomplishmentGreen"><%=percentage.format(percent)%>%<%} else if(percent > 101) {%><td class="accomplishmentGreen">100%</td><%}%><%}%>

                            <%if (z == 0) {%><td><button class="btn btn-primary btn-sm" type="submit" name="buttontrackable" value="<%=kra.getGoals().get(y).getMeasures().get(z).getMeasureID()%>">View</button></td><%}%>
                            <%if (z != 0) {%><td><button class="btn btn-primary btn-sm" type="submit" name="buttontrackable" value="<%=kra.getGoals().get(y).getMeasures().get(z).getMeasureID()%>">View</button></td><%}%>
                            </tr>    
                            <% }
                                }
                            } %>
                        </table>
                        <% } %>
                    </form>
                </div>

                <form action="viewSE" method="post">
                    <!--- table -->
                    <div class="container-fluid panels">
                        <h4>SE Proposals to Assess</h4>
                        <%
                            ArrayList<SE> proposals = new ArrayList();
                            if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Department Chair")) {
                                proposals = UserDAO.retrieveSEProposalByDepartment(UserDAO.getDepartmentByUserID(Integer.parseInt(session.getAttribute("userID").toString())));
                            }
                            if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Dean")) {
                                proposals = UserDAO.retrieveSEProposalByStepUnit(3, session.getAttribute("unit").toString());
                            }
                            if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Unit Chair")) {
                                proposals = UserDAO.retrieveSEProposalByStepUnit(1, session.getAttribute("unit").toString());
                            }

                            if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Social Engagement Director")) {
                                proposals = UserDAO.retrieveSEProposalByStepUnit(2, session.getAttribute("unit").toString());
                            }

                            if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("VP/VC")) {
                                proposals = UserDAO.retrieveSEProposalByStepUnit(3, session.getAttribute("unit").toString());
                            }
                        %>
                        <table id="example" class="table table-striped table-bordered" style="width:100%">    
                            <thead class="thead-dark" >
                                <tr>
                                    <th>Implementation</th>
                                    <th>Program Name</th>
                                    <th>Unit</th>
                                    <th>Department</th>
                                    <th>Program Head</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    for (int i = 0; i < proposals.size(); i++) {
                                        if (!UserDAO.isRevise(proposals.get(i).getId())) {
                                %>

                                <tr>
                                    <td><%=proposals.get(i).getActualDate()%></td>
                                    <td><%=proposals.get(i).getName()%></td>
                                    <td><%=proposals.get(i).getUnit()%></td>
                                    <td><%=proposals.get(i).getDepartment()%></td>
                                    <td><%=proposals.get(i).getProgramHead()%></td>
                                    <td><button type="submit" name="seID<%=i%>" value="<%=proposals.get(i).getId()%>"  class="btn btn-primary btn-sm">View</button></td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </form>
                <%
                    if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Dean")) {
                        ArrayList<FF> ffproposals = new ArrayList();
                        ffproposals = UserDAO.retrieveFFProposalByStepUnit(3, session.getAttribute("unit").toString());
                %>
                <form action="viewFF" method="post">

                    <div class="container-fluid panels">

                        <h4>FF Proposals to Assess</h4>
                        <table id="example2" class="table table-striped table-bordered" style="width:100%">    
                            <thead class="thead-dark" >
                                <tr>
                                    <th>Implementation</th>
                                    <th>Program Name</th>
                                    <th>Unit</th>
                                    <th>Department</th>
                                    <th>Program Head</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    for (int i = 0; i < ffproposals.size(); i++) {
                                        if (!UserDAO.isFFRevise(ffproposals.get(i).getId())) {
                                %>

                                <tr>
                                    <td><%=ffproposals.get(i).getActualDate()%></td>
                                    <td><%=ffproposals.get(i).getProjectName()%></td>
                                    <td><%=ffproposals.get(i).getUnit()%></td>
                                    <td><%=ffproposals.get(i).getDepartment()%></td>
                                    <td><%=ffproposals.get(i).getProgramHead()%></td>
                                    <td><button type="submit" name="ffID<%=i%>" value="<%=ffproposals.get(i).getId()%>"  class="btn btn-primary btn-sm">View</button></td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </tbody>
                        </table>

                        <%
                            }
                        %>
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