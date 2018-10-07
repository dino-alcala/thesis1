<%-- 
    Document   : MULTIPLE-approveCoscaSE
    Created on : 06 18, 18, 7:21:12 PM
    Author     : Karl Madrid
--%>

<%@page import="entity.SE"%>
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

        <title>Approve SE Proposal</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/sidebar2.css">
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https: //maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

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

            #sidebarCategoryActive {
                background-color: lightgreen;
            }

            #sidebarCategoryActive:hover {
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

            textarea{
                resize:none;
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
                    $("#sidebar-container").load("sidebar.jsp");
                </script>
            </div>
            <!-- sidebar-container END -->

            <!-- MAIN -->

            <div class="col py-3">
                <form action ="approveSE2" method="post">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">

                                <%
                                    SE SE = new SE();
                                    SE = UserDAO.retrieveSEBySEID(Integer.parseInt(request.getAttribute("seID").toString()));

                                %>

                                <div class="panel panel-success ">

                                    <div class="card">
                                        <div class="card-body">
                                            <h3><%=SE.getName()%></h3>
                                            <p><b>Unit: </b> <%=SE.getUnit()%></p>
                                            <p><b>Department: </b> <%=SE.getDepartment()%></p>
                                            <p><b>Program Head: </b> <%=SE.getProgramHead()%></p>
                                            <p><b>Program Classification: </b> <%=SE.getActivityClassification()%></p>
                                            <p><b>Total Amount Requested:</b> ₱<%=SE.getTotalAmount()%></p>
                                            <p><b>Actual Date of Implementation: </b> <%=SE.getActualDate()%></p>
                                        </div>
                                    </div>

                                </div>

                                <ul class="progress-tracker progress-tracker--center">
                                    <li class="progress-step is-active">
                                        <span class="progress-marker"></span>
                                        <span class="progress-text">
                                            <h4 class="progress-title"><u>Step 1</u></h4>
                                            Received by OVPLM
                                        </span>
                                    </li>

                                    <li class="progress-step">
                                        <span class="progress-marker"></span>
                                        <span class="progress-text">
                                            <h4 class="progress-title"><u>Step 2</u></h4>
                                            Initial Assessment
                                        </span>
                                    </li>

                                    <li class="progress-step">
                                        <span class="progress-marker"></span>
                                        <span class="progress-text">
                                            <h4 class="progress-title"><u>Step 3</u></h4>
                                            Evaluation by COSCA
                                        </span>
                                    </li>

                                    <li class="progress-step">
                                        <span class="progress-marker"></span>
                                        <span class="progress-text">
                                            <h4 class="progress-title"><u>Step 4</u></h4>
                                            Approval by the Council
                                        </span>
                                    </li>

                                    <li class="progress-step">
                                        <span class="progress-marker"></span>
                                        <span class="progress-text">
                                            <h4 class="progress-title"><u>Step 5</u></h4>
                                            Accomplish and Upload PRS for Endorsement
                                        </span>
                                    </li>

                                    <li class="progress-step">
                                        <span class="progress-marker"></span>
                                        <span class="progress-text">
                                            <h4 class="progress-title"><u>Step 6</u></h4>
                                            Ready to Implement
                                        </span>
                                    </li>
                                </ul>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Targets</h4>
                                    </div>
                                    <div class="card-body">   
                                        <p><b>KRA:</b> <%=UserDAO.getKRAnameByID(SE.getTargetKRA())%></p><br>
                                        <p><b>Goal:</b> <%=UserDAO.getGoalnameByID(SE.getTargetGoal())%></p><br>
                                        <p><b>Measure:</b> <%=UserDAO.getMeasurenameByID(SE.getTargetMeasure())%></p><br>
                                        <p><b>Community: </b> <%=UserDAO.getCommunitynameByID(SE.getTargetCommunity())%></p>
                                    </div>  
                                </div>
                                <br/>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Social/Community Problem being Addressed</h4>
                                    </div>
                                    <div class="card-body">   
                                        <p><%=SE.getSocialCommunityProblem()%></p>
                                    </div>
                                </div>
                                <br/>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Social Engagement Partner(s)/Beneficiaries</h4>
                                    </div>
                                    <div class="card-body">   
                                        <p>Name of Partner: <%=SE.getNameSEbeneficiaries()%></p>
                                        <p>Address: <%=SE.getAddressSEbeneficiaries()%></p>
                                        <p>Contact Person: <%=SE.getContactPersonSEbeneficiaries()%></p>
                                        <p>Mobile Number: <%=SE.getMobileSEbeneficiaries()%></p>
                                        <p>Email: <%=SE.getEmailSEbeneficiaries()%></p><br>
                                        <p>Brief Description of Partner: <%=SE.getDescriptionSEbeneficiaries()%></p>
                                    </div>
                                </div>
                                <br>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Measurable Outcomes/Objectives of the Project</h4>
                                    </div>
                                    <div class="card-body">   
                                        <p><%=SE.getObjectives()%></p>
                                    </div>
                                </div>
                                <br/>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Sustainability Component</h4>
                                    </div>
                                    <div class="card-body">
                                        <%
                                            for (int i = 0; i < SE.getComponent().size(); i++) {
                                        %>
                                        <p><%=SE.getComponent().get(i)%></p>

                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                                <br/>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Work Plan</h4>
                                    </div>
                                </div>
                                <table style="width:100%">
                                    <tr>
                                        <th>Date</th>
                                        <th>Activity</th> 
                                        <th>Time Start</th>
                                        <th>Time End</th>
                                        <th>Venue</th>
                                    </tr>
                                    <%
                                        for (int i = 0; i < SE.getWorkplan().size(); i++) {
                                    %>
                                    <tr>
                                        <td><%=SE.getWorkplan().get(i).getDate()%></td>
                                        <td><%=SE.getWorkplan().get(i).getActivity()%></td>
                                        <td><%=SE.getWorkplan().get(i).getTimestarttimeend()%></td>
                                        <td><%=SE.getWorkplan().get(i).getTimestarttimeend2()%></td>
                                        <td><%=SE.getWorkplan().get(i).getVenue()%></td>
                                    </tr>

                                    <%
                                        }
                                    %>

                                </table>
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
                                        for (int i = 0; i < SE.getExpenses().size(); i++) {
                                    %>
                                    <tr>
                                        <td><%=SE.getExpenses().get(i).getItem()%></td>
                                        <td><%=SE.getExpenses().get(i).getUnitcost()%></td>
                                        <td><%=SE.getExpenses().get(i).getQuantity()%></td>
                                        <td><%=SE.getExpenses().get(i).getUnitcost() * SE.getExpenses().get(i).getQuantity()%></td>
                                    </tr>
                                    <%
                                            count += SE.getExpenses().get(i).getUnitcost() * SE.getExpenses().get(i).getQuantity();
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
                                        <h4>Expected Participants vs. Total Population of the Unit</h4>
                                    </div>
                                </div>
                                <table style="width:100%">
                                    <tr>
                                        <th>Sector</th>
                                        <th>Total Population</th>
                                        <th>Expected Number of Participants</th>
                                    </tr>
                                    <tr>
                                        <td>Academic Staff from Unit</td>
                                        <td><%=SE.getTotalpopulationAcademicStaff()%></td>
                                        <td><%=SE.getExpectedAcademicStaff()%></td>
                                    </tr>
                                    <tr>
                                        <td>Support Staff from Unit</td>
                                        <td><%=SE.getTotalpopulationSupportStaff()%></td>
                                        <td><%=SE.getExpectedSupportStaff()%></td>
                                    </tr>
                                    <tr>
                                        <td>Undergraduate Students</td>
                                        <td><%=SE.getTotalpopulationUndergraduate()%></td>
                                        <td><%=SE.getExpectedUndergraduate()%></td>
                                    </tr>
                                    <tr>
                                        <td>Graduate Students</td>
                                        <td><%=SE.getTotalPopulationGraduate()%></td>
                                        <td><%=SE.getExpectedGraduate()%></td>
                                    </tr>
                                </table>
                                <br/>

                                <div class="card">
                                    <div class="card-header">
                                        <h4>Persons Responsible</h4>
                                    </div>
                                </div>
                                <table style="width:100%">
                                    <tr>
                                        <th>Name</th>
                                        <th>Email</th>
                                    </tr>
                                    <%
                                        for (int i = 0; i < SE.getResponsible().size(); i++) {
                                    %>
                                    <tr>
                                        <td><%=SE.getResponsible().get(i).getName()%></td>
                                        <td><%=SE.getResponsible().get(i).getEmail()%></td>
                                    </tr>

                                    <%
                                        }
                                    %>
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
                                        <td>Step 1</td>
                                        <td style="padding:0px"><textarea id="remarks1" rows="3" cols="95" style="margin-bottom:-5px;" name="remarks1"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td>Step 2</td>
                                        <td><%=SE.getCarmelRemarks()%></td>
                                    </tr>
                                    <tr>
                                        <td>Step 3</td>
                                        <td><%=SE.getCoscaRemarks()%></td>
                                    </tr>
                                </table>
                                <br/>

                                <center><button type="submit" class="btn-success" name="approve" value="<%=SE.getId()%>">Approve</button>

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