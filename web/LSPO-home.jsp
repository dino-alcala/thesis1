<%-- 
    Document   : LSPO-home
    Created on : 06 18, 18, 7:17:58 PM
    Author     : Karl Madrid
--%>

<%@page import="entity.FF"%>
<%@page import="java.util.Collections"%>
<%@page import="entity.KRA"%>
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

        <title>LSPO Home</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/sidebar.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

        <%
            if (session.getAttribute("unit").toString().equals("Lasallian Pastoral Office (LSPO)")) {
                try {
                    session.setAttribute("jspName", "LSPO-home.jsp");
                } catch (Exception e) {
                    
                }
            } else {
                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/"+ session.getAttribute("jspName").toString());
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
            #notifsScroll {
                overflow-y: auto; 
                overflow-x: hidden;
                height: 250px;
            }

            #myInput{
                margin-bottom: 20px;
            }

            .card-text{
                margin-bottom: 5px;
            }

            .progressnum{
                font-size: 12px;
                padding-bottom: 10px;
                border-bottom: 1px solid lightgray;
            }

            .krascards:hover {
                background-color: lightgreen;
            }

            tr:hover {
                background-color: lightgreen;
            }

            h2{
                font-size: 40px;
                text-align: left;
                margin-top: 20px;
                border-bottom: 2px solid green;
                padding-bottom: 10px;
                margin-bottom: 25px;
            }

            .budget{
                font-size: 70px; 
                text-align: center; 
                border-bottom: 2px solid lightgray;
                padding-bottom: 20px;
            }

            .table{
                border-bottom: 2px solid lightgray;
                margin-bottom: 30px;
            }

            .quickhead{
                border-bottom: 1px solid lightblue;
                padding-bottom: 10px; 
                margin-bottom: 20px;
            }
            .quickview{
                margin-bottom: 50px;
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


            .viewButton{
                text-align: center;
                margin-bottom: 0%;
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
                <span class="menu-collapsed">Lasallian Pastoral Office (LSPO)</span>
            </a>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown d-sm-block d-md-none">
                        <a class="nav-link" href="LSPO-home.jsp" id="smallerscreenmenu">
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
            <div id="sidebar-container" class="sidebar-expanded d-none d-md-block">
                <ul class="list-group sticky-top sticky-offset">
                    <!-- Menu with submenu -->
                    <a href="LSPO-home.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span class="fa fa-home fa-fw mr-2"></span>
                            <span class="menu-collapsed">Home</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>
                    <a href="#submenuProposals" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span class="fa fa-folder-open fa-fw mr-2"></span>
                            <span class="menu-collapsed">Programs</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>
                    <div id="submenuProposals" class="collapse sidebar-submenu">
                        <a href="MULTIPLE-createSE.jsp"  class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                            <span class="menu-collapsed" id="subMenuCategory">Create SE Program Proposal</span>
                        </a>
                        <a href="MULTIPLE-createFF.jsp"  class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                            <span class="menu-collapsed" id="subMenuCategory">Create FF Program Proposal</span>
                        </a>
                        <a href="MULTIPLE-socialEngagementProgramsList.jsp" class="list-group-item list-group-item-action" id="subMenuCategoryBox">
                            <span class="menu-collapsed" id="subMenuCategory">SE Programs</span>
                        </a>
                        <a href="MULTIPLE-faithFormationProgramsList.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                            <span class="menu-collapsed" id="subMenuCategory">FF Programs</span>
                        </a>
                        <%
                            if (session.getAttribute("position").toString().equals("LSPO - Director")) {

                        %>
                        <a href="MULTIPLE-seProgramsForApproval.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                            <span class="menu-collapsed" id="subMenuCategory">For Approval</span>
                        </a>
                        <%                            }
                        %>
                    </div>
                    <a href="MULTIPLE-unitsList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span class="fa fa-group fa-fw mr-2"></span>
                            <span class="menu-collapsed">Units</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>
                    <a href="#submenuCommunity" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span class="fa fa-building fa-fw mr-2"></span>
                            <span class="menu-collapsed">Communities</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>
                    <div id="submenuCommunity" class="collapse sidebar-submenu">
                        <a href="MULTIPLE-addCommunity.jsp" class="list-group-item list-group-item-action" id="subMenuCategoryBox">
                            <span class="menu-collapsed" id="subMenuCategory">Add Community</span>
                        </a>
                        <a href="MULTIPLE-communityList.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                            <span class="menu-collapsed" id="subMenuCategory">Communities</span>
                        </a>
                    </div>
                    <a href="MULTIPLE-krasList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span class="fa fa-check-square-o fa-fw mr-2"></span>
                            <span class="menu-collapsed">Key Result Areas</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>
                    <% if(session.getAttribute("position").toString().equals("LSPO - Director")) {%>
                    <a href="#submenuReports" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                            <div class="d-flex w-100 justify-content-start align-items-center">
                                <span class="fa fa-bar-chart fa-fw mr-2"></span>
                                <span class="menu-collapsed">Reports</span>
                                <span class="submenu-icon ml-auto"></span>
                            </div>
                        </a>
                        <div id="submenuReports" class="collapse sidebar-submenu">
                            <a href="#" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                                <span class="menu-collapsed" id="subMenuCategory">Accomplishment</span>
                            </a>
                            <a href="#" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                                <span class="menu-collapsed" id="subMenuCategory">Budgets</span>
                            </a>
                            <a href="#" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                                <span class="menu-collapsed" id="subMenuCategory">Communities</span>
                            </a>
                            <a href="#" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                                <span class="menu-collapsed" id="subMenuCategory">Programs</span>
                            </a>
                            <a href="#" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                                <span class="menu-collapsed" id="subMenuCategory">Units</span>
                            </a>
                            <a href="OVPLM-termEndReport.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                                <span class="menu-collapsed" id="subMenuCategory">Term-End</span>
                            </a>
                        </div>
                    <% } %>
                    <a href="MULTIPLE-evaluationSEResponsesList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span class="fa fa-pencil-square-o fa-fw mr-2"></span>
                            <span class="menu-collapsed">Evaluation Forms</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>
                </ul>

            </div>


            <!-- MAIN -->
            <div class="col py-3">

                <!---KRAs-->
                <div class="container-fluid panels">

                    <h2>Key Result Areas</h2>

                    <h2>Key Result Areas</h2>

                    <h5>KRA 3. Formation for all sectors that is truly Lasallian </h5>
                    <table class="table table-bordered">
                        <thead class="thead-light">
                            <tr>
                                <th scope="col">Goals</th>
                                <th scope="col">Measures</th>
                                <th scope="col">Targets</th>
                                <th scope="col">Accomplishment</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!--- Goal 1 Measure 1-->
                            <tr>
                                <td><b>G1 </b> Implement sustainable, holistic and developmental Lasallian formation  across all sectors based on the Lasallian Guiding Principles </td>
                                <td><b>M1</b> Integration in curricular and co-curricular programs of formation based on Lasallian spirituality and mission </td>
                                <td>50% of student organizations have implemented a Lasallian formation activity</td>
                                <td class="accomplishmentRed">15%</td>
                            </tr>

                            <!--- Goal 1 Measure 2-->
                            <tr>
                                <td></td>
                                <td><b>M2</b> Participation of administrators, faculty and personnel in Lasallian formation activity </td>
                                <td>50% of faculty departments have undergone Lasallian formation program</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td>75% of staff have undergone Lasallian formation programs  </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td>All administrators have undergone the Lasallian formation activity  </td>
                                <td></td>
                            </tr>

                            <!--- Goal 1 Measure 3-->
                            <tr>
                                <td></td>
                                <td><b>M3</b> Number of Lasallian formation activities available for other sectors in the DLSU community  </td>
                                <td>At Least one formation activity engaging alumni, parents, and community partners.</td>
                                <td></td>
                            </tr>

                            <!--- Goal 2 Measure 1-->
                            <tr>
                                <td><b>G2 </b> Implement sustainable, holistic and developmental Lasallian formation  across all sectors based on the Lasallian Guiding Principles </td>
                                <td><b>M1</b> Number of fora and other interdisciplinary activities focused on bridging faith and scholarship (e.g. ethics, heritage, culture, science, theology, philosophy) </td>
                                <td>At least one interdisciplinary activity conducted each term</td>
                                <td></td>
                            </tr>


                            <!--- Goal 2 Measure 2-->
                            <tr>
                                <td> </td>
                                <td><b>M2</b> Participation of international students in co-curricular activities promoting interfaith and multicultural diversity </td>
                                <td>50% of international students participate in co-curricular activities promoting interfaith and multicultural diversity</td>
                                <td></td>
                            </tr>

                            <!--- Goal 3 Measure 1-->
                            <tr>
                                <td><b>G3 </b> Implement sustainable, holistic and developmental Lasallian formation  across all sectors based on the Lasallian Guiding Principles </td>
                                <td><b>M1</b> Number of Lasallian communities committed to the Lasallian mission  </td>
                                <td>3 communities</td>
                                <td></td>
                            </tr>

                        </tbody>
                    </table>

                    <h5>KRA 5.  Community that is attuned to a sustainable Earth and socially engaged </h5>
                    <table class="table table-bordered">
                        <thead class="thead-light">
                            <tr>
                                <th scope="col">Goals</th>
                                <th scope="col">Measures</th>
                                <th scope="col">Targets</th>
                                <th scope="col">Accomplishment</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!--- Goal 1 Measure 1-->
                            <tr>
                                <td><b>G1 </b> Each unit of the University has at least one sustainable social engagement project </td>
                                <td><b>M1</b> Number of sustainable social engagement project of units </td>
                                <td>20%</td>
                                <td class="accomplishmentGreen">20%</td>
                            </tr>


                            <!--- Goal 1 Measure 2A-->
                            <tr>
                                <td></td>
                                <td><b>M2</b> Involvement of faculty, student, and personnel in DLSU community engagement programs and activities <b>A.</b> Percentage of student organizations involved in community engagement programs and activities</td>
                                <td>50%</td>
                                <td></td>
                            </tr>

                            <!--- Goal 1 Measure 2B-->
                            <tr>
                                <td></td>
                                <td><b>M2</b> Involvement of faculty, student, and personnel in DLSU community engagement programs and activities <b>B.</b> Percentage of staff engaged in community engagement programs and activities</td>
                                <td>50%</td>
                                <td></td>
                            </tr>

                            <!--- Goal 1 Measure 2C-->
                            <tr>
                                <td></td>
                                <td><b>M2</b> Involvement of faculty, student, and personnel in DLSU community engagement programs and activities <b>C.</b> Percentage of departments with community engagement project  </td>
                                <td>20%</td>
                                <td></td>
                            </tr>

                            <!--- Goal 1 Measure 3-->
                            <tr>
                                <td></td>
                                <td><b>M3</b> Number of social engagement choices under the four components of the Sustainable Development Goals Localization Project
                                     L-ARAL, (Education)  L-SEED (Social Enterprise)  L-Envisage (Environment / DRR)  L-HEARTS (Health and Wellness) 
                                </td>
                                <td>16</td>
                                <td></td>
                            </tr>

                            <!--- Goal 2 Measure 1A-->
                            <tr>
                                <td><b>G2</b> Service Learning is institutionalized</td>
                                <td><b>M1</b> Service learning (SL) component of academic programs   
                                    <b>A.</b> Percentage of undergraduate programs with SL component</td>
                                <td>50%</td>
                                <td></td>
                            </tr>

                            <!--- Goal 2 Measure 1B-->
                            <tr>
                                <td></td>
                                <td><b>M1</b> Service learning (SL) component of academic programs   
                                    <b>B.</b> Percentage of graduate programs with SL component </td>
                                <td>10%</td>
                                <td></td>
                            </tr>

                            <!--- Goal 2 Measure 2-->
                            <tr>
                                <td></td>
                                <td><b>M2</b> Number of international SL activities </td>
                                <td>1</td>
                                <td></td>
                            </tr>

                        </tbody>
                    </table>

                </div>


                <!--- table -->
                <%
                    if (Integer.parseInt(session.getAttribute("userID").toString()) == 32) {

                        ArrayList<FF> f = new ArrayList();
                        f = UserDAO.retrieveFFProposalToAssessByStep(5);
                %>
                <form action="viewProposalsAssess" method="post">
                    <div class="container-fluid panels">

                        <h2>FF Proposals to assess (<%=f.size()%>)</h2>

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
                                    for (int i = 0; i < f.size(); i++) {
                                %>
                                <tr>
                                    <td><%=f.get(i).getDatecreated()%></td>
                                    <td><%=f.get(i).getProjectName()%></td>
                                    <td><%=f.get(i).getUnit()%></td>
                                    <td><%=f.get(i).getDepartment()%></td>
                                    <td><%=f.get(i).getProgramHead()%></td>
                                    <td><button type="submit" name="viewFF<%=i%>" value="<%=f.get(i).getId()%>" class="btn btn-primary btn-sm">View</button></td>
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
