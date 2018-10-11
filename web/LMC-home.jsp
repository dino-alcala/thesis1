<%-- 
    Document   : LMC-home
    Created on : 07 4, 18, 10:00:41 PM
    Author     : Karl Madrid
--%>

<%@page import="entity.FF"%>
<%@page import="entity.SE"%>
<%@page import="java.util.Collections"%>
<%@page import="entity.KRA"%>
<%@page import="entity.KRA"%>
<%@page import="entity.Notification"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <html>
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">

            <title>LMC Home</title>

            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
            <link rel="stylesheet" href="css/sidebar.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">

            <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

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
                    border-bottom: 1px solid gray;
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
                            <a class="nav-link" href="LMC-home.jsp" id="smallerscreenmenu">
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
                            <a class="nav-link" href="MULTIPLE-communityList.jsp" id="smallerscreenmenu">
                                Budget
                            </a>
                            <a class="nav-link" href="MULTIPLE-krasList.jsp" id="smallerscreenmenu">
                                Key Result Areas
                            </a>
                            <a class="nav-link" href="#" id="smallerscreenmenu">
                                Reports
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
                        <a href="LMC-home.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
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
                            <a href="MULTIPLE-socialEngagementProgramsList.jsp" class="list-group-item list-group-item-action" id="subMenuCategoryBox">
                                <span class="menu-collapsed" id="subMenuCategory">SE Programs</span>
                            </a>
                            <a href="MULTIPLE-faithFormationProgramsList.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                                <span class="menu-collapsed" id="subMenuCategory">FF Programs</span>
                            </a>
                            <%
                            if (session.getAttribute("position").toString().equals("DSA - Dean") || session.getAttribute("position").toString().equals("LMSTC - Executive Director") || 
                                    session.getAttribute("position").toString().equals("LSPO = Director") || session.getAttribute("position").toString().equals("COSCA - Director")) {
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
                    </ul>
                    <!-- List Group END-->
                </div>
                <!-- sidebar-container END -->

                <!-- MAIN -->
                <div class="col py-3">
                    <form action="viewKRA" method="post">
                        <!---KRAs-->
                        <div class="container-fluid panels">

                            <h2 class="kraheading">Top 3 Key Result Areas</h2>

                            <div class="card-columns">

                                <%
                                    ArrayList<KRA> kra = new ArrayList();
                                    kra = UserDAO.retrieveSORTEDKRA();
                                    kra = UserDAO.insertPercentage(kra);
                                    Collections.sort(kra, KRA.compareDESCPercentage);
                                %>

                                <%
                                    for (int i = 0; i < 3; i++) {
                                %>

                                <div class="card krascards">
                                    <div class="card-body text-left">
                                        <p class="card-text"><b><%=kra.get(i).getName()%></b></p>
                                        <div class="progress">
                                            <div class="progress-bar bg-success" style="width:<%=kra.get(i).getPercentage()%>%"><%=kra.get(i).getPercentage()%>%</div>
                                        </div>
                                        <p class="progressnum"><%=kra.get(i).getTotal()%>/<%=kra.get(i).getTargetTotal()%></p>
                                        <p class="viewButton"><button type="submit" name="top<%=i%>" class="btn btn-primary btn-sm">View</button></p>
                                    </div>
                                </div>

                                <%
                                    }
                                %>

                            </div>

                            <h2 class="kraheading">Bottom 3 Key Result Areas</h2>

                            <div class="card-columns">

                                <%
                                    ArrayList<KRA> kra2 = new ArrayList();
                                    kra2 = UserDAO.retrieveSORTEDKRA();
                                    kra2 = UserDAO.insertPercentage(kra2);
                                    Collections.sort(kra2, KRA.sortBottomPercentage);
                                %>

                                <%
                                    for (int i = 0; i < 3; i++) {
                                %>

                                <div class="card krascards">
                                    <div class="card-body text-left">
                                        <p class="card-text"><b><%=kra2.get(i).getName()%></b></p>
                                        <div class="progress">
                                            <div class="progress-bar bg-success" style="width:<%=kra2.get(i).getPercentage()%>%"><%=kra2.get(i).getPercentage()%>%</div>
                                        </div>
                                        <p class="progressnum"><%=kra2.get(i).getTotal()%>/<%=kra2.get(i).getTargetTotal()%></p>
                                        <p class="viewButton"><button type="submit" name="top<%=i%>" class="btn btn-primary btn-sm">View</button></p>
                                    </div>
                                </div>

                                <%
                                    }
                                %>

                            </div>

                        </div>
                    </form>
                    <!--- end of KRAs-->

                    <!--- table -->
                    <form action="viewProposalsAssessLMC" method="post">
                        <div class="container-fluid panels">


                            <%
                                ArrayList<SE> proposals = new ArrayList();
                                proposals = UserDAO.retrieveSEProposalToAssessByStep(5);

                                int userID = Integer.parseInt(session.getAttribute("userID").toString());
                            %>
                            <h2>Social Engagement Programs (<%=proposals.size()%>)</h2>

                            <input class="form-control" id="myInput" type="text" placeholder="Search table..">

                            <table class="table ">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>Date</th> 
                                        <th>Program Name</th>
                                        <th>Unit</th>
                                        <th>Department</th>
                                        <th>Program Head</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody id="myTable">
                                    <%
                                        for (int i = 0; i < proposals.size(); i++) {

                                            if (!UserDAO.isRevise(proposals.get(i).getId())) {

                                                if (userID == 19) {

                                                    if (!UserDAO.hasMichaelVoted(proposals.get(i).getId())) {
                                    %>
                                    <tr>
                                        <td><%=proposals.get(i).getDate()%></td>
                                        <td><%=proposals.get(i).getName()%></td>
                                        <td><%=proposals.get(i).getUnit()%></td>
                                        <td><%=proposals.get(i).getDepartment()%></td>
                                        <td><%=proposals.get(i).getProgramHead()%></td>
                                        <td><button type="submit" name="viewSE<%=i%>" value="<%=proposals.get(i).getId()%>" class="btn btn-primary btn-sm">View</button></td>
                                    </tr>
                                    <%
                                        }
                                    } else if (userID == 20) {

                                        if (!UserDAO.hasNelcaVoted(proposals.get(i).getId())) {
                                    %>
                                    <tr>
                                        <td><%=proposals.get(i).getDate()%></td>
                                        <td><%=proposals.get(i).getName()%></td>
                                        <td><%=proposals.get(i).getUnit()%></td>
                                        <td><%=proposals.get(i).getDepartment()%></td>
                                        <td><%=proposals.get(i).getProgramHead()%></td>
                                        <td><button type="submit" name="viewSE<%=i%>" value="<%=proposals.get(i).getId()%>" class="btn btn-primary btn-sm">View</button></td>
                                    </tr>
                                    <%
                                        }
                                    } else if (userID == 21) {

                                        if (!UserDAO.hasMargaritaVoted(proposals.get(i).getId())) {
                                    %>
                                    <tr>
                                        <td><%=proposals.get(i).getDate()%></td>
                                        <td><%=proposals.get(i).getName()%></td>
                                        <td><%=proposals.get(i).getUnit()%></td>
                                        <td><%=proposals.get(i).getDepartment()%></td>
                                        <td><%=proposals.get(i).getProgramHead()%></td>
                                        <td><button type="submit" name="viewSE<%=i%>" value="<%=proposals.get(i).getId()%>" class="btn btn-primary btn-sm">View</button></td>
                                    </tr>
                                    <%
                                        }
                                    } else if (userID == 22) {

                                        if (!UserDAO.hasJamesVoted(proposals.get(i).getId())) {
                                    %>
                                    <tr>
                                        <td><%=proposals.get(i).getDate()%></td>
                                        <td><%=proposals.get(i).getName()%></td>
                                        <td><%=proposals.get(i).getUnit()%></td>
                                        <td><%=proposals.get(i).getDepartment()%></td>
                                        <td><%=proposals.get(i).getProgramHead()%></td>
                                        <td><button type="submit" name="viewSE<%=i%>" value="<%=proposals.get(i).getId()%>" class="btn btn-primary btn-sm">View</button></td>
                                    </tr>
                                    <%
                                        }
                                    } else if (userID == 23) {

                                        if (!UserDAO.hasFritzieVoted(proposals.get(i).getId())) {
                                    %>
                                    <tr>
                                        <td><%=proposals.get(i).getDate()%></td>
                                        <td><%=proposals.get(i).getName()%></td>
                                        <td><%=proposals.get(i).getUnit()%></td>
                                        <td><%=proposals.get(i).getDepartment()%></td>
                                        <td><%=proposals.get(i).getProgramHead()%></td>
                                        <td><button type="submit" name="viewSE<%=i%>" value="<%=proposals.get(i).getId()%>" class="btn btn-primary btn-sm">View</button></td>
                                    </tr>
                                    <%
                                        }
                                    } else {

                                    %>
                                    <tr>
                                        <td><%=proposals.get(i).getDate()%></td>
                                        <td><%=proposals.get(i).getName()%></td>
                                        <td><%=proposals.get(i).getUnit()%></td>
                                        <td><%=proposals.get(i).getDepartment()%></td>
                                        <td><%=proposals.get(i).getProgramHead()%></td>
                                        <td><button type="submit" name="viewSE<%=i%>" value="<%=proposals.get(i).getId()%>" class="btn btn-primary btn-sm">View</button></td>
                                    </tr>
                                    <%
                                                }
                                            }
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>

                        <div class="container-fluid panels">
                            <%
                                ArrayList<FF> proposals2 = new ArrayList();
                                proposals2 = UserDAO.retrieveFFProposalToAssessByStep(6);
                            %>

                            <h2>Proposals Progress (<%=proposals2.size()%>)</h2>

                            <input class="form-control" id="myInput" type="text" placeholder="Search table..">

                            <table class="table ">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>Date</th> 
                                        <th>Program Name</th>
                                        <th>Unit</th>
                                        <th>Department</th>
                                        <th>Program Head</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody id="myTable">
                                    <%
                                        for (int j = 0; j < proposals2.size(); j++) {

                                            if (!UserDAO.isFFRevise(proposals2.get(j).getId())) {
                                                if (userID == 19) {

                                                    if (!UserDAO.hasMichaelFFVoted(proposals2.get(j).getId())) {
                                    %>
                                    <tr>
                                        <td><%=proposals2.get(j).getDatecreated()%></td>
                                        <td><%=proposals2.get(j).getProjectName()%></td>
                                        <td><%=proposals2.get(j).getUnit()%></td>
                                        <td><%=proposals2.get(j).getDepartment()%></td>
                                        <td><%=proposals2.get(j).getProgramHead()%></td>
                                        <td><button type="submit" name="viewFF<%=j%>" value="<%=proposals2.get(j).getId()%>" class="btn btn-primary btn-sm">View</button></td>
                                    </tr>
                                    <%
                                        }
                                    } else if (userID == 20) {

                                        if (!UserDAO.hasNelcaFFVoted(proposals2.get(j).getId())) {
                                    %>
                                    <tr>
                                        <td><%=proposals2.get(j).getDatecreated()%></td>
                                        <td><%=proposals2.get(j).getProjectName()%></td>
                                        <td><%=proposals2.get(j).getUnit()%></td>
                                        <td><%=proposals2.get(j).getDepartment()%></td>
                                        <td><%=proposals2.get(j).getProgramHead()%></td>
                                        <td><button type="submit" name="viewFF<%=j%>" value="<%=proposals2.get(j).getId()%>" class="btn btn-primary btn-sm">View</button></td>
                                    </tr>
                                    <%
                                        }
                                    } else if (userID == 21) {

                                        if (!UserDAO.hasMargaritaFFVoted(proposals2.get(j).getId())) {
                                    %>
                                    <tr>
                                        <td><%=proposals2.get(j).getDatecreated()%></td>
                                        <td><%=proposals2.get(j).getProjectName()%></td>
                                        <td><%=proposals2.get(j).getUnit()%></td>
                                        <td><%=proposals2.get(j).getDepartment()%></td>
                                        <td><%=proposals2.get(j).getProgramHead()%></td>
                                        <td><button type="submit" name="viewFF<%=j%>" value="<%=proposals2.get(j).getId()%>" class="btn btn-primary btn-sm">View</button></td>
                                    </tr>
                                    <%
                                        }
                                    } else if (userID == 22) {

                                        if (!UserDAO.hasJamesFFVoted(proposals2.get(j).getId())) {
                                    %>
                                    <tr>
                                        <td><%=proposals2.get(j).getDatecreated()%></td>
                                        <td><%=proposals2.get(j).getProjectName()%></td>
                                        <td><%=proposals2.get(j).getUnit()%></td>
                                        <td><%=proposals2.get(j).getDepartment()%></td>
                                        <td><%=proposals2.get(j).getProgramHead()%></td>
                                        <td><button type="submit" name="viewFF<%=j%>" value="<%=proposals2.get(j).getId()%>" class="btn btn-primary btn-sm">View</button></td>
                                    </tr>
                                    <%
                                        }
                                    } else if (userID == 23) {

                                        if (!UserDAO.hasFritzieFFVoted(proposals2.get(j).getId())) {
                                    %>
                                    <tr>
                                        <td><%=proposals2.get(j).getDatecreated()%></td>
                                        <td><%=proposals2.get(j).getProjectName()%></td>
                                        <td><%=proposals2.get(j).getUnit()%></td>
                                        <td><%=proposals2.get(j).getDepartment()%></td>
                                        <td><%=proposals2.get(j).getProgramHead()%></td>
                                        <td><button type="submit" name="viewFF<%=j%>" value="<%=proposals2.get(j).getId()%>" class="btn btn-primary btn-sm">View</button></td>
                                    </tr>
                                    <%
                                        }
                                    } else {

                                    %>
                                    <tr>
                                        <td><%=proposals2.get(j).getDatecreated()%></td>
                                        <td><%=proposals2.get(j).getProjectName()%></td>
                                        <td><%=proposals2.get(j).getUnit()%></td>
                                        <td><%=proposals2.get(j).getDepartment()%></td>
                                        <td><%=proposals2.get(j).getProgramHead()%></td>
                                        <td><button type="submit" name="viewFF<%=j%>" value="<%=proposals2.get(j).getId()%>" class="btn btn-primary btn-sm">View</button></td>
                                    </tr>
                                    <%
                                                }
                                            }
                                        }
                                    %>
                                </tbody>
                            </table>

                        </div>
                        <!--- end of table -->
                    </form>
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