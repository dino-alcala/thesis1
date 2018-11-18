<%-- 
    Document   : UR-home
    Created on : 06 27, 18, 1:25:59 PM
    Author     : Karl Madrid
--%>

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

        <title>Create KRA</title>

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
            html{
                font-size:14px;
            }
            .navbar{
                height:8%;
            }
            .sidebar-expanded{
                margin-top:0.1%;
            }
            
            #notifsScroll {
                overflow-y: auto; 
                overflow-x: hidden;
                height: 250px;
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

            #notifsScroll {
                overflow-y: auto; 
                overflow-x: hidden;
                height: 250px;
            }

            html {
                background: #e6e9e9;
                background-image: linear-gradient(270deg, rgb(230, 233, 233) 0%, rgb(216, 221, 221) 100%);
                -webkit-font-smoothing: antialiased;
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

            h1, h2, h3, h4, h5, h6 {
                color: #222;
                font-weight: 600;
                line-height: 1.3;
            }

            h2 {
                margin-top: 1.3em;
            }

            a {
                color: #0083e8;
            }

            b, strong {
                font-weight: 600;
            }

            samp {
                display: none;
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
                background-color: #4CAF50;
                border: none;
                color: white;
                padding: 15px 32px;
                text-align: center;
                display: inline-block;
                margin: 4px 2px;
                font-size: 16px;
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

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <script type='text/javascript'>


            function addRow2() {
                var count = document.getElementById("countmeasuregoal1").value;
                var table = document.getElementById("goaltable");
                var rows = document.getElementById("goaltable").rows.length;
                var row = table.insertRow(rows);

                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);

                cell1.innerHTML = "<textarea style='border-radius:0px;' rows = '2' cols = '10%' name ='goal1measure" + count + "'></textarea>";
                cell2.innerHTML = "<textarea style='border-radius:0px;' rows = '2' cols = '10%' name ='goal1target" + count + "'></textarea>";
                count++;
                document.getElementById("countmeasuregoal1").setAttribute('value', count);
            }

            function deleteRow2() {
                var count = document.getElementById("countmeasuregoal1").value;
                var rows = document.getElementById("goaltable").rows.length;
                if (rows - 1 > 0) {
                    document.getElementById("goaltable").deleteRow(rows - 1);
                    count--;
                    document.getElementById("countmeasuregoal1").setAttribute('value', count);
                } else {

                }
            }

            function addRow3() {
                var count = document.getElementById("countmeasuregoal2").value;
                var table = document.getElementById("goaltable2");
                var rows = document.getElementById("goaltable2").rows.length;
                var row = table.insertRow(rows);

                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);

                cell1.innerHTML = "<textarea style='border-radius:0px;' rows = '2' cols = '10%' name ='goal2measure" + count + "'></textarea>";
                cell2.innerHTML = "<textarea style='border-radius:0px;' rows = '2' cols = '10%' name ='goal2target" + count + "'></textarea>";
                count++;
                document.getElementById("countmeasuregoal2").setAttribute('value', count);

            }

            function deleteRow3() {
                var count = document.getElementById("countmeasuregoal2").value;
                var rows = document.getElementById("goaltable2").rows.length;
                if (rows - 1 > 0) {
                    document.getElementById("goaltable2").deleteRow(rows - 1);
                    count--;
                    document.getElementById("countmeasuregoal2").setAttribute('value', count);
                } else {

                }
            }

            function addRow4() {
                var count = document.getElementById("countmeasuregoal3").value;
                var table = document.getElementById("goaltable3");
                var rows = document.getElementById("goaltable3").rows.length;
                var row = table.insertRow(rows);

                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);

                cell1.innerHTML = "<textarea style='border-radius:0px;' rows = '2' cols = '10%' name ='goal3measure" + count + "'></textarea>";
                cell2.innerHTML = "<textarea style='border-radius:0px;' rows = '2' cols = '10%' name ='goal3target" + count + "'></textarea>";
                count++;
                document.getElementById("countmeasuregoal3").setAttribute('value', count);

            }

            function deleteRow4() {
                var count = document.getElementById("countmeasuregoal3").value;
                var rows = document.getElementById("goaltable3").rows.length;
                if (rows - 1 > 0) {
                    document.getElementById("goaltable3").deleteRow(rows - 1);
                    count--;
                    document.getElementById("countmeasuregoal3").setAttribute('value', count);
                } else {

                }
            }

            $(document).ready(function () {
                $("#addgoal").click(function () {
                    $("#container").append('<h2>Goal 1: </h2><textarea rows = "1" cols = "1%" name ="goalnumber"></textarea><center><table style = "width:100%" id="goaltable"><tr><th>Measure</th><th>Description</th><th>Target</th></tr><tr><td><textarea rows = "2" cols = "1%" name ="measure"></textarea></td><td><textarea rows = "2" cols = "10%" name ="description"></textarea></td><td><textarea rows = "2" cols = "1%" name ="target"></textarea></td></tr><tr><td><textarea rows = "2" cols = "1%" name ="measure"></textarea></td><td><textarea rows = "2" cols = "10%" name ="description"></textarea></td><td><textarea rows = "2" cols = "1%" name ="target"></textarea></td></tr><tr><td><textarea rows = "2" cols = "1%" name ="measure"></textarea></td><td><textarea rows = "2" cols = "10%" name ="description"></textarea></td><td><textarea rows = "2" cols = "1%" name ="target"></textarea></td></tr></table></center><br><center><input type ="button" id="addRowButton" onclick ="addRow2()" value="Add row">&nbsp;<input type ="button" id="deleteRowButton" onclick ="deleteRow2()" value="Delete row"></center>');

                });
            });


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
                <hr size="5" noshade>    
                <center><h1>Create KRA</h1></center>
                <hr size="5" noshade>

                <div class="form-style-5">
                    <form action = "addKRA" method="post">
                        <%
                            SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
                            java.util.Date javaDate = new java.util.Date();
                            java.sql.Date Datejava = new java.sql.Date(javaDate.getTime());
                        %>
                        <fieldset>
                            <legend>Date: <input type = "date" rows = "1" cols = "1%" name ="date" value="<%=Datejava%>"/></legend>
                        </fieldset>

                        <fieldset>
                            <legend>KRA Name: <textarea  rows = "1" cols = "1%" name ="kraname"></textarea></legend>
                        </fieldset>

                        <div class="add-goal">
                            <h4>Goal 1: </h4><textarea style='border-radius:0px;' rows = "1" cols = "1%" name ="goalname1"></textarea>
                            <center><table style = "width:100%" id="goaltable">
                                    <tr>
                                        <th>Measure</th>
                                        <th>Target</th>
                                    </tr>
                                    <tr>    
                                        <td><textarea style='border-radius:0px;' rows = "2" cols = "50%" name ="goal1measure1"></textarea></td>
                                        <td><textarea style='border-radius:0px;' rows = "2" cols = "50%" name ="goal1target1"></textarea></td>
                                    </tr>
                                    <tr>    
                                        <td><textarea style='border-radius:0px;' rows = "2" cols = "50%" name ="goal1measure2"></textarea></td>
                                        <td><textarea style='border-radius:0px;' rows = "2" cols = "50%" name ="goal1target2"></textarea></td>
                                    </tr>
                                    <tr>    
                                        <td><textarea style='border-radius:0px;' rows = "2" cols = "50%" name ="goal1measure3"></textarea></td>
                                        <td><textarea style='border-radius:0px;' rows = "2" cols = "50%" name ="goal1target3"></textarea></td>
                                    </tr>

                                    <input type="hidden" value="4" id="countmeasuregoal1" name="countmeasuregoal1">
                                </table></center>
                            <br>
                            <center>
                                <input type ="button" id="addRowButton" onclick ="addRow2()" value="Add row">  
                                <input type ="button" id="deleteRowButton" onclick ="deleteRow2()" value="Delete row">
                            </center>
                            <br>
                        </div>

                        <div class="add-goal">
                            <h4>Goal 2: </h4><textarea style='border-radius:0px;' rows = "1" cols = "1%" name ="goalname2"></textarea>
                            <center><table style = "width:100%" id="goaltable2">
                                    <tr>
                                        <th>Measure</th>
                                        <th>Target</th>
                                    </tr>
                                    <tr>    
                                        <td><textarea style='border-radius:0px;' rows = "2" cols = "50%" name ="goal2measure1"></textarea></td>
                                        <td><textarea style='border-radius:0px;' rows = "2" cols = "50%" name ="goal2target1"></textarea></td>
                                    </tr>
                                    <tr>    
                                        <td><textarea style='border-radius:0px;' rows = "2" cols = "50%" name ="goal2measure2"></textarea></td>
                                        <td><textarea style='border-radius:0px;' rows = "2" cols = "50%" name ="goal2target2"></textarea></td>
                                    </tr>
                                    <tr>    
                                        <td><textarea style='border-radius:0px;' rows = "2" cols = "50%" name ="goal2measure3"></textarea></td>
                                        <td><textarea style='border-radius:0px;' rows = "2" cols = "50%" name ="goal2target3"></textarea></td>
                                    </tr>

                                    <input type="hidden" value="4" id="countmeasuregoal2" name="countmeasuregoal2">
                                </table></center>
                            <br>
                            <center>
                                <input type ="button" id="addRowButton" onclick ="addRow3()" value="Add row">  
                                <input type ="button" id="deleteRowButton" onclick ="deleteRow3()" value="Delete row">
                            </center>
                            <br>
                        </div>

                        <div class="add-goal">
                            <h4>Goal 3: </h4><textarea style='border-radius:0px;' rows = "1" cols = "1%" name ="goalname3"></textarea>
                            <center><table style = "width:100%" id="goaltable3">
                                    <tr>
                                        <th>Measure</th>
                                        <th>Target</th>
                                    </tr>
                                    <tr>    
                                        <td><textarea style='border-radius:0px;' rows = "2" cols = "50%" name ="goal3measure1"></textarea></td>
                                        <td><textarea style='border-radius:0px;' rows = "2" cols = "50%" name ="goal3target1"></textarea></td>
                                    </tr>
                                    <tr>    
                                        <td><textarea style='border-radius:0px;' rows = "2" cols = "50%" name ="goal3measure2"></textarea></td>
                                        <td><textarea style='border-radius:0px;' rows = "2" cols = "50%" name ="goal3target2"></textarea></td>
                                    </tr>
                                    <tr>    
                                        <td><textarea style='border-radius:0px;' rows = "2" cols = "50%" name ="goal3measure3"></textarea></td>
                                        <td><textarea style='border-radius:0px;' rows = "2" cols = "50%" name ="goal3target3"></textarea></td>
                                    </tr>

                                    <input type="hidden" value="4" id="countmeasuregoal3" name="countmeasuregoal3">
                                </table></center>
                            <br>
                            <center>
                                <input type ="button" id="addRowButton" onclick ="addRow4()" value="Add row">  
                                <input type ="button" id="deleteRowButton" onclick ="deleteRow4()" value="Delete row">
                            </center>
                            <br>

                            <div id="container"></div>
                        </div>
                        <br>
                        <center><button class="button" type="submit" value="Submit" >Create KRA</button></center>
                    </form>
                </div>
            </div>

        </div>


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