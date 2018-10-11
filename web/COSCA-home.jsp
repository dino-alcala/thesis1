<%-- 
    Document   : COSCA-home
    Created on : 06 18, 18, 7:13:13 PM
    Author     : Karl Madrid
--%>

<%@page import="entity.FF"%>
<%@page import="entity.SE"%>
<%@page import="java.util.Collections"%>
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

        <title>COSCA Home</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/sidebar.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

        <script>
            <!---search ta ble - ->
                    $(document).ready(function () {
            $("#myInput").on("keyup", function () {
            var value = $(this).val().toLowerCase();
            $("#myTable tr").filter(function  () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > - 1)
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
                            <span class="menu-collapsed"><%=session.getAttribute("unit")%></span>
</a>
<div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
        <li class="nav-item dropdown d-sm-block d-md-none">
            <a class="nav-link" href="COSCA-home.jsp" id="smallerscreenmenu">
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
            <a href="COSCA-home.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
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
                    if (Integer.parseInt(session.getAttribute("userID").toString()) == 18) {
                %>
                <a href="MULTIPLE-seProgramsForApproval.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                    <span class="menu-collapsed" id="subMenuCategory">For Approval</span>
                </a>                        
                <%
                    }
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
            <a href="MULTIPLE-viewBudget.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="fa fa-money fa-fw mr-2"></span>
                    <span class="menu-collapsed">Budget</span>
                    <span class="submenu-icon ml-auto"></span>
                </div>
            </a>
            <a href="MULTIPLE-krasList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="fa fa-check-square-o fa-fw mr-2"></span>
                    <span class="menu-collapsed">Key Result Areas</span>
                    <span class="submenu-icon ml-auto"></span>
                </div>
            </a>
            <a href="MULTIPLE-evaluationSEResponsesList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
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
        <form action="viewKRA" method="post">
            <!---KRAs-->
        <div class="container-fluid panels">
            
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
                          <td>Development of Lasallian Formation Program for graduate student</td>
                          <td class="accomplishmentGreen">85%</td>
                        </tr>
                        <tr>
                          <td></td>
                          <td></td>
                          <td>Existing Lasallian Formation programs for undergraduate students have been reviewed and revised </td>
                          <td class="accomplishmentYellow">50%</td>
                        </tr>
                        <tr>
                          <td></td>
                          <td></td>
                          <td>50% of student organizations have implemented a Lasallian formation activity</td>
                          <td class="accomplishmentRed">15%</td>
                        </tr>
                        <!--- end of Goal 1 Measure 1-->
                      
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
                        <!--- end of Goal 1 Measure 2 -->
                      
                      <!--- Goal 1 Measure 3-->
                        <tr>
                          <td></td>
                          <td><b>M3</b> Number of Lasallian formation activities available for other sectors in the DLSU community  </td>
                          <td>At Least one formation activity engaging alumni, parents, and community partners.</td>
                          <td></td>
                        </tr>
                        <!--- end of Goal 1 Measure 3 -->
                      
                      <!--- Goal 2 Measure 1-->
                        <tr>
                          <td><b>G2 </b> Implement sustainable, holistic and developmental Lasallian formation  across all sectors based on the Lasallian Guiding Principles </td>
                          <td><b>M1</b> Number of fora and other interdisciplinary activities focused on bridging faith and scholarship (e.g. ethics, heritage, culture, science, theology, philosophy) </td>
                          <td>At least one interdisciplinary activity conducted each term</td>
                          <td></td>
                      </tr>
                      <!--- end of Goal 2 Measure 1 -->
                      
                      <!--- Goal 2 Measure 2-->
                        <tr>
                          <td> </td>
                          <td><b>M2</b> Integration of faith dimension using the Lasallian Reflection Framework (LRF) in GE courses</td>
                          <td>Review and integrate the LRF in all NLCC subjects </td>
                          <td></td>
                      </tr>
                      <!--- end of Goal 2 Measure 2 -->
                      
                      <!--- Goal 2 Measure 3-->
                        <tr>
                          <td> </td>
                          <td><b>M3</b> Participation of international students in co-curricular activities promoting interfaith and multicultural diversity </td>
                          <td>50% of international students participate in co-curricular activities promoting interfaith and multicultural diversity</td>
                          <td></td>
                      </tr>
                      <!--- end of Goal 2 Measure 3 -->
                      
                      <!--- Goal 3 Measure 1-->
                        <tr>
                          <td><b>G3 </b> Implement sustainable, holistic and developmental Lasallian formation  across all sectors based on the Lasallian Guiding Principles </td>
                          <td><b>M1</b> Number of Lasallian communities committed to the Lasallian mission  </td>
                          <td>3 communities</td>
                          <td></td>
                      </tr>
                      <!--- end of Goal 3 Measure 1 -->
                      
                  </tbody>
                </table>
              
        </div>
    <!--- end of KRAs-->

        <!--- table -->
        
        <%
            if (Integer.parseInt(session.getAttribute("userID").toString()) == 18) {

                ArrayList<SE> s = new ArrayList();
                s = UserDAO.retrieveSEProposalToAssessByStep(4);
        %>
        <form action="viewProposalsAssess" method="post">
        <div class="container-fluid panels">

            <h2>SE Proposals to assess (<%=s.size()%>)</h2>

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
                            for (int i = 0; i < s.size(); i++) {
                            %>
                            <tr>
                                <td><%=s.get(i).getDate()%></td>
                                <td><%=s.get(i).getName()%></td>
                                <td><%=s.get(i).getUnit()%></td>
                                <td><%=s.get(i).getDepartment()%></td>
                                <td><%=s.get(i).getProgramHead()%></td>
                                <td><button type="submit" name="viewSE<%=i%>" value="<%=s.get(i).getId()%>" class="btn btn-primary btn-sm">View</button></td>
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
                        <!--- end of table -->

                        </div>

                        </div>
                        <!-- body-row END -->
            <script>
            // san                        dbox disable popups
            if (window.self !== window.top && window.                            name != "view1") {;
                window.alert = function(){                                                         /*disabl                                                  e alert*/};
            window.confirm = f                                                            unction(){/*                                                             disable confirm*/};
                     window.prompt = function(){ / * disable prompt * /};
                        window.open = function(){/*disable o                                     pen*/};
            }
            
            // prevent href=# cli                                ck jump
        document.addEventListener("DOMContentLoaded", funct                                    ion() {
                                var links = document.getElementsByTagNam                            e("A");
                        for (var i = 0; i < links.length; i++) {
                        if (links[i].href.indexOf('#') != - 1) {
                        links[i].addEventListener("click", functi                            on(e) {
                        console.debug("pre                                                    vent href=# c                            lick");
                        if (this.hash) {
                        if (this.hash == "#") {
                        e.preventDef                                                  ault();
                        return                        false;
            }
            else {
                                /*
                                 var el = document.getElementById                                                    (this.hash.replace(/#/                                     , ""));
                                 if                                                                                        (el) {
                                 el.sc                            rollIntoView                                     (tru                               e                      );
                                 }
                                 */
                }                        
            }
            return                           false;
                })
                }
                }
            }                      , fals                                                            e)                        ;    
                </                                      script>
                <s                                          cript>
            // H                    ide s                               ubmenus
                $('#body-row .collapse').coll                    apse('                 hide');
                // Collap                    se/Expa                                nd icon
            $('#collapse-icon').addClass('fa-angle-double-                                                  lef                t');
        // Collaps                                e click
        $('[data-toggle=sidebar-colapse]').click(funct                                ion() {
                                SidebarColl                                apse();
            });
            function SidebarCollap                                se () {
                                $('.menu-collapsed').toggleClass('d-                                none');
                        $('.sidebar-submenu').toggleClass('d-                                none');
                        $('.submenu-icon').toggleClass('d-                                none');
                        $('#sidebar-container').t                        oggleClass('sidebar-expanded sidebar-colla                                psed');
                        // Treating d-flex/d-none on separators wit                          h title
                        var SeparatorTitle = $('.                                 sidebar-separator-t                                  itle');
                        if (SeparatorTitle.hasClass('d-fl                                                    ex')) {
                        Sep                                 ar                atorTitle.rem                oveClass('d-                                                                            flex');
            }                                else {
                                Separ                    atorTitl                          e.addClass('d-                              flex');
            }
            
            // Collapse/Expa                                nd icon
            $('#collapse-icon').toggleClass('fa-angle-double-left fa-angle-double-r                                ight');
            }
                </                                script>
    </body>
</html>
