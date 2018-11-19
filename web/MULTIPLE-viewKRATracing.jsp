<%-- 
    Document   : UR-home
    Created on : 06 27, 18, 1:25:59 PM
    Author     : Karl Madrid
--%>

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
            var option1 = document.createElement("option");
            option1.text = "Community that is attuned to a sustainable Earth and socially engaged";
            selectkra.add(option1, selectkra.options[null]);
            } else if (classification.value == "Interdisciplinary Fora") {
            var option1 = document.createElement("option");
            option1.text = "Formation for all sectors that is truly Lasallian";
            selectkra.add(option1, selectkra.options[null]);
            } else if (classification.value == "Direct Service to the Poor and Marginalized") {
            var option1 = document.createElement("option");
            option1.text = "Community that is attuned to a sustainable Earth and socially engaged";
            selectkra.add(option1, selectkra.options[null]);
            } else if (classification.value == "Issue Awareness and Advocacy") {
            var option1 = document.createElement("option");
            option1.text = "Formation for all sectors that is truly Lasallian";
            selectkra.add(option1, selectkra.options[null]);
            } else if (classification.value == "Public Engagement") {
            var option1 = document.createElement("option");
            option1.text = "Community that is attuned to a sustainable Earth and socially engaged";
            selectkra.add(option1, selectkra.options[null]);
            } else if (classification.value == "Others") {
            var option1 = document.createElement("option");
            option1.text = "Formation for all sectors that is truly Lasallian";
            selectkra.add(option1, selectkra.options[null]);
            var option2 = document.createElement("option");
            option2.text = "Community that is attuned to a sustainable Earth and socially engaged";
            selectkra.add(option2, selectkra.options[null]);
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

                <!---KRAs-->
                <div class="container panels">
                    <h2><%
                        if (request.getAttribute("first") != null || request.getAttribute("second") != null || request.getAttribute("third") != null || request.getAttribute("fourth") != null || request.getAttribute("fifth") != null || request.getAttribute("sixth") != null || request.getAttribute("seventh") != null) {
                        %>
                        KRA 3. Formation for all sectors that is truly Lasallian 
                        <%
                            }

                            if (request.getAttribute("ninth") != null || request.getAttribute("tenth") != null || request.getAttribute("eleventh") != null || request.getAttribute("twelfth") != null || request.getAttribute("thirteenth") != null || request.getAttribute("sixteenth") != null) {
                        %>
                        KRA 5. Community that is attuned to a sustainable Earth and socially engaged
                        <%
                            }
                        %>

                    </h2>
                    <table class="table table-bordered">
                        <thead class="thead-light">
                            <tr>
                                <th scope="col">Goal</th>
                                <th scope="col">Measure</th>
                                <th scope="col">Target</th>
                                <th scope="col">Accomplishment</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                DecimalFormat percentage = new DecimalFormat("0.00");

                            %>
                            <!--- Goal 1 Measure 1-->
                            <tr>
                                <td>
                                    <%                                        if (request.getAttribute("first") != null || request.getAttribute("second") != null || request.getAttribute("third") != null || request.getAttribute("fourth") != null || request.getAttribute("fifth") != null) {
                                    %>
                                    <b>G1</b> Implement sustainable, holistic and developmental Lasallian formation across all sectors based on the Lasallian Guiding Principles
                                    <%
                                        }

                                        if (request.getAttribute("sixth") != null || request.getAttribute("seventh") != null) {
                                    %>

                                    <b>G2</b> Create a conducive environment that helps bridge faith and scholarship
                                    <%
                                        }

                                        if (request.getAttribute("ninth") != null || request.getAttribute("tenth") != null || request.getAttribute("eleventh") != null || request.getAttribute("twelfth") != null || request.getAttribute("thirteenth") != null) {
                                    %>

                                    <b>G1</b> Each unit of the University has at least one sustainable social engagement project
                                    <%
                                        }

                                        if (request.getAttribute("sixteenth") != null) {
                                    %>

                                    <b>G2</b>  Service Learning is institutionalized
                                    <%
                                        }
                                    %>
                                </td>
                                <td>
                                    <%
                                        if (request.getAttribute("first") != null) {
                                    %>
                                    <b>M1</b> Integration in curricular and co-curricular programs of formation based on Lasallian spirituality and mission
                                    <%
                                        }

                                        if (request.getAttribute("second") != null || request.getAttribute("third") != null || request.getAttribute("fourth") != null) {
                                    %>
                                    <b>M2</b> Participation of administrators, faculty and personnel in Lasallian formation activity

                                    <%
                                        }

                                        if (request.getAttribute("fifth") != null) {
                                    %>
                                    <b>M3</b> Number of Lasallian formation activities available for other sectors in the DLSU community
                                    <%
                                        }

                                        if (request.getAttribute("sixth") != null) {
                                    %>
                                    <b>M1</b> Number of fora and other interdisciplinary activities focused on bridging faith and scholarship (e.g. ethics, heritage, culture, science, theology, philosophy)
                                    <%
                                        }

                                        if (request.getAttribute("seventh") != null) {
                                    %>
                                    <b>M2</b> Participation of international students in co-curricular activities promoting interfaith and multicultural diversity
                                    <%
                                        }

                                        if (request.getAttribute("ninth") != null) {
                                    %>
                                    <b>M1</b> Number of sustainable social engagement project of units
                                    <%
                                        }

                                        if (request.getAttribute("tenth") != null) {
                                    %>
                                    <b>M2</b> Involvement of faculty, student, and personnel in DLSU community engagement programs and activities <b>A.</b> Percentage of student organizations involved in community engagement programs and activities
                                    <%
                                        }

                                        if (request.getAttribute("eleventh") != null) {
                                    %>
                                    <b>M2</b> Involvement of faculty, student, and personnel in DLSU community engagement programs and activities <b>B.</b> Percentage of staff engaged in community engagement programs and activities
                                    <%
                                        }

                                        if (request.getAttribute("twelfth") != null) {
                                    %>
                                    <b>M2</b> Involvement of faculty, student, and personnel in DLSU community engagement programs and activities <b>C.</b> Percentage of departments with community engagement project
                                    <%
                                        }

                                        if (request.getAttribute("thirteenth") != null) {
                                    %>
                                    <b>M3</b> Number of social engagement choices under the four components of the Sustainable Development Goals Localization Project  L-ARAL, (Education)  L-SEED (Social Enterprise)  L-Envisage (Environment / DRR)  L-HEARTS (Health and Wellness)
                                    <%
                                        }

                                        if (request.getAttribute("sixteenth") != null) {
                                    %>
                                    <b>M2</b> Number of international SL activities
                                    <%
                                        }
                                    %>
                                </td>
                                <td>
                                    <%
                                        if (request.getAttribute("first") != null) {
                                    %>
                                    50% of student organizations have implemented a Lasallian formation activity
                                    <%
                                        }

                                        if (request.getAttribute("second") != null) {
                                    %>
                                    50% of faculty departments have undergone Lasallian formation program
                                    <%
                                        }

                                        if (request.getAttribute("third") != null) {
                                    %>
                                    75% of staff have undergone Lasallian formation programs 
                                    <%
                                        }

                                        if (request.getAttribute("fourth") != null) {
                                    %>
                                    All administrators have undergone the Lasallian formation activity
                                    <%
                                        }

                                        if (request.getAttribute("fifth") != null) {
                                    %>
                                    At Least one formation activity engaging alumni, parents, and community partners. 
                                    <%
                                        }

                                        if (request.getAttribute("sixth") != null) {
                                    %>
                                    At least one interdisciplinary activity conducted each term
                                    <%
                                        }

                                        if (request.getAttribute("seventh") != null) {
                                    %>
                                    50% of international students participate in co-curricular activities promoting interfaith and multicultural diversity

                                    <%
                                        }

                                        if (request.getAttribute("ninth") != null) {
                                    %>
                                    20%

                                    <%
                                        }

                                        if (request.getAttribute("tenth") != null) {
                                    %>
                                    50%

                                    <%
                                        }

                                        if (request.getAttribute("eleventh") != null) {
                                    %>
                                    50%

                                    <%
                                        }

                                        if (request.getAttribute("twelfth") != null) {
                                    %>
                                    20%

                                    <%
                                        }

                                        if (request.getAttribute("thirteenth") != null) {
                                    %>
                                    16

                                    <%
                                        }

                                        if (request.getAttribute("sixteenth") != null) {
                                    %>
                                    1

                                    <%
                                        }
                                    %>

                                </td>
                                <%
                                    if (request.getAttribute("first") != null) {
                                %>
                                <%                                    double percent1 = UserDAO.firstTarget();

                                    if (percent1 < 17) {
                                %>
                                <td class="accomplishmentRed"><%=percentage.format(percent1)%>%</td>
                                <%
                                    }

                                    if (percent1 >= 17 && percent1 <= 35) {
                                %>
                                <td class="accomplishmentYellow"><%=percentage.format(percent1)%>%</td>

                                <%
                                    }

                                    if (percent1 > 35) {

                                %>

                                <td class="accomplishmentGreen"><%=percentage.format(percent1)%>%</td>

                                <%
                                    }
                                %>
                                <%
                                    }

                                    if (request.getAttribute("second") != null) {
                                %>
                                <%                                    double percent2 = UserDAO.secondTarget();

                                    if (percent2 < 17) {
                                %>
                                <td class="accomplishmentRed"><%=percentage.format(percent2)%>%</td>
                                <%
                                    }

                                    if (percent2 >= 17 && percent2 <= 35) {
                                %>
                                <td class="accomplishmentYellow"><%=percentage.format(percent2)%>%</td>

                                <%
                                    }

                                    if (percent2 > 35) {

                                %>

                                <td class="accomplishmentGreen"><%=percentage.format(percent2)%>%</td>

                                <%
                                        }
                                    }

                                    if (request.getAttribute("third") != null) {
                                %>
                                <%                                    double percent3 = UserDAO.thirdTarget();

                                    if (percent3 < 25) {
                                %>
                                <td class="accomplishmentRed"><%=percentage.format(percent3)%>%</td>
                                <%
                                    }

                                    if (percent3 >= 25 && percent3 <= 50) {
                                %>
                                <td class="accomplishmentYellow"><%=percentage.format(percent3)%>%</td>

                                <%
                                    }

                                    if (percent3 > 50) {

                                %>

                                <td class="accomplishmentGreen"><%=percentage.format(percent3)%>%</td>

                                <%
                                        }
                                    }

                                    if (request.getAttribute("fourth") != null) {
                                %>
                                <%                                    double percent4 = UserDAO.fourthTarget();

                                    if (percent4 < 33) {
                                %>
                                <td class="accomplishmentRed"><%=percentage.format(percent4)%>%</td>
                                <%
                                    }

                                    if (percent4 >= 33 && percent4 <= 66) {
                                %>
                                <td class="accomplishmentYellow"><%=percentage.format(percent4)%>%</td>

                                <%
                                    }

                                    if (percent4 > 66) {

                                %>

                                <td class="accomplishmentGreen"><%=percentage.format(percent4)%>%</td>

                                <%
                                        }
                                    }

                                    if (request.getAttribute("fifth") != null) {
                                %>
                                <%                                    if (!UserDAO.fifthTarget()) {
                                %>
                                <td class="accomplishmentRed"><%=0%>%</td>

                                <%
                                    }

                                    if (UserDAO.fifthTarget()) {

                                %>

                                <td class="accomplishmentGreen"><%=100%>%</td>

                                <%
                                        }
                                    }

                                    if (request.getAttribute("sixth") != null) {
                                %>
                                <%                                    double percent6 = UserDAO.sixthTarget();

                                    if (percent6 < 1) {
                                %>
                                <td class="accomplishmentRed"><%=0%>%</td>

                                <%
                                    }

                                    if (percent6 >= 1) {

                                %>

                                <td class="accomplishmentGreen"><%=100%>%</td>

                                <%
                                        }
                                    }

                                    if (request.getAttribute("seventh") != null) {
                                %>
                                <%                                    double percent7 = UserDAO.seventhTarget();

                                    if (percent7 < 17) {
                                %>
                                <td class="accomplishmentRed"><%=percentage.format(percent7)%>%</td>
                                <%
                                    }

                                    if (percent7 >= 17 && percent7 <= 35) {
                                %>
                                <td class="accomplishmentYellow"><%=percentage.format(percent7)%>%</td>

                                <%
                                    }

                                    if (percent7 > 35) {

                                %>

                                <td class="accomplishmentGreen"><%=percentage.format(percent7)%>%</td>

                                <%
                                        }
                                    }

                                    if (request.getAttribute("ninth") != null) {
                                %>
                                <%                                    double percent9 = UserDAO.NinthTarget();

                                    if (percent9 < 7) {
                                %>
                                <td class="accomplishmentRed"><%=percentage.format(percent9)%>%</td>
                                <%
                                    }

                                    if (percent9 >= 7 && percent9 <= 15) {
                                %>
                                <td class="accomplishmentYellow"><%=percentage.format(percent9)%>%</td>

                                <%
                                    }

                                    if (percent9 > 15) {

                                %>

                                <td class="accomplishmentGreen"><%=percentage.format(percent9)%>%</td>

                                <%
                                        }
                                    }

                                    if (request.getAttribute("tenth") != null) {
                                %>
                                <%                                    double percent10 = UserDAO.tenthTarget();

                                    if (percent10 < 17) {
                                %>
                                <td class="accomplishmentRed"><%=percentage.format(percent10)%>%</td>
                                <%
                                    }

                                    if (percent10 >= 17 && percent10 <= 35) {
                                %>
                                <td class="accomplishmentYellow"><%=percentage.format(percent10)%>%</td>

                                <%
                                    }

                                    if (percent10 > 35) {

                                %>

                                <td class="accomplishmentGreen"><%=percentage.format(percent10)%>%</td>

                                <%
                                        }
                                    }

                                    if (request.getAttribute("eleventh") != null) {
                                %>
                                <%                                    double percent11 = UserDAO.eleventhTarget();

                                    if (percent11 < 17) {
                                %>
                                <td class="accomplishmentRed"><%=percentage.format(percent11)%>%</td>
                                <%
                                    }

                                    if (percent11 >= 17 && percent11 <= 35) {
                                %>
                                <td class="accomplishmentYellow"><%=percentage.format(percent11)%>%</td>

                                <%
                                    }

                                    if (percent11 > 35) {

                                %>

                                <td class="accomplishmentGreen"><%=percentage.format(percent11)%>%</td>

                                <%
                                        }
                                    }

                                    if (request.getAttribute("twelfth") != null) {
                                %>
                                <%                                    double percent12 = UserDAO.twelfthTarget();

                                    if (percent12 < 7) {
                                %>
                                <td class="accomplishmentRed"><%=percentage.format(percent12)%>%</td>
                                <%
                                    }

                                    if (percent12 >= 7 && percent12 <= 15) {
                                %>
                                <td class="accomplishmentYellow"><%=percentage.format(percent12)%>%</td>

                                <%
                                    }

                                    if (percent12 > 15) {

                                %>

                                <td class="accomplishmentGreen"><%=percentage.format(percent12)%>%</td>

                                <%
                                        }
                                    }

                                    if (request.getAttribute("thirteenth") != null) {
                                %>
                                <%                                    double percent13 = UserDAO.thirteenthTarget();

                                    if (percent13 < 33) {
                                %>
                                <td class="accomplishmentRed"><%=percentage.format(percent13)%>%</td>
                                <%
                                    }

                                    if (percent13 >= 33 && percent13 <= 66) {
                                %>
                                <td class="accomplishmentYellow"><%=percentage.format(percent13)%>%</td>

                                <%
                                    }

                                    if (percent13 > 66) {

                                %>

                                <td class="accomplishmentGreen"><%=percentage.format(percent13)%>%</td>

                                <%
                                        }
                                    }

                                    if (request.getAttribute("sixteenth") != null) {
                                %>
                                <%                                    double percent16 = UserDAO.sixteenthTarget();

                                    if (percent16 < 1) {
                                %>
                                <td class="accomplishmentRed"><%=0%>%</td>

                                <%
                                    }

                                    if (percent16 >= 1) {

                                %>

                                <td class="accomplishmentGreen"><%=100%>%</td>

                                <%
                                        }
                                    }
                                %>
                            </tr>
                            <!--- end of Goal 1 Measure 1-->
                        </tbody>
                    </table>

                </div>


                <!--- table -->
                <div class="container panels">

                    <%
                        ArrayList<FF> FF = new ArrayList();
                        ArrayList<SE> SE = new ArrayList();

                        if (request.getAttribute("first") != null) {
                            FF = UserDAO.programsfirstTarget();
                        }

                        if (request.getAttribute("second") != null) {
                            FF = UserDAO.programssecondTarget();
                        }

                        if (request.getAttribute("third") != null) {
                            FF = UserDAO.programsthirdTarget();
                        }

                        if (request.getAttribute("fourth") != null) {
                            FF = UserDAO.programsfourthTarget();
                        }

                        if (request.getAttribute("fifth") != null) {
                            FF = UserDAO.programsfifthTarget();
                        }

                        if (request.getAttribute("first") != null || request.getAttribute("second") != null || request.getAttribute("third") != null
                                || request.getAttribute("fourth") != null || request.getAttribute("fifth") != null) {


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
                        if (request.getAttribute("sixth") != null) {
                            SE = UserDAO.programssixthTarget();
                        }

                        if (request.getAttribute("seventh") != null) {
                            SE = UserDAO.programsseventhTarget();
                        }

                        if (request.getAttribute("ninth") != null) {
                            SE = UserDAO.programsNinthTarget();
                        }

                        if (request.getAttribute("tenth") != null) {
                            SE = UserDAO.programstenthTarget();
                        }

                        if (request.getAttribute("eleventh") != null) {
                            SE = UserDAO.programseleventhTarget();
                        }

                        if (request.getAttribute("twelfth") != null) {
                            SE = UserDAO.programstwelfthTarget();
                        }

                        if (request.getAttribute("thirteenth") != null) {
                            SE = UserDAO.programsthirteenthTarget();
                        }

                        if (request.getAttribute("sixteenth") != null) {
                            SE = UserDAO.programssixteenthTarget();
                        }

                        if (request.getAttribute("sixth") != null || request.getAttribute("seventh") != null || request.getAttribute("eighth") != null
                                || request.getAttribute("ninth") != null || request.getAttribute("tenth") != null || request.getAttribute("eleventh") != null
                                || request.getAttribute("twelfth") != null || request.getAttribute("thirteenth") != null || request.getAttribute("fourteenth") != null
                                || request.getAttribute("fifteenth") != null || request.getAttribute("sixteenth") != null) {
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