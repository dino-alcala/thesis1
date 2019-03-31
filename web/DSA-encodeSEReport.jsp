<%-- 
    Document   : UR-home
    Created on : 06 27, 18, 1:25:59 PM
    Author     : Karl Madrid
--%>

<%@page import="entity.Measure"%>
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
            table,th,td{
                border:.5px solid
                    black;
            }


            textarea{
                resize: none;
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
            
            h3{
                border-bottom: 2px solid green;
                border-top: 2px solid green;
                padding-bottom: 10px;
                padding-top: 10px;
            }

            .button{
                background-color: darkgreen;
                border: none;
                border-radius: 5px;
                color: white;
                padding: 10px 20px;
                text-align: center;
                display: inline-block;
                margin: 4px 2px;
                font-size: 16px;
                font-family: "Arial", Helvetica, sans-serif;
            }

            legend, h3, #inputText, #classification, option, select, value, td, #fname{
                font-family: "Arial", Helvetica, sans-serif;
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

        <script type='text/javascript'>


            function addRow() {
                var count = document.getElementById("countparticipants").value;
                var table = document.getElementById("participants");
                var rows = document.getElementById("participants").rows.length;
                var row = table.insertRow(rows - 1);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                cell1.innerHTML = "<td><textarea rows = '2' cols = '20%' name='classification" + count + "'></textarea></td>";
                cell2.innerHTML = "<td><textarea rows = '2' cols = '20%' name='number" + count + "'></textarea></td>";
                count++;
                document.getElementById("countparticipants").setAttribute('value', count);
            }

            function addRow2() {
                var table = document.getElementById("expenditures");
                var rows = document.getElementById("expenditures").rows.length;
                var row = table.insertRow(rows - 1);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                cell1.innerHTML = '<td><textarea rows = "2" cols = "20%" name="source"></textarea></td>';
                cell2.innerHTML = '<td><textarea rows = "2" cols = "20%" name="amount"></textarea></td>';
            }

            function deleteRow() {
                var count = document.getElementById("countparticipants").value;
                var rows = document.getElementById("participants").rows.length;
                if (rows - 1 > 1) {
                    document.getElementById("participants").deleteRow(rows - 2);
                    count--;
                    document.getElementById("countparticipants").setAttribute('value', count);
                } else {

                }
            }

            function deleteRow2() {
                var rows = document.getElementById("expenditures").rows.length;
                if (rows - 1 > 1) {
                    document.getElementById("expenditures").deleteRow(rows - 2);
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
                <center><h3>Program Accomplishment Report Form</h3></center>

                <div class="form-style-5">


                    <form action="encodeSEReport" method="post">
                        <%
                            SE SE = new SE();
                            SE = UserDAO.retrieveSEBySEID(Integer.parseInt(request.getAttribute("seID").toString()));
                        %>
                        <fieldset>
                            <legend><span class="number">1</span><b> Information Identification</b></legend>
                        </fieldset>

                        <fieldset>
                            <legend><b>Target KRA:</b> </legend>
                            <input id="inputText" name="kra" size="50" type="text" readonly value="<%=UserDAO.getKRAnameByID(SE.getTargetKRA())%>">
                            <br><br>
                        </fieldset>

                        <fieldset>
                            <legend><b>Target Goal:</b> </legend>
                            <input id="inputText" name="goal" size="50" type="text" readonly value="<%=UserDAO.getGoalnameByID(SE.getTargetGoal())%>">
                            <br><br>
                        </fieldset>


                        <%
                            ArrayList<Integer> measuresid = new ArrayList();
                            measuresid = UserDAO.GetMeasures(SE.getId());

                            for (int x = 0; x < measuresid.size(); x++) {
                                
                        %>
                        <fieldset>
                            <legend><b>Target Measure:</b> </legend>
                            <input id="inputText" name="measure<%=x%>" size="50" type="text" readonly value="<%=UserDAO.GetMeasureObject(measuresid.get(x)).getMeasure()%> - <%=UserDAO.GetMeasureObject(measuresid.get(x)).getDescription()%>">
                            <br><br>
                        </fieldset>
                        <%
                            }
                        %>
                        <br><br><br>

                        <fieldset>
                            <legend><b>Program Name:</b></legend>
                            <center><input id="fname" name="name" size="50" type="text" readonly value="<%=SE.getName()%>"></center>
                            <br>
                        </fieldset>
                            
                        <fieldset>  
                            <legend><b>Program Head:</b></legend>
                            <center><input value="<%=SE.getProgramHead()%>" readonly name="programhead" size="50" type="text" required></center>
                            <br>
                        </fieldset>

                        <fieldset>  
                            <legend><b>Student Organization:</b></legend>
                            <center><input id="fname" name="proponents" size="50" type="text" readonly value="<%=SE.getDepartment()%>"></center>
                            <br>
                        </fieldset>

                        <fieldset>  
                            <legend><b>Number of Beneficiaries</b></legend>
                            <input id="fname" style="width:30%" type="number" name="number" size="50" type="text" required>
                            <br><br>
                        </fieldset>

                        <fieldset>  
                            <legend><b>Project Beneficiaries (Urban poor, women, youth, etc.)</b></legend>
                            <input style="width:30%" id="fname" name="projben" size="50" type="text" required>
                            <br><br>
                        </fieldset>

                        <fieldset>  
                            <legend><b>Address of Beneficiaries</b></legend>
                            <center><input id="fname" name="addressben" size="50" type="text" required></center>
                            <br>
                        </fieldset>

                        <fieldset>  
                            <legend><b>Date of Project Implementation</b></legend>
                            <center><input value="<%=SE.getActualDate()%>" id="fname" name="implementationdate" readonly size="50" type="date" required></center>
                            <br><br>
                        </fieldset>
                            
                        <fieldset>  
                            <legend><b>Address of Project Implementation</b></legend>
                            <center><input value="<%=SE.getImplementationaddress()%>" id="fname" name="addressproj" readonly size="50" type="text" required></center>
                            <br><br>
                        </fieldset>
                            
                        <fieldset>  
                            <legend><b>Link to Google Sheets:</b></legend>
                            <input style="width:30%" id="fname" name="gsheets" size="50" type="text" required>
                            <br><br>
                        </fieldset>  

                        <fieldset>
                            <legend><b>List of DLSU Participants</b></legend>
                            <center><table style = "width:40%" id="participants">
                                    <tr>
                                        <th>Classification</th>
                                        <th>Number of Individuals</th>
                                    </tr>
                                    <tr>
                                        <td style="padding:12px">CAP</td>
                                        <td><input id="inputText" style="border-radius:0px; margin-top:-5px;" type="number" name ="number0" required value="<%=UserDAO.countCAP(Integer.parseInt(request.getAttribute("seID").toString()))%>" readonly></td>

                                    </tr>
                                    <tr>
                                        <td style="padding:12px">APSP</td>
                                        <td><input id="inputText" style="border-radius:0px; margin-top:-5px;" type="number" name ="number1" required value="<%=UserDAO.countAPSP(Integer.parseInt(request.getAttribute("seID").toString()))%>" readonly></td>
                                    </tr>
                                    <tr>
                                        <td style="padding:12px">ASF</td>
                                        <td><input id="inputText" style="border-radius:0px; margin-top:-5px;" type="number" name ="number2" required value="<%=UserDAO.countASF(Integer.parseInt(request.getAttribute("seID").toString()))%>" readonly></td>
                                    </tr>
                                    <tr>
                                        <td style="padding:12px">Faculty</td>
                                        <td><input id="inputText" style="border-radius:0px; margin-top:-5px;" type="number" name ="number3" required value="<%=UserDAO.countFaculty(Integer.parseInt(request.getAttribute("seID").toString()))%>" readonly></td>
                                    </tr>
                                    <tr>
                                        <td style="padding:12px">Administrators</td>
                                        <td><input id="inputText" style="border-radius:0px; margin-top:-5px;" type="number" name ="number4" required value="<%=UserDAO.countAdmin(Integer.parseInt(request.getAttribute("seID").toString()))%>" readonly></td>
                                    </tr>
                                    <tr>
                                        <td style="padding:12px">Direct Hired Contractuals</td>
                                        <td><input id="inputText" style="border-radius:0px; margin-top:-5px;" type="number" name ="number5" required value="<%=UserDAO.countDirecthired(Integer.parseInt(request.getAttribute("seID").toString()))%>" readonly></td>
                                    </tr>
                                    <tr>
                                        <td style="padding:12px">Independent Contractors</td>
                                        <td><input id="inputText" style="border-radius:0px; margin-top:-5px;" type="number" name ="number6" required value="<%=UserDAO.countIndependent(Integer.parseInt(request.getAttribute("seID").toString()))%>" readonly></td>
                                    </tr>
                                    <tr>
                                        <td style="padding:12px">External Service Personnel</td>
                                        <td><input id="inputText" style="border-radius:0px; margin-top:-5px;" type="number" name ="number7" required value="<%=UserDAO.countExternal(Integer.parseInt(request.getAttribute("seID").toString()))%>" readonly></td>
                                    </tr>
                                    <tr>
                                        <td style="padding:12px">Graduate Students</td>
                                        <td><input id="inputText" style="border-radius:0px; margin-top:-5px;" type="number" name ="number8" required value="<%=UserDAO.countGrad(Integer.parseInt(request.getAttribute("seID").toString()))%>" readonly></td>
                                    </tr>
                                    <tr>
                                        <td style="padding:12px">Undergraduate Students</td>
                                        <td><input id="inputText" style="border-radius:0px; margin-top:-5px;" type="number" name ="number9" required value="<%=UserDAO.countUndergrad(Integer.parseInt(request.getAttribute("seID").toString()))%>" readonly></td>
                                    </tr>
                                    <tr>
                                        <td style="padding:12px">Alumni</td>
                                        <td><input id="inputText" style="border-radius:0px; margin-top:-5px;" type="number" name ="number10" required value="<%=UserDAO.countAlumni(Integer.parseInt(request.getAttribute("seID").toString()))%>" readonly></td>
                                    </tr>
                                    <tr>
                                        <td style="padding:12px">Parents</td>
                                        <td><input id="inputText" style="border-radius:0px; margin-top:-5px;" type="number" name ="number11" required value="<%=UserDAO.countParent(Integer.parseInt(request.getAttribute("seID").toString()))%>" readonly></td>
                                    </tr>
                                </table>
                            </center>
                            <br><br>
                        </fieldset>

                        <fieldset>  
                            <legend><b>Amount of Grants Received from OVPLM or Others:</b></legend>
                            <center><input id="fname" name="source" size="50" readonly value="<%=SE.getTotalAmount()%>" type="text"></center>
                            <br>
                        </fieldset>

                        <br><br>
                        <center>
                            <legend>Page 1 of 4</legend>
                            <button class="button" type="submit" name="seID" value="<%=SE.getId()%>">Next</button>
                        </center>
                    </form>
                </div>
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