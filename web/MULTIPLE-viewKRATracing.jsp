<%-- 
    Document   : UR-home
    Created on : 06 27, 18, 1:25:59 PM
    Author     : Karl Madrid
--%>

<%@page import="dao.TargetDAO"%>
<%@page import="entity.Goal"%>
<%@page import="entity.Measure"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entity.Community"%>
<%@page import="dao.OvplmDAO"%>
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

        <title>View KRA Target</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/sidebar.css">
        <link rel="stylesheet" href="css/formstyle5.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">

        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

        <style>
            .table{
                border-bottom: 2px solid lightgray;
                margin-bottom: 30px;
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

            table,th,td{
                border:.5px solid
                    black;
            }

            hr{
                background-color:green;
            }

            textarea{
                resize: none;
            } 

            a {
                color: #0083e8;
            }

            b{
                font-weight: 600;
                font-size: 17px;
            }

            th {
                background-color: green;
                color: white;
            }

            table {
                border-collapse: collapse;
            }

            th{
                padding:15px;
            }

            .button{
                background-color: #009900;
                border: none;
                border-radius: 5px;
                color: white;
                padding: 15px 32px;
                text-align: center;
                display: inline-block;
                margin: 4px 2px;
                font-size: 16px;
                font-family: "Arial", Helvetica, sans-serif;
            }

            legend, h3{
                font-family: "Arial", Helvetica, sans-serif;
            }

            #inputText, #classification { 
                font-family: "Arial", Helvetica, sans-serif; 
            }

            option, select, value{
                font-family: "Arial", Helvetica, sans-serif;
            }

            tr:hover {
                background-color: lightgreen;
            }

            h2{
                font-size: 20px;
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

            .kraheading{
                font-size: 50px;
                text-align: center;
                margin-top: 15px;
                border-bottom: 2px solid green;
                padding-bottom: 5px;
                margin-bottom: 25px;
                font-family: 'Roboto', sans-serif;
            }

            .button {
                background-color: red;
                border: none;
                border-radius: 5px;
                color: white;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
                padding: 14px 40px;
            }

            p{
                margin-top: 40px;
                text-align: center;
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

            .accomplishmentGreen{
                text-align: center;
                font-size: 25px;
                color: white;
                background-color: green;
            }
            .accomplishmentYellow{
                text-align: center;
                font-size: 25px;
                color: white;
                background-color: #FFBF00;
            }
            .accomplishmentRed{
                text-align: center;
                font-size: 25px;
                color: white;
                background-color: red;
            }

            @keyframes colorize {
                0% {
                    -webkit-filter: grayscale(100%);
                    filter: grayscale(100%);
                }
                100% {
                    -webkit-filter: grayscale(0%);
                    filter: grayscale(0%);
                }
            }
        </style>

        <script type="text/javascript">
            <%
                if (request.getAttribute("successSE") != null) {

            %>
            $("document").ready(function () {

            alert("<%=request.getAttribute("successSE")%>");
            });
            <%
                }

                if (request.getAttribute("successFF") != null) {

            %>
            $("document").ready(function () {

            alert("<%=request.getAttribute("successFF")%>");
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
                        <a class="nav-link" href="UR-home.jsp" id="smallerscreenmenu">
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
                        <a class="nav-link" href="MULTIPLE-evaluationSEResponsesList.jsp" id="smallerscreenmenu">
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
                            <% UserDAO UserDAO = new UserDAO(); %>
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

                <!---KRAs-->
                <% 
                    TargetDAO TargetDAO = new TargetDAO();
                    OvplmDAO OvplmDAO = new OvplmDAO();
                    Measure m = UserDAO.GetMeasureObject(Integer.parseInt(request.getAttribute("measureID").toString()));
                    KRA k = OvplmDAO.retrieveKRAByID(m.getKraID());
                %>
                <div class="container panels">
                    <h2><%=k.getName()%></h2>
                    <table class="table table-bordered">
                        <thead class="thead-light">
                            <tr>
                                <th scope="col">Goal</th>
                                <th scope="col">Measure</th>
                                <th scope="col">Target</th>
                                <th scope="col">Accomplishment Against Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                DecimalFormat percentage = new DecimalFormat("0.00");
                                double percent = TargetDAO.calculateTarget(m, TargetDAO.getTotals());
                            %>
                        <td><%=UserDAO.getGoalnameByID(m.getGoalID())%></td>
                        <td><%=m.getDescription()%></td>
                        <td><%if(m.getUntrackable() == 0){%><%=m.getNumtarget()%><% if (m.getNumtypetarget().equals("Count")) { %>&nbsp; Count/s<%} else {%>%<%}%> of <%=m.getUnittarget()%> have undergone/conducted/contains a <%=m.getTypetarget()%> program/component<% if (m.getEngagingtarget().equals("N/A")) { %><%} else {%>engaging <%=m.getEngagingtarget()%><%}%><%} else {%>Not Trackable<%}%></td>
                        <% if(percent >= 0 && percent <= 33) {%><td class="accomplishmentRed"><%=percentage.format(percent)%>%<%} else if (percent >= 34 && percent <= 66) {%><td class="accomplishmentYellow"><%=percentage.format(percent)%>%<%} else if (percent >= 67 && percent <= 100) {%><td class="accomplishmentGreen"><%=percentage.format(percent)%>%<%} else if (percent >= 101) {%><td class="accomplishmentGreen">100%</td><%} else {%><td class="accomplishmentRed">N/A</td><%}%>
                        </tbody>
                    </table>

                </div>


                <!--- table -->
                <div class="container panels">

                    <%
                        ArrayList<FF> FF = new ArrayList();
                        ArrayList<SE> SE = new ArrayList();
                        ArrayList<Integer> ids = new ArrayList();

                        if (m.getTypetarget().equals("Faith Formation")) {
                            for(int x = 0 ; x < TargetDAO.getPrograms(m).size() ; x++){
                                FF proposal = UserDAO.retrieveFFByFFID(TargetDAO.getPrograms(m).get(x));
                                FF.add(proposal);
                            }
                    %>
                    <h2>Programs Contributed</h2>
                    <form action="viewKRATracingFF" method="post">
                        <table id="example" class="table table-striped table-bordered" style="width:100%">    
                            <thead class="thead-dark" >
                                <tr>
                                    <th>Date</th>
                                    <th>Program Name</th>
                                    <th>Unit</th>
                                    <th>Department</th>
                                    <th>Program Head</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%                                
                                    for (int i = 0; i < FF.size(); i++) {
                                %>
                                <tr>
                                    <td><%=FF.get(i).getDatecreated()%></td>
                                    <td><%=FF.get(i).getProjectName()%></td>
                                    <td><%=FF.get(i).getUnit()%></td>
                                    <td><%=FF.get(i).getDepartment()%></td>
                                    <td><%=FF.get(i).getProgramHead()%></td>
                                    <td><button type="submit" name="ffID" value="<%=FF.get(i).getId()%>" class="btn btn-primary btn-sm">View</button></td>
                                </tr>

                                <% }
                                    } %>
                            </tbody>
                        </table>
                    </form>

                    <%
                        if(!m.getTypetarget().equals("Faith Formation")) {
                            for(int x = 0 ; x < TargetDAO.getPrograms(m).size() ; x++){
                                SE proposal = UserDAO.retrieveSEBySEID(TargetDAO.getPrograms(m).get(x));
                                SE.add(proposal);
                            }
                    %>
                    <h2>Programs Contributed</h2>

                    <form action="viewKRATracingSE" method="post">
                        <table id="example" class="table table-striped table-bordered" style="width:100%">    
                            <thead class="thead-dark" >
                                <tr>
                                    <th>Date</th>
                                    <th>Program Name</th>
                                    <th>Unit</th>
                                    <th>Department</th>
                                    <th>Program Head</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (int i = 0; i < SE.size(); i++) {
                                %>
                                <tr>
                                    <td><%=SE.get(i).getDate()%></td>
                                    <td><%=SE.get(i).getName()%></td>
                                    <td><%=SE.get(i).getUnit()%></td>
                                    <td><%=SE.get(i).getDepartment()%></td>
                                    <td><%=SE.get(i).getProgramHead()%></td>
                                    <td><button type="submit" name="seID" value="<%=SE.get(i).getId()%>" class="btn btn-primary btn-sm">View</button></td>
                                </tr>
                                <%
                                        }
                                    }
                                %>

                            </tbody>
                        </table>
                    </form>
                </div>
                <!--- end of table -->

            </div>

        </div>

        <script>
            $('#date').datepicker({
            startDate: new Date()
            });
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
            if (links[i].href.indexOf('#') != - 1) {
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