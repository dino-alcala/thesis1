<%-- 
    Document   : MULTIPLE-perProgramEvaluationFormsList
    Created on : 06 18, 18, 7:51:35 PM
    Author     : Karl Madrid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>Per-program Evaluation Forms List</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/sidebar2.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">  

        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

        <script>
<!---search table-->
            $(document).ready(function () {
                    $("#m yIn p ut").on("keyup ", function () {
                var value = $(this).val().toLowerCase() ;
                    $("#myTable tr").filter(function () {
                        $(this).to ggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
                    });
< !-- - search table-- >
                    function sortTable(n) {
                    var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
                            table = document.getElementById("myTable");
                            switching = true;
                            // Set the sorting direction to ascending:
                            dir = "asc";
                            /* Make a loop that will continue until
                             no switching has been done: */
                            while (switching) {
                    // Start by saying: no switching is done:
                    switching = false;
                            rows = table.getElementsByTagName("TR");
                            /* Loop through all table rows (except the
                             first, which contains table headers): */
                            for (i = 0; i < (rows.length - 1); i++) {
                    // Start by saying there should be no switching:
                    shouldSwitch = false;
                            /* Get the two elements you want to compare,
                             one from current row and one from the next: */
                            x = rows[i].getElementsByTagName("TD")[n];
                            y = rows[i + 1].getElementsByTagName("TD")[n];
                            /* Check if the two rows should switch place,
                             based on the direction, asc or desc: */
                            if (dir == "asc") {
                    if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                    // If so, mark as a switch and break the loop:
                    shouldSwitch = true;
                            break;
                    }
                    } else if (dir == "desc") {
                    if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                    // If so, mark as a switch and break the loop:
                    shouldSwitch = true;
                            break;
                    }
                    }
                    }
                    if (shouldSwitch) {
                    /* If a switch has been marked, make the switch
                     and mark that a switch has been done: */
                    rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                            switching = true;
                            // Each time a switch is done, increase this count by 1:
      switchcount ++; 
    } else {
      /* If no switching has been done AND the direction is "asc",
      set the direction to "desc" and run the while loop again. */
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
                font-size: 40px;
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
                    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span class="fa fa-home fa-fw mr-2"></span>
                            <span class="menu-collapsed">Dashboard</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>
                    <a href="#submenuProposals" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategoryActive">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span class="fa fa-folder-open fa-fw mr-2"></span>
                            <span class="menu-collapsed">Programs</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>
                    <div id="submenuProposals" class="collapse sidebar-submenu">
                        <a href="#" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                            <span class="menu-collapsed" id="subMenuCategory">Create Program Proposal</span>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action" id="sidebarCategoryActive">
                            <span class="menu-collapsed" id="sidebarCategoryActive">SE Programs</span>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                            <span class="menu-collapsed" id="subMenuCategory">FF Programs</span>
                        </a>
                    </div>
                    <a href="#submenuUnits" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span class="fa fa-group fa-fw mr-2"></span>
                            <span class="menu-collapsed">Units</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>
                    <div id="submenuUnits" class="collapse sidebar-submenu">
                        <a href="#" class="list-group-item list-group-item-action" id="subMenuCategoryBox">
                            <span class="menu-collapsed" id="subMenuCategory">Add Unit</span>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                            <span class="menu-collapsed" id="subMenuCategory">Units</span>
                        </a>
                    </div>
                    <a href="#submenuCommunity" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span class="fa fa-building fa-fw mr-2"></span>
                            <span class="menu-collapsed">Communities</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>
                    <div id="submenuCommunity" class="collapse sidebar-submenu">
                        <a href="#" class="list-group-item list-group-item-action" id="subMenuCategoryBox">
                            <span class="menu-collapsed" id="subMenuCategory">Add Community</span>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                            <span class="menu-collapsed" id="subMenuCategory">Communities</span>
                        </a>
                    </div>
                    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span class="fa fa-money fa-fw mr-2"></span>
                            <span class="menu-collapsed">Budget</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span class="fa fa-check-square-o fa-fw mr-2"></span>
                            <span class="menu-collapsed">Key Result Areas</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>
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
                    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span class="fa fa-pencil-square-o fa-fw mr-2"></span>
                            <span class="menu-collapsed">Evaluation Forms</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>
                </ul>
                <!-- List Group END-->
            </div>
            <!-- sidebar-container END -->

            <!-- MAIN -->
            <div class="col py-3">

                <!--- table -->
                <div class="container">

                    <h2>*insert program name* Evaluation Forms</h2>

                    <input class="form-control" id="myInput" type="text" placeholder="Search table..">

                    <table class="table ">
                        <thead class="thead-dark">
                            <tr>
                                <th onclick="sortTable(0)">Evaluation #</th>
                                <th onclick="sortTable(1)">Filled up by</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody id="myTable">
                            <tr>
                                <td>COSCA</td>        
                                <td>z</td>
                                <td><button type="button" class="btn btn-info">View</button></td>
                            </tr>
                            <tr>
                                <td>y</td>
                                <td>Moe</td>
                                <td><button type="button" class="btn btn-info">View</button></td>
                            </tr>
                            <tr>
                                <td>z</td>
                                <td>Dooley</td>
                                <td><button type="button" class="btn btn-info">View</button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!--- end of table -->

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