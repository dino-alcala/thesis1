<%-- 
    Document   : ADMIN-editEmployee
    Created on : 06 12, 18, 12:06:56 PM
    Author     : Karl Madrid
--%>

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
                var c1 = document.getElementById(c1);
                var c2 = document.getElementById(c2);

                c2.innerHTML = "";

                if (c1.value == "Center for Social Concern and Action (COSCA)") {
                    var optionArray = ["0|N/A"];
                }

                if (c1.value == "Br. Andrew Gonzales College of Education (BAGCED)") {
                    var optionArray = ["1|Counselling and Educational Psychology Department (CEPD)", "2|Departmentof English and Applied Linguistics (DEAL)", "3|Educational Leadership and Management Department (ELMD)", "4|Physical Education Department (PED)", "5|Science Education Department (SED)"];
                }

                if (c1.value == "College of Computer Studies (CCS)") {
                    var optionArray = ["6|Computer Technology (CT)", "7|Information Technology (IT)", "8|Software Technology (ST)"];
                }

                if (c1.value == "College of Liberal Arts (CLA)") {
                    var optionArray = ["9|Behavioral Sciences", "10|Communication", "11|Literature", "12|Filipino", "13|History", "14|International Studies"
                                , "15|Philosophy", "16|Political Science", "17|Psychology", "18|Theology and Religious Education"];
                }

                if (c1.value == "College of Science (COS)") {
                    var optionArray = ["19|Biology", "20|Chemistry", "21|Mathematics", "22|Physics"];
                }

                if (c1.value == "Gokongwei College of Engineering (GCOE)") {
                    var optionArray = ["23|Chemical Engineering", "24|Civil Engineering", "25|Electronics and Communications Engineering", "26|Industrial Engineering", "27|Manufacturing Engineering and Management", "28|Mechanical Engineering"];
                }

                if (c1.value == "Ramon V. del Rosario College of Business (RVRCOB)") {
                    var optionArray = ["29|Accountancy", "30|Commercial Law", "31|Decision Sciences and Innovation Department", "32|Management of Financial Institutions", "33|Management and Organization Department", "34|Marketing Management"];
                }

                if (c1.value == "School of Economics (SOE)") {
                    var optionArray = ["35|Industrial Applied Economics", "36|Financial Appied Economics", "37|Ladderized Applied Economics", "38|Management of Financial Institutions", "39|Management and Organization Department", "40|Marketing Management"];
                }

                for (var option in optionArray) {
                    var pair = optionArray[option].split("|");
                    var newOption = document.createElement("option");
                    newOption.value = pair[0];

                    if (newOption.value == <%=u.getDepartment()%>) {
                        newOption.selected = "selected";
                    }

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
        <!-- NavBar END -->

        <!-- Bootstrap row -->
        <div class="row" id="body-row">

            <!-- Sidebar -->
            <div id="sidebar-container" class="sidebar-expanded d-none d-md-block">
                <ul class="list-group sticky-top sticky-offset">
                    <!-- Menu with submenu -->
                    <a href="ADMIN-home.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span class="fa fa-home fa-fw mr-2"></span>
                            <span class="menu-collapsed">Home</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>
                </ul>
                <!-- List Group END-->
            </div>
            <!-- sidebar-container END -->

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
                                                <select name="unit" id="type" class="field-select" onchange="department(this.id, 'dept')">
                                                    <optgroup label ="Offices">
                                                        <option <%if (u.getUnit().equals("Center for Social Concern and Action (COSCA)")) {%> selected="selected"<%}%>>Center for Social Concern and Action (COSCA)</option>
                                                        <option <%if (u.getUnit().equals("Dean of Student Affairs")) {%> selected="selected"<%}%>>Dean of Student Affairs</option>
                                                        <option <%if (u.getUnit().equals("Laguna Campus Lasallian Mission")) {%> selected="selected"<%}%>>Laguna Campus Lasallian Mission</option>
                                                        <option <%if (u.getUnit().equals("Lasallian Mission Director")) {%> selected="selected"<%}%>>Lasallian Mission Director</option>
                                                        <option <%if (u.getUnit().equals("Lasallian Pastoral Office (LSPO)")) {%> selected="selected"<%}%>>Lasallian Pastoral Office (LSPO)</option>
                                                        <option <%if (u.getUnit().equals("Office of the Vice President for Lasallian Mission (OVPLM)")) {%> selected="selected"<%}%>>Office of the Vice President for Lasallian Mission (OVPLM)</option>
                                                        <option <%if (u.getUnit().equals("Office of Personnel Management Director")) {%> selected="selected"<%}%>>Office of Personnel Management Director</option>
                                                    </optgroup>
                                                    <optgroup label="Colleges">
                                                        <option <%if (u.getUnit().equals("Br. Andrew Gonzales College of Education (BAGCED)")) {%> selected="selected"<%}%>>Br. Andrew Gonzales College of Education (BAGCED)</option>
                                                        <option <%if (u.getUnit().equals("College of Computer Studies (CCS)")) {%> selected="selected"<%}%>>College of Computer Studies (CCS)</option>
                                                        <option <%if (u.getUnit().equals("College of Law (COL)")) {%> selected="selected"<%}%>>College of Law (COL)</option>
                                                        <option <%if (u.getUnit().equals("College of Liberal Arts (CLA)")) {%> selected="selected"<%}%>>College of Liberal Arts (CLA)</option>
                                                        <option <%if (u.getUnit().equals("College of Science (COS)")) {%> selected="selected"<%}%>>College of Science (COS)</option>
                                                        <option <%if (u.getUnit().equals("Gokongwei College of Engineering (GCOE)")) {%> selected="selected"<%}%>>Gokongwei College of Engineering (GCOE)</option>
                                                        <option <%if (u.getUnit().equals("Ramon V. del Rosario College of Business (RVRCOB)")) {%> selected="selected"<%}%>>Ramon V. del Rosario College of Business (RVRCOB)</option>
                                                        <option <%if (u.getUnit().equals("School of Economics (SOE)")) {%> selected="selected"<%}%>>School of Economics (SOE)</option>
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