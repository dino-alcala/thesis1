<%-- 
    Document   : OVPLM-perUnitReport
    Created on : 06 18, 18, 8:06:20 PM
    Author     : Karl Madrid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="entity.Community"%>
<%@page import="entity.KRA"%>
<%@page import="entity.FF"%>
<%@page import="entity.SE"%>
<%@page import="java.sql.Date"%>
<%@page import="entity.Unit"%>
<%@page import="entity.Notification"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UserDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>Per-unit Report</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/sidebar.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
        <script src="https://cdn.rawgit.com/emn178/Chart.PieceLabel.js/master/build/Chart.PieceLabel.min.js"></script> 

        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
        <style type="text/css" class="init"></style>

        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
        <script type="text/javascript" language="javascript" src="../resources/demo.js"></script>
        <script type="text/javascript" class="init"></script>

        <script>
            $(document).ready(function () {
            var table = $('#example').DataTable();
            $("#seprogram").on('change', function(){
            var kra = $("#seprogram").val();
            $.ajax({
            type:'POST',
                    data:{kra:kra},
                    url:'unitReport',
                    success: function(response){

            <%
                UserDAO UserDAO2 = new UserDAO();
            %>

            <%
                ArrayList<SE> s = new ArrayList();
            %>
                    table.clear();
                    table.draw();
                    if (response == "Socially Engaged Research"){

            <%
                s = UserDAO2.retrieveSEProposalByUnitClassificationDate(request.getAttribute("unit").toString(), "Socially Engaged Research", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
            %>

            <%
                for (int i = 0; i < s.size(); i++) {
            %>
                    var counter = 1;
                    table.row.add([
                            '<%=s.get(i).getDate()%>',
                            '<%=s.get(i).getDepartment()%>',
                            '<%=s.get(i).getName()%>',
                            '<%=s.get(i).getProgramHead()%>',
                            '<%=s.get(i).getActivityClassification()%>',
                            '<%=UserDAO2.getCommunitynameByID(s.get(i).getTargetCommunity())%>',
                            '<%=s.get(i).getSourceOfFunds()%>'
                    ]).draw(false);
            <%
                }
            %>
                    }
                    else if (response == "Issue Awareness and Advocacy"){

            <%
                s = UserDAO2.retrieveSEProposalByUnitClassificationDate(request.getAttribute("unit").toString(), "Issue Awareness and Advocacy", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
            %>

            <%
                for (int i = 0; i < s.size(); i++) {
            %>
                    var counter = 1;
                    table.row.add([
                            '<%=s.get(i).getDate()%>',
                            '<%=s.get(i).getDepartment()%>',
                            '<%=s.get(i).getName()%>',
                            '<%=s.get(i).getProgramHead()%>',
                            '<%=s.get(i).getActivityClassification()%>',
                            '<%=UserDAO2.getCommunitynameByID(s.get(i).getTargetCommunity())%>',
                            '<%=s.get(i).getSourceOfFunds()%>'
                    ]).draw(false);
            <%
                }
            %>
                    } else if (response == "All"){

            <%
                s = UserDAO2.retrieveALLSEProposalByUnitDate(request.getAttribute("unit").toString(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
            %>

            <%
                for (int i = 0; i < s.size(); i++) {
            %>
                    var counter = 1;
                    table.row.add([
                            '<%=s.get(i).getDate()%>',
                            '<%=s.get(i).getDepartment()%>',
                            '<%=s.get(i).getName()%>',
                            '<%=s.get(i).getProgramHead()%>',
                            '<%=s.get(i).getActivityClassification()%>',
                            '<%=UserDAO2.getCommunitynameByID(s.get(i).getTargetCommunity())%>',
                            '<%=s.get(i).getSourceOfFunds()%>'
                    ]).draw(false);
            <%
                }
            %>
                    } else if (response == "Service-Learning"){

            <%
                s = UserDAO2.retrieveSEProposalByUnitClassificationDate(request.getAttribute("unit").toString(), "Service-Learning", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
            %>

            <%
                for (int i = 0; i < s.size(); i++) {
            %>
                    var counter = 1;
                    table.row.add([
                            '<%=s.get(i).getDate()%>',
                            '<%=s.get(i).getDepartment()%>',
                            '<%=s.get(i).getName()%>',
                            '<%=s.get(i).getProgramHead()%>',
                            '<%=s.get(i).getActivityClassification()%>',
                            '<%=UserDAO2.getCommunitynameByID(s.get(i).getTargetCommunity())%>',
                            '<%=s.get(i).getSourceOfFunds()%>'
                    ]).draw(false);
            <%
                }
            %>
                    } else if (response == "Interdisciplinary Fora"){

            <%
                s = UserDAO2.retrieveSEProposalByUnitClassificationDate(request.getAttribute("unit").toString(), "Interdisciplinary Fora", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
            %>

            <%
                for (int i = 0; i < s.size(); i++) {
            %>
                    var counter = 1;
                    table.row.add([
                            '<%=s.get(i).getDate()%>',
                            '<%=s.get(i).getDepartment()%>',
                            '<%=s.get(i).getName()%>',
                            '<%=s.get(i).getProgramHead()%>',
                            '<%=s.get(i).getActivityClassification()%>',
                            '<%=UserDAO2.getCommunitynameByID(s.get(i).getTargetCommunity())%>',
                            '<%=s.get(i).getSourceOfFunds()%>'
                    ]).draw(false);
            <%
                }
            %>
                    } else if (response == "Direct Service to the Poor and Marginalized"){

            <%
                s = UserDAO2.retrieveSEProposalByUnitClassificationDate(request.getAttribute("unit").toString(), "Direct Service to the Poor and Marginalized", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
            %>

            <%
                for (int i = 0; i < s.size(); i++) {
            %>
                    var counter = 1;
                    table.row.add([
                            '<%=s.get(i).getDate()%>',
                            '<%=s.get(i).getDepartment()%>',
                            '<%=s.get(i).getName()%>',
                            '<%=s.get(i).getProgramHead()%>',
                            '<%=s.get(i).getActivityClassification()%>',
                            '<%=UserDAO2.getCommunitynameByID(s.get(i).getTargetCommunity())%>',
                            '<%=s.get(i).getSourceOfFunds()%>'
                    ]).draw(false);
            <%
                }
            %>
                    } else if (response == "Public Engagement"){

            <%
                s = UserDAO2.retrieveSEProposalByUnitClassificationDate(request.getAttribute("unit").toString(), "Public Engagement", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
            %>

            <%
                for (int i = 0; i < s.size(); i++) {
            %>
                    var counter = 1;
                    table.row.add([
                            '<%=s.get(i).getDate()%>',
                            '<%=s.get(i).getDepartment()%>',
                            '<%=s.get(i).getName()%>',
                            '<%=s.get(i).getProgramHead()%>',
                            '<%=s.get(i).getActivityClassification()%>',
                            '<%=UserDAO2.getCommunitynameByID(s.get(i).getTargetCommunity())%>',
                            '<%=s.get(i).getSourceOfFunds()%>'
                    ]).draw(false);
            <%
                }
            %>
                    } else if (response == "Others"){

            <%
                s = UserDAO2.retrieveSEProposalByUnitClassificationDate(request.getAttribute("unit").toString(), "Others", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
            %>

            <%
                for (int i = 0; i < s.size(); i++) {
            %>
                    var counter = 1;
                    table.row.add([
                            '<%=s.get(i).getDate()%>',
                            '<%=s.get(i).getDepartment()%>',
                            '<%=s.get(i).getName()%>',
                            '<%=s.get(i).getProgramHead()%>',
                            '<%=s.get(i).getActivityClassification()%>',
                            '<%=UserDAO2.getCommunitynameByID(s.get(i).getTargetCommunity())%>',
                            '<%=s.get(i).getSourceOfFunds()%>'
                    ]).draw(false);
            <%
                }
            %>
                    }

                    console.log(response);
                    }
            });
            }).trigger('change');
            });
            $(document).ready(function () {
            var table2 = $('#example2').DataTable();
            $("#ffprogram").on('change', function(){
            var kra = $("#ffprogram").val();
            $.ajax({
            type:'POST',
                    data:{kra:kra},
                    url:'unitReport',
                    success: function(response){


            <%
                ArrayList<FF> f = new ArrayList();
            %>
                    table2.clear();
                    table2.draw();
                    if (response == "Recollection"){

            <%
                f = UserDAO2.retrieveFFProposalByUnitClassificationDate(request.getAttribute("unit").toString(), "Recollection", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
            %>

            <%
                for (int i = 0; i < f.size(); i++) {
            %>
                    var counter = 1;
                    table2.row.add([
                            '<%=f.get(i).getDatecreated()%>',
                            '<%=f.get(i).getDepartment()%>',
                            '<%=f.get(i).getProjectName()%>',
                            '<%=f.get(i).getProgramHead()%>',
                            '<%=f.get(i).getActivityClassification()%>',
                            '<%=UserDAO2.getCommunitynameByID(f.get(i).getTargetCommunity())%>',
                            '<%=f.get(i).getSourceOfFunds()%>'
                    ]).draw(false);
            <%
                }
            %>
                    } else if (response == "Retreat"){

            <%
                f = UserDAO2.retrieveFFProposalByUnitClassificationDate(request.getAttribute("unit").toString(), "Retreat", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
            %>

            <%
                for (int i = 0; i < f.size(); i++) {
            %>
                    var counter = 1;
                    table2.row.add([
                            '<%=f.get(i).getDatecreated()%>',
                            '<%=f.get(i).getDepartment()%>',
                            '<%=f.get(i).getProjectName()%>',
                            '<%=f.get(i).getProgramHead()%>',
                            '<%=f.get(i).getActivityClassification()%>',
                            '<%=UserDAO2.getCommunitynameByID(f.get(i).getTargetCommunity())%>',
                            '<%=f.get(i).getSourceOfFunds()%>'
                    ]).draw(false);
            <%
                }
            %>
                    } else if (response == "Spiritual-development Activity"){

            <%
                f = UserDAO2.retrieveFFProposalByUnitClassificationDate(request.getAttribute("unit").toString(), "Spiritual-activity development", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
            %>

            <%
                for (int i = 0; i < f.size(); i++) {
            %>
                    var counter = 1;
                    table2.row.add([
                            '<%=f.get(i).getDatecreated()%>',
                            '<%=f.get(i).getDepartment()%>',
                            '<%=f.get(i).getProjectName()%>',
                            '<%=f.get(i).getProgramHead()%>',
                            '<%=f.get(i).getActivityClassification()%>',
                            '<%=UserDAO2.getCommunitynameByID(f.get(i).getTargetCommunity())%>',
                            '<%=f.get(i).getSourceOfFunds()%>'
                    ]).draw(false);
            <%
                }
            %>
                    } else if (response == "Others"){

            <%
                f = UserDAO2.retrieveFFProposalByUnitClassificationDate(request.getAttribute("unit").toString(), "Others", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
            %>

            <%
                for (int i = 0; i < f.size(); i++) {
            %>
                    var counter = 1;
                    table2.row.add([
                            '<%=f.get(i).getDatecreated()%>',
                            '<%=f.get(i).getDepartment()%>',
                            '<%=f.get(i).getProjectName()%>',
                            '<%=f.get(i).getProgramHead()%>',
                            '<%=f.get(i).getActivityClassification()%>',
                            '<%=UserDAO2.getCommunitynameByID(f.get(i).getTargetCommunity())%>',
                            '<%=f.get(i).getSourceOfFunds()%>'
                    ]).draw(false);
            <%
                }
            %>
                    } else if (response == "All"){

            <%
                f = UserDAO2.retrieveALLFFProposalByUnitDate(request.getAttribute("unit").toString(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
            %>

            <%
                for (int i = 0; i < f.size(); i++) {
            %>
                    var counter = 1;
                    table2.row.add([
                            '<%=f.get(i).getDatecreated()%>',
                            '<%=f.get(i).getDepartment()%>',
                            '<%=f.get(i).getProjectName()%>',
                            '<%=f.get(i).getProgramHead()%>',
                            '<%=f.get(i).getActivityClassification()%>',
                            '<%=UserDAO2.getCommunitynameByID(f.get(i).getTargetCommunity())%>',
                            '<%=f.get(i).getSourceOfFunds()%>'
                    ]).draw(false);
            <%
                }
            %>
                    }


                    console.log(response);
                    }
            });
            }).trigger('change');
            });
            $(document).ready(function () {
            var table3 = $('#example3').DataTable();
            $("#kralist").on('change', function(){
            var kra = $("#kralist").val();
            $.ajax({
            type:'POST',
                    data:{kra:kra},
                    url:'unitReport',
                    success: function(response){

            <%
                UserDAO UserDAO3 = new UserDAO();
                ArrayList<KRA> kra = new ArrayList();
                kra = UserDAO3.retrieveUnitSortedKRA(request.getAttribute("unit").toString(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
                kra = UserDAO3.insertPercentage(kra);

                ArrayList<KRA> kraslist = new ArrayList();
            %>
                    table3.clear();
                    table3.draw();
            <%
                for (int i = 0; i < kra.size(); i++) {

            %>
                    if (response == "<%=kra.get(i).getId()%>"){


            <% kraslist = UserDAO3.retrieveProgramsUnitMeasureByKRA(request.getAttribute("unit").toString(), kra.get(i).getId(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
            %>

            <%
                for (int j = 0; j < kraslist.size(); j++) {
            %>
                    var counter = 1;
                    table3.row.add([
                            '<%=kraslist.get(j).getDate()%>',
                            '<%=UserDAO3.getKRAnameByID(kraslist.get(j).getId())%>',
                            '<%=UserDAO3.getGoalnameByID(kraslist.get(j).getGoalID())%>',
                            '<%=UserDAO3.getMeasurenameByID(kraslist.get(j).getMeasureID())%>',
                            '<%=kraslist.get(j).getProgramName()%>'
                    ]).draw(false);
            <%
                }
            %>
                    }
            <%  }

            %>
                    if (response == "All"){


            <% kraslist = UserDAO3.retrieveALLProgramsUnitMeasure(request.getAttribute("unit").toString(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
            %>

            <%
                for (int j = 0; j < kraslist.size(); j++) {
            %>
                    var counter = 1;
                    table3.row.add([
                            '<%=kraslist.get(j).getDate()%>',
                            '<%=UserDAO3.getKRAnameByID(kraslist.get(j).getId())%>',
                            '<%=UserDAO3.getGoalnameByID(kraslist.get(j).getGoalID())%>',
                            '<%=UserDAO3.getMeasurenameByID(kraslist.get(j).getMeasureID())%>',
                            '<%=kraslist.get(j).getProgramName()%>'
                    ]).draw(false);
            <%
                }
            %>
                    }


                    console.log(response);
                    }
            });
            }).trigger('change');
            });
            $(document).ready(function () {
            $('#example4').DataTable();
            });
            $(document).ready(function () {
            $('#example5').DataTable();
            });
            $(document).ready(function () {
            $('#example6').DataTable();
            });
        </script>


        <style>   
            #notifsScroll {
                overflow-y: auto; 
                overflow-x: hidden;
                height: 250px;
            }

            #myInput, #myInput2, #myInput3{
                margin-bottom: 20px;
            }

            .card-text{
                margin-bottom: 5px;
            }

            .progressnum{
                font-size: 12px;
            }

            .krascards:hover {
                background-color: lightgreen;
            }

            tr:hover {
                background-color: lightgreen;
            }

            h2{
                font-size: 30px;
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

            .totalsdiv{
                margin-top: 20px;
                background-color: white;
                padding-bottom: 15px;
                border-style: solid;
                border-color: lightgray;
                border-width: 1px;
                border-radius: 8px;
                align-content: center;
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

            h3{
                text-align: center;
                margin-top: 20px;
            }

            .totaltitle{
                text-align: center;
                font-size: 40px;
            }

            .card-text{
                color: white;
                font-size: 20px;
                font-family: 'Montserrat', sans-serif;
            }

            .total{
                color: white;
                font-size: 40px;
                font-family: 'Montserrat', sans-serif;
            }

            .total2{
                color: white;
                font-size: 30px;
                font-family: 'Montserrat', sans-serif;
            }

            .kras{
                margin-top: 20px;
                background-color: white;
                padding-bottom: 15px;
                border-style: solid;
                border-color: lightgray;
                border-width: 1px;
                border-radius: 8px;
                margin-bottom: 20px;
            }
            .daterange{
                text-align: right;
                margin-top: 30px;
            }
            .button {
                background-color: dodgerblue;
                border: none;
                color: white;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
                padding: 14px 40px;
            }

            .pbutton{
                margin-top: 40px;
                text-align: center;
            }

            .quickhead3{
                border-bottom: 2px solid black;
                padding-bottom: 10px; 
                margin-bottom: 20px;
                color: black;
            }

            #notifsScroll {
                overflow: auto; 
                height: 250px;
            }

            #buttonSE {
                margin: 5px 5px 5px 10px;
                padding-left: 60px;
                padding-bottom: 15px;
                background-color: #cc0099;
            }

            #buttonFF {
                margin: 5px 5px 5px 10px;
                padding-left: 60px;
                padding-bottom: 15px;
                background-color: #00e699;
            }

            #buttonBR {
                margin: 5px 5px 5px 10px;
                padding-left: 60px;
                padding-bottom: 15px;
                background-color: #55F024;
            }

            #buttonBU {
                margin: 5px 5px 5px 10px;
                padding-left: 60px;
                padding-bottom: 15px;
                background-color: #F0A624;
            }

            .budget{
                font-size: 70px; 
                text-align: center; 
                font-family: 'Montserrat', sans-serif;
                border-bottom: 1px solid darkgreen;
                padding-bottom: 20px;
                margin-bottom: 20px;
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
                <span class="menu-collapsed">Office of the Vice President for Lasallian Mission</span>
            </a>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown d-sm-block d-md-none">
                        <a class="nav-link" href="OVPLM-home.html" id="smallerscreenmenu">
                            Home
                        </a>
                        <a class="nav-link" href="MULTIPLE-faithFormationProgramsList.html" id="smallerscreenmenu">
                            Programs
                        </a>
                        <a class="nav-link" href="MULTIPLE-unitsList.html" id="smallerscreenmenu">
                            Units
                        </a>
                        <a class="nav-link" href="MULTIPLE-communityList.html" id="smallerscreenmenu">
                            Communities
                        </a>
                        <a class="nav-link" href="MULTIPLE-krasList.html" id="smallerscreenmenu">
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
                    <button type="button" class="btn btn-basic navbar-btn-profile">
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
                <a href="index.jsp" class="btn btn-basic navbar-btn-logout">
                    <i class="fa fa-sign-out"></i>
                </a>
                </div>
            </ul>
        </nav>

        <!-- Bootstrap row -->
        <div class="row" id="body-row">

            <!-- Sidebar -->
            <div id="sidebar-container" class="sidebar-expanded d-none d-md-block">
                <script>
                    $("#sidebar-container").load("sidebarovplm.jsp");
                </script>
            </div>

            <!-- MAIN -->
            <div class="col py-3">
                <form action="viewUnitReport" method="post">
                    <div class="container-fluid panels">
                        <p></p>
                        <p>Enter Report Range: From: <input type="date" <%if (request.getAttribute("dated") != null) {%> value="<%=Date.valueOf(request.getAttribute("startDate").toString())%>" <%}%> name="startDate"> To: <input type="date" <%if (request.getAttribute("dated") != null) {%> value="<%=Date.valueOf(request.getAttribute("endDate").toString())%>" <%}%> name="endDate"></p>
                        <div class="form-group">
                            <label for="sel1">Choose Unit:</label>
                            <select class="form-control" id="type" name="unit">
                                <optgroup label="Added Units">
                                    <option></option>
                                    <%
                                        ArrayList<Unit> units = new ArrayList();
                                        units = UserDAO.retrieveUnits();
                                        for (int i = 0; i < units.size(); i++) {
                                    %>
                                    <option value="<%=units.get(i).getName()%>" <%if (request.getAttribute("dated") != null) {
                                            if (request.getAttribute("unit").toString().equals(units.get(i).getName())) {%> selected="selected"<%}
                                                }%>><%=units.get(i).getName()%></option>
                                    <%
                                        }
                                    %>
                                </optgroup>

                            </select>
                        </div>
                        <!--
                        <button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-print"></span>Print Report</button>
                        <button type="button" class="btn btn-success">Download Report</button>
                        -->
                        <button type="submit">Submit</button>
                    </div>
                </form>

                <!--- Totals -->
                <div class="container-fluid totalsdiv">
                    <h2 class="totaltitle"><%=request.getAttribute("unit")%></h2>
                    <div class="card-deck">
                        <div class="card bg-white">
                            <div class="card-body text-center">
                                <div id="canvas-holder" style="width:50%" >
                                    <canvas id="chartUP" style="margin-left:260px"></canvas>
                                </div>
                                <script>
                                    Chart.defaults.global.legend.display = true;
                                    var ctx = document.getElementById('chartUP').getContext('2d');
                                    ctx.canvas.width = 40;
                                    ctx.canvas.height = 20;
                                    var chartUP = new Chart(ctx, {
                                    type: 'pie',
                                            data: {
                                            labels: ['Social Engagement', 'Faith Formation'],
                                                    datasets:
                                            [{
                                            data: [<%=UserDAO.countSEProposalByUnit(request.getAttribute("unit").toString(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%>, <%=UserDAO.countFFProposalByUnit(request.getAttribute("unit").toString(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%>],
                                                    backgroundColor: ['#cc0099', '#00e699']
                                            }],
                                            },
                                            options: {
                                            legend: {
                                            display: true,
                                                    position: 'bottom',
                                                    labels: {
                                                    boxWidth: 60,
                                                            fontSize: 20
                                                    }
                                            },
                                                    tooltips: {
                                                    titleFontSize: 20,
                                                            bodyFontSize: 20
                                                    }
                                            }

                                    });
                                </script> 
                            </div>
                        </div>
                    </div>
                    <p></p>
                    <div class="card-deck">
                        <div class="card bg-info">
                            <div class="card-body text-center">
                                <p class="card-text"><b>Communities Visited</b></p>
                                <p class="total"><%=UserDAO.countCommunitiesVisited(request.getAttribute("unit").toString(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%></p>
                            </div>
                        </div>
                        <div class="card bg-info">
                            <div class="card-body text-center">
                                <p class="card-text"><b>KRAs Targeted</b></p>
                                <p class="total"><%=kra.size()%></p>
                            </div>
                        </div> 
                    </div>
                    <p></p>
                </div>

                <!--- Programs Completed -->
                <div class="container-fluid panels">

                    <h2>Programs Completed (<%=request.getAttribute("startDate")%> - <%=request.getAttribute("endDate")%>)</h2>

                    <h3>Social Engagement</h3>

                    <p></p>
                    <div class="form-group" style="width:100%">
                        <label for="sel1">Choose SE Classification:</label>
                        <select class="form-control" id="seprogram" name="unit">
                            <optgroup label="SE Classification">
                                <option value="All">All</option>
                                <option value="Socially Engaged Research">Socially Engaged Research</option>
                                <option value="Service-Learning">Service Learning</option>
                                <option value="Interdisciplinary Fora">Interdisciplinary Fora</option>
                                <option value="Direct Service to the Poor and Marginalized">Direct Service to the Poor and Marginalized</option>
                                <option value="Issue Awareness and Advocacy">Issue Awareness and Advocacy</option>
                                <option value="Public Engagement">Public Engagement</option>
                                <option value="Others">Others</option>
                            </optgroup>
                        </select>
                    </div>
                    <p></p>

                    <table id="example" class="table table-striped table-bordered" style="width:100%">
                        <thead class="thead-dark">
                            <tr>
                                <th>Date</th>
                                <th>Department</th>
                                <th>Program Name</th>
                                <th>Program Head</th>
                                <th>Activity Classification</th>
                                <th>Community</th>
                                <th>Funded By</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>

                    <h2></h2>

                    <h3>Faith Formation</h3>

                    <p></p>
                    <div class="form-group" style="width:100%">
                        <label for="sel1">Choose FF Classification:</label>
                        <select class="form-control" id="ffprogram" name="unit">
                            <optgroup label="SE Classification">
                                <option value="All">All</option>
                                <option value="Recollection">Recollection</option>
                                <option value="Retreat">Retreat</option>
                                <option value="Spiritual-development Activity">Spiritual-development Activity</option>
                                <option value="Others">Others</option>
                            </optgroup>
                        </select>
                    </div>

                    <table id="example2" class="table table-striped table-bordered" style="width:100%">
                        <thead class="thead-dark">
                            <tr>
                                <th>Date</th>
                                <th>Department</th>
                                <th>Program Name</th>
                                <th>Program Head</th>
                                <th>Activity Classification</th>
                                <th>Community</th>
                                <th>Funded By</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>

                </div>

                <!--- KRAs -->
                <div class="container-fluid kras">

                    <h2>KRAs Targeted (<%=request.getAttribute("startDate")%> - <%=request.getAttribute("endDate")%>)</h2>

                    <div class="card-deck">
                        <div class="card chartscards">
                            <div id="canvas-holder" style="width:75%;">
                                <canvas id="chartPUPkras"  width="200" height="85" style="margin-left:80px"></canvas>
                            </div>
                        </div>
                        <script>
                            Chart.defaults.global.legend.display = false;
                            var ctx = document.getElementById('chartPUPkras').getContext('2d');
                            var chartPUPkras = new Chart(ctx, {
                            type: 'horizontalBar',
                                    data: {
                                    labels: [<%for (int i = 0; i < kra.size(); i++) {%>"<%=kra.get(i).getName()%>",<%}%>],
                                            datasets: [
                                            {
                                            label: "Unit's Programs",
                                                    backgroundColor: [<%for (int i = 0; i < kra.size(); i++) {%> "#3E95CD", <%}%>],
                                                    data: [<%for (int i = 0; i < kra.size(); i++) {%> <%=kra.get(i).getTotal()%>, <%}%>]
                                            },
                                            {
                                            label: "Overall Target",
                                                    backgroundColor: [<%for (int i = 0; i < kra.size(); i++) {%>"#1A3A4F",<%}%>],
                                                    data: [<%for (int i = 0; i < kra.size(); i++) {%> <%=kra.get(i).getTargetTotal()%>, <%}%>]
                                            },
                                            ],
                                    },
                                    options: {
                                    legend: {
                                    display: true,
                                            position: 'top',
                                            labels: {
                                            fontSize: 16
                                            }
                                    },
                                            title: {
                                            display: true,
                                            },
                                            scales: {
                                            yAxes: [{
                                            stacked: true,
                                                    ticks: {
                                                    fontSize: 15
                                                    }
                                            }],
                                                    xAxes: [{
                                                    ticks: {
                                                    beginAtZero: true,
                                                            fontSize: 20
                                                    }
                                                    }]
                                            },
                                            tooltips: {
                                            titleFontSize: 18,
                                                    bodyFontSize: 18
                                            }

                                    }
                            });
                        </script>
                    </div>
                    <p>
                    </p>

                    <div class="form-group" style="width:100%">
                        <label for="sel1">Choose KRA:</label>
                        <select class="form-control" id="kralist" name="unit">
                            <optgroup label="KRA # - Goal #">
                                <option value="All">All</option>
                                <%
                                    for (int i = 0; i < kra.size(); i++) {
                                %>
                                <option value="<%=kra.get(i).getId()%>"><%=kra.get(i).getName()%></option>
                                <%
                                    }
                                %>
                            </optgroup>
                        </select>
                    </div>

                    <p></p>

                    <table id="example3" class="table table-striped table-bordered" style="width:100%">
                        <thead class="thead-dark">
                            <tr>
                                <th>Date</th>
                                <th>KRA</th>
                                <th>Goal</th>
                                <th>Measure</th>
                                <th>Program Name</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>

                <!--- Communities -->
                <div class="container-fluid panels">

                    <%
                        ArrayList<Community> c = new ArrayList();
                        c = UserDAO.retrieveProgramsUnitCommunityByDate(request.getAttribute("unit").toString(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
                    %>

                    <h2>Communities (<%=request.getAttribute("startDate")%> - <%=request.getAttribute("endDate")%>)</h2>

                    <table id="example4" class="table table-striped table-bordered" style="width:100%">    
                        <thead class="thead-dark">
                            <tr>
                                <th>Community</th>
                                <th># of Programs</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (int i = 0; i < c.size(); i++) {
                            %>
                            <tr>
                                <td><%=c.get(i).getName()%></td>
                                <td><%=c.get(i).getNumberOfPrograms()%></td>

                            </tr>

                            <%
                                }
                            %>

                        </tbody>
                    </table>
                </div>

                <!--- budget -->
                <div class="container-fluid panels">

                    <%
                        DecimalFormat df = new DecimalFormat("#,###,###,###.##");
                    %>

                    <h2>Unit's Budget (<%=request.getAttribute("startDate")%> - <%=request.getAttribute("endDate")%>)</h2>

                    <div class="card-deck">
                        <div class="card bg-success">
                            <div class="card-body text-center">
                                <p class="card-text"><b>Budget Requested (as of <%=request.getAttribute("endDate")%>)</b></p>
                                <p class="total2">PHP <%=df.format(UserDAO.getBudgetRequestedByUnitDate(request.getAttribute("unit").toString(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString())))%></p>
                            </div>
                        </div>
                        <div class="card bg-success">
                            <div class="card-body text-center">
                                <p class="card-text"><b>Budget Utilized (as of <%=request.getAttribute("endDate")%>)</b></p>
                                <p class="total2">PHP <%=df.format(UserDAO.getUtilizedBudgetUnitByDate(request.getAttribute("unit").toString(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString())))%></p>
                            </div>
                        </div> 
                        <div class="card bg-success">
                            <div class="card-body text-center">
                                <p class="card-text"><b>Budget Variance (as of <%=request.getAttribute("endDate")%>)</b></p>
                                <p class="total2">PHP <%=df.format(UserDAO.getBudgetRequestedByUnitDate(request.getAttribute("unit").toString(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString())) - UserDAO.getUtilizedBudgetUnitByDate(request.getAttribute("unit").toString(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString())))%></p>
                            </div>
                        </div> 
                    </div>

                    <h2></h2>

                    <h3>Social Engagement Programs</h3>
                    <%
                        ArrayList<SE> seproposal = new ArrayList();
                        seproposal = UserDAO.retrieveSEProposalAmountRequestedByUnitDate(request.getAttribute("unit").toString(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
                    %>
                    <table id="example5" class="table table-striped table-bordered" style="width:100%">
                        <thead  class="thead-dark">
                            <tr>
                                <th>Program</th>
                                <th>Unit</th>
                                <th>Department</th>
                                <th>Amount Requested</th>
                                <th>Amount Utilized</th>
                                <th>Variance</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (int i = 0; i < seproposal.size(); i++) {
                            %>
                            <tr>
                                <td><%=seproposal.get(i).getName()%></td>
                                <td><%=seproposal.get(i).getUnit()%></td>
                                <td><%=seproposal.get(i).getDepartment()%></td>
                                <td>₱<%=seproposal.get(i).getTotalAmount()%></td>
                                <td>₱<%=UserDAO.getUtilizedBudgetBySEIDDate(seproposal.get(i).getId(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%></td>
                                <td>₱<%=seproposal.get(i).getTotalAmount() - UserDAO.getUtilizedBudgetBySEIDDate(seproposal.get(i).getId(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>

                    <h2></h2>

                    <h3>Faith Formation Programs</h3>
                    <%
                        ArrayList<FF> ffproposal = new ArrayList();
                        ffproposal = UserDAO.retrieveFFProposalAmountRequestedByUnitDate(request.getAttribute("unit").toString(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
                    %>

                    <table id="example6" class="table table-striped table-bordered" style="width:100%">
                        <thead  class="thead-dark">
                            <tr>
                                <th>Program</th>
                                <th>Unit</th>
                                <th>Department</th>
                                <th>Amount Requested</th>
                                <th>Amount Utilized</th>
                                <th>Variance</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (int i = 0; i < ffproposal.size(); i++) {
                            %>
                            <tr>
                                <td><%=ffproposal.get(i).getProjectName()%></td>
                                <td><%=ffproposal.get(i).getUnit()%></td>
                                <td><%=ffproposal.get(i).getDepartment()%></td>
                                <td>₱<%=ffproposal.get(i).getTotalAmount()%></td>
                                <td>₱<%=UserDAO.getUtilizedBudgetByFFIDDate(ffproposal.get(i).getId(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%></td>
                                <td>₱<%=ffproposal.get(i).getTotalAmount() - UserDAO.getUtilizedBudgetByFFIDDate(ffproposal.get(i).getId(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>

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
