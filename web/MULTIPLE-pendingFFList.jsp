<%-- 
    Document   : MULTIPLE-pendingSEList
    Created on : 06 18, 18, 7:50:22 PM
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

        <title>Pending FF Programs List</title>

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
                if (request.getAttribute("cancelProgram") != null) {

            %>
            $("document").ready(function () {

                alert("<%=request.getAttribute("cancelProgram")%>");
            });

            <%
                }

            %>

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

            h4{
                font-size: 25px;
                text-align: left;
                margin-top: 15px;
                border-bottom: 2px solid green;
                padding-bottom: 5px;
                margin-bottom: 25px;
                font-family: 'Roboto', sans-serif;
            }

            .budget{
                font-size: 70px; 
                text-align: center; 
                padding-bottom: 5px;
                font-family: 'Montserrat', sans-serif;
            }

            .table{
                margin-bottom: 20px;
            }

            .quickhead{
                border-bottom: 1px solid lightgreen;
                padding-bottom: 10px; 
                margin-bottom: 20px;
            }
            .quickview{
                margin-bottom: 50px;
                margin-top: 20px;
                background-color: white;
                padding-bottom: 15px;
                border-style: solid;
                border-color: lightgray;
                border-width: 1px;
                border-radius: 8px;
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

            h3{
                border-bottom: 2px solid green;
            }

            #buttonCompleted{
                color: green;
                background-color: white;
                border-color: green;
                margin-top:25px;
            }

            #buttonPending{
                color: white;
                background-color: green;
                border-color: green;
                margin-top:25px;
            }

            #buttonCancel{
                color: green;
                background-color: white;
                border-color: green;
                margin-top:25px;
            }
            
            #buttonRejected{
                color: green;
                background-color: white;
                border-color: green;
                margin-top:25px;
            }

            #buttonCompleted:hover{
                color: white;
                background-color: green;
                border-color: green;
            }

            #buttonPending:hover{
                color: white;
                background-color: green;
                border-color: green;
            }

            #buttonCancel:hover{
                color: white;
                background-color: green;
                border-color: green;
            }
            
            #buttonRejected:hover{
                color: white;
                background-color: green;
                border-color: green;
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
                    <button type="button" class="btn btn-info navbar-btn-notifications" href="#" data-toggle="dropdown">
                        <span class="badge badge-pill badge-primary" style="background-color:red; color:white; float:right;margin-bottom:-20px;">!</span> 
                        <i class="fa fa-bell"></i>
                    </button>
                </div>
                <div class="nav-button">
                    <div class="dropdown">
                        <button type="button" class="btn btn-info navbar-btn-notifications" href="#" data-toggle="dropdown">
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
                <form action="viewFF3" method="post">
                    <%
                        ArrayList<FF> my = new ArrayList();
                        my = UserDAO.retrievePendingFFProposalByUserID(Integer.parseInt(session.getAttribute("userID").toString()));
                    %>
                    <!--- table -->
                    <div class="container-fluid panels">
                        <div class="btn-group btn-group-justified">
                            <a type="button" class="btn btn-primary" id="buttonCompleted" href="MULTIPLE-faithFormationProgramsList.jsp">Completed</a>
                            <a href="MULTIPLE-pendingFFList.jsp" type="button" class="btn btn-primary" id="buttonPending" >Pending</a>
                            <a href="MULTIPLE-cancelledFFList.jsp" type="button" class="btn btn-primary" id="buttonCancel" >Cancelled</a>
                            <a href="MULTIPLE-rejectedFFList.jsp" type="button" class="btn btn-primary" id="buttonRejected" >Rejected</a>
                        </div>

                        <br>
                        <h4>My Faith Formation Programs (<%=my.size()%>)</h4>

                        <table id="example" class="table table-striped table-bordered" style="width:100%">    
                            <thead class="thead-dark" >
                                <tr>
                                    <th>Date</th> 
                                    <th>Program Name</th>
                                    <th>Unit</th>
                                    <th>Department</th>
                                    <th>Program Head</th>
                                    <th>Status</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="myTable">
                                <%
                                    for (int i = 0; i < my.size(); i++) {
                                %>
                                <tr>
                                    <td><%=my.get(i).getDatecreated()%></td>
                                    <td><%=my.get(i).getProjectName()%></td>
                                    <td><%=my.get(i).getUnit()%></td>
                                    <td><%=my.get(i).getDepartment()%></td>
                                    <td><%=my.get(i).getProgramHead()%></td>
                                    <td>Step <%=UserDAO.getStepFF(my.get(i).getId())%></td>
                                    <td><button type="submit" name="viewFF<%=i%>" value="<%=my.get(i).getId()%>" class="btn btn-primary btn-sm">View</button></td>
                                </tr>
                                <%

                                    }
                                %>
                            </tbody>
                        </table>

                        <br><br>
                        <%
                            ArrayList<FF> others = new ArrayList();
                            others = UserDAO.retrievePendingFFProposalByOthers(Integer.parseInt(session.getAttribute("userID").toString()));
                        %>
                        <h4>All Faith Formation Programs (<%=others.size()%>)</h4>

                        <table id="example2" class="table table-striped table-bordered" style="width:100%">    
                            <thead class="thead-dark" >
                                <tr>
                                    <th>Date</th> 
                                    <th>Program Name</th>
                                    <th>Unit</th>
                                    <th>Department</th>
                                    <th>Program Head</th>
                                    <th>Status</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="myTable">
                                <%
                                    for (int i = 0; i < others.size(); i++) {
                                %>
                                <tr>
                                    <td><%=others.get(i).getDatecreated()%></td>
                                    <td><%=others.get(i).getProjectName()%></td>
                                    <td><%=others.get(i).getUnit()%></td>
                                    <td><%=others.get(i).getDepartment()%></td>
                                    <td><%=others.get(i).getProgramHead()%></td>
                                    <td>Step <%=UserDAO.getStepFF(others.get(i).getId())%></td>
                                    <td><button type="submit" name="viewOthers<%=i%>" value="<%=others.get(i).getId()%>" class="btn btn-primary btn-sm">View</button></td>
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
