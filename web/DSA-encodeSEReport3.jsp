<%-- 
    Document   : UR-home
    Created on : 06 27, 18, 1:25:59 PM
    Author     : Karl Madrid
--%>

<%@page import="entity.SEexpenses"%>
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

        <title>Create SE Completion Report - Student Org</title>

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
            tr:hover {
                background-color: lightgreen;
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
                font-family: "Times New Roman", Times, serif;
                font-size: 20px;
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

            #addRowButton {
                padding: 10px;
                padding-right: 17px;
                padding-left: 17px;
            }

            #deleteRowButton {
                padding: 10px;
            }

            #addRowButton, #deleteRowButton {
                display:inline-block;
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
                font-family: "Times New Roman", Times, serif;
            }
            
            td{
                padding:15px
            }
            
            h3{
                font-family: "Times New Roman", Times, serif;
            }
            
            legend, th, td{
                font-family: "Times New Roman", Times, serif;
                font-size: 15px;
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

        <script type='text/javascript'>


            function addRow() {
                var count = document.getElementById("countobjectives").value;
                var table = document.getElementById("objectives");
                var rows = document.getElementById("objectives").rows.length;
                var row = table.insertRow(rows);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                cell1.innerHTML = "<td><textarea style='border-radius:0px' rows = '2' cols = '20%' name='expected" + count + "'></textarea></td>";
                cell2.innerHTML = "<td><textarea style='border-radius:0px' rows = '2' cols = '20%' name='actual" + count + "'></textarea></td>";
                cell3.innerHTML = "<td><textarea style='border-radius:0px' rows = '2' cols = '20%' name='hinder" + count + "'></textarea></td>";
                count++;
                document.getElementById("countobjectives").setAttribute('value', count);
            }

            function addRow2() {
                var count = document.getElementById("countovplm").value;
                var table = document.getElementById("uce");
                var rows = document.getElementById("uce").rows.length;
                var row = table.insertRow(rows);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                var cell4 = row.insertCell(3);
                var cell5 = row.insertCell(4);
                cell1.innerHTML = "<td><textarea style='border-radius:0px' rows = '2' cols = '20%' name='item" + count + "'></textarea></td>";
                cell2.innerHTML = "<td><textarea style='border-radius:0px' rows = '2' cols = '20%' name='approved" + count + "'></textarea></td>";
                cell3.innerHTML = "<td><textarea style='border-radius:0px' rows = '2' cols = '20%' name='expended" + count + "'></textarea></td>";
                cell4.innerHTML = "<td><textarea style='border-radius:0px' rows = '2' cols = '20%' name='variance" + count + "'></textarea></td>";
                cell5.innerHTML = "<td><textarea style='border-radius:0px' rows = '2' cols = '20%' name='reason" + count + "'></textarea></td>";
                count++;
                document.getElementById("countovplm").setAttribute('value', count);

            }

            function addRow3() {
                var count = document.getElementById("countothers").value;
                var table = document.getElementById("others");
                var rows = document.getElementById("others").rows.length;
                var row = table.insertRow(rows);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                var cell4 = row.insertCell(3);
                var cell5 = row.insertCell(4);
                cell1.innerHTML = "<td><textarea style='border-radius:0px' rows = '2' cols = '20%' name='item" + count + "'></textarea></td>";
                cell2.innerHTML = "<td><textarea style='border-radius:0px' rows = '2' cols = '20%' name='approved" + count + "'></textarea></td>";
                cell3.innerHTML = "<td><textarea style='border-radius:0px' rows = '2' cols = '20%' name='expended" + count + "'></textarea></td>";
                cell4.innerHTML = "<td><textarea style='border-radius:0px' rows = '2' cols = '20%' name='variance" + count + "'></textarea></td>";
                cell5.innerHTML = "<td><textarea style='border-radius:0px' rows = '2' cols = '20%' name='reason" + count + "'></textarea></td>";
                count++;
                document.getElementById("countothers").setAttribute('value', count);

            }

            function deleteRow() {
                var count = document.getElementById("countobjectives").value;
                var rows = document.getElementById("objectives").rows.length;
                if (rows - 1 > 1) {
                    document.getElementById("objectives").deleteRow(rows - 1);
                    count--;
                    document.getElementById("countobjectives").setAttribute('value', count);
                } else {

                }
            }

            function deleteRow2() {
                var count = document.getElementById("countovplm").value;
                var rows = document.getElementById("uce").rows.length;
                if (rows - 1 > 1) {
                    document.getElementById("uce").deleteRow(rows - 1);
                    count--;
                    document.getElementById("countovplm").setAttribute('value', count);
                } else {

                }
            }

            function deleteRow3() {
                var count = document.getElementById("countothers").value;
                var rows = document.getElementById("others").rows.length;
                if (rows - 1 > 1) {
                    document.getElementById("others").deleteRow(rows - 1);
                    count--;
                    document.getElementById("countothers").setAttribute('value', count);
                } else {

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
                        $("#sidebar-container").load("sidebarmultiple.jsp");
                    </script>
                </ul>
            </div>

            <!-- MAIN -->
            <div class="col py-3">
                <hr size="5" noshade>    
                <center><h3>Program Accomplishment Report Form</h3></center>
                <hr size="5" noshade>

                <div class="form-style-5">


                    <form action="encodeSEReport3" method="post" enctype="multipart/form-data">
                        <fieldset>
                            <legend><span class="number">5</span><b>Major Problems Encountered</b></legend>
                            <center><textarea rows="10" cols="90%" name="problem" required></textarea> </center>
                            <br><br>
                        </fieldset>

                        <fieldset>
                            <legend><span class="number">6</span><b>Other Recommendations (Comments / Feedbacks / Participation of Stakeholders)</b></legend>
                            <center><textarea rows="10" cols="90%" name="recommendation" required></textarea> </center>
                            <br><br>
                        </fieldset>

                        <fieldset>
                            <legend><span class="number">7</span><b>Annexes</b></legend>
                            <table>
                                <tr>
                                    <td>Upload Photo</td>
                                    <td><input type ="file" name ="uploadphoto"><br></td>
                                </tr>
                                <tr>
                                    <td>Upload Attendance Sheets of Beneficiaries</td>
                                    <td><input type ="file" name ="uploadbeneficiaries"><br></td>
                                </tr>
                                <tr>
                                    <td>Upload Attendance Sheets for DLSU Participants</td>
                                    <td><input type ="file" name ="uploadparticipants"></td>
                                </tr>
                                <tr>
                                    <td>Upload Beneficiaries' letters / feedbacks</td>
                                    <td><input type ="file" name ="uploadletters"></td>
                                </tr>
                                <br>
                            </table>
                        </fieldset>
                        <br><br>
                        <center><button class="button" type="submit">Next</button></center>
                    </form>
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