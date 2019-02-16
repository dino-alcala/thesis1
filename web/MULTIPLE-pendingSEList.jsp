<%-- 
    Document   : MULTIPLE-pendingSEList
    Created on : 06 18, 18, 7:50:22 PM
    Author     : Karl Madrid
--%>

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

        <title>Pending SE Programs List</title>

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

        <style>
            #myInput{
                margin-bottom: 20px;
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

            .table{
                margin-bottom: 20px;
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
                if (request.getAttribute("cancelProgram") != null) {

            %>
            $("document").ready(function () {

                alert("<%=request.getAttribute("cancelProgram")%>");
            });

            <%
                }

            %>

        </script>

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
            <div class="sidebar-expanded d-none d-md-block">
                <ul id="sidebar-container" class="list-group sticky-top sticky-offset">
                    <script>
                        $("#sidebar-container").load("sidebarmultiple.jsp");
                    </script>
                </ul>
            </div>

            <!-- MAIN -->
            <div class="col py-3">

                <form action="viewSE3" method="post">
                    <%
                        ArrayList<SE> my = new ArrayList();
                        my = UserDAO.retrievePendingSEProposalByUserID(Integer.parseInt(session.getAttribute("userID").toString()));
                    %>
                    <!--- table -->
                    <div class="container-fluid panels">
                        <div class="btn-group btn-group-justified">
                            <a type="button" class="btn btn-primary" id="buttonCompleted" href="MULTIPLE-socialEngagementProgramsList.jsp">Completed</a>
                            <a href="MULTIPLE-pendingSEList.jsp" type="button" class="btn btn-primary" id="buttonPending" >Pending</a>
                            <a href="MULTIPLE-cancelledSEList.jsp" type="button" class="btn btn-primary" id="buttonCancel" >Cancelled</a>
                            <a href="MULTIPLE-rejectedSEList.jsp" type="button" class="btn btn-primary" id="buttonRejected" >Rejected</a>

                        </div>

                        <br>
                        <h4>My Social Engagement Programs (<%=my.size()%>)</h4>

                        <table id="example" class="table table-striped table-bordered" style="width:100%">    
                            <thead class="thead-dark" >
                                <tr>
                                    <th>Implementation</th> 
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
                                    <td><%=my.get(i).getActualDate()%></td>
                                    <td><%=my.get(i).getName()%></td>
                                    <td><%=my.get(i).getUnit()%></td>
                                    <td><%=my.get(i).getDepartment()%></td>
                                    <td><%=my.get(i).getProgramHead()%></td>
                                    <td><% if(UserDAO.getStep(my.get(i).getId()) == 10){%> Pending Cancellation <%} else {%>Step <%=UserDAO.getStep(my.get(i).getId())%> <%}%></td>
                                    <td><button type="submit" name="viewSE<%=i%>" value="<%=my.get(i).getId()%>" class="btn btn-primary btn-sm">View</button></td>
                                </tr>

                                <%
                                    }
                                %>
                            </tbody>
                        </table>

                        <%
                            ArrayList<SE> others = new ArrayList();
                            others = UserDAO.retrievePendingSEProposalByOthers(Integer.parseInt(session.getAttribute("userID").toString()));
                        %>
                        <br><br>
                        <h4>All Social Engagement Programs (<%=others.size()%>)</h4>

                        <table id="example2" class="table table-striped table-bordered" style="width:100%">    
                            <thead class="thead-dark" >
                                <tr>
                                    <th>Implementation</th> 
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
                                    <td><%=others.get(i).getActualDate()%></td>
                                    <td><%=others.get(i).getName()%></td>
                                    <td><%=others.get(i).getUnit()%></td>
                                    <td><%=others.get(i).getDepartment()%></td>
                                    <td><%=others.get(i).getProgramHead()%></td>
                                    <td><% if(UserDAO.getStep(others.get(i).getId()) == 10){%> Pending Cancellation <%} else {%>Step <%=UserDAO.getStep(others.get(i).getId())%> <%}%></td>
                                    <td><button type="submit" name="viewOthers<%=i%>" value="<%=others.get(i).getId()%>" type="button" class="btn btn-primary btn-sm">View</button></td>
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
