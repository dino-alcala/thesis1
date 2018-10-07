<%-- 
    Document   : MULTIPLE-updateBudget
    Created on : 06 18, 18, 7:55:29 PM
    Author     : Karl Madrid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>Update Budget</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/sidebar2.css">
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

        <script>
<!-- Filter Table -->
            function myFunction() {
            // Declare variables 
                    var input,  filter, table, tr, td, i;
                        input = document.getElementById("myInput");
                        filter = input.value.toUpperCase();
                        table = document.getElementById("myTable");
                        tr = table.getElementsByTagName("tr");

                        // Loop through all table rows, and hide those who don't match the search query
                for (i = 0; i < tr.length; i++) {
                            td = tr[i].getElementsByTagName("td")[0];
                    if (td) {
                                if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                                    tr[i].style.display = "";
                                } else {
                                tr[i].style.display = "none";
                        }
                }
                 }
             }
                        <!-- Filter Table -->


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
                            //Each time a switch is done, increase this count by 1:
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
        function addRow() {
                var table = document.getElementById("projectplantable");
                var rows = document.getElementById("projectplantable").rows.length;
                var row = table.insertRow(rows);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                var cell4 = row.insertCell(3);
                cell1.innerHTML = '<input type = "text" size = 10%>';
                cell2.innerHTML = '<input type = "text" size = 10%>';
                cell3.innerHTML = '<input type = "text" size = 10%>';
                cell4.innerHTML = '<input type = "text" size = 10%>';
            }
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

            #myTable th, #myTable td {
                text-align: left; /* Left-align text */
                padding: 12px; /* Add padding */
            }

            #myTable tr {
                border-bottom: 1px solid #ddd; 
            }

            #myTable tr.header, #myTable tr:hover {
                background-color: #4CAF50;
            }

            .panel-title{
                font-size: 40px;
                text-align: left;
                margin-top: 20px;
                padding-bottom: 10px;
            }

            p{
                margin-bottom: 0;
                font-size: 15px;
            }

            a:link {
                color: black; 
                background-color: transparent; 
                text-decoration: none;
            }

            table, td, th {
                border: 1px solid black;
                border-collapse: collapse;
                text-align: center;
            }

            h4{
                color: white;
            }

            h3{
                font-size: 40px;   
                border-bottom: 2px solid #4CAF50;
                padding-bottom: 5px;
            }

            .panel-success > .panel-heading {
                background-color: #4CAF50;
                border-color: #ddd;
                border: 1px solid;
            }

            .panel-body{
                border: 1px solid;
            }

            .heading{
                border: 1px solid;
                margin-top: 30px;
                padding-top: 0px;
                margin-bottom: 30px;
            }
            .panel-upper{
                border: 3px solid #4CAF50;
            }

            .button-e {
                background-color: green;
                border: none;
                color: white;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
                padding: 14px 40px;
            }
            .button-d {
                background-color: red;
                border: none;
                color: white;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
                padding: 14px 40px;
            }

            .buttons{
                margin-bottom: 30px;
                align-content: center;
            }

            .form-style-5{

                max-width: 100%;
                margin: 10px auto;
                padding: 20px;
                border-radius: 8px;
                font-family: Georgia, "Times New Roman", Times, serif;
            }

            .form-style-5 fieldset{
                border: none;
            }

            .form-style-5 legend {
                font-size: 1.4em;
                margin-bottom: 10px;
            }

            .form-style-5 label {
                display: block;
                margin-bottom: 8px;
            }

            .form-style-5 input[type="text"],
            .form-style-5 input[type="date"],
            .form-style-5 input[type="datetime"],
            .form-style-5 input[type="email"],
            .form-style-5 input[type="number"],
            .form-style-5 input[type="search"],
            .form-style-5 input[type="time"],
            .form-style-5 input[type="url"],
            .form-style-5 textarea,
            .form-style-5 select {

                font-family: Georgia, "Times New Roman", Times, serif;
                background: rgba(255,255,255,.1);
                border: 5;
                border-radius: 4px;
                font-size: 16px;
                margin: 2;
                outline: 0;
                padding: 8px;
                text-align: center;
                box-sizing: border-box; 
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box; 
                background-color: #e8eeef;
                color:black;
                -webkit-box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
                box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;


            }
            .form-style-5 input[type="text"]:focus,
            .form-style-5 input[type="date"]:focus,
            .form-style-5 input[type="datetime"]:focus,
            .form-style-5 input[type="email"]:focus,
            .form-style-5 input[type="number"]:focus,
            .form-style-5 input[type="search"]:focus,
            .form-style-5 input[type="time"]:focus,
            .form-style-5 input[type="url"]:focus,
            .form-style-5 textarea:focus,
            .form-style-5 select:focus{
                background: #d2d9dd;
            }

            .form-style-5 select{
                -webkit-appearance: menulist-button;
                height:35px;
            }

            .form-style-5 .number {
                background: green;
                color: #fff;
                height: 30px;
                width: 30px;
                display: inline-block;
                font-size: 0.8em;
                margin-right: 4px;
                line-height: 30px;
                text-align: center;
                text-shadow: 0 1px 0 rgba(255,255,255,0.2);
                border-radius: 15px 15px 15px 0px;
            }

            .form-style-5 input[type="submit"],
            .form-style-5 input[type="button"]
            {
                position: relative;
                display: block;
                padding: 19px 39px 18px 39px;
                color: #FFF;
                margin: 0 auto;
                background: green;
                font-size: 18px;
                text-align: center;
                font-style: normal;
                width: 30%;
                border-radius: 10px;
                border: 1px solid darkgreen;
                border-width: 1px 1px 3px;
                margin-bottom: 10px;
            }
            .form-style-5 input[type="submit"]:hover,
            .form-style-5 input[type="button"]:hover
            {
                background: #109177;
            }

            th,tr,td{
                padding:15px;
            }
            table {
                border-collapse: collapse;
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
                            Communities
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
                <script>
                    $("#sidebar-container").load("sidebar.jsp");
                </script>
            </div>
            <!-- sidebar-container END -->

            <!-- MAIN -->
            <div class="col py-3">

                <div class="row">
                    <div class="col-lg-10">
                        <div class="form-style-5">


                            <div class="panel-body heading">
                                <h3>Budget Update</h3>

                            </div>



                            <div class="panel panel-success">
                                <div class="panel-heading">
                                    <h4>Breakdown</h4>
                                </div>

                                <center><table style = "width:100%" id = "projectplantable">
                                        <tr>
                                            <th>SAMPLE FIELD</th>
                                            <th>SAMPLE FIELD</th>
                                            <th>SAMPLE FIELD</th>
                                            <th>SAMPLE FIELD</th>
                                        </tr>
                                        <tr>
                                            <td><input type = "text" size = 10% placeholder="1000"></td>
                                            <td><input type = "text" size = 10% placeholder="1000"></td>
                                            <td><input type = "text" size = 10% placeholder="1000"></td>
                                            <td><input type = "text" size = 10% placeholder="1000"></td>
                                        </tr>
                                        <tr>
                                            <td><input type = "text" size = 10% placeholder="1000"></td>
                                            <td><input type = "text" size = 10% placeholder="1000"></td>
                                            <td><input type = "text" size = 10% placeholder="1000"></td>
                                            <td><input type = "text" size = 10% placeholder="1000"></td>    
                                        </tr>
                                    </table></center>
                                <br>
                                <center><button type="button" onclick="addRow()">Click to Add Row</button></center>

                            </div>
                            <p class="buttons">
                            <center><button class="button-e">Done</button></center>
                            </p>
                        </div>  
                    </div>

                </div>

            </div>

        </div>
        <!-- body-row END -->

        <script>
                            // sandbox disable popups
                            if (window.self !== window.top && window.name != "view1") {;
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