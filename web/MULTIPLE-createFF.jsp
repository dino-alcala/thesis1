<%-- 
    Document   : UR-home
    Created on : 06 27, 18, 1:25:59 PM
    Author     : Karl Madrid
--%>

<%@page import="dao.OvplmDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entity.Community"%>
<%@page import="java.text.DecimalFormat"%>
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

        <title>Create FF</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/sidebar2.css">
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

            .form-style-5{

                max-width: 95%;
                margin: 10px auto;
                padding: 20px;
                border-radius: 8px;
                font-family: Georgia, "Times New Roman", Times, serif;
                font-size: 12px;
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
                border: 0;
                border-radius: 4px;
                font-size: 16px;
                margin-bottom: -5px;
                outline: 0;
                padding: 7px;
                width: 100%;
                box-sizing: border-box; 
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box; 
                background-color: #d2d9dd;
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

            .form-style-5 input[type="submit"]
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
                width: 20%;
                border-radius: 10px;
                border: 1px solid darkgreen;
                border-width: 1px 1px 3px;
                margin-bottom: 10px;
            }
            .form-style-5 input[type="button"]
            {
                position: relative;
                display: block;
                padding: 9px 9px 9px 9px;
                color: #FFF;
                margin: 0 auto;
                background: green;
                font-size: 15px;
                text-align: center;
                font-style: normal;
                border-radius: 10px;
                border: 1px solid darkgreen;
                margin-bottom: 10px;
            }
            .form-style-5 input[type="submit"]:hover,
            .form-style-5 input[type="button"]:hover
            {
                background: #109177;
            }

            th{
                padding:15px;
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
        
                <script>
            function addRow(){

            var count = document.getElementById("countexpenses").value;
            var table = document.getElementById("breakdowntable");
            var rows = document.getElementById("breakdowntable").rows.length;
            var row = table.insertRow(rows - 1);
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
            cell1.innerHTML = "<td><textarea rows = '2' cols = '25%' name ='ffitem" + count + "' required></textarea></td>";
            cell2.innerHTML = "<td><textarea rows = '2' cols = '25%' name ='ffunitcost" + count + "' required></textarea></td>";
            cell3.innerHTML = "<td><textarea rows = '2' cols = '25%' name ='ffquantity" + count + "' required></textarea></td>";
            cell4.innerHTML = "<td><textarea rows = '2' cols = '25%' name ='ffsubtotal" + count + "' required></textarea></td>";
            count++;
            document.getElementById("countexpenses").setAttribute('value', count);
            }
            function deleteRow(){
            var count = document.getElementById("countexpenses").value;
            var rows = document.getElementById("breakdowntable").rows.length;
            if (rows - 1 > 0){
            document.getElementById("breakdowntable").deleteRow(rows - 2);
            count--;
            document.getElementById("countexpenses").setAttribute('value', count);
            } else {

            }
            }
        </script>

        <script type="text/javascript">
            <%
                OvplmDAO OvplmDAO = new OvplmDAO();
                ArrayList<KRA> k = new ArrayList();
                k = OvplmDAO.retrieveKRA();

            %>

            function changegoal(c1, c2) {

            var c1 = document.getElementById(c1);
            var c2 = document.getElementById(c2);
            c2.innerHTML = "";
            <%                    for (int i = 0; i < k.size(); i++) {
            %>
            if (c1.value == "<%=k.get(i).getId()%>") {
            var optionArray = ["|",<%for (int j = 0; j < k.get(i).getGoals().size(); j++) {%>"<%=k.get(i).getGoals().get(j).getGoalID()%>|<%=k.get(i).getGoals().get(j).getName()%>",<%}%>];
                }

            <%
                }
            %>

                for (var option in optionArray) {
                var pair = optionArray[option].split("|");
                var newOption = document.createElement("option");
                newOption.value = pair[0];
                newOption.innerHTML = pair[1];
                c2.options.add(newOption);
                }

                }

                function changemeasure(c1, c2) {

                var c1 = document.getElementById(c1);
                var c2 = document.getElementById(c2);
                c2.innerHTML = "";
            <%
                for (int i = 0; i < k.size(); i++) {
                    for (int j = 0; j < k.get(i).getGoals().size(); j++) {
            %>

                if (c1.value == "<%=k.get(i).getGoals().get(j).getGoalID()%>") {
                var optionArray = ["|",<%for (int l = 0; l < k.get(i).getGoals().get(j).getMeasures().size(); l++) {%>"<%=k.get(i).getGoals().get(j).getMeasures().get(l).getMeasureID()%>|<%=k.get(i).getGoals().get(j).getMeasures().get(l).getMeasure()%>",<%}%>];
                    }

            <%
                    }
                }
            %>

                    for (var option in optionArray) {
                    var pair = optionArray[option].split("|");
                    var newOption = document.createElement("option");
                    newOption.value = pair[0];
                    newOption.innerHTML = pair[1];
                    c2.options.add(newOption);
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
                    $("#sidebar-container").load("sidebarmultiple.jsp");
                </script>
            </div>
            <!-- sidebar-container END -->

            <!-- MAIN -->
            <div class="col py-3">
                <hr size="5" noshade>    
                <center><h1>Faith Formation Program Proposal</h1></center>
                <hr size="5" noshade>

                <div class="form-style-5">
                    <form action = "addFF" method="post">
                        <%
                            UserDAO = new UserDAO();
                            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-mm-dd");
                            java.util.Date javaDate = new java.util.Date();
                            java.sql.Date sqlDate = new java.sql.Date(javaDate.getTime());
                        %>
                        <fieldset>
                            <legend><b>Unit: <%=session.getAttribute("unit")%></b></legend>
                        </fieldset>

                        <fieldset>
                            <legend><b>Department: <%=UserDAO.getDepartmentByUserID(Integer.parseInt(session.getAttribute("userID").toString()))%></b></legend>
                        </fieldset>

                        <fieldset>
                            <legend><b>Date: <%=sqlDate%></b></legend>
                        </fieldset>

                        <fieldset>
                            <legend><b>Program Head:</b></legend>
                            <center><input type = "text" name ="programhead" required></center>
                            <br>
                        </fieldset>

                        <fieldset>
                            <legend><b>Activity Classification:</b> </legend>
                            <select name="classification">
                                <option value="Recollection">Recollection</option>
                                <option value="Retreat">Retreat</option>
                                <option value="Spiritual-activity development">Spiritual-activity development</option>
                                <option value="Others">Others</option>
                            </select>
                            <br><br>
                        </fieldset>

                        <fieldset>
                            <legend><b>Target KRA: </b></legend>
                            <select name="kra" id="kra" onchange="changegoal(this.id, 'goals')" required>
                                <option></option>
                                <%
                                    for (int m = 0; m < k.size(); m++) {
                                %>
                                <option value="<%=k.get(m).getId()%>"><%=k.get(m).getName()%></option>
                                <%
                                    }
                                %>
                            </select>
                            <br><br>
                        </fieldset>

                        <fieldset>
                            <legend><b>Target Goal: </b></legend>
                            <select name="goal" id="goals" onchange="changemeasure(this.id, 'measures')" required>
                            </select>
                            <br><br>
                        </fieldset>

                        <fieldset>
                            <legend><b>Target Measure: </b></legend>
                            <select name="measure" id="measures" required>
                            </select>
                            <br><br><br><br>
                        </fieldset>

                        <fieldset>
                            <legend><span class="number">1</span><b> Project Name:</b></legend>
                            <center><input type = "text" name ="pname" required></center>
                            <br>
                        </fieldset>

                        <fieldset>
                            <legend><span class="number">2</span><b> Venue:</b></legend>
                            <center><input type = "text" name ="pvenue" required></center>
                            <br>
                        </fieldset>

                        <fieldset>
                            <legend><span class="number">3</span><b> Speaker:</b></legend>
                            <center><input type = "text" name ="pspeaker" required></center>
                            <br>
                        </fieldset>

                        <fieldset>
                            <legend><span class="number">4</span><b> Objectives:</b></legend>
                            <center><textarea rows="3" cols = "50%" name="objectives" required></textarea></center>
                            <br>
                        </fieldset>

                        <fieldset>
                            <legend><span class="number">5</span><b> Target Implementation Date:</b></legend>
                            <center><input type = "date" name ="actualdate" min="<%=sqlDate%>" required></center>
                            <br>
                        </fieldset>

                        <fieldset>
                            <legend><span class="number">6</span><b> Total Amount Requested:</b></legend>
                            <center><input type = "number" name ="pbudget" required></center>
                            <br>
                        </fieldset>

                        <fieldset>
                            <legend><span class="number">7</span><b>Source of Funds:</b></legend>
                            <center><select name="funds">
                                    <option value="OVPLM">OVPLM</option>
                                    <option value="Others">Others</option>
                                </select></center>
                            <br>
                        </fieldset>

                        <%
                            DecimalFormat df = new DecimalFormat("#,###,###,###.##");
                        %>

                        <h2>Breakdown of Expenses (Budget of 2000 per head):</h2>
                        <input type="hidden" value="1" id="countexpenses" name="countexpenses">
                        <fieldset>
                            <center><table style = "width:100%" id="breakdowntable">
                                    <tr>

                                        <th>Item</th>
                                        <th>Unit Cost</th>
                                        <th>Quantity</th>
                                        <th>Subtotal</th>
                                    </tr>
                                    <tr>
                                        <td><textarea rows = "2" cols = "25%" name ="ffitem0" required></textarea></td>
                                        <td><textarea rows = "2" cols = "25%" name ="ffunitcost0" required></textarea></td>
                                        <td><textarea rows = "2" cols = "25%" name ="ffquantity0" required></textarea></td>
                                        <td><textarea rows = "2" cols = "25%" name ="ffsubtotal0" required></textarea></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td>Grand Total: </td>
                                    </tr>
                                </table></center>
                            <br>
                            <center><input type ="button" onclick ="addRow()" value="Click to Add Row">
                                <input style="background-color:red; border: red;" type ="button" onclick ="deleteRow()" value="Click to Delete Row"></center>
                        </fieldset>

                        <br><br><br><br>
                        <center><button type = "submit" class="button">Next</button></center>
                    </form>
                </div>
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

