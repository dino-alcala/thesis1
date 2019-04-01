<%-- 
    Document   : OVPLM-perUnitReport
    Created on : 06 18, 18, 8:06:20 PM
    Author     : Karl Madrid
--%>

<%@page import="dao.TargetDAO"%>
<%@page import="entity.StudentOrg"%>
<%@page import="entity.Department"%>
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
                s = UserDAO2.retrieveSEImplementedByUnitClassificationDate(request.getAttribute("unit").toString(), "Socially Engaged Research", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
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
                s = UserDAO2.retrieveSEImplementedByUnitClassificationDate(request.getAttribute("unit").toString(), "Issue Awareness and Advocacy", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
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
                s = UserDAO2.retrieveALLSEImplementedByUnitDate(request.getAttribute("unit").toString(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
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
                s = UserDAO2.retrieveSEImplementedByUnitClassificationDate(request.getAttribute("unit").toString(), "Service-Learning", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
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
                s = UserDAO2.retrieveSEImplementedByUnitClassificationDate(request.getAttribute("unit").toString(), "Interdisciplinary Fora", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
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
                s = UserDAO2.retrieveSEImplementedByUnitClassificationDate(request.getAttribute("unit").toString(), "Direct Service to the Poor and Marginalized", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
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
                s = UserDAO2.retrieveSEImplementedByUnitClassificationDate(request.getAttribute("unit").toString(), "Public Engagement", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
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
                s = UserDAO2.retrieveSEImplementedByUnitClassificationDate(request.getAttribute("unit").toString(), "Others", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
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
                f = UserDAO2.retrieveFFImplementedByUnitClassificationDate(request.getAttribute("unit").toString(), "Recollection", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
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
                            '<%=f.get(i).getActivityClassification()%>', ,
                            '<%=f.get(i).getSourceOfFunds()%>'
                    ]).draw(false);
            <%
                }
            %>
                    } else if (response == "Retreat"){

            <%
                f = UserDAO2.retrieveFFImplementedByUnitClassificationDate(request.getAttribute("unit").toString(), "Retreat", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
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
                            '<%=f.get(i).getSourceOfFunds()%>'
                    ]).draw(false);
            <%
                }
            %>
                    } else if (response == "Spiritual Talk"){

            <%
                f = UserDAO2.retrieveFFImplementedByUnitClassificationDate(request.getAttribute("unit").toString(), "Spiritual Talk", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
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
                            '<%=f.get(i).getSourceOfFunds()%>'
                    ]).draw(false);
            <%
                }
            %>
                    } else if (response == "Prayer Service"){

            <%
                f = UserDAO2.retrieveFFImplementedByUnitClassificationDate(request.getAttribute("unit").toString(), "Prayer Service", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
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
                            '<%=f.get(i).getSourceOfFunds()%>'
                    ]).draw(false);
            <%
                }
            %>
                    } else if (response == "Talk on the life of the Founder"){

            <%
                f = UserDAO2.retrieveFFImplementedByUnitClassificationDate(request.getAttribute("unit").toString(), "Talk on the life of the Founder", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
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
                            '<%=f.get(i).getSourceOfFunds()%>'
                    ]).draw(false);
            <%
                }
            %>
                    } else if (response == "Br. Gabriel Drolin Experience"){

            <%
                f = UserDAO2.retrieveFFImplementedByUnitClassificationDate(request.getAttribute("unit").toString(), "Br. Gabriel Drolin Experience", Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
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
                            '<%=f.get(i).getSourceOfFunds()%>'
                    ]).draw(false);
            <%
                }
            %>
                    }
                    
                else if (response == "All"){

            <%
                f = UserDAO2.retrieveALLFFImplementedByUnitDate(request.getAttribute("unit").toString(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
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
                TargetDAO TargetDAO = new TargetDAO();
                ArrayList<KRA> kra = new ArrayList();
                kra = TargetDAO.retrieveUnitSortedKRA2(request.getAttribute("unit").toString(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
                //kra = UserDAO3.insertPercentage(kra);

                ArrayList<KRA> kraslist = new ArrayList();
            %>
                    table3.clear();
                    table3.draw();
            <%
                for (int i = 0; i < kra.size(); i++) {

            %>
                    if (response == "<%=kra.get(i).getId()%>"){


            <% kraslist = TargetDAO.retrieveProgramsUnitMeasureOfSelectedKRA(kra.get(i).getId(), request.getAttribute("unit").toString(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
            %>

            <%
                for (int j = 0; j < kraslist.size(); j++) {
            %>
                    var counter = 1;
                    table3.row.add([
                            '<%=kraslist.get(j).getDate()%>',
                            '<%=kraslist.get(j).getName()%>',
                            '<%=kraslist.get(j).getProgramName()%>'
                    ]).draw(false);
            <%
                }
            %>
                    }
            <%  }

            %>
                    if (response == "All"){


            <% kraslist = TargetDAO.retrieveProgramsUnitMeasure(request.getAttribute("unit").toString(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()));
            %>

            <%
                for (int j = 0; j < kraslist.size(); j++) {
            %>
                    var counter = 1;
                    table3.row.add([
                            '<%=kraslist.get(j).getDate()%>',
                            '<%=kraslist.get(j).getName()%>',
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
                font-size: 20px;
                text-align: center;
                margin-top: 20px;
            }
            
            .totaltitle{
                text-align: center;
                font-size: 20px;
            }
            
            .card-text{
                color: white;
                font-size: 15px;
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
                <span class="menu-collapsed"><%=session.getAttribute("unit")%></span>
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
                <form action="viewUnitReport" method="post">
                    <div class="container panels">
                        <p></p>
                        <p>Enter Report Range: From: <input type="date" <%if (request.getAttribute("dated") != null) {%> value="<%=Date.valueOf(request.getAttribute("startDate").toString())%>" <%}%> name="startDate"> To: <input type="date" <%if (request.getAttribute("dated") != null) {%> value="<%=Date.valueOf(request.getAttribute("endDate").toString())%>" <%}%> name="endDate"></p>
                        <div class="form-group">
                            <% if (session.getAttribute("position").equals("CCS - ADEALM")) { %>
                            <label for="sel1">Unit:</label>
                            <select class="form-control" id="type" name="unit">
                                <option value = "College of Computer Studies (CCS)">College of Computer Studies (CCS)</option>
                            </select>


                            <% } else if (session.getAttribute("position").equals("COS - ADEALM")) { %>
                            <label for="sel1">Unit:</label>
                            <select class="form-control" id="type" name="unit">
                                <option value = "College of Science (COS)">College of Science (COS)</option>
                            </select>

                            <% } else if (session.getAttribute("position").equals("GCOE - ADEALM")) { %>
                            <label for="sel1">Unit:</label>
                            <select class="form-control" id="type" name="unit">
                                <option value = "Gokongwei College of Engineering">Gokongwei College of Engineering (GCOE)</option>
                            </select>

                            <% } else if (session.getAttribute("position").equals("RVRCOB - ADEALM")) { %>
                            <label for="sel1">Unit:</label>
                            <select class="form-control" id="type" name="unit">
                                <option value = "Ramon V. Del Rosario College of Business (RVR-COB)">Ramon V. Del Rosario College of Business (RVR-COB)</option>
                            </select>

                            <% } else if (session.getAttribute("position").equals("BAGCED - ADEALM")) { %>
                            <label for="sel1">Unit:</label>
                            <select class="form-control" id="type" name="unit">
                                <option value = "Br. Andrew Gonzales College of Education (BAGCED)">Br. Andrew Gonzales College of Education (BAGCED)</option>
                            </select>

                            <% } else if (session.getAttribute("position").equals("CLA - ADEALM")) { %>
                            <label for="sel1">Unit:</label>
                            <select class="form-control" id="type" name="unit">
                                <option value = "College of Liberal Arts (CLA)">College of Liberal Arts (CLA)</option>
                            </select>

                            <% } else if (session.getAttribute("position").equals("COL - ADEALM")) { %>
                            <label for="sel1">Unit:</label>
                            <select class="form-control" id="type" name="unit">
                                <option value = "College of Law (COL)">College of Law (COL)</option>
                            </select>


                            <% } else if (session.getAttribute("position").equals("SOE - ADEALM")) { %>
                            <label for="sel1">Unit:</label>
                            <select class="form-control" id="type" name="unit">
                                <option value = "School of Economics (SOE)">School of Economics (SOE)</option>
                            </select>

                            <% } else {
                            %>
                            <label for="sel1">Choose Unit:</label>
                            <select class="form-control" id="type" name="unit">
                                <option></option>
                                <optgroup label="Non-Academic Units">
                                    <%
                                        ArrayList<Unit> units = new ArrayList();
                                        units = UserDAO.retrieveUnitsNonAcademic();
                                        for (int i = 0; i < units.size(); i++) {
                                    %>
                                    <option value="<%=units.get(i).getName()%>"><%=units.get(i).getName()%></option>
                                    <%
                                        }
                                    %>
                                    <option></option>
                                </optgroup>
                                <optgroup label="Academic Units">
                                    <%
                                        units = UserDAO.retrieveUnitsAcademic();
                                        for (int i = 0; i < units.size(); i++) {
                                    %>
                                    <option value="<%=units.get(i).getName()%>"><%=units.get(i).getName()%></option>
                                    <%
                                        }
                                    %>
                                </optgroup>
                            </select>
                            <% }%>
                        </div>
                        
                        <button type="button" onclick="window.print()" class="btn btn-primary"><span class="glyphicon glyphicon-print"></span>Print Report</button>
                        <button class="btn btn-success" type="submit">Submit</button>
                    </div>
                </form>

                <!--- Totals -->
                <div class="container-fluid totalsdiv">
                    <h2 class="totaltitle">Programs Implemented by <%=request.getAttribute("unit")%><br>(student orgs included)</h2> 
                    <div class="card-deck">
                        <div class="card bg-white">
                            <div class="card-body text-center">
                                <div id="canvas-holder" style="width:50%" >
                                    <canvas id="chartUP" width="110" height="90" style="margin-left:260px"></canvas>
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
                                            data: [<%=UserDAO.countSEImplementedByUnitStudentOrg(request.getAttribute("unit").toString(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%>, <%=UserDAO.countFFImplementedByUnitStudentOrg(request.getAttribute("unit").toString(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%>],
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
                        <div class="card bg-primary">
                            <div class="card-body text-center">
                                <p class="card-text"><b>Communities Visited</b></p>
                                <p class="total"><%=UserDAO.countCommunitiesVisited(request.getAttribute("unit").toString(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%></p>
                            </div>
                        </div>
                            <%
                                DecimalFormat formatter = new DecimalFormat("0.0");
                                %>
                            <div class="card bg-warning">
                            <div class="card-body text-center">
                                <p class="card-text"><b>Overall Programs Rating</b></p>
                                <p class="total"><%=formatter.format(UserDAO.getCollegeRating(request.getAttribute("unit").toString()))%>/5</p>
                            </div>
                        </div>
                        <div class="card bg-primary">
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

                    <h2>Programs Implemented (<%=request.getAttribute("startDate")%> - <%=request.getAttribute("endDate")%>)</h2>
                     
                    <!--- etong chart yung departments ng unit dapat -->
                    <div class="card-deck">
                        <div class="card chartscards">
                            <div id="canvas-holder" style="width:75%;">
                                <canvas id="chartU" width="100" height="60" style="margin-left:80px"></canvas>
                            </div>
                        </div>
                        <script>
                            <%
                                ArrayList<Department> departments = new ArrayList();
                                departments = UserDAO.getDepartmentsByUnit(request.getAttribute("unit").toString());
                            %>
                            Chart.defaults.global.legend.display = false;
                            var ctx = document.getElementById('chartU').getContext('2d');
                            var chartU = new Chart(ctx, {
                            type: 'bar',
                                    data: {
                                    labels: [<%for (int i = 0; i < departments.size(); i++) {%>"<%=departments.get(i).getName()%>",<%}%>],
                                            datasets: [
                                            {
                                            label: "Social Engagement",
                                                    backgroundColor: [<%for (int i = 0; i < departments.size(); i++) {%>"#EA7A2D",<%}%>],
                                                    data: [<%for (int i = 0; i < departments.size(); i++) {%> <%=UserDAO.countSEImplementedByDepartment(request.getAttribute("unit").toString(), departments.get(i).getName(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%>, <%}%>]
                                            }
                                            , {
                                            label: "Faith Formation",
                                                    backgroundColor: [<%for (int i = 0; i < departments.size(); i++) {%>"#2D36EA",<%}%>],
                                                    data: [<%for (int i = 0; i < departments.size(); i++) {%> <%=UserDAO.countFFImplementedByDepartment(request.getAttribute("unit").toString(), departments.get(i).getName(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%>, <%}%>]
                                            }
                                            ]
                                            

                                    },
                                    options: {
                                    legend: {
                                    display: true,
                                            labels: {
                                            fontSize: 16
                                            }
                                    },
                                            title: {
                                            display: true,
                                            },
                                            scales: {
                                            yAxes: [{
                                            ticks: {
                                            beginAtZero: true,
                                                    fontSize: 16
                                            }
                                            }],
                                                    xAxes: [{
                                                    barThickness: 70,
                                                    barPercentage: 0.1,
                                                    ticks: {
                                                    fontSize: 16
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
                                <option value="Retreat">Retreat</option>
                                <option value="Recollection">Recollection</option>
                                <option value="Prayer Service">Prayer Service</option>
                                <option value="Spiritual Talk">Spiritual Talk</option>
                                <option value="Talk on the life of the Founder">Talk on the life of the Founder</option>
                                <option value="Br. Gabriel Drolin Experience">Br. Gabriel Drolin Experience</option>
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
                                <th>Funded By</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>

                </div>

                <!--- KRAs -->
                <div class="container-fluid kras">

                    <h2>KRAs Targeted (# of Programs per KRA) (<%=request.getAttribute("startDate")%> - <%=request.getAttribute("endDate")%>)</h2>

                    <div class="card-deck">
                        <div class="card chartscards">
                            <div id="canvas-holder" style="width:75%;">
                                <canvas id="chartPUPkras"  width="100" height="60" style="margin-left:80px"></canvas>
                            </div>
                        </div>
                        <script>
                            Chart.defaults.global.legend.display = false;
                            var ctx = document.getElementById('chartPUPkras').getContext('2d');
                            var chartPUPkras = new Chart(ctx, {
                            type: 'bar',
                                    data: {
                                    labels: [<%for (int i = 0; i < kra.size(); i++) {%>"<%=kra.get(i).getName().substring(0, 5) %>",<%}%>],
                                            datasets: [
                                            {
                                            label: "Unit's Programs",
                                                    backgroundColor: [<%for (int i = 0; i < kra.size(); i++) {%> "#3E95CD", <%}%>],
                                                    data: [<%for (int i = 0; i < kra.size(); i++) {%> <%=kra.get(i).getTotal()%>, <%}%>]
                                            },
                                            ],
                                    },
                                    options: {
                                    legend: {
                                    display: true,
                                            labels: {
                                            fontSize: 16
                                            }
                                    },
                                            title: {
                                            display: true,
                                            },
                                            scales: {
                                            yAxes: [{
                                            ticks: {
                                            beginAtZero: true,
                                                    fontSize: 16
                                            }
                                            }],
                                                    xAxes: [{
                                                    barThickness: 70,
                                                    barPercentage: 0.1,
                                                    ticks: {
                                                    fontSize: 16
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

                    <h2>Unit's Budget *(<%=request.getAttribute("startDate")%> - <%=request.getAttribute("endDate")%>)</h2>

                    <div class="card-deck">
                        <div class="card bg-success">
                            <div class="card-body text-center">                                
                                <p class="card-text"><b>Budget Requested for <br>Programs Requested by Unit from *</b></p>
                                <p class="total2">₱ <%=df.format(UserDAO.getBudgetRequestedByUnitDate(request.getAttribute("unit").toString(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString())))%></p>
                            </div>
                        </div>
                        <div class="card bg-success">
                            <div class="card-body text-center">
                                <p class="card-text"><b>Budget Requested for <br>Programs Implemented by Unit from *</b></p>
                                <p class="total2">₱ <%=df.format(UserDAO.getBudgetImplementedByUnitDate(request.getAttribute("unit").toString(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString())))%></p>
                            </div>
                        </div>
                        <div class="card bg-success">
                            <div class="card-body text-center">
                                <p class="card-text"><b>Budget Utilized for <br>Programs Implemented by Unit from *</b></p>
                                <p class="total2">₱ <%=df.format(UserDAO.getImplementedUtilizedBudgetUnitByDate(request.getAttribute("unit").toString(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString())))%></p>
                                
                                <!--<p class="card-text"><b>Budget Utilized for <br>Programs Requested by Unit from *</b></p>
                                <p class="total2">PHP <%=df.format(UserDAO.getRequestedUtilizedBudgetUnitByDate(request.getAttribute("unit").toString(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString())))%></p>-->
                            </div>
                        </div> 
                        <div class="card bg-success">
                            <div class="card-body text-center">
                                <p class="card-text"><b>Budget Variance <br>Programs Implemented by Unit from *</b></p>
                                <p class="total2">₱ <%=df.format(UserDAO.getBudgetImplementedByUnitDate(request.getAttribute("unit").toString(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString())) - UserDAO.getImplementedUtilizedBudgetUnitByDate(request.getAttribute("unit").toString(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString())))%></p>
                                
                                <!--<p class="card-text"><b>Budget Variance <br>Programs Requested by Unit from *</b></p>
                                <p class="total2">PHP <%=df.format(UserDAO.getBudgetRequestedByUnitDate(request.getAttribute("unit").toString(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString())) - UserDAO.getRequestedUtilizedBudgetUnitByDate(request.getAttribute("unit").toString(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString())))%></p>-->
                            </div>
                        </div> 
                    </div>

                    <h2></h2>

                    <h3>Social Engagement Proposals</h3>
                    <form action = "viewProposalsProgress">
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
                                    <th>Variance</th>
                                    <th></th>
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
                                    <td>₱<%=seproposal.get(i).getTotalAmount() - UserDAO.getUtilizedBudgetBySEIDDate(seproposal.get(i).getId(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%></td>
                                    <td><button class="btn btn-primary btn-sm" type="submit" name="viewSE<%=i%>" value="<%=seproposal.get(i).getId()%>">View</button></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>

                        <h2></h2>

                        <h3>Faith Formation Proposals</h3>
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
                                    <th>Variance</th>
                                    <th></th>
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
                                    <td>₱<%=ffproposal.get(i).getTotalAmount() - UserDAO.getUtilizedBudgetByFFIDDate(ffproposal.get(i).getId(), Date.valueOf(request.getAttribute("startDate").toString()), Date.valueOf(request.getAttribute("endDate").toString()))%></td>
                                    <td><button class="btn btn-primary btn-sm" type="submit" name="viewFF<%=i%>" value="<%=ffproposal.get(i).getId()%>">View</button></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
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
