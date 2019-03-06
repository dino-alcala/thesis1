<%-- 
    Document   : COSCA-home
    Created on : 06 18, 18, 7:13:13 PM
    Author     : Karl Madrid
--%>

<%@page import="dao.OvplmDAO"%>
<%@page import="dao.TargetDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="entity.FF"%>
<%@page import="entity.SE"%>
<%@page import="java.util.Collections"%>
<%@page import="entity.KRA"%>
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

        <title>COSCA Home</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/sidebar.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

        <%
            if (session.getAttribute("unit").toString().equals("Center for Social Concern and Action (COSCA)")) {
                try {
                    session.setAttribute("jspName", "COSCA-home.jsp");
                } catch (Exception e) {

                }
            } else {
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/" + session.getAttribute("jspName").toString());
                dispatcher.forward(request, response);
            }
        %>

        <script>
            $(document).ready(function () {
                $("#myInput").on("keyup", function () {
                    var value = $(this).val().toLowerCase();
                    $("#myTable tr").filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
            });

            function sortTable(n) {
                var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
                table = document.getElementById("myTable");
                switching = true;
                dir = "asc";
                while (switching) {
                    switching = false;
                    rows = table.getElementsByTagName("TR");
                    for (i = 0; i < (rows.length - 1); i++) {
                        shouldSwitch = false;
                        x = rows[i].getElementsByTagName("TD")[n];
                        y = rows[i + 1].getElementsByTagName("TD")[n];
                        if (dir == "asc") {
                            if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {

                                shouldSwitch = true;
                                break;
                            }
                        } else if (dir == "desc") {
                            if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                                shouldSwitch = true;
                                break;
                            }
                        }
                    }
                    if (shouldSwitch) {
                        rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                        switching = true;

                        switchcount++;
                    } else {
                        if (switchcount == 0 && dir == "asc") {
                            dir = "desc";
                            switching = true;
                        }
                    }
                }
            }

        </script>

        <style>
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

            .button{
                background-color: #333333;
                border: 5px;
                color: white;
                font-size:17px;
                text-align: center;
                font-family: "Times New Roman", Times, serif;
                width:100%;
            }

            #myInput{
                margin-bottom: 20px;
            }

            .card-text{
                margin-bottom: 5px;
            }

            tr:hover {
                background-color: lightgreen;
            }

            h4{
                font-size: 20px;
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
                        <a class="nav-link" href="COSCA-home.jsp" id="smallerscreenmenu">
                            Home
                        </a>
                        <a class="nav-link" href="MULTIPLE-faithFormationProgramsList.jsp" id="smallerscreenmenu">
                            Programs
                        </a>
                        <a class="nav-link" href="MULTIPLE-unitsList.jsp" id="smallerscreenmenu">
                            Units
                        </a>
                        <a class="nav-link" href="MULTIPLE-communityList.jsp" id="smallerscreenmenu">
                            Communities
                        </a>
                        <a class="nav-link" href="MULTIPLE-krasList.jsp" id="smallerscreenmenu">
                            Key Result Areas
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


        <!--Bootstrap row-->
        <div class="row" id="body-row">

            <!--Sidebar-->
            <div class="sidebar-expanded d-none d-md-block">
                <ul id="sidebar-container" class="list-group sticky-top sticky-offset">
                    <script>
                        $("#sidebar-container").load("sidebarmultiple.jsp");
                    </script>
                </ul>
            </div>


            <!--MAIN-->
            <div class="col py-3">

                <!---KRAs-->
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


                <!---table-->

                <%
                    if (session.getAttribute("position").equals("COSCA - Sir Neil Position")) {

                        ArrayList<SE> s = new ArrayList<SE>();
                        s = UserDAO.retrieveSEProposalByStep(4);
                %>
                <form action="viewProposalsAssess" method="post">
                    <div class="container-fluid panels">

                        <h4>SE Proposals to assess (<%=s.size()%>)</h4>

                        <input class="form-control" id="myInput" type="text" placeholder="Search table..">

                        <table class="table ">
                            <thead class="thead-dark">
                                <tr>
                                    <th onclick="sortTable(0)">Date</th>
                                    <th onclick="sortTable(1)">Program Name</th>
                                    <th onclick="sortTable(2)">Unit</th>
                                    <th onclick="sortTable(3)">Department</th>
                                    <th onclick="sortTable(4)">Program Head</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="myTable">
                                <%
                                    for (int i = 0; i < s.size(); i++) {
                                %>
                                <tr>
                                    <td><%=s.get(i).getDate()%></td>
                                    <td><%=s.get(i).getName()%></td>
                                    <td><%=s.get(i).getUnit()%></td>
                                    <td><%=s.get(i).getDepartment()%></td>
                                    <td><%=s.get(i).getProgramHead()%></td>
                                    <td><button type="submit" name="viewSE<%=i%>" value="<%=s.get(i).getId()%>" class="btn btn-primary btn-sm">View</button></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </form>
                <%
                    }
                %>

                <%
                    if (session.getAttribute("position").equals("COSCA - Director")) {

                        ArrayList<SE> s = new ArrayList<SE>();
                        s = UserDAO.retrieveSEProposalByStep(5);
                %>
                <form action="viewProposalsAssess" method="post">
                    <div class="container-fluid panels">

                        <h4>SE Proposals to assess (<%=s.size()%>)</h4>

                        <input class="form-control" id="myInput" type="text" placeholder="Search table..">

                        <table class="table ">
                            <thead class="thead-dark">
                                <tr>
                                    <th onclick="sortTable(0)">Date</th>
                                    <th onclick="sortTable(1)">Program Name</th>
                                    <th onclick="sortTable(2)">Unit</th>
                                    <th onclick="sortTable(3)">Department</th>
                                    <th onclick="sortTable(4)">Program Head</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="myTable">
                                <%
                                    for (int i = 0; i < s.size(); i++) {
                                %>
                                <tr>
                                    <td><%=s.get(i).getDate()%></td>
                                    <td><%=s.get(i).getName()%></td>
                                    <td><%=s.get(i).getUnit()%></td>
                                    <td><%=s.get(i).getDepartment()%></td>
                                    <td><%=s.get(i).getProgramHead()%></td>
                                    <td><button type="submit" name="viewSE<%=i%>" value="<%=s.get(i).getId()%>" class="btn btn-primary btn-sm">View</button></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </form>
                <%
                    }
                %>

                <form action="viewProposalsProgress" method="post">             
                    <div class="container-fluid panels">
                        <%
                            ArrayList<SE> proposals = new ArrayList();
                            proposals = UserDAO.retrieveSEbyUnit(session.getAttribute("unit").toString());
                        %>
                        <h4>SE Proposals Progress for <%=session.getAttribute("unit").toString()%> (<%=proposals.size()%>)</h4>

                        <input class="form-control" id="myInput2" type="text" placeholder="Search table..">
                        <br>
                        <table class="table">
                            <thead class="thead-dark">
                                <tr>
                                    <th onclick="sortTable(0)">Date</th>
                                    <th onclick="sortTable(1)">Program Name</th>
                                    <th onclick="sortTable(2)">Program Head</th>
                                    <th onclick="sortTable(3)">Funded by</th>
                                    <th onclick="sortTable(4)">Status</th>
                                    <th onclick="sortTable(5)">Department</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="myTable2">
                                <%
                                    for (int i = 0; i < proposals.size(); i++) {
                                %>
                                <tr>
                                    <td><%=proposals.get(i).getDate()%></td>
                                    <td><%=proposals.get(i).getName()%></td>
                                    <td><%=proposals.get(i).getProgramHead()%></td>
                                    <td><%=UserDAO.getSourceOfFunds(proposals.get(i).getId())%></td>
                                    <td>Step <%=UserDAO.getStep(proposals.get(i).getId())%></td>
                                    <td><center><%=proposals.get(i).getDepartment()%></center></td>
                            <td><button type="submit" name="viewSE<%=i%>" value="<%=proposals.get(i).getId()%>" class="btn btn-primary btn-sm">View</button></td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
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
