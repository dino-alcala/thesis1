<%-- 
    Document   : UR-home
    Created on : 06 27, 18, 1:25:59 PM
    Author     : Karl Madrid
--%>

<%@page import="entity.FFexpenses"%>
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

        <title>Create FF Completion Report</title>

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

            legend, h3, #inputText, #classification, option, select, value, th{
                font-family: "Arial", Helvetica, sans-serif;
            }
            
            
            #addRowButton {
                padding: 10px;
                font-family: "Arial", Helvetica, sans-serif;
            }

            #deleteRowButton {
                padding: 10px;
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

        <script type='text/javascript'>


            function addRow() {
                var count = document.getElementById("countobjectives").value;
                var table = document.getElementById("objectives");
                var rows = document.getElementById("objectives").rows.length;
                var row = table.insertRow(rows);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                cell1.innerHTML = "<td><textarea style='border-radius:0px' rows = '2' cols = '20%' name='expected" + count + "' required></textarea></td>";
                cell2.innerHTML = "<td><textarea style='border-radius:0px' rows = '2' cols = '20%' name='actual" + count + "' required></textarea></td>";
                cell3.innerHTML = "<td><textarea style='border-radius:0px' rows = '2' cols = '20%' name='hinder" + count + "' required></textarea></td>";
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
                cell5.innerHTML = "<td><textarea style='border-radius:0px' rows = '2' cols = '20%' name='reason" + count + "' required></textarea></td>";
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
                cell5.innerHTML = "<td><textarea style='border-radius:0px' rows = '2' cols = '20%' name='reason" + count + "' required></textarea></td>";
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
                                    <button type="submit" value="<%=n.get(i).getRedirect()%>" name="redirect" style="width:100%; background-color:white; text-align:left;"> 
                                        <li class="notification-box">
                                            <strong class="notificationBoxHeader"><%=n.get(i).getTitle()%></strong><br>
                                            <%=n.get(i).getBody()%>
                                        </li>
                                    </button>

                                    <input type="hidden" name="ID" value="<%=n.get(i).getAttribute()%>"/>

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
                    <form action="createFFreport3" method="post">
                        <%
                            FF FF = new FF();
                            FF = UserDAO.retrieveFFByFFID(Integer.parseInt(request.getParameter("ffID")));
                        %>
                        <fieldset>
                            <legend><span class="number">2</span><b>Executive Summary</b></legend>
                        </fieldset>


                        <fieldset>
                            <legend><b>What is the significance of the project?</b></legend>
                            <center><textarea id="inputText" rows="8" cols="90%" name="significance" required></textarea> </center>
                            <br>
                        </fieldset>

                        <fieldset>
                            <legend><b>What are the highlights of the project?</b></legend>
                            <center><textarea id="inputText" rows="8" cols="90%" name="highlights" required></textarea> </center>
                            <br><br>
                        </fieldset>

                        <fieldset>
                            <legend><span class="number">3</span><b>Accomplishment of Objectives</b></legend>            
                        </fieldset>

                        <fieldset>
                            <input type="hidden" name="countobjectives" id="countobjectives" value="1">
                            <center><table style = "width:100%" id="objectives">
                                    <tr>
                                        <th>Expected Outcomes</th>
                                        <th>Actual Accomplishment</th>
                                        <th>Hindering Factors</th>
                                    </tr>
                                    <tr>
                                        <td><textarea id="inputText" style="border-radius:0px" rows = "2" cols = "20%" name ="expected0" required></textarea></td>
                                        <td><textarea id="inputText" style="border-radius:0px" rows = "2" cols = "20%" name ="actual0" required></textarea></td>
                                        <td><textarea id="inputText" style="border-radius:0px" rows = "2" cols = "20%" name ="hinder0" required></textarea></td>
                                    </tr>

                                </table></center>
                            <br>
                            <center>
                                <button type ="button" class="button" id="addRowButton" onclick ="addRow()" value="Add Row">Add row</button>
                                <button style="background-color:red; border: red;" class="button" id="deleteRowButton" type ="button" onclick ="deleteRow()" value="Delete Row">Delete row</button></center>
                            <br>
                        </fieldset>

                        <fieldset>
                            <legend><span class="number">4</span><b>Financial Aspect</b></legend>
                        </fieldset>

                        <fieldset>
                            <%
                                ArrayList<FFexpenses> expenses = new ArrayList();
                                expenses = UserDAO.retrieveExpensesFF(Integer.parseInt(request.getParameter("ffID").toString()));
                            %>
                            <%
                                if (FF.getSourceOfFunds().equals("OVPLM")) {
                            %>
                            <input type="hidden" name="countovplm" id="countovplm" value="<%=expenses.size()%>">
                            <legend><b> Grant from OVPLM fund</b></legend>
                            <center><table style = "width:100%" id="uce">
                                    <tr>
                                        <th>Line Item</th>
                                        <th>Approved Amount</th>
                                        <th>Expended Amount</th>
                                        <th>Variance (Approved minus Expended Amount)</th>
                                        <th>Reason for Variance</th>
                                    </tr>
                                    <%
                                        for (int i = 0; i < expenses.size(); i++) {
                                    %>
                                    <tr>
                                        <td><textarea id="inputText" style="border-radius:0px" rows = "2" cols = "20%" name ="item<%=i%>" readonly><%=expenses.get(i).getItem()%></textarea></td>
                                        <td><textarea id="inputText" style="border-radius:0px" rows = "2" cols = "20%" name ="approved<%=i%>" readonly><%=expenses.get(i).getUnitcost() * expenses.get(i).getQuantity()%></textarea></td>
                                        <td><textarea id="inputText" style="border-radius:0px" rows = "2" cols = "20%" name ="expended<%=i%>" readonly><%=expenses.get(i).getAmountUsed()%></textarea></td>
                                        <td><textarea id="inputText" style="border-radius:0px" rows = "2" cols = "20%" name ="variance<%=i%>" readonly><%=(expenses.get(i).getUnitcost() * expenses.get(i).getQuantity()) - expenses.get(i).getAmountUsed()%></textarea></td>
                                        <td><textarea id="inputText" style="border-radius:0px" rows = "2" cols = "20%" name ="reason<%=i%>" required></textarea></td>
                                    </tr>
                                    <%
                                        }
                                    %>

                                </table></center>
                            <br>
                            <center>
                                <button type ="button" class="button" id="addRowButton" onclick ="addRow2()" value="Add Row">Add row</button>
                                <button style="background-color:red; border: red;" class="button" id="deleteRowButton" type ="button" onclick ="deleteRow2()" value="Delete Row">Delete row</button></center>
                            <br>
                            <br>
                            <%
                            } else {
                            %>
                            <input type="hidden" name="countothers" id="countothers" value="1">
                            <legend><b> Grant from other sources</b></legend>
                            <center><table style = "width:100%" id="others">
                                    <tr>
                                        <th>Line Item</th>
                                        <th>Approved Amount</th>
                                        <th>Expended Amount</th>
                                        <th>Variance (Approved minus Expended Amount)</th>
                                        <th>Reason for Variance</th>
                                    </tr>
                                    <%
                                        for (int i = 0; i < expenses.size(); i++) {
                                    %>
                                    <tr>
                                        <td><textarea rows = "2" cols = "20%" name ="item<%=i%>" readonly><%=expenses.get(i).getItem()%></textarea></td>
                                        <td><textarea rows = "2" cols = "20%" name ="approved<%=i%>" readonly><%=expenses.get(i).getUnitcost() * expenses.get(i).getQuantity()%></textarea></td>
                                        <td><textarea rows = "2" cols = "20%" name ="expended<%=i%>" readonly><%=expenses.get(i).getAmountUsed()%></textarea></td>
                                        <td><textarea rows = "2" cols = "20%" name ="variance<%=i%>" readonly><%=(expenses.get(i).getUnitcost() * expenses.get(i).getQuantity()) - expenses.get(i).getAmountUsed()%></textarea></td>
                                        <td><textarea rows = "2" cols = "20%" name ="reason<%=i%>" required></textarea></td>
                                    </tr>
                                    <%
                                        }
                                    %>

                                </table></center>
                            <br>
                            <center><input type ="button" id="addRowButton" onclick ="addRow3()" value="Add Row">
                                <input style="background-color:red; border: red;" id="deleteRowButton" type ="button" onclick ="deleteRow3()" value="Delete Row"></center>
                                <%
                                    }
                                %>
                        </fieldset>

                        <br><br>
                        <center><button class="button" type="submit" name="funds" value="<%=FF.getSourceOfFunds()%>">Next</button></center>
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