<%-- 
    Document   : UR-home
    Created on : 06 27, 18, 1:25:59 PM
    Author     : Karl Madrid
--%>

<%@page import="dao.StudentOrgDAO"%>
<%@page import="entity.StudentOrg"%>
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

        <title>Create FF Program - Student Org</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
        <link rel="stylesheet" href="css/sidebar.css">
        <link rel="stylesheet" href="css/formstyle5.css">

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

            #myInput{
                margin-bottom: 20px;
            }

            .card-text{
                margin-bottom: 5px;
            }

            .krascards:hover {
                background-color: lightgreen;
            }

            tr:hover {
                background-color: lightgreen;
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


            th{
                padding:15px;
            }

            a {
                color: #0083e8;
            }

            b, strong {
                font-weight: 600;
                font-size: 20px;
            }

            h3{
                font-family: "Times New Roman", Times, serif;
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
                font-family: "Times New Roman", Times, serif;
            }

            #addRowButton, #deleteRowButton {
                display:inline-block;
                font-family: "Times New Roman", Times, serif;
            }

            legend{
                font-family: "Times New Roman", Times, serif;
            }

            table,th,td{
                font-family: "Times New Roman", Times, serif;
                font-size: 15px;

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
            cell1.innerHTML = "<td><textarea style='border-radius: 0px' rows = '2' cols = '25%' name ='ffitem" + count + "' required></textarea></td>";
            cell2.innerHTML = "<td><textarea style='border-radius: 0px' rows = '2' cols = '25%' name ='ffunitcost" + count + "' required></textarea></td>";
            cell3.innerHTML = "<td><textarea style='border-radius: 0px' rows = '2' cols = '25%' name ='ffquantity" + count + "' required></textarea></td>";
            cell4.innerHTML = "<td><textarea style='border-radius: 0px' rows = '2' cols = '25%' name ='ffsubtotal" + count + "' required></textarea></td>";
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
                <center><h3>Faith Formation Program Proposal</h3></center>
                <hr size="5" noshade>

                <div class="form-style-5">
                    <form action = "encodeFF" method="post">
                        <%
                            UserDAO = new UserDAO();
                            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-mm-dd");
                            java.util.Date javaDate = new java.util.Date();
                            java.sql.Date sqlDate = new java.sql.Date(javaDate.getTime());
                        %>

                        <center>
                            <fieldset>
                                <legend><b>Date:</b> <%=sqlDate%></legend>
                            </fieldset>
                        </center>
                            
                        <%
                                ArrayList<StudentOrg> student = new ArrayList();
                                StudentOrgDAO StudentOrgDAO = new StudentOrgDAO();
                                student = StudentOrgDAO.retrieveOrgList();
                            %>
                            
                            
                        <fieldset>
                            <legend><b>Student Organization:</b></legend>
                            <select id="studentorg" name="studentorg">
                                <% for(int x = 0 ; x < student.size() ; x++){ %>
                                <option><%=student.get(x).getName()%></option>
                                <% 
                                    }
                                %>
                            </select>
                            <br><br>
                        </fieldset>

                        <br>
                        <fieldset>
                            <legend><b>Program Head:</b></legend>
                            <input type = "text" name ="programhead" required>
                            <br><br>
                        </fieldset>

                        <fieldset>
                            <legend><b>Type of Faith Formation:</b> </legend>
                            <select name="classification">
                                <option value="Retreat">Retreat</option>
                                <option value="Recollection">Recollection</option>
                                <option value="Prayer Service">Prayer Service</option>
                                <option value="Spiritual Talk">Spiritual Talk</option>
                                <option value="Talk on the life of the Founder">Talk on the life of the Founder</option>
                                <option value="Br. Gabriel Drolin Experience">Br. Gabriel Drolin Experience</option>
                            </select>
                            <br><br><br><br>
                        </fieldset>

                        <fieldset>
                            <legend><span class="number">1</span><b> Project Name:</b></legend>
                            <center><input type = "text" name ="pname" required></center>
                            <br><br>
                        </fieldset>

                        <fieldset>
                            <legend><span class="number">2</span><b> Venue:</b></legend>
                            <center><input type = "text" name ="pvenue" required></center>
                            <br><br>
                        </fieldset>

                        <fieldset>
                            <legend><span class="number">3</span><b> Speaker:</b></legend>
                            <center><input type = "text" name ="pspeaker" required></center>
                            <br><br>
                        </fieldset>

                        <fieldset>
                            <legend><span class="number">4</span><b> Objectives:</b></legend>
                            <center><textarea rows="3" cols = "50%" name="objectives" required></textarea></center>
                            <br><br>
                        </fieldset>

                        <fieldset>
                            <legend><span class="number">5</span><b> Target Implementation Date:</b></legend>
                            <input style ="width:30%" type = "date" name ="actualdate" min="<%=sqlDate%>" required>
                            <br><br><br>
                        </fieldset>

                        <fieldset>
                            <legend><span class="number">6</span><b> Total Amount Requested:</b></legend>
                            <input style ="width:30%" type = "number" name ="pbudget" required>
                            <br><br><br>
                        </fieldset>

                        <fieldset>
                            <legend><span class="number">7</span><b>Source of Funds:</b></legend>
                            <select style ="width:50%" name="funds">
                                <option value="OVPLM">Office of the Vice President for Lasallian Mission</option>
                                <option value="Others">Others</option>
                            </select>
                            <br>
                        </fieldset>

                        <%
                            DecimalFormat df = new DecimalFormat("#,###,###,###.##");
                        %>

                        <br><br>
                        <legend><b>Breakdown of Expenses (Budget of 2000 per head)</b></legend>
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
                                        <td><textarea style="border-radius: 0px;" rows = "2" cols = "25%" name ="ffitem0" required></textarea></td>
                                        <td><textarea style="border-radius: 0px;" rows = "2" cols = "25%" name ="ffunitcost0" required></textarea></td>
                                        <td><textarea style="border-radius: 0px;" rows = "2" cols = "25%" name ="ffquantity0" required></textarea></td>
                                        <td><textarea style="border-radius: 0px;" rows = "2" cols = "25%" name ="ffsubtotal0" required></textarea></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td>Grand Total: </td>
                                    </tr>
                                </table></center>
                            <br>
                            <center><input type ="button" id="addRowButton" onclick ="addRow()" value="Click to Add Row">
                                <input style= "background-color:red; border: red;" type ="button" id="deleteRowButton" onclick ="deleteRow()" value="Click to Delete Row"></center>
                        </fieldset>

                        <br><br><br><br>
                        <center><button type = "submit" class="button">Next</button></center>
                    </form>
                </div>
            </div>

        </div>

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

