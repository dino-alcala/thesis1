<%-- 
    Document   : SIGNATORIES-home
    Created on : 07 11, 18, 9:36:35 PM
    Author     : Karl Madrid
--%>

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
<<<<<<< HEAD

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

=======
>>>>>>> 00b57db8acffec7f4509301f873cb2498fcc8958
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
            }
            .krascards:hover {
                background-color: lightgreen;
            }
            tr:hover {
                background-color: lightgreen;
            }
            h2{
                font-size: 30px;
                text-align: left;
                margin-top: 20px;
                border-bottom: 2px solid green;
                padding-bottom: 10px;
                margin-bottom: 25px;
                font-family: 'Roboto', sans-serif;
            }
            .budget{
                font-size: 70px; 
                text-align: center; 
                border-bottom: 2px solid lightgray;
                padding-bottom: 20px;
                font-family: 'Montserrat', sans-serif;
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
                    <button type="button" class="btn btn-default navbar-btn-profile">
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

                </ul>
            </div>

            <!-- MAIN -->

            <div class="col py-3">
                <form action="viewSE" method="post">
                    <!--- table -->
                    <div class="container-fluid panels">


                        <h2>SE Proposals to Assess</h2>
                        <%
                            ArrayList<SE> proposals = new ArrayList();
                            if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString())) + " - Department Chair")) {
                                proposals = UserDAO.retrieveSEProposalByDepartment(UserDAO.getDepartmentByUserID(Integer.parseInt(session.getAttribute("userID").toString())));
                            }
                            if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString())) + " - ADEALM")) {
                                proposals = UserDAO.retrieveSEProposalByStep(2);
                            }
                            if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString())) + " - Dean")) {
                                proposals = UserDAO.retrieveSEProposalByStep(3);
                            }
                        %>
                        <table id="example" class="table table-striped table-bordered" style="width:100%">    
                            <thead class="thead-dark" >
                                <tr>
                                    <th>Date</th>
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
                                    <td><%=proposals.get(i).getDate()%></td>
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
                    if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString())) + " - Dean")) {
                        ArrayList<FF> ffproposals = new ArrayList();
                        ffproposals = UserDAO.retrieveFFProposalByStep(3);
                %>
                <form action="viewFF" method="post">

                    <div class="container-fluid panels">

                        <h2>FF Proposals to Assess</h2>
                        <table id="example2" class="table table-striped table-bordered" style="width:100%">    
                            <thead class="thead-dark" >
                                <tr>
                                    <th>Date</th>
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
                                    <td><%=ffproposals.get(i).getDatecreated()%></td>
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