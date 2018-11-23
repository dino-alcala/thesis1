<%-- 
    Document   : UR-home
    Created on : 06 27, 18, 1:25:59 PM
    Author     : Karl Madrid
--%>

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

        <title>UR Home</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/sidebar.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

        <style>
            tr:hover {
                background-color: lightgreen;
            }


            h4{
                font-size: 22px;
                text-align: left;
                margin-top: 10px;
                border-bottom: 2px solid green;
                padding-bottom: 7px;
                margin-bottom: 25px;
            }

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

            .accomplishmentGreen{
                text-align: center;
                font-size: 17px;
                color: white;
                background-color: green;
            }
            
            .accomplishmentYellow{
                text-align: center;
                font-size: 17px;
                color: white;
                background-color: #FFBF00;
            }
            
            .accomplishmentRed{
                text-align: center;
                font-size: 17px;
                color: white;
                background-color: #cc0000;
            }

            .button{
                background-color: #333333;
                border: 5px;
                color: white;
                font-size:17px;
                text-align: center;
                font-family: "Times New Roman", Times, serif;
                width:100%;
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
                                <%
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
                <form action="viewKRATracing">
                    <!---KRAs-->
                    <div class="container-fluid panels">
                        <h4>Key Result Areas</h4>

                        <h5>KRA 3. Formation for all sectors that is truly Lasallian </h5>
                        <table class="table table-bordered">
                            <thead class="thead-light">
                                <tr>
                                    <th style='width:30%' scope="col">Goals</th>
                                    <th style='width:30%' scope="col">Measures</th>
                                    <th style='width:30%' scope="col">Targets</th>
                                    <th style='width:5%' scope="col">Accomplishment</th>
                                    <th style="width:5%"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    DecimalFormat percentage = new DecimalFormat("0.00");

                                %>
                                <!--- Goal 1 Measure 1-->
                                <tr>
                                    <td><b>G1 </b> Implement sustainable, holistic and developmental Lasallian formation  across all sectors based on the Lasallian Guiding Principles </td>
                                    <td><b>M1</b> Integration in curricular and co-curricular programs of formation based on Lasallian spirituality and mission </td>
                                    <td>50% of student organizations have implemented a Lasallian formation activity</td>
                                    <%                                        double percent1 = UserDAO.firstTarget();
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
                                    <td><button class="btn btn-primary" type="submit" name="first" value="1">View</button></td>
                                </tr>

                                <!--- Goal 1 Measure 2-->
                                <tr>
                                    <td></td>
                                    <td><b>M2</b> Participation of administrators, faculty and personnel in Lasallian formation activity </td>
                                    <td>50% of faculty departments have undergone Lasallian formation program</td>
                                    <%
                                        double percent2 = UserDAO.secondTarget();

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
                                    %>
                                    <td><button class="btn btn-primary" type="submit" name="second" value="2">View</button></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td>75% of staff have undergone Lasallian formation programs</td>
                                    <%
                                        double percent3 = UserDAO.thirdTarget();

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
                                    %>
                                    <td><button class="btn btn-primary" type="submit" name="third" value="3">View</button></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td>All administrators have undergone the Lasallian formation activity</td>
                                    <%
                                        double percent4 = UserDAO.fourthTarget();

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
                                    %>
                                    <td><button class="btn btn-primary" type="submit" name="fourth" value="4">View</button></td>
                                </tr>

                                <!--- Goal 1 Measure 3-->
                                <tr>
                                    <td></td>
                                    <td><b>M3</b> Number of Lasallian formation activities available for other sectors in the DLSU community  </td>
                                    <td>At Least one formation activity engaging alumni, parents, and community partners.</td>
                                    <%
                                        if (!UserDAO.fifthTarget()) {
                                    %>
                                    <td class="accomplishmentRed"><%=0%>%</td>

                                    <%
                                        }

                                        if (UserDAO.fifthTarget()) {

                                    %>

                                    <td class="accomplishmentGreen"><%=100%>%</td>

                                    <%
                                        }
                                    %>
                                    <td><button class="btn btn-primary" type="submit" name="fifth" value="5">View</button></td>
                                </tr>

                                <!--- Goal 2 Measure 1-->
                                <tr>
                                    <td><b>G2 </b> Create a conducive environment that helps bridge faith and scholarship </td>
                                    <td><b>M1</b> Number of fora and other interdisciplinary activities focused on bridging faith and scholarship (e.g. ethics, heritage, culture, science, theology, philosophy) </td>
                                    <td>At least one interdisciplinary activity conducted each term</td>
                                    <%
                                        double percent6 = UserDAO.sixthTarget();

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
                                    %>
                                    <td><button class="btn btn-primary" type="submit" name="sixth" value="6">View</button></td>
                                </tr>


                                <!--- Goal 2 Measure 2-->
                                <tr>
                                    <td> </td>
                                    <td><b>M2</b> Participation of international students in co-curricular activities promoting interfaith and multicultural diversity </td>
                                    <td>50% of international students participate in co-curricular activities promoting interfaith and multicultural diversity</td>
                                    <%
                                        double percent7 = UserDAO.seventhTarget();

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
                                    %>
                                    <td><button class="btn btn-primary" type="submit" name="seventh" value="7">View</button></td>
                                </tr>

                            </tbody>
                        </table>

                        <h5>KRA 5.  Community that is attuned to a sustainable Earth and socially engaged </h5>
                        <table class="table table-bordered">
                            <thead class="thead-light">
                                <tr>
                                    <th style='width:30%' scope="col">Goals</th>
                                    <th style='width:50%' scope="col">Measures</th>
                                    <th style='width:10%' scope="col">Targets</th>
                                    <th style='width:5%' scope="col">Accomplishment</th>
                                    <th style="width:5%;"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <!--- Goal 1 Measure 1-->
                                <tr>
                                    <td><b>G1 </b> Each unit of the University has at least one sustainable social engagement project </td>
                                    <td><b>M1</b> Number of sustainable social engagement project of units </td>
                                    <td>20%</td>
                                    <%
                                        double percent9 = UserDAO.NinthTarget();

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
                                    %>
                                    <td><button class="btn btn-primary" type="submit" name="ninth" value="9">View</button></td>
                                </tr>


                                <!--- Goal 1 Measure 2A-->
                                <tr>
                                    <td></td>
                                    <td><b>M2</b> Involvement of faculty, student, and personnel in DLSU community engagement programs and activities<br><br>
                                        A. Percentage of student organizations involved in community engagement programs and activities</td>
                                    <td>50%</td>
                                    <%
                                        double percent10 = UserDAO.tenthTarget();

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
                                    %>
                                    <td><button class="btn btn-primary" type="submit" name="tenth" value="10">View</button></td>
                                </tr>

                                <!--- Goal 1 Measure 2B-->
                                <tr>
                                    <td></td>
                                    <td><b>M2</b> Involvement of faculty, student, and personnel in DLSU community engagement programs and activities<br><br>
                                        B. Percentage of staff engaged in community engagement programs and activities</td>
                                    <td>50%</td>
                                    <%
                                        double percent11 = UserDAO.eleventhTarget();

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
                                    %>
                                    <td><button class="btn btn-primary" type="submit" name="eleventh" value="11">View</button></td>
                                </tr>

                                <!--- Goal 1 Measure 2C-->
                                <tr>
                                    <td></td>
                                    <td><b>M2</b> Involvement of faculty, student, and personnel in DLSU community engagement programs and activities<br><br>
                                        C. Percentage of departments with community engagement project  </td>
                                    <td>20%</td>
                                    <%
                                        double percent12 = UserDAO.twelfthTarget();

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
                                    %>
                                    <td><button class="btn btn-primary" type="submit" name="twelfth" value="12">View</button></td>
                                </tr>

                                <!--- Goal 1 Measure 3-->
                                <tr>
                                    <td></td>
                                    <td><b>M3</b> Number of social engagement choices under the four components of the Sustainable Development Goals Localization Project<br><br>
                                        - L-ARAL, (Education) - L-SEED (Social Enterprise) <br>
                                        - L-Envisage (Environment / DRR) - L-HEARTS (Health and Wellness) <br>
                                    </td>
                                    <td>16</td>
                                    <%
                                        double percent13 = UserDAO.thirteenthTarget();

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
                                    %>
                                    <td><button class="btn btn-primary" type="submit" name="thirteenth" value="13">View</button></td>
                                </tr>

                                <!--- Goal 2 Measure 2-->
                                <tr>
                                    <td><b>G2</b> Service Learning is institutionalized</td>
                                    <td><b>M1</b> Number of international SL activities </td>
                                    <td>1</td>
                                    <%
                                        double percent16 = UserDAO.sixteenthTarget();

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
                                    %>
                                    <td><button class="btn btn-primary" type="submit" name="sixteenth" value="16">View</button></td>
                                </tr>

                            </tbody>
                        </table>

                    </div>
                </form>


                <!--- table -->
                <form action="viewProposalsProgress" method="post">
                    <div class="container-fluid panels">
                        <%
                            ArrayList<SE> s = new ArrayList();
                            s = UserDAO.retrieveSEbyDepartment(UserDAO.getDepartmentByUserID(Integer.parseInt(session.getAttribute("userID").toString())));
                        %>

                        <h4>SE Proposals Progress (<%=s.size()%>)</h4>

                        <input class="form-control" id="myInput" type="text" placeholder="Search table..">

                        <table class="table ">
                            <thead class="thead-dark">
                                <tr>
                                    <th onclick="sortTable(0)">Date</th>
                                    <th onclick="sortTable(1)">Program Name</th>
                                    <th onclick="sortTable(2)">Program Head</th>
                                    <th onclick="sortTable(3)">Funded by</th>
                                    <th onclick="sortTable(4)">Status</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="myTable">
                                <%
                                    for (int i = 0; i < s.size(); i++) {
                                %>
                                <tr>
                                    <td><%=s.get(i).getDate()%></td>
                                    <td><%=s.get(i).getName()%></td>
                                    <td><%=s.get(i).getProgramHead()%></td>
                                    <td><%=UserDAO.getSourceOfFunds(s.get(i).getId())%></td>
                                    <td>Step <%=UserDAO.getStep(s.get(i).getId())%></td>
                                    <td><button type="submit" name="viewSE<%=i%>" value="<%=s.get(i).getId()%>" class="btn btn-primary btn-sm">View</button></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>

                    <div class="container-fluid panels">

                        <%
                            ArrayList<FF> f = new ArrayList();
                            f = UserDAO.retrieveFFbyDepartment(UserDAO.getDepartmentByUserID(Integer.parseInt(session.getAttribute("userID").toString())));
                        %>
                        <h4>FF Proposals Progress (<%=f.size()%>)</h4>

                        <input class="form-control" id="myInput" type="text" placeholder="Search table..">

                        <table class="table ">
                            <thead class="thead-dark">
                                <tr>
                                    <th onclick="sortTable(0)">Date</th>
                                    <th onclick="sortTable(1)">Program Name</th>
                                    <th onclick="sortTable(2)">Program Head</th>
                                    <th onclick="sortTable(3)">Funded by</th>
                                    <th onclick="sortTable(4)">Status</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="myTable">
                                <%
                                    for (int i = 0; i < f.size(); i++) {
                                %>
                                <tr>
                                    <td><%=f.get(i).getDatecreated()%></td>
                                    <td><%=f.get(i).getProjectName()%></td>
                                    <td><%=f.get(i).getProgramHead()%></td>
                                    <td><%=UserDAO.getSourceOfFunds(f.get(i).getId())%></td>
                                    <td>Step <%=UserDAO.getStep(f.get(i).getId())%></td>
                                    <td><button type="submit" name="viewFF<%=i%>" value="<%=f.get(i).getId()%>" class="btn btn-primary btn-sm">View</button></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </form>
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

