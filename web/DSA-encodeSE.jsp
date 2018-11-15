<%-- 
    Document   : UR-home
    Created on : 06 27, 18, 1:25:59 PM
    Author     : Karl Madrid
--%>

<%@page import="dao.StudentOrgDAO"%>
<%@page import="entity.StudentOrg"%>
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

        <title>Create SE Program - Student Org</title>

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

            .krascards:hover {
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

            a {
                color: #0083e8;
            }

            b, strong {
                font-weight: 600;
                font-size: 17px;
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
            
            #inputText { 
                font-family: "Arial", Helvetica, sans-serif; 
            }
            
            option, select{
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

        <script>
            var created = 0;
            
            <%
                OvplmDAO OvplmDAO = new OvplmDAO();
                ArrayList<KRA> k = new ArrayList();
                k = OvplmDAO.retrieveKRA();
            %>
            
            function displayAccordingly(c1, c2) {
            var classification = document.getElementById('classification');
            var c1 = document.getElementById(c1);
            var c2 = document.getElementById(c2);
            c2.innerHTML = "";
            
            if (classification.value == "Socially Engaged Research") { 
                var optionArray = ["|", "2|KRA5 - Community that is attuned to a sustainable Earth and socially engaged"];
    
                for (var option in optionArray) {
                var pair = optionArray[option].split("|");
                var newOption = document.createElement("option");
                newOption.value = pair[0];
                newOption.innerHTML = pair[1];
                c2.options.add(newOption);
                }
                
            } else if (classification.value == "Service-Learning") {
                var option1=document.createElement("option");
                option1.text="Community that is attuned to a sustainable Earth and socially engaged";
                selectkra.add(option1,selectkra.options[null]);
            } else if (classification.value == "Interdisciplinary Fora") {
                var option1=document.createElement("option");
                option1.text="Formation for all sectors that is truly Lasallian";
                selectkra.add(option1,selectkra.options[null]);
            } else if (classification.value == "Direct Service to the Poor and Marginalized") {
                var option1=document.createElement("option");
                option1.text="Community that is attuned to a sustainable Earth and socially engaged";
                selectkra.add(option1,selectkra.options[null]);
            } else if (classification.value == "Issue Awareness and Advocacy") {
                var option1=document.createElement("option");
                option1.text="Formation for all sectors that is truly Lasallian";
                selectkra.add(option1,selectkra.options[null]);
            } else if (classification.value == "Public Engagement") {
                var option1=document.createElement("option");
                option1.text="Community that is attuned to a sustainable Earth and socially engaged";
                selectkra.add(option1,selectkra.options[null]);
            } else if (classification.value == "Others") {
                var option1=document.createElement("option");
                option1.text="Formation for all sectors that is truly Lasallian";
                selectkra.add(option1,selectkra.options[null]);
                
                var option2=document.createElement("option");
                option2.text="Community that is attuned to a sustainable Earth and socially engaged";
                selectkra.add(option2,selectkra.options[null]);
            } 
        }
        
        function changeKRA(c1, c2){
            var c1 = document.getElementById(c1);
            var c2 = document.getElementById(c2);
            c2.innerHTML = "";
            var optionArray = ["|",<%for (int m = 0; m < k.size(); m++) {%>"<%=k.get(m).getId()%>|<%=k.get(m).getName()%>",<%}%>];
                for (var option in optionArray) {
                var pair = optionArray[option].split("|");
                var newOption = document.createElement("option");
                newOption.value = pair[0];
                newOption.innerHTML = pair[1];
                c2.options.add(newOption);
                }
                }
        
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

                    function changemeasure(c1, c2, c3, c4) {

                    var c1 = document.getElementById(c1);
                    var c2 = document.getElementById(c2);
                    var c3 = document.getElementById(c3);
                    var c4 = document.getElementById(c4);
                    c2.innerHTML = "";
                    c3.innerHTML = "";
                    c4.innerHTML = "";
            <%
                for (int i = 0; i < k.size(); i++) {
                    for (int j = 0; j < k.get(i).getGoals().size(); j++) {
            %>

                    if (c1.value == "<%=k.get(i).getGoals().get(j).getGoalID()%>") {
                    var optionArray = [<%for (int l = 0; l < k.get(i).getGoals().get(j).getMeasures().size(); l++) {%>"<%=k.get(i).getGoals().get(j).getMeasures().get(l).getMeasureID()%>|<%=k.get(i).getGoals().get(j).getMeasures().get(l).getMeasure()%>",<%}%>];
                        }

                        if (c1.value == "<%=k.get(i).getGoals().get(j).getGoalID()%>") {
                        var optionArray2 = ["0|None",<%for (int l = 0; l < k.get(i).getGoals().get(j).getMeasures().size(); l++) {%>"<%=k.get(i).getGoals().get(j).getMeasures().get(l).getMeasureID()%>|<%=k.get(i).getGoals().get(j).getMeasures().get(l).getMeasure()%>",<%}%>];
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

                            for (var option in optionArray2) {
                            var pair = optionArray2[option].split("|");
                            var newOption = document.createElement("option");
                            newOption.value = pair[0];
                            newOption.innerHTML = pair[1];
                            c3.options.add(newOption);
                            }

                            for (var option in optionArray2) {
                            var pair = optionArray2[option].split("|");
                            var newOption = document.createElement("option");
                            newOption.value = pair[0];
                            newOption.innerHTML = pair[1];
                            c4.options.add(newOption);
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
                <center><h3>Social Engagement Proposal</h3></center>
                <hr size="5" noshade>

                <div class="form-style-5">
                    <form action = "encodeSE" method="post"> 

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
                            <legend><b>Program Name:</b></legend>
                            <input id="inputText" type = "text" name ="programname" required>
                            <br><br>
                        </fieldset>

                        <fieldset>
                            <legend><b>Program Head (First name, Last name):</b></legend>
                            <input type = "text" name ="programhead" id="inputText" required>
                            <br><br><br><br>
                        </fieldset>

                        <fieldset>
                            <legend><b>Target Community:</b></legend>
                            <%
                                ArrayList<Community> c = new ArrayList();
                                c = UserDAO.retrieveCommunity();
                            %>
                            <select name="community">
                                <%
                                    for (int m = 0; m < c.size(); m++) {
                                %>
                                <option value="<%=c.get(m).getId()%>"><%=c.get(m).getName()%></option>
                                <%
                                    }
                                %>
                            </select>
                            <br><br>
                        </fieldset>
                            
                        <fieldset>
                            <legend><b>Type of Social Engagement:</b></legend>
                            <select id="classification" name="classification" onchange="changeKRA(this.id, 'kra')">
                                <option value=""></option>
                                <option value="Socially Engaged Research">Socially Engaged Research</option>
                                <option value="Service-Learning">Service-Learning</option>
                                <option value="Interdisciplinary Fora">Interdisciplinary Fora</option>
                                <option value="Direct Service to the Poor and Marginalized">Direct Service to the Poor and Marginalized</option>
                                <option value="Issue Awareness and Advocacy">Issue Awareness and Advocacy</option>
                                <option value="Public Engagement">Public Engagement</option>
                                <option value="Others">Others</option>
                            </select>
                            <br><br>
                        </fieldset>
                            
                        <fieldset>
                            <legend><b>Target KRA:</b></legend>
                            <select name="kra" id="kra" onchange="changegoal(this.id, 'goals')" required>
                            </select>
                            <br><br>
                        </fieldset>

                        <fieldset>
                            <legend><b>Target Goal:</b></legend>
                            <select name="goal" id="goals" onchange="changemeasure(this.id, 'measures', 'measures2', 'measures3')" required>

                            </select>
                            <br><br>
                        </fieldset>


                        <fieldset>
                            <legend><b>Target Measure:</b></legend>
                            <select name="measure" id="measures" required>

                            </select>
                            <br><br><br>
                        </fieldset> 

                        <fieldset>
                            <legend><b>Target Measure 2:</b></legend>
                            <select name="measure2" id="measures2">
                                
                            </select>
                            <br><br><br>
                        </fieldset>

                        <fieldset>
                            <legend><b>Target Measure 3:</b></legend>
                            <select name="measure3" id="measures3">
                    
                            </select>
                            <br><br>
                            <center><a href="MULTIPLE-viewMeasureDetails.jsp" target="_blank"><button type="button" class="button">View Measure Details</button></a></center>
                            <br><br><br>
                        </fieldset>

                        <fieldset>
                            <legend><span class="number">1</span><b> Target Implementation Date:</b></legend>
                            <input id="inputText" style="width:30%" type = "date" name ="actualdate" min="<%=sqlDate%>" required>
                            <br><br><br>
                        </fieldset>

                        <fieldset>
                            <legend><span class="number">2</span><b> Implementation Address:</b></legend>
                            <input id="inputText" type = "text" name ="implementationaddress" required>
                            <br><br><br>
                        </fieldset>

                        <fieldset>
                            <legend><span class="number">3</span><b> Total Amount Requested:</b></legend>
                            <input id="inputText" style="width:30%" type = "number" name ="totalamount" required>
                            <br><br><br>
                        </fieldset>

                        <fieldset>
                            <legend><span class="number">4</span><b>Explain the Social/Community Problem being Addressed:</b></legend>
                            <center><textarea id="inputText" rows = "6" cols = "100%" name ="problemaddressed" required></textarea></center>
                            <br><br>
                        </fieldset>

                        <fieldset>
                            <legend><span class="number">5</span> <b>Social Engagement Partner/Beneficiary:</b><br></legend>
                            <legend>Name of Partner (First name, Last name): <input id="inputText" type='text' name='partnername' required/><br><br>
                                Address: <input id="inputText" type='text' name='partneraddress' required/><br><br>
                                Contact Person (First name, Last name): <input id="inputText" type='text' name='partnercontact' required/><br><br>
                                Mobile Number: <br><input style="width:30%" style="width:30%" id="inputText" type='number' name='partnernumber' required/><br><br>
                                Email: <input id="inputText" type='text' name='partneremail' required/><br><br>
                                Brief Description of Partner: <textarea id="inputText" name='partnerdescription' rows='5' required></textarea></legend>
                            <br>
                        </fieldset>


                        <fieldset>
                            <legend><span class="number">6</span><b >Measurable Outcomes/Objectives of the Project:</b></legend>
                            <center><textarea id="inputText" rows = "6" cols = "100%" name ="measureableoutcome" required></textarea></center>
                            <br><br>
                        </fieldset>

                        <fieldset>
                            <legend><span class="number">7</span><b> Sustainability Component (Check all that apply, if none proceed to next number):</b>
                                <br><br>
                                <input id="inputText" type='checkbox' name="component" value="Training/Capacity Building for the Partner"/>Training/Capacity Building for the Partner<br>
                                <input id="inputText" type='checkbox' name="component" value="Policy Advocacy/Development related to the Social Problem being Addressed"/>Policy Advocacy/Development related to the Social Problem being Addressed<br>
                                <input id="inputText" type='checkbox' name="component" value="Continuing and Developmental Partnership"/>Continuing and Developmental Partnership<br>
                                <input id="inputText" type='checkbox' name="component" value="Others"/>Others:</legend><textarea name='otherscomponent' rows='2'></textarea><br><br>
                            <legend>Explanation:</legend>
                            <textarea id="inputText" name='sustainabilityexplanation' rows='4' required></textarea>
                            <br><br><br>
                        </fieldset>

                        <fieldset>
                            <legend><span class="number">8</span><b >Source of Funds:</b></legend>
                            <select id="inputText" style="width:50%" name="funds" required>
                                <option value="OVPLM">Office of the Vice President for Lasallian Mission</option>
                                <option value="Others">Others</option>
                            </select>
                            <br>
                        </fieldset>
                        <br><br>
                        <br>
                        <center><button type="submit" class="button">Next</button></center>
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