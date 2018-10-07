<%-- 
    Document   : ADMIN-home
    Created on : 06 12, 18, 12:08:37 PM
    Author     : Karl Madrid
--%>

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

        <title>Admin Home</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/sidebar2.css">
        <link rel="stylesheet" type="text/css" href="css/styles.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
               <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
 
        <script >
                   <!--- search table-->
           $(document).re ady(function () {
           $("#myInput").on ("keyup", function () {                var value = $(this).val().toLowerCase();
           $("#m yTable tr").filter(function () {
           $(this).toggle($(this).text().toLowerCase().ind exOf(value) > - 1)
           });
           });
           });< !-- - search table-- >
                   < !-- Sort Table -- >
                   function sortTable(n) {
                   var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
                   table = document.getElementById("myTable");
                   switching = true;
                   //Set the sorting direction to ascending:
                   dir = "asc";
                   /*Make a loop that will continue until
                    no switching has been done:*/
                   while (switching) {
                   //start by saying: no switching is done:
                   switching = false;
                   rows = table.getElementsByTagName("TR");
                   /*Loop through all table rows (except the
                    first, which contains table headers):*/
                   for (i = 1; i < (rows.length - 1); i++) {
                   //start by saying there should be no switching:
                   shouldSwitch = false;
                   /*Get the two elements you want to compare,
                    one from current row and one from the next:*/
                   x = rows[i].getElementsByTagName("TD")[n];
                   y = rows[i + 1].getElementsByTagName("TD")[n];
                   /*check if the two rows should switch place,
                    based on the direction, asc or desc:*/
                   if (dir == "asc") {
                   if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                   //if so, mark as a switch and break the loop:
                   shouldSwitch = true;
                   break;
                   }
                   } else if (dir == "desc") {
                   if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                   //if so, mark as a switch and break the loop:
                   shouldSwitch = true;
                   break;
                   }
                   }
                   }
                   if (shouldSwitch) {
                   /*If a switch has been marked, make the switch
                    and mark that a switch has been done:*/
                   rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                   switching = true;
//Ea ch time a switch is done, increase this count by 1:
       switchcount ++;      
     } else {
       /*If no switching has been done AND the direction is "asc",
       set the direction to "desc" and run the while loop again.*/
       if (switchcount == 0 && dir == "asc") {
         dir = "desc";
         switching = true;
       }
     }
   }
 }
   <!-- Sort Table -->
        </script>

        <style>
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

            #modules{
                font-size: 18px;
            }

            .panel-primary{
                margin-top: 10px;
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

            thead{
                color: white;
                background: #4FAC50;
            }

            #myTable th, #myTable td {
                text-align: left; /* Left-align text */
                padding: 12px; /* Add padding */
            }

            #myTable tr {
                border-bottom: 1px solid #ddd; 
            }

            #myTable tr.header, #myTable tr:hover {
                background-color: #f1f1f1;
            }

            .panel-title{
                font-size: 30px;
                text-align: left;
                margin-top: 20px;
                border-bottom: 2px solid green;
                padding-bottom: 10px;
            }

            p{
                margin-bottom: 0;
                font-size: 15px;
            }

            #myTable tr.header, #myTable tr:hover {
                background-color: lightgreen;
            }

            <%--NavbarAndSidebar--%>

            body {
                padding-top: 56px;
            }

            .sticky-offset {
                top: 56px;
            }

            #body-row {
                margin-left:0;
                margin-right:0;
            }

            #sidebar-container {
                min-height: 100vh;   
                background-color: #333333;
                padding: 0;
            }

            /* Sidebar sizes when expanded and expanded */
            .sidebar-expanded {
                width: 230px;
            }
            .sidebar-collapsed {
                width: 60px;
            }

            /* Menu item*/
            #sidebar-container .list-group a {
                height: 50px;
                color: white;
            }

            /* Submenu item*/
            #sidebar-container .list-group .sidebar-submenu a {
                height: 45px;
                padding-left: 30px;
            }
            .sidebar-submenu {
                font-size: 0.9rem;
            }

            .sidebar-separator {
                background-color: #333333;
                height: 25px;
            }
            .logo-separator {
                background-color: #333333;    
                height: 60px;
            }

            /* Closed submenu icon */
            #sidebar-container .list-group .list-group-item[aria-expanded="false"] .submenu-icon::after {
                content: " \f0d7";
                font-family: FontAwesome;
                display: inline;
                text-align: right;
                padding-left: 10px;
            }
            /* Opened submenu icon */
            #sidebar-container .list-group .list-group-item[aria-expanded="true"] .submenu-icon::after {
                content: " \f0da";
                font-family: FontAwesome;
                display: inline;
                text-align: right;
                padding-left: 10px;
            }

            .nav-link {
                border-bottom: 2px solid green;
            }

            #navbar {
                background-color: #009900;
            }

            #navbar-unit {
                color: white;
            }

            .navbar-toggler-icon {
                background-color: white;
            }

            #smallerscreenmenuButton {
                color: white;
            }

            #smallerscreenmenu {
                color: white;
            }

            #submenuCategoryBox {
                background-color: #d9d9d9;
            }

            #submenuCategoryBox:hover {
                background-color: lightgreen;
            }

            #submenuCategory{
                font-size: 13px;
                color: #4d4d4d;
            }

            #sidebarCategory {
                background-color: #4d4d4d;
            }

            #sidebarCategory:hover {
                background-color: lightgreen;
            }

            #sidebarCategory {
                background-color: lightgreen;
            }

            #sidebarCategory:hover {
                background-color: lightgreen;
            }

            #employees {
                font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }

            #employees td, #employees th {
                border: 1px solid #ddd;
                padding: 12px;
            }


            #employees tr:hover {
                background-color: lightgreen;
            }

            #employees th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #4CAF50;
                color: white;
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
                <img src="img/dlsu.png" width="30" height="30" class="d-inline-block align-top" data-toggle="sidebar-colapse" id="collapse-icon">
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
                            <li class="notification-box" href="#">
                                <div class="row">
                                    <div class="col-sm-8">
                                        <strong class="notificationBoxHeader">Databasing</strong>
                                        <div class="notificationBoxMessage">
                                            Status: Approved
                                        </div>
                                    </div>    
                                </div>
                            </li>
                            <li class="notification-box" href="#">
                                <div class="row">
                                    <div class="col-sm-8">
                                        <strong class="notificationBoxHeader">Programming 101</strong>
                                        <div class="notificationBoxMessage">
                                            Status: Step 4
                                        </div>
                                    </div>    
                                </div>
                            </li>
                            <li class="notification-box" href="#">
                                <div class="row">
                                    <div class="col-sm-8">
                                        <strong class="notificationBoxHeader">*Insert name ng proposal*</strong>
                                        <div class="notificationBoxMessage">
                                            Status: *insert status*
                                        </div>
                                    </div>    
                                </div>
                            </li>  
                            </div>
                        </ul>
                    </div>
                </div>
                <div class="nav-button">
                    <a href="index.jsp" class="btn btn-info navbar-btn-logout">
                        <i class="fa fa-sign-out"></i>
                    </a>
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
                    
                    <a href="signUp.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="addUser">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span>&nbsp;+</span>
                            <span class="menu-collapsed">&nbsp;&nbsp;&nbsp;Add user</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>
                    
                    <a href="OVPLM-addUnit.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="addUser">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span>&nbsp;+</span>
                            <span class="menu-collapsed">&nbsp;&nbsp;&nbsp;Add unit</span>
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
                    <div class="col-lg-10">
                        <%
                            UserDAO UserDAO = new UserDAO();
                            ArrayList<User> u = new ArrayList();
                            u = UserDAO.retrieveEmployees();
                        %>
                        <h3 class="panel-title">Employees List (<%=u.size()%>)</h3>

                        <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Filter..">

                        <div class="panel panel-primary">

                            <div class="panel-body">
                                <form action="viewEmployee" method="post">
                                    <table id="myTable">

                                        <thead>
                                            <tr>
                                                <th onclick="sortTable(0)">Name</th>
                                                <th onclick="sortTable(1)">Type</th>
                                                <th onclick="sortTable(2)">Email Address</th>
                                                <th></th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <%
                                                for (int i = 0; i < u.size(); i++) {
                                            %>
                                            <tr>
                                                <td><%=u.get(i).getFirstName() + " " + u.get(i).getLastName()%></td>
                                                <td><%=u.get(i).getUnit()%></td>
                                                <td><%=u.get(i).getEmail()%></td> 
                                                <td><button type="submit" name="id<%=i%>" class="btn btn-info" value="<%=u.get(i).getId()%>">View</button></td>
                                            </tr>
                                            <%
                                                }
                                            %>

                                        </tbody> 

                                    </table>
                                </form>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>
        <!-- body-row END -->
        <script>
                    // sandbox disable popups
                    if (window.self !== window.top && window.name != "view1") {;
                    window.alert = function(){/*disable alert*/};
                    window.confirm = function(){/*disable confirm*/};
                    window.prompt = function(){/*disable prompt*/};
                    window.open = function(){/*disable open*/};
                    }

                    // prevent href=# click jump
                    document.addEventListener("DOMContentLoaded", function() {
                    var links = document.getElementsByTagName("A");
                    for (var i = 0; i < links.length; i++) {
                    if (links[i].href.indexOf('#') != - 1) {
                    links[i].addEventListener("click", function(e) {
                    console.debug("prevent href=# click");
                    if (this.hash) {
                    if (this.hash == "#") {
                    e.preventDefault();
                    return false;
                    }
                    else {
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
                    $('[data-toggle=sidebar-colapse]').click(function() {
                    SidebarCollapse();
                    });
                    function SidebarCollapse () {
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