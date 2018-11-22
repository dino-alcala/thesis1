<%-- 
    Document   : OVPLM-addUnit
    Created on : 06 12, 18, 1:26:08 PM
    Author     : Karl Madrid
--%>

<%@page import="entity.Unit"%>
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

        <title>Add Department</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
        <link rel="stylesheet" href="css/sidebar.css">
        <link rel="stylesheet" href="css/formstyle1.css">
        <link rel="stylesheet" type="text/css" href="css/homepagestyle.css">

        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

        <script>
            function addFields() {
                // Number of inputs to create
                var number = document.getElementById("member55").value;
                // Container <div> where dynamic content will be placed
                var container = document.getElementById("container55");
                // Clear previous contents of the container
                while (container.hasChildNodes()) {
                    container.removeChild(container.lastChild);
                }

                for (i = 0; i < number; i++) {

                    // Append a node with a random text
                    container.appendChild(document.createElement("hr"));
                    container.appendChild(document.createTextNode("Department " + (i + 1) + ": "));
                    container.appendChild(document.createElement("br"));
                    // Create an <input> element, set its type and name attributes
                    var input = document.createElement("input");
                    input.type = "text";
                    input.name = "department" + i;
                    container.appendChild(input);
                    // Append a line break 
                    container.appendChild(document.createElement("br"));

                    container.appendChild(document.createElement("br"));
                    container.appendChild(document.createTextNode("Number of CAP for Department " + (i + 1) + ": "));
                    container.appendChild(document.createElement("br"));
                    // Create an <input> element, set its type and name attributes
                    var input = document.createElement("input");
                    input.type = "text";
                    input.name = "cap" + i;
                    container.appendChild(input);
                    // Append a line break 
                    container.appendChild(document.createElement("br"));

                    container.appendChild(document.createElement("br"));
                    container.appendChild(document.createTextNode("Number of APSP for Department " + (i + 1) + ": "));
                    container.appendChild(document.createElement("br"));
                    // Create an <input> element, set its type and name attributes
                    var input = document.createElement("input");
                    input.type = "text";
                    input.name = "apsp" + i;
                    container.appendChild(input);
                    // Append a line break 
                    container.appendChild(document.createElement("br"));

                    container.appendChild(document.createElement("br"));
                    container.appendChild(document.createTextNode("Number of ASF for Department " + (i + 1) + ": "));
                    container.appendChild(document.createElement("br"));
                    // Create an <input> element, set its type and name attributes
                    var input = document.createElement("input");
                    input.type = "text";
                    input.name = "asf" + i;
                    container.appendChild(input);
                    // Append a line break 
                    container.appendChild(document.createElement("br"));

                    container.appendChild(document.createElement("br"));
                    container.appendChild(document.createTextNode("Number of Faculty (Full-time and Part-time) for Department " + (i + 1) + ": "));
                    container.appendChild(document.createElement("br"));
                    // Create an <input> element, set its type and name attributes
                    var input = document.createElement("input");
                    input.type = "text";
                    input.name = "faculty" + i;
                    container.appendChild(input);
                    // Append a line break 
                    container.appendChild(document.createElement("br"));

                    container.appendChild(document.createElement("br"));
                    container.appendChild(document.createTextNode("Number of Administrators for Department " + (i + 1) + ": "));
                    container.appendChild(document.createElement("br"));
                    // Create an <input> element, set its type and name attributes
                    var input = document.createElement("input");
                    input.type = "text";
                    input.name = "admin" + i;
                    container.appendChild(input);
                    // Append a line break 
                    container.appendChild(document.createElement("br"));

                    container.appendChild(document.createElement("br"));
                    container.appendChild(document.createTextNode("Number of Direct Hired Contractual for Department " + (i + 1) + ": "));
                    container.appendChild(document.createElement("br"));
                    // Create an <input> element, set its type and name attributes
                    var input = document.createElement("input");
                    input.type = "text";
                    input.name = "direct" + i;
                    container.appendChild(input);
                    // Append a line break 
                    container.appendChild(document.createElement("br"));

                    container.appendChild(document.createElement("br"));
                    container.appendChild(document.createTextNode("Number of Independent Contractor for Department " + (i + 1) + ": "));
                    container.appendChild(document.createElement("br"));
                    // Create an <input> element, set its type and name attributes
                    var input = document.createElement("input");
                    input.type = "text";
                    input.name = "independent" + i;
                    container.appendChild(input);
                    // Append a line break 
                    container.appendChild(document.createElement("br"));

                    container.appendChild(document.createElement("br"));
                    container.appendChild(document.createTextNode("Number of External Service Personnel for Department " + (i + 1) + ": "));
                    container.appendChild(document.createElement("br"));
                    // Create an <input> element, set its type and name attributes
                    var input = document.createElement("input");
                    input.type = "text";
                    input.name = "external" + i;
                    container.appendChild(input);
                    // Append a line break 
                    container.appendChild(document.createElement("br"));
                    container.appendChild(document.createElement("br"));

                }
            }
        </script>

        <style>
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

            .table{
                border-bottom: 2px solid lightgray;
                margin-bottom: 30px;
            }

            h1{
                text-align: left;
                font-size: 25px;
                border-bottom: 2px solid green;
                padding-bottom: 10px;
            }  
            
            .formBg{
                width: 60%;
                padding: 10px;
                margin-top: 0px;
            }

            .dropbtn {
                background-color: dimgray;
                color: white;
                padding: 16px;
                font-size: 16px;
                border: none;
                cursor: pointer;
            }

            hr{
                background-color: black;
            }
            
            label, .btn-primary, select, option{
               font-family: "Arial", Helvetica, sans-serif;
            }
        </style>


        <script type="text/javascript">
            function department(c1, c2) {

            <%
                        UserDAO UserDAO = new UserDAO();
                        ArrayList<Unit> units = new ArrayList();
                        units = UserDAO.retrieveUnitsAcademic();
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
                        <a class="nav-link" href="OVPLM-home.html" id="smallerscreenmenu">
                            Home
                        </a>
                        <a class="nav-link" href="MULTIPLE-faithFormationProgramsList.html" id="smallerscreenmenu">
                            Programs
                        </a>
                        <a class="nav-link" href="MULTIPLE-unitsList.html" id="smallerscreenmenu">
                            Units
                        </a>
                        <a class="nav-link" href="MULTIPLE-communityList.html" id="smallerscreenmenu">
                            Communities
                        </a>
                        <a class="nav-link" href="MULTIPLE-krasList.html" id="smallerscreenmenu">
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
                        $("#sidebar-container").load("sidebarovplm.jsp");
                    </script>
                </ul>
            </div>

            <!-- MAIN -->
            <div class="col py-3">

                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="formBg">
                                <h1>Add Unit</h1>

                                <div class="panel panel-success">

                                    <div class="panel-body">

                                        <p><i>All fields are required</i></p>

                                        <form action="addDepartmentAcademic" method="post">
                                            <ul class="form-style-1">
                                                <li>
                                                    <label>Select Unit: <span class="required"></span></label>
                                                    <select name="unit">
                                                        <optgroup label="Added Units">
                                                            <option disabled selected>Select Unit</option>
                                                            <%
                                                                for (int k = 0; k < units.size(); k++) {
                                                            %>
                                                            <option><%=units.get(k).getName()%></option>
                                                            <%
                                                                }
                                                            %>
                                                        </optgroup>
                                                    </select>
                                                </li>
                                                <li>
                                                    <label>Department Name: <span class="required"></span></label>
                                                    <input type="text" name="unitname" class="field-long" />
                                                </li>
                                                <br>
                                                <li>
                                                    <label>Total Number of CAP: <span class="required"></span></label>
                                                    <input type="number" name="cap" class="field-long" />
                                                </li>                                                
                                                <li>
                                                    <label>Total Number of APSP: <span class="required"></span></label>
                                                    <input type="number" name="apsp" class="field-long" />
                                                </li>                                                
                                                <li>
                                                    <label>Total Number of ASF: <span class="required"></span></label>
                                                    <input type="number" name="asf" class="field-long" />
                                                </li>
                                                <li>
                                                    <label>Total Number of Faculty (full-time and part-time): <span class="required"></span></label>
                                                    <input type="number" name="faculty" class="field-long" />
                                                </li>
                                                <li>
                                                    <label>Total Number of Administrators: <span class="required"></span></label>
                                                    <input type="number" name="admin" class="field-long" />
                                                </li>
                                                <li>
                                                    <label>Total Number of Direct Hired Contractuals: <span class="required"></span></label>
                                                    <input type="number" name="direct" class="field-long" />
                                                </li>
                                                <li>
                                                    <label>Total Number of Independent Contractors: <span class="required"></span></label>
                                                    <input type="number" name="independent" class="field-long" />
                                                </li>
                                                <li>
                                                    <label>Total Number of External Service Personnel: <span class="required"></span></label>
                                                    <input type="number" name="external" class="field-long" />
                                                </li>
                                                <li>
                                                    <button type="submit" class="btn btn-primary">Add Department</button>
                                                </li>
                                                <br><br>
                                            </ul>
                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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