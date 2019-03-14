<%-- 
    Document   : ADMIN-editEmployee
    Created on : 06 12, 18, 12:06:56 PM
    Author     : Karl Madrid
--%>

<%@page import="entity.Unit"%>
<%@page import="entity.Notification"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.User"%>
<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>Edit Employee</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/sidebar.css">
        <link rel="stylesheet" href="css/formstyle1.css">
        <link rel="stylesheet" type="text/css" href="css/homepagestyle.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

        <style>
            html{
                font-size:14px;
            }
            
            .navbar{
                height:8%;
            }
            
            .sidebar-expanded{
                margin-top: -1%;
            }
            
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
            
            body{
                background-color: whitesmoke;
                padding-top: 56px;
            }
            
            
            h1{
                font-size: 25px;
                text-align: left;
                border-bottom: 2px solid green;
                padding-bottom: 7px;
                font-family: "Arial", Helvetica, sans-serif;
            }   
            
            label, .btn-warning, select, option, #inputText{
               font-family: "Arial", Helvetica, sans-serif;
            }
            
            .formBg{
                width: 60%;
                padding: 10px;
                margin-top: 0px;
            }
            
            .btn-warning{
                color: white;
            }
        </style>

        <%
            UserDAO UserDAO = new UserDAO();
            User u = new User();
            u = UserDAO.getEmployee(Integer.parseInt(request.getAttribute("userID").toString()));
        %>

        <script type="text/javascript">
            function department(c1, c2) {

        <%
                ArrayList<Unit> units = new ArrayList();
                units = UserDAO.retrieveUnits();
        %>

                var c1 = document.getElementById(c1);
                var c2 = document.getElementById(c2);
                c2.innerHTML = "";
        <%
                for (int i = 0; i < units.size(); i++) {
                    ArrayList<Integer> departmentID = new ArrayList();
                    departmentID = UserDAO.retrieveDepartmentByUnitID(units.get(i).getUnitID());
        %>

                if (c1.value == "<%=units.get(i).getName()%>") {
        <%
                if (departmentID.size() > 1) {
        %>
                var nodept = document.createElement("option");
                        nodept.value = 0;
                        nodept.innerHTML = "No Department";
                        c2.options.add(nodept);
        <%
                }
        %>

                var optionArray = [<%for (int j = 0; j < departmentID.size(); j++) {%>"<%=UserDAO.getDepartmentByID(departmentID.get(j)).getDepartmentID()%>|<%=UserDAO.getDepartmentByID(departmentID.get(j)).getName()%>",<%}%>];
                        }

        <%
                }
        %>
                        for (var option in optionArray) {
                            var pair = optionArray[option].split("|");
                            var newOption = document.createElement("option");
                            newOption.value = pair[0];
                            newOption.innerHTML = pair[1];
                            c2.options.add(newOption);
                        }

                    }
    </script>

    </head>

    <body onload="department('type', 'dept')">
        <!-- Bootstrap NavBar -->
        <nav class="navbar navbar-expand-md fixed-top" id="navbar">
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation" id="smallerscreenmenuButton">
                <span class="fa fa-align-justify"></span>
            </button>
            <a class="navbar-brand" href="#" id="navbar-unit">
                <img src="https://upload.wikimedia.org/wikipedia/en/thumb/c/c2/De_La_Salle_University_Seal.svg/1200px-De_La_Salle_University_Seal.svg.png" width="30" height="30" class="d-inline-block align-top" data-toggle="sidebar-colapse" id="collapse-icon">
                <span class="menu-collapsed">Administrator</span>
            </a>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown d-sm-block d-md-none">
                        <a class="nav-link" href="#" id="smallerscreenmenu">
                            Home
                        </a>
                        <a class="nav-link" href="#" id="smallerscreenmenu">
                            Add Employee
                        </a>
                        <a class="nav-link" href="#" id="smallerscreenmenu">
                            Create Employee
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
                                    <button type="submit" value="<%=n.get(i).getId()%>" name="redirect" style="width:100%; background-color:white; text-align:left;"> 
                                        <li class="notification-box">
                                            <strong class="notificationBoxHeader"><%=n.get(i).getTitle()%></strong><br>
                                            <%=n.get(i).getBody()%>
                                        </li>
                                    </button>
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
        <!-- NavBar END -->

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
                <div class="row">
                    <div class="col-lg-12">
                        <div class="formBg">
                            <h1>Edit Employee</h1>

                            <div class="panel panel-success">

                                <div class="panel-heading"></div>

                                <div class="panel-body">

                                    <form action="editEmployee" method="post">
                                        <ul class="form-style-1">

                                            <li><label>Full Name <span class="required"></span></label>
                                                <input id= "inputText" type="text" value="<%=u.getFirstName()%>" name="firstName" class="field-divided" placeholder="First" />&nbsp;<input id= "inputText" type="text" name="lastName" value="<%=u.getLastName()%>" class="field-divided" placeholder="Last" />
                                            </li>

                                            <li>
                                                <label>Email <span class="required"></span></label>
                                                <input id= "inputText" type="email" name="email" value="<%=u.getEmail()%>" class="field-long" />
                                            </li>

                                            <li>
                                                <label>Unit</label>
                                                <select class="form-control" id="type" name="unit" onchange="department(this.id, 'dept')">
                                                    <optgroup label="Academic Units">
                                                        <option disabled selected>Select Unit</option>
                                                        <%
                                                            units = UserDAO.retrieveUnitsAcademic();
                                                            for (int k = 0; k < units.size(); k++) {
                                                        %>
                                                        <option <%if(units.get(k).getName().equals(u.getUnit())){%>selected<%}%>><%=units.get(k).getName()%></option>
                                                        <%
                                                            }
                                                        %>
                                                    </optgroup>
                                                    <optgroup label="Non-Academic Units">
                                                        <%
                                                            units = UserDAO.retrieveUnitsNonAcademic();
                                                            for (int k = 0; k < units.size(); k++) {
                                                        %>
                                                        <option <%if(units.get(k).getName().equals(u.getUnit())){%>selected<%}%>><%=units.get(k).getName()%></option>
                                                        <%
                                                            }
                                                        %>
                                                    </optgroup>
                                                </select>
                                            </li>

                                            <li>
                                                <label>Department</label>
                                                <select name="dept" id="dept" class="field-select">
                                                </select>
                                            </li>

                                            <li>
                                                <label>Username <span class="required"></span></label>
                                                <input id= "inputText" type="text" name="username" class="field-long" value="<%=u.getUsername()%>" disabled="true" />
                                            </li>

                                            <li>
                                                <label>Password <span class="required"></span></label>
                                                <input id= "inputText" type="password" name="password" class="field-long" />
                                            </li>

                                            <li>
                                                <label>Confirm Password <span class="required"></span></label>
                                                <input id= "inputText" type="password" name="field8" class="field-long" />
                                            </li>

                                            <li align="center">
                                                <button type="submit" name="id" value="<%=u.getId()%>" class="btn btn-warning">Edit Employee</button>
                                            </li>

                                        </ul>
                                    </form>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>

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