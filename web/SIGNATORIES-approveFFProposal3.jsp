<%-- 
    Document   : MULTIPLE-approveCoscaSE
    Created on : 06 18, 18, 7:21:12 PM
    Author     : Karl Madrid
--%>

<%@page import="entity.FF"%>
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

        <title>Approve FF Proposal</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/sidebar2.css">
        <link rel="stylesheet" href="css/styles.css">
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

            #myInput {
                background-image: url('/css/searchicon.png'); /* Add a search icon to input */
                background-position: 10px 12px; /* Position the search icon */
                background-repeat: no-repeat; /* Do not repeat the icon image */
                width: 100%; /* Full-width */
                padding: 12px 20px 12px 40px; /* Add some padding */
                border: 1px solid #ddd; /* Add a grey border */
                margin-bottom: 12px; /* Add some space below the input */
                margin-top: 20px; 
            }

            #myTable {
                border-collapse: collapse; /* Collapse borders */
                width: 100%; /* Full-width */
                border: 1px solid #ddd; /* Add a grey border */

            }

            #myTable th, #myTable td {
                text-align: left; /* Left-align text */
                padding: 12px; /* Add padding */
            }

            #myTable tr {
                border-bottom: 1px solid #ddd; 
            }

            #myTable tr.header, #myTable tr:hover {
                background-color: #4CAF50;
            }

            .panel-title{
                font-size: 40px;
                text-align: left;
                margin-top: 20px;
                padding-bottom: 10px;
            }

            p{
                margin-bottom: 0;
                font-size: 15px;
            }

            a:link {
                color: black; 
                background-color: transparent; 
                text-decoration: none;
            }

            table, td, th {
                border: 1px solid black;
                border-collapse: collapse;
                text-align: center;
            }

            h4{
                color: white;
            }

            .panel-success > .panel-heading {
                background-color: #4CAF50;
                border-color: #ddd;
                border: 1px solid;
            }

            .panel-body{
                border: 1px solid;
            }

            .panel-upper{
                border: 3px solid #4CAF50;
            }

            .progress-tracker {
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                margin: 40px auto;
                padding: 0;
                list-style: none;
            }

            .progress-step {
                display: block;
                position: relative;
                -webkit-box-flex: 1;
                -ms-flex: 1 1 0%;
                flex: 1 1 0%;
                margin: 0;
                padding: 0;
                min-width: 28px;
            }

            .progress-step:last-child {
                -webkit-box-flex: 0;
                -ms-flex-positive: 0;
                flex-grow: 0;
            }

            .progress-step:not(:last-child)::after {
                content: '';
                display: block;
                position: absolute;
                z-index: -10;
                top: 12px;
                bottom: 12px;
                right: -14px;
                width: 100%;
                height: 4px;
                -webkit-transition: background-color 0.3s;
                transition: background-color 0.3s;
            }

            .progress-step.is-active .progress-title {
                font-weight: 400;
            }

            .progress-step > a {
                display: block;
            }

            .progress-marker {
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-pack: center;
                -ms-flex-pack: center;
                justify-content: center;
                -webkit-box-align: center;
                -ms-flex-align: center;
                align-items: center;
                position: relative;
                z-index: 20;
                width: 28px;
                height: 28px;
                padding-bottom: 2px;
                color: #fff;
                font-weight: 400;
                border: 2px solid transparent;
                border-radius: 50%;
                -webkit-transition: background-color, border-color;
                transition: background-color, border-color;
                -webkit-transition-duration: 0.3s;
                transition-duration: 0.3s;
            }

            .progress-text {
                display: block;
                padding: 14px 9.3333333333px;
                overflow: hidden;
                text-overflow: ellipsis;
            }

            .progress-title {
                margin-top: 0;
            }

            .progress-step .progress-marker {
                color: #fff;
                background-color: #b6b6b6;
            }

            .progress-step::after {
                background-color: #b6b6b6;
            }

            .progress-step .progress-text, .progress-step .progress-step > a .progress-text {
                color: #333333;
            }

            .progress-step.is-active .progress-marker {
                background-color: yellow;
            }

            .progress-step.is-complete .progress-marker {
                background-color: green;
            }

            .progress-step.is-complete::after {
                background-color: #868686;
            }

            .progress-step:hover .progress-marker {
                background-color: #56ADF5;
            }

            .progress-tracker--center .progress-step {
                text-align: center;
            }

            .progress-tracker--center .progress-step:last-child {
                -webkit-box-flex: 1;
                -ms-flex-positive: 1;
                flex-grow: 1;
            }

            .progress-tracker--center .progress-step::after {
                right: -50%;
            }

            .progress-tracker--center .progress-marker {
                margin-left: auto;
                margin-right: auto;
            }

            .progress-tracker--right .progress-step {
                text-align: right;
            }

            .progress-tracker--right .progress-step:last-child {
                -webkit-box-flex: 1;
                -ms-flex-positive: 1;
                flex-grow: 1;
            }

            .progress-tracker--right .progress-step::after {
                right: calc(-100% + 14px);
            }

            .progress-tracker--right .progress-marker {
                margin-left: auto;
            }

            .progress-tracker--border {
                padding: 5px;
                border: 2px solid #868686;
                border-radius: 38px;
            }

            .progress-tracker--spaced .progress-step::after {
                width: calc(100% - 48px);
                margin-right: 24px;
            }

            .progress-tracker--word {
                padding-right: 38.6666666667px;
                overflow: hidden;
            }

            .progress-tracker--word .progress-text {
                display: inline-block;
                white-space: nowrap;
            }

            .progress-tracker--word .progress-title {
                margin: 0;
            }

            .progress-tracker--word-center {
                padding-right: 38.6666666667px;
                padding-left: 38.6666666667px;
            }

            .progress-tracker--word-center .progress-text {
                padding-right: 0;
                padding-left: 0;
                -webkit-transform: translateX(calc(-50% + 14px));
                transform: translateX(calc(-50% + 14px));
            }

            .progress-tracker--word-right {
                padding-right: 0;
                padding-left: 38.6666666667px;
            }

            .progress-tracker--word-right .progress-text {
                padding-left: 0;
                -webkit-transform: translateX(calc(-100% + 28px));
                transform: translateX(calc(-100% + 28px));
            }

            .progress-tracker--text .progress-step:last-child {
                -webkit-box-flex: 1;
                -ms-flex-positive: 1;
                flex-grow: 1;
            }

            .progress-tracker--text-top .progress-step::after {
                top: auto;
            }

            .progress-tracker--text-top .progress-text {
                height: 100%;
            }

            .progress-tracker--text-top .progress-marker {
                bottom: 28px;
            }

            .progress-tracker--text-inline .progress-step {
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
            }

            .progress-tracker--text-inline .progress-text {
                position: relative;
                z-index: 30;
                max-width: 70%;
                white-space: nowrap;
                padding-top: 0;
                padding-bottom: 0;
                background-color: #fff;
            }

            .progress-tracker--text-inline .progress-title {
                margin: 0;
            }

            .progress-tracker--square .progress-step {
                padding-top: 0;
            }

            .progress-tracker--square .progress-marker {
                -webkit-transform: scaleX(0.33) translateY(-12px);
                transform: scaleX(0.33) translateY(-12px);
                border-radius: 0;
            }

            @media (max-width: 399px) {
                .progress-tracker-mobile {
                    overflow-x: auto;
                }
                .progress-tracker-mobile .progress-tracker {
                    min-width: 200%;
                }
            }

            .progress-tracker--vertical {
                -webkit-box-orient: vertical;
                -webkit-box-direction: normal;
                -ms-flex-direction: column;
                flex-direction: column;
            }

            .progress-tracker--vertical .progress-step {
                -webkit-box-flex: 1;
                -ms-flex: 1 1 auto;
                flex: 1 1 auto;
            }

            .progress-tracker--vertical .progress-step::after {
                right: auto;
                top: 14px;
                left: 12px;
                width: 4px;
                height: 100%;
            }

            .progress-tracker--vertical .progress-marker {
                position: absolute;
                left: 0;
            }

            .progress-tracker--vertical .progress-text {
                padding-top: 7px;
                padding-left: 42px;
            }

            .progress-tracker--vertical .progress-step:not(:last-child) .progress-text {
                padding-bottom: 42px;
            }

            @-webkit-keyframes scale-up {
                from {
                    opacity: 1;
                    -webkit-transform: translate(-50%, -50%) scale(0);
                    transform: translate(-50%, -50%) scale(0);
                }
                to {
                    opacity: 0;
                    -webkit-transform: translate(-50%, -50%) scale(1);
                    transform: translate(-50%, -50%) scale(1);
                }
            }

            @keyframes scale-up {
                from {
                    opacity: 1;
                    -webkit-transform: translate(-50%, -50%) scale(0);
                    transform: translate(-50%, -50%) scale(0);
                }
                to {
                    opacity: 0;
                    -webkit-transform: translate(-50%, -50%) scale(1);
                    transform: translate(-50%, -50%) scale(1);
                }
            }

            .anim-ripple .progress-marker::before, .anim-ripple-large .progress-marker::before, .anim-ripple-splash .progress-marker::before {
                content: "";
                display: block;
                width: 100%;
                height: 100%;
                position: absolute;
                top: 50%;
                left: 50%;
                z-index: 30;
                background: rgba(0, 0, 0, 0.3);
                border-radius: 50%;
                -webkit-transform: translate(-50%, -50%) scale(0);
                transform: translate(-50%, -50%) scale(0);
                visibility: hidden;
            }

            .anim-ripple :not(:active) .progress-marker::before, .anim-ripple-large :not(:active) .progress-marker::before, .anim-ripple-splash :not(:active) .progress-marker::before {
                -webkit-animation: scale-up 0.3s ease-out;
                animation: scale-up 0.3s ease-out;
            }

            .anim-ripple :focus .progress-marker::before, .anim-ripple-large :focus .progress-marker::before, .anim-ripple-splash :focus .progress-marker::before {
                visibility: visible;
            }

            .anim-ripple-large .progress-marker::before {
                width: 200%;
                height: 200%;
            }

            .anim-ripple-splash .progress-marker::before {
                width: 200%;
                height: 200%;
                box-shadow: 0 0 6px 6px rgba(0, 0, 0, 0.35);
            }

            .anim-ripple-double .progress-marker::before, .anim-ripple-double .progress-marker::after {
                content: "";
                display: block;
                width: 100%;
                height: 100%;
                position: absolute;
                top: 50%;
                left: 50%;
                z-index: 30;
                background: rgba(0, 0, 0, 0.3);
                border-radius: 50%;
                -webkit-transform: translate(-50%, -50%) scale(0);
                transform: translate(-50%, -50%) scale(0);
                visibility: hidden;
                background: none;
                border: 3px solid rgba(0, 0, 0, 0.3);
            }

            .anim-ripple-double :not(:active) .progress-marker::before, .anim-ripple-double :not(:active) .progress-marker::after {
                -webkit-animation: scale-up 0.3s ease-out 0s;
                animation: scale-up 0.3s ease-out 0s;
            }

            .anim-ripple-double :not(:active) .progress-marker::after {
                -webkit-animation-delay: 0.15s;
                animation-delay: 0.15s;
            }

            .anim-ripple-double :focus .progress-marker::before, .anim-ripple-double :focus .progress-marker::after {
                visibility: visible;
            }

            .anim-path .progress-step::after {
                background-image: -webkit-linear-gradient(left, #b6b6b6 50%, #868686 50%);
                background-image: linear-gradient(to right, #b6b6b6 50%, #868686 50%);
                background-size: 200% 100%;
                background-position: 0% 100%;
                -webkit-transition: background-position 0.3s ease-out;
                transition: background-position 0.3s ease-out;
            }

            .anim-path .progress-step.is-complete::after {
                background-position: -100% 100%;
            }

            <!--NavbarAndSidebar-->

            body {
                padding-top: 56px;
            }

            .sticky-offset {
                top: 56px;
            }

            #body-row {
                margin-left:0;
                margin-right:0;
            }

            #sidebar-container {
                min-height: 100vh;   
                background-color: #333333;
                padding: 0;
            }

            /* Sidebar sizes when expanded and expanded */
            .sidebar-expanded {
                width: 230px;
            }
            .sidebar-collapsed {
                width: 60px;
            }

            /* Menu item*/
            #sidebar-container .list-group a {
                height: 50px;
                color: white;
            }

            /* Submenu item*/
            #sidebar-container .list-group .sidebar-submenu a {
                height: 45px;
                padding-left: 30px;
            }
            .sidebar-submenu {
                font-size: 0.9rem;
            }

            .sidebar-separator {
                background-color: #333333;
                height: 25px;
            }
            .logo-separator {
                background-color: #333333;    
                height: 60px;
            }

            /* Closed submenu icon */
            #sidebar-container .list-group .list-group-item[aria-expanded="false"] .submenu-icon::after {
                content: " \f0d7";
                font-family: FontAwesome;
                display: inline;
                text-align: right;
                padding-left: 10px;
            }
            /* Opened submenu icon */
            #sidebar-container .list-group .list-group-item[aria-expanded="true"] .submenu-icon::after {
                content: " \f0da";
                font-family: FontAwesome;
                display: inline;
                text-align: right;
                padding-left: 10px;
            }

            .nav-link {
                border-bottom: 2px solid green;
            }

            #navbar {
                background-color: #009900;
            }

            #navbar-unit {
                color: white;
            }

            .navbar-toggler-icon {
                background-color: white;
            }

            #smallerscreenmenuButton {
                color: white;
            }

            #smallerscreenmenu {
                color: white;
            }

            #submenuCategoryBox {
                background-color: #d9d9d9;
            }

            #submenuCategoryBox:hover {
                background-color: lightgreen;
            }

            #submenuCategory{
                font-size: 13px;
                color: #4d4d4d;
            }

            #sidebarCategory {
                background-color: #4d4d4d;
            }

            #sidebarCategory:hover {
                background-color: lightgreen;
            }

            #sidebarCategory {
                background-color: lightgreen;
            }

            #sidebarCategory:hover {
                background-color: lightgreen;
            }

            h3{
                font-size: 40px;   
                border-bottom: 2px solid #4CAF50;
                padding-bottom: 5px;
            }

            .card-header{
                background-color: #4CAF50;
            }

            .card-body{
                background-color: whitesmoke;
            }

            .card{
                border: 1px solid black;
            }


            th,tr,td{
                padding:15px;
            }

            .progress-title{
                color: darkgreen;
            }

        </style>

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
                        <a class="nav-link" href="#" id="smallerscreenmenu">
                            Dashboard
                        </a>
                        <a class="nav-link" href="#" id="smallerscreenmenu">
                            Proposals
                        </a>
                        <a class="nav-link" href="#" id="smallerscreenmenu">
                            Units
                        </a>
                        <a class="nav-link" href="#" id="smallerscreenmenu">
                            Key Result Areas
                        </a>
                        <a class="nav-link" href="#" id="smallerscreenmenu">
                            Reports
                        </a>
                        <a class="nav-link" href="#" id="smallerscreenmenu">
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
                    <button type="button" class="btn btn-info navbar-btn-logout">
                        <i class="fa fa-sign-out"></i>
                    </button>
                </div>
            </ul>
        </nav>
        <!-- NavBar END -->

        <!-- Bootstrap row -->
        <div class="row" id="body-row">

            <!-- Sidebar -->
            <div id="sidebar-container" class="sidebar-expanded d-none d-md-block">
                <ul class="list-group sticky-top sticky-offset">
                    <!-- Menu with submenu -->
                    <a href="SIGNATORIES-home2.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span class="fa fa-home fa-fw mr-2"></span>
                            <span class="menu-collapsed">Home</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>

                    <a href="MULTIPLE-viewBudget.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span class="fa fa-money fa-fw mr-2"></span>
                            <span class="menu-collapsed">Budget</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>

                    <a href="MULTIPLE-faithFormationProgramsList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span class="fa fa-check fa-fw mr-2"></span>
                            <span class="menu-collapsed">FF Programs</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>

                </ul>
                <!-- List Group END-->
            </div>
            <!-- sidebar-container END -->

            <!-- MAIN -->

            <div class="col py-3">
                <form action="approveFF" method="post">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">


                                <div class="panel panel-success ">

                                    <%
                                        FF FF = new FF();
                                        FF = UserDAO.retrieveFFByFFID(Integer.parseInt(request.getAttribute("ffID").toString()));
                                    %>

                                    <div class="card">
                                        <div class="card-body">
                                            <h3><%=FF.getProjectName()%></h3>
                                            <p><b>Unit: </b> <%=FF.getUnit()%></p>
                                            <p><b>Department: </b> <%=FF.getDepartment()%></p>
                                            <p><b>Program Head: </b> <%=FF.getProgramHead()%></p>
                                            <p><b>Program Classification: </b> <%=FF.getActivityClassification()%></p>
                                            <p><b>Total Amount Requested:</b> ₱<%=FF.getTotalAmount()%></p>
                                            <p><b>Actual Date of Implementation: </b> <%=FF.getActualDate()%></p>
                                            <p><b>Venue: </b> <%=FF.getVenue()%></p>
                                            <p><b>Speaker: </b> <%=FF.getSpeaker()%></p>
                                        </div>
                                    </div><br>

                                </div>



                                <div class="card">
                                    <div class="card-header">
                                        <h4>Targets</h4>
                                    </div>
                                    <div class="card-body">   
                                        <p><b>KRA:</b> <%=UserDAO.getKRAnameByID(FF.getTargetKRA())%></p><br>
                                        <p><b>Goal:</b> <%=UserDAO.getGoalnameByID(FF.getTargetGoal())%></p><br>
                                        <p><b>Measure:</b> <%=UserDAO.getMeasurenameByID(FF.getTargetMeasure())%></p><br>
                                        <p><b>Community: </b><%=UserDAO.getCommunitynameByID(FF.getTargetCommunity())%></p>
                                    </div>  
                                </div>
                                <br/>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Objectives of the Project</h4>
                                    </div>
                                    <div class="card-body">   
                                        <p><%=FF.getObjectives()%></p>
                                    </div>
                                </div>
                                <br/>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Breakdown of Expenses</h4>
                                    </div>
                                </div>

                                <table style="width:100%">
                                    <tr>
                                        <th>Item</th>
                                        <th>Unit Cost</th> 
                                        <th>Quantity</th>
                                        <th>Subtotal</th>
                                    </tr>
                                    <%
                                        double count = 0;
                                        for (int i = 0; i < FF.getExpenses().size(); i++) {
                                    %>
                                    <tr>
                                        <td><%=FF.getExpenses().get(i).getItem()%></td>
                                        <td><%=FF.getExpenses().get(i).getUnitcost()%></td>
                                        <td><%=FF.getExpenses().get(i).getQuantity()%></td>
                                        <td><%=FF.getExpenses().get(i).getUnitcost() * FF.getExpenses().get(i).getQuantity()%></td>
                                    </tr>
                                    <%
                                            count += FF.getExpenses().get(i).getUnitcost() * FF.getExpenses().get(i).getQuantity();
                                        }
                                    %>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td>Grand Total: <%=count%></td>
                                    </tr>
                                </table>
                                <br/>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Remarks</h4>
                                    </div>
                                </div>
                                <table style="width:100%">
                                    <tr>
                                        <th style="width:35%">Step</th>
                                        <th style="width:65%">Remarks</th> 
                                    </tr>
                                    <tr>
                                        <td>Chairperson/Director</td>
                                        <td style="padding:0px"><%if (FF.getChairdirectorRemarks() != null) {%><%=FF.getChairdirectorRemarks()%><%}%></td>
                                    </tr>

                                    <tr>
                                        <td>Vice President for Lasallian Mission</td>
                                        <td style="padding:0px"><%if (FF.getVplmRemarks() != null) {%><%=FF.getVplmRemarks()%><%}%></td>
                                    </tr>
                                    <tr>
                                        <td>Dean/Unit Head</td>
                                        <td style="padding:0px"><textarea id="remarks1" rows="3" cols="95" style="margin-bottom:-5px;" name="remarks1"><%if (FF.getDeanunitRemarks() != null) {%><%=FF.getDeanunitRemarks()%><%}%></textarea></td>
                                    </tr>
                                </table>
                                <br/>
                                <center><button class='btn-info' type="submit" name="viewAttendees" value="<%=FF.getId()%>">Attendees List</button></center><br>
                                <center><button class="btn-success" type="submit" name="approve" value="<%=FF.getId()%>">Approve</button>
                                    <button class="btn-warning" type="submit" name="revise" value="<%=FF.getId()%>">Revise</button>
                                    <button class="btn-danger" type="submit" style='background-color:red; border-color:red;' name="reject" value="<%=FF.getId()%>">Reject</button></center><br>
                            </div>

                        </div>

                    </div>
                </form>
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