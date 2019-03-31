<%-- 
    Document   : UR-home
    Created on : 06 27, 18, 1:25:59 PM
    Author     : Karl Madrid
--%>

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

        <title>Create KRA</title>

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
            .table{
                border-bottom: 2px solid lightgray;
                margin-bottom: 30px;
            }
            
            #select{
                font-family: Arial;
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
            h1, h2, h3, h4, h5, h6 {
                color: #222;
                font-weight: 600;
                line-height: 1.3;
                font-size: 25px;
            }
            h2 {
                margin-top: 1.3em;
            }
            a {
                color: #0083e8;
            }
            b{
                font-weight: 600;
            }
            th {
                background-color: green;
                color: white;
            }
            p{
                font-size: 20px;
                font-family: Arial;
                    
            }
            table {
                border-collapse: collapse;
            }
            th{
                padding:15px;
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

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <script type='text/javascript'>
            
            function addTotalGoal(){
                var count = document.getElementById("countgoals").value;
                count++;
                document.getElementById("countgoals").setAttribute('value',count);
            }
            
            function subtractTotalGoal(){
                var count = document.getElementById("countgoals").value;
                count--;
                document.getElementById("countgoals").setAttribute('value',count);
            }
            
            function addRow() {
                var count = document.getElementById("countmeasuregoal1").value;
                var table = document.getElementById("goaltable");
                var rows = document.getElementById("goaltable").rows.length;
                var row = table.insertRow(rows);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                cell1.innerHTML = "<textarea required style='border-radius:0px;' rows = '2' cols = '10%' name ='goal1measure" + count + "'></textarea>";
                cell2.innerHTML = "<textarea required style='border-radius:0px;' rows = '2' cols = '10%' name ='goal1description" + count + "'></textarea>";
                cell3.innerHTML = '<br><input style="width:15%; border-radius:0%" type="number" value="0" name="goal1numtarget'+count+'"/>&nbsp;<select style="width:20%; border-radius:0%" name="goal1numtypetarget'+count+'"><option value="Count">Count/s</option><option value="Percent">Percent</option></select>of<select style="width:40%; border-radius:0%" name="goal1unittarget'+count+'"><option value="Administrators">Administrators</option><option value="Alumni">Alumni</option><option value="APSP Employees">APSP</option><option value="ASF Employees">ASF</option><option value="CAP Employees">CAP</option><option value="Departments">Departments</option><option value="Faculty Employees">Faculty</option><option value="Faculty Departments">Faculty Departments</option><option value="Graduate Students">Graduate Students</option><option value="International Students">International Students</option><option value="No Specified Unit">No Specified Unit</option><option value="SE Programs Per Unit">SE Programs Per Unit</option><option value="Social Engagement Programs">Social Engagement Programs</option><option value="Staff">Staff</option><option value="Student Organizations">Student Orgs</option><option value="Undergraduate Students">Undergraduate Students</option></select><br><br>have undergone/conducted/contains a <select style="width:40%; border-radius:0%" name="goal1typetarget'+count+'"><option value="Faith Formation">Faith Formation</option><option value="Interdisciplinary Fora">Interdisciplinary Fora</option><option value="Service-Learning">Service-Learning</option><option value="Social Engagement">Social Engagement</option><option value="Sustainable Development Goals Localization Project">Sustainable Development Goals Localization Project</option><option value="Sustainable SE">Sustainable SE</option></select><br><br>program/component engaging<select style="width:40%; border-radius:0%" name="goal1engaging'+count+'"><option value="Alumni">Alumni</option><option value="International Communities">International Communities</option><option value="International Students">International Students</option><option value="N/A">N/A</option><option value="Parents">Parents</option></select><br><br>check if not applicable: <input type="checkbox" name="goal1untrackable'+count+'" value="untrackable"/><br><br>';
                count++;
                document.getElementById("countmeasuregoal1").setAttribute('value', count);
            }
            
            function deleteRow() {
                var count = document.getElementById("countmeasuregoal1").value;
                var rows = document.getElementById("goaltable").rows.length;
                if (rows - 1 > 0) {
                    document.getElementById("goaltable").deleteRow(rows - 1);
                    count--;
                    document.getElementById("countmeasuregoal1").setAttribute('value', count);
                } else {
                }
            }
            
            function addRow2() {
                var count = document.getElementById("countmeasuregoal2").value;
                var table = document.getElementById("goaltable2");
                var rows = document.getElementById("goaltable2").rows.length;
                var row = table.insertRow(rows);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                cell1.innerHTML = "<textarea required style='border-radius:0px;' rows = '2' cols = '10%' name ='goal2measure" + count + "'></textarea>";
                cell2.innerHTML = "<textarea required style='border-radius:0px;' rows = '2' cols = '10%' name ='goal2description" + count + "'></textarea>";
                cell3.innerHTML = '<br><input style="width:15%; border-radius:0%" type="number" value="0" name="goal2numtarget'+count+'"/>&nbsp;<select style="width:20%; border-radius:0%" name="goal2numtypetarget'+count+'"><option value="Count">Count/s</option><option value="Percent">Percent</option></select>of<select style="width:40%; border-radius:0%" name="goal2unittarget'+count+'"><option value="Administrators">Administrators</option><option value="Alumni">Alumni</option><option value="APSP Employees">APSP</option><option value="ASF Employees">ASF</option><option value="CAP Employees">CAP</option><option value="Departments">Departments</option><option value="Faculty Employees">Faculty</option><option value="Faculty Departments">Faculty Departments</option><option value="Graduate Students">Graduate Students</option><option value="International Students">International Students</option><option value="No Specified Unit">No Specified Unit</option><option value="SE Programs Per Unit">SE Programs Per Unit</option><option value="Social Engagement Programs">Social Engagement Programs</option><option value="Staff">Staff</option><option value="Student Organizations">Student Orgs</option><option value="Undergraduate Students">Undergraduate Students</option></select><br><br>have undergone/conducted/contains a <select style="width:40%; border-radius:0%" name="goal2typetarget'+count+'"><option value="Faith Formation">Faith Formation</option><option value="Interdisciplinary Fora">Interdisciplinary Fora</option><option value="Service-Learning">Service-Learning</option><option value="Social Engagement">Social Engagement</option><option value="Sustainable Development Goals Localization Project">Sustainable Development Goals Localization Project</option><option value="Sustainable SE">Sustainable SE</option></select><br><br>program/component engaging<select style="width:40%; border-radius:0%" name="goal2engaging'+count+'"><option value="Alumni">Alumni</option><option value="International Communities">International Communities</option><option value="International Students">International Students</option><option value="N/A">N/A</option><option value="Parents">Parents</option></select><br><br>check if not applicable: <input type="checkbox" name="goal2untrackable'+count+'" value="untrackable"/><br><br>';
                count++;
                document.getElementById("countmeasuregoal2").setAttribute('value', count);
            }
            
            function deleteRow2() {
                var count = document.getElementById("countmeasuregoal2").value;
                var rows = document.getElementById("goaltable2").rows.length;
                if (rows - 1 > 0) {
                    document.getElementById("goaltable2").deleteRow(rows - 1);
                    count--;
                    document.getElementById("countmeasuregoal2").setAttribute('value', count);
                } else {
                }
            }
            
            function addRow3() {
                var count = document.getElementById("countmeasuregoal3").value;
                var table = document.getElementById("goaltable3");
                var rows = document.getElementById("goaltable3").rows.length;
                var row = table.insertRow(rows);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                cell1.innerHTML = "<textarea required style='border-radius:0px;' rows = '2' cols = '10%' name ='goal3measure" + count + "'></textarea>";
                cell2.innerHTML = "<textarea required style='border-radius:0px;' rows = '2' cols = '10%' name ='goal3description" + count + "'></textarea>";
                cell3.innerHTML = '<br><input style="width:15%; border-radius:0%" type="number" value="0" name="goal3numtarget'+count+'"/>&nbsp;<select style="width:20%; border-radius:0%" name="goal3numtypetarget'+count+'"><option value="Count">Count/s</option><option value="Percent">Percent</option></select>of<select style="width:40%; border-radius:0%" name="goal3unittarget'+count+'"><option value="Administrators">Administrators</option><option value="Alumni">Alumni</option><option value="APSP Employees">APSP</option><option value="ASF Employees">ASF</option><option value="CAP Employees">CAP</option><option value="Departments">Departments</option><option value="Faculty Employees">Faculty</option><option value="Faculty Departments">Faculty Departments</option><option value="Graduate Students">Graduate Students</option><option value="International Students">International Students</option><option value="No Specified Unit">No Specified Unit</option><option value="SE Programs Per Unit">SE Programs Per Unit</option><option value="Social Engagement Programs">Social Engagement Programs</option><option value="Staff">Staff</option><option value="Student Organizations">Student Orgs</option><option value="Undergraduate Students">Undergraduate Students</option></select><br><br>have undergone/conducted/contains a <select style="width:40%; border-radius:0%" name="goal3typetarget'+count+'"><option value="Faith Formation">Faith Formation</option><option value="Interdisciplinary Fora">Interdisciplinary Fora</option><option value="Service-Learning">Service-Learning</option><option value="Social Engagement">Social Engagement</option><option value="Sustainable Development Goals Localization Project">Sustainable Development Goals Localization Project</option><option value="Sustainable SE">Sustainable SE</option></select><br><br>program/component engaging<select style="width:40%; border-radius:0%" name="goal3engaging'+count+'"><option value="Alumni">Alumni</option><option value="International Communities">International Communities</option><option value="International Students">International Students</option><option value="N/A">N/A</option><option value="Parents">Parents</option></select><br><br>check if not applicable: <input type="checkbox" name="goal3untrackable'+count+'" value="untrackable"/><br><br>';
                count++;
                document.getElementById("countmeasuregoal3").setAttribute('value', count);
            }
            
            function deleteRow3() {
                var count = document.getElementById("countmeasuregoal3").value;
                var rows = document.getElementById("goaltable3").rows.length;
                if (rows - 1 > 0) {
                    document.getElementById("goaltable3").deleteRow(rows - 1);
                    count--;
                    document.getElementById("countmeasuregoal3").setAttribute('value', count);
                } else {
                }
            }
            
            function addRow4() {
                var count = document.getElementById("countmeasuregoal4").value;
                var table = document.getElementById("goaltable4");
                var rows = document.getElementById("goaltable4").rows.length;
                var row = table.insertRow(rows);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                cell1.innerHTML = "<textarea required style='border-radius:0px;' rows = '2' cols = '10%' name ='goal4measure" + count + "'></textarea>";
                cell2.innerHTML = "<textarea required style='border-radius:0px;' rows = '2' cols = '10%' name ='goal4description" + count + "'></textarea>";
                cell3.innerHTML = '<br><input style="width:15%; border-radius:0%" type="number" value="0" name="goal4numtarget'+count+'"/>&nbsp;<select style="width:20%; border-radius:0%" name="goal4numtypetarget'+count+'"><option value="Count">Count/s</option><option value="Percent">Percent</option></select>of<select style="width:40%; border-radius:0%" name="goal4unittarget'+count+'"><option value="Administrators">Administrators</option><option value="Alumni">Alumni</option><option value="APSP Employees">APSP</option><option value="ASF Employees">ASF</option><option value="CAP Employees">CAP</option><option value="Departments">Departments</option><option value="Faculty Employees">Faculty</option><option value="Faculty Departments">Faculty Departments</option><option value="Graduate Students">Graduate Students</option><option value="International Students">International Students</option><option value="No Specified Unit">No Specified Unit</option><option value="SE Programs Per Unit">SE Programs Per Unit</option><option value="Social Engagement Programs">Social Engagement Programs</option><option value="Staff">Staff</option><option value="Student Organizations">Student Orgs</option><option value="Undergraduate Students">Undergraduate Students</option></select><br><br>have undergone/conducted/contains a <select style="width:40%; border-radius:0%" name="goal4typetarget'+count+'"><option value="Faith Formation">Faith Formation</option><option value="Interdisciplinary Fora">Interdisciplinary Fora</option><option value="Service-Learning">Service-Learning</option><option value="Social Engagement">Social Engagement</option><option value="Sustainable Development Goals Localization Project">Sustainable Development Goals Localization Project</option><option value="Sustainable SE">Sustainable SE</option></select><br><br>program/component engaging<select style="width:40%; border-radius:0%" name="goal4engaging'+count+'"><option value="Alumni">Alumni</option><option value="International Communities">International Communities</option><option value="International Students">International Students</option><option value="N/A">N/A</option><option value="Parents">Parents</option></select><br><br>check if not applicable: <input type="checkbox" name="goal4untrackable'+count+'" value="untrackable"/><br><br>';
                count++;
                document.getElementById("countmeasuregoal4").setAttribute('value', count);
            }
            
            function deleteRow4() {
                var count = document.getElementById("countmeasuregoal4").value;
                var rows = document.getElementById("goaltable4").rows.length;
                if (rows - 1 > 0) {
                    document.getElementById("goaltable4").deleteRow(rows - 1);
                    count--;
                    document.getElementById("countmeasuregoal4").setAttribute('value', count);
                } else {
                }
            }
            
            function addRow5() {
                var count = document.getElementById("countmeasuregoal5").value;
                var table = document.getElementById("goaltable5");
                var rows = document.getElementById("goaltable5").rows.length;
                var row = table.insertRow(rows);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                cell1.innerHTML = "<textarea required style='border-radius:0px;' rows = '2' cols = '10%' name ='goal5measure" + count + "'></textarea>";
                cell2.innerHTML = "<textarea required style='border-radius:0px;' rows = '2' cols = '10%' name ='goal5description" + count + "'></textarea>";
                cell3.innerHTML = '<br><input style="width:15%; border-radius:0%" type="number" value="0" name="goal5numtarget'+count+'"/>&nbsp;<select style="width:20%; border-radius:0%" name="goal5numtypetarget'+count+'"><option value="Count">Count/s</option><option value="Percent">Percent</option></select>of<select style="width:40%; border-radius:0%" name="goal5unittarget'+count+'"><option value="Administrators">Administrators</option><option value="Alumni">Alumni</option><option value="APSP Employees">APSP</option><option value="ASF Employees">ASF</option><option value="CAP Employees">CAP</option><option value="Departments">Departments</option><option value="Faculty Employees">Faculty</option><option value="Faculty Departments">Faculty Departments</option><option value="Graduate Students">Graduate Students</option><option value="International Students">International Students</option><option value="No Specified Unit">No Specified Unit</option><option value="SE Programs Per Unit">SE Programs Per Unit</option><option value="Social Engagement Programs">Social Engagement Programs</option><option value="Staff">Staff</option><option value="Student Organizations">Student Orgs</option><option value="Undergraduate Students">Undergraduate Students</option></select><br><br>have undergone/conducted/contains a <select style="width:40%; border-radius:0%" name="goal5typetarget'+count+'"><option value="Faith Formation">Faith Formation</option><option value="Interdisciplinary Fora">Interdisciplinary Fora</option><option value="Service-Learning">Service-Learning</option><option value="Social Engagement">Social Engagement</option><option value="Sustainable Development Goals Localization Project">Sustainable Development Goals Localization Project</option><option value="Sustainable SE">Sustainable SE</option></select><br><br>program/component engaging<select style="width:40%; border-radius:0%" name="goal5engaging'+count+'"><option value="Alumni">Alumni</option><option value="International Communities">International Communities</option><option value="International Students">International Students</option><option value="N/A">N/A</option><option value="Parents">Parents</option></select><br><br>check if not applicable: <input type="checkbox" name="goal5untrackable'+count+'" value="untrackable"/><br><br>';
                count++;
                document.getElementById("countmeasuregoal5").setAttribute('value', count);
            }
            
            function deleteRow5() {
                var count = document.getElementById("countmeasuregoal5").value;
                var rows = document.getElementById("goaltable5").rows.length;
                if (rows - 1 > 0) {
                    document.getElementById("goaltable5").deleteRow(rows - 1);
                    count--;
                    document.getElementById("countmeasuregoal5").setAttribute('value', count);
                } else {
                }
            }
            
            function addRow6() {
                var count = document.getElementById("countmeasuregoal6").value;
                var table = document.getElementById("goaltable6");
                var rows = document.getElementById("goaltable6").rows.length;
                var row = table.insertRow(rows);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                cell1.innerHTML = "<textarea required style='border-radius:0px;' rows = '2' cols = '10%' name ='goal6measure" + count + "'></textarea>";
                cell2.innerHTML = "<textarea required style='border-radius:0px;' rows = '2' cols = '10%' name ='goal6description" + count + "'></textarea>";
                cell3.innerHTML = '<br><input style="width:15%; border-radius:0%" type="number" value="0" name="goal6numtarget'+count+'"/>&nbsp;<select style="width:20%; border-radius:0%" name="goal6numtypetarget'+count+'"><option value="Count">Count/s</option><option value="Percent">Percent</option></select>of<select style="width:40%; border-radius:0%" name="goal6unittarget'+count+'"><option value="Administrators">Administrators</option><option value="Alumni">Alumni</option><option value="APSP Employees">APSP</option><option value="ASF Employees">ASF</option><option value="CAP Employees">CAP</option><option value="Departments">Departments</option><option value="Faculty Employees">Faculty</option><option value="Faculty Departments">Faculty Departments</option><option value="Graduate Students">Graduate Students</option><option value="International Students">International Students</option><option value="No Specified Unit">No Specified Unit</option><option value="SE Programs Per Unit">SE Programs Per Unit</option><option value="Social Engagement Programs">Social Engagement Programs</option><option value="Staff">Staff</option><option value="Student Organizations">Student Orgs</option><option value="Undergraduate Students">Undergraduate Students</option></select><br><br>have undergone/conducted/contains a <select style="width:40%; border-radius:0%" name="goal6typetarget'+count+'"><option value="Faith Formation">Faith Formation</option><option value="Interdisciplinary Fora">Interdisciplinary Fora</option><option value="Service-Learning">Service-Learning</option><option value="Social Engagement">Social Engagement</option><option value="Sustainable Development Goals Localization Project">Sustainable Development Goals Localization Project</option><option value="Sustainable SE">Sustainable SE</option></select><br><br>program/component engaging<select style="width:40%; border-radius:0%" name="goal6engaging'+count+'"><option value="Alumni">Alumni</option><option value="International Communities">International Communities</option><option value="International Students">International Students</option><option value="N/A">N/A</option><option value="Parents">Parents</option></select><br><br>check if not applicable: <input type="checkbox" name="goal6untrackable'+count+'" value="untrackable"/><br><br>';
                count++;
                document.getElementById("countmeasuregoal6").setAttribute('value', count);
            }
            
            function deleteRow6() {
                var count = document.getElementById("countmeasuregoal6").value;
                var rows = document.getElementById("goaltable6").rows.length;
                if (rows - 1 > 0) {
                    document.getElementById("goaltable6").deleteRow(rows - 1);
                    count--;
                    document.getElementById("countmeasuregoal6").setAttribute('value', count);
                } else {
                }
            }
            
            $(document).ready(function () {
                var goal = 2;
                var count = document.getElementById("countgoals").value;
                $("#addgoal").click(function () {
                    if(goal != 7){
                        $("#container").append('<div id="add-goal'+goal+'"><h4>Goal '+goal+': </h4><textarea required style="border-radius:0px;" rows = "1" cols = "1%" name ="goalname'+goal+'"></textarea><center><table style = "width:100%" id="goaltable'+goal+'"><tr><th style="width:15%">Measure</th><th style="width:40%">Description</th><th style="width:40%">Target</th></tr><tr><td><textarea required style="border-radius:0px;" rows = "2" cols = "50%" name ="goal'+goal+'measure1"></textarea></td><td><textarea required style="border-radius:0px;" rows = "2" cols = "50%" name ="goal'+goal+'description1"></textarea></td><td><br><input style="width:15%; border-radius:0%" type="number" value="0" name="goal'+goal+'numtarget1"/>&nbsp;<select style="width:20%; border-radius:0%" name="goal'+goal+'numtypetarget1"><option value="Count">Count/s</option><option value="Percent">Percent</option></select>of<select style="width:40%; border-radius:0%" name="goal'+goal+'unittarget1"><option value="Administrators">Administrators</option><option value="Alumni">Alumni</option><option value="APSP Employees">APSP</option><option value="ASF Employees">ASF</option><option value="CAP Employees">CAP</option><option value="Departments">Departments</option><option value="Faculty Employees">Faculty</option><option value="Faculty Departments">Faculty Departments</option><option value="Graduate Students">Graduate Students</option><option value="International Students">International Students</option><option value="No Specified Unit">No Specified Unit</option><option value="SE Programs Per Unit">SE Programs Per Unit</option><option value="Social Engagement Programs">Social Engagement Programs</option><option value="Staff">Staff</option><option value="Student Organizations">Student Orgs</option><option value="Undergraduate Students">Undergraduate Students</option></select><br><br>have undergone/conducted/contains a <select style="width:40%; border-radius:0%" name="goal'+goal+'typetarget1"><option value="Faith Formation">Faith Formation</option><option value="Interdisciplinary Fora">Interdisciplinary Fora</option><option value="Service-Learning">Service-Learning</option><option value="Social Engagement">Social Engagement</option><option value="Sustainable Development Goals Localization Project">Sustainable Development Goals Localization Project</option><option value="Sustainable SE">Sustainable SE</option></select><br><br>program/component engaging<select style="width:40%; border-radius:0%" name="goal'+goal+'engaging1"><option value="Alumni">Alumni</option><option value="International Communities">International Communities</option><option value="International Students">International Students</option><option value="N/A">N/A</option><option value="Parents">Parents</option></select><br><br>check if not applicable: <input type="checkbox" name="goal'+goal+'untrackable1" value="untrackable"/><br><br></td></tr><tr><td><textarea required style="border-radius:0px;" rows = "2" cols = "50%" name ="goal'+goal+'measure2"></textarea></td><td><textarea required style="border-radius:0px;" rows = "2" cols = "50%" name ="goal'+goal+'description2"></textarea></td><td><br><input style="width:15%; border-radius:0%" type="number" value="0" name="goal'+goal+'numtarget2"/>&nbsp;<select style="width:20%; border-radius:0%" name="goal'+goal+'numtypetarget2"><option value="Count">Count/s</option><option value="Percent">Percent</option></select>of<select style="width:40%; border-radius:0%" name="goal'+goal+'unittarget2"><option value="Administrators">Administrators</option><option value="Alumni">Alumni</option><option value="APSP Employees">APSP</option><option value="ASF Employees">ASF</option><option value="CAP Employees">CAP</option><option value="Departments">Departments</option><option value="Faculty Employees">Faculty</option><option value="Faculty Departments">Faculty Departments</option><option value="Graduate Students">Graduate Students</option><option value="International Students">International Students</option><option value="No Specified Unit">No Specified Unit</option><option value="SE Programs Per Unit">SE Programs Per Unit</option><option value="Social Engagement Programs">Social Engagement Programs</option><option value="Staff">Staff</option><option value="Student Organizations">Student Orgs</option><option value="Undergraduate Students">Undergraduate Students</option></select><br><br>have undergone/conducted/contains a <select style="width:40%; border-radius:0%" name="goal'+goal+'typetarget2"><option value="Faith Formation">Faith Formation</option><option value="Interdisciplinary Fora">Interdisciplinary Fora</option><option value="Service-Learning">Service-Learning</option><option value="Social Engagement">Social Engagement</option><option value="Sustainable Development Goals Localization Project">Sustainable Development Goals Localization Project</option><option value="Sustainable SE">Sustainable SE</option></select><br><br>program/component engaging<select style="width:40%; border-radius:0%" name="goal'+goal+'engaging2"><option value="Alumni">Alumni</option><option value="International Communities">International Communities</option><option value="International Students">International Students</option><option value="N/A">N/A</option><option value="Parents">Parents</option></select><br><br>check if not applicable: <input type="checkbox" name="goal'+goal+'untrackable2" value="untrackable"/><br><br></td></tr><tr><td><textarea required style="border-radius:0px;" rows = "2" cols = "50%" name ="goal'+goal+'measure3"></textarea></td><td><textarea required style="border-radius:0px;" rows = "2" cols = "50%" name ="goal'+goal+'description3"></textarea></td><td><br><input style="width:15%; border-radius:0%" type="number" value="0" name="goal'+goal+'numtarget3"/>&nbsp;<select style="width:20%; border-radius:0%" name="goal'+goal+'numtypetarget3"><option value="Count">Count/s</option><option value="Percent">Percent</option></select>of<select style="width:40%; border-radius:0%" name="goal'+goal+'unittarget3"><option value="Administrators">Administrators</option><option value="Alumni">Alumni</option><option value="APSP Employees">APSP</option><option value="ASF Employees">ASF</option><option value="CAP Employees">CAP</option><option value="Departments">Departments</option><option value="Faculty Employees">Faculty</option><option value="Faculty Departments">Faculty Departments</option><option value="Graduate Students">Graduate Students</option><option value="International Students">International Students</option><option value="No Specified Unit">No Specified Unit</option><option value="SE Programs Per Unit">SE Programs Per Unit</option><option value="Social Engagement Programs">Social Engagement Programs</option><option value="Staff">Staff</option><option value="Student Organizations">Student Orgs</option><option value="Undergraduate Students">Undergraduate Students</option></select><br><br>have undergone/conducted/contains a <select style="width:40%; border-radius:0%" name="goal'+goal+'typetarget3"><option value="Faith Formation">Faith Formation</option><option value="Interdisciplinary Fora">Interdisciplinary Fora</option><option value="Service-Learning">Service-Learning</option><option value="Social Engagement">Social Engagement</option><option value="Sustainable Development Goals Localization Project">Sustainable Development Goals Localization Project</option><option value="Sustainable SE">Sustainable SE</option></select><br><br>program/component engaging<select style="width:40%; border-radius:0%" name="goal'+goal+'engaging3"><option value="Alumni">Alumni</option><option value="International Communities">International Communities</option><option value="International Students">International Students</option><option value="N/A">N/A</option><option value="Parents">Parents</option></select><br><br>check if not applicable: <input type="checkbox" name="goal'+goal+'untrackable3" value="untrackable"/><br><br></td></tr></table><br><center><input type ="button" id="addRowButton" onclick ="addRow'+goal+'()" value="Add row"></center><center><input type ="button" id="deleteRowButton" onclick ="deleteRow'+goal+'()" value="Delete row"></center><input type="hidden" value="4" id="countmeasuregoal'+goal+'" name="countmeasuregoal'+goal+'"><br>');
                        goal++;
                    } 
                });
                
                $("#deletegoal").click(function () {
                    if(goal == 3){
                        $("#add-goal2").remove();
                        goal--;
                    } else if(goal == 4){
                        $("#add-goal3").remove();
                        goal--;
                    } else if(goal == 5){
                        $("#add-goal4").remove();
                        goal--;
                    } else if(goal == 6){
                        $("#add-goal5").remove();
                        goal--;
                    } else if(goal == 7){
                        $("#add-goal6").remove();
                        goal--;
                    }
                });
            });
            
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
                            <% UserDAO UserDAO = new UserDAO();%>
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
                        $("#sidebar-container").load("sidebarovplm.jsp");
                    </script>
                </ul>
            </div>

            <!-- MAIN -->
            <div class="col py-3">
                <hr size="5" noshade>    
                <center><h1>Create KRA</h1></center>
                <hr size="5" noshade>

                <div class="form-style-5">
                    <form action = "addKRA" method="post">
                        <%
                            SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
                            java.util.Date javaDate = new java.util.Date();
                            java.sql.Date Datejava = new java.sql.Date(javaDate.getTime());
                        %>
                        <fieldset>
                            <legend id="select">Date: <input style="border-radius:0%" type = "date" rows = "1" cols = "1%" name ="date" value="<%=Datejava%>"/></legend>
                        </fieldset>

                        <fieldset>
                            <legend id="select">KRA Name: <textarea style="border-radius:0%"  rows = "1" cols = "1%" name ="kraname"></textarea></legend>
                            <br><br>
                        </fieldset>

                        <div id="add-goal">
                            <h4>Goal 1: </h4><textarea required style='border-radius:0px;' rows = "1" cols = "1%" name ="goalname1"></textarea>
                            <center><table style = "width:100%" id="goaltable">
                                    <tr>
                                        <th id="select" style="width:15%">Measure</th>
                                        <th id="select" style="width:40%">Description</th>
                                        <th id="select" style="width:40%">Target</th>
                                    </tr>
                                    <tr>    
                                        <td><textarea id="select" required placeholder="KRA3-G1-M1" style='border-radius:0px;' rows = "2" cols = "50%" name ="goal1measure1"></textarea></td>
                                        <td><textarea id="select" required placeholder="Description" style='border-radius:0px;' rows = "2" cols = "50%" name ="goal1description1"></textarea></td>
                                        <td>
                                            <br><input style="width:15%; border-radius:0%" type="number" value="0" name="goal1numtarget1"/>&nbsp;
                                            <select id="select" style="width:20%; border-radius:0%" name="goal1numtypetarget1">
                                                <option value="Count">Count/s</option>
                                                <option value="Percent">Percent</option>
                                            </select>
                                            of
                                            <select id="select" style="width:40%; border-radius:0%" name="goal1unittarget1">
                                                <option value="Administrators">Administrators</option>
                                                <option value="Alumni">Alumni</option>
                                                <option value="APSP Employees">APSP</option>
                                                <option value="ASF Employees">ASF</option>
                                                <option value="CAP Employees">CAP</option>
                                                <option value="Departments">Departments</option>
                                                <option value="Faculty Employees">Faculty</option>
                                                <option value="Faculty Departments">Faculty Departments</option>
                                                <option value="Graduate Students">Graduate Students</option>
                                                <option value="International Students">International Students</option>
                                                <option value="No Specified Unit">No Specified Unit</option>
                                                <option value="SE Programs Per Unit">SE Programs Per Unit</option>
                                                <option value="Social Engagement Programs">Social Engagement Programs</option>
                                                <option value="Staff">Staff</option>
                                                <option value="Student Organizations">Student Orgs</option>
                                                <option value="Undergraduate Students">Undergraduate Students</option>
                                            </select><br><br>
                                            have undergone/conducted/contains a 
                                            <select id="select" style="width:40%; border-radius:0%" name="goal1typetarget1">
                                                <option value="Faith Formation">Faith Formation</option>
                                                <option value="Interdisciplinary Fora">Interdisciplinary Fora</option>
                                                <option value="Service-Learning">Service-Learning</option>
                                                <option value="Social Engagement">Social Engagement</option>
                                                <option value="Sustainable Development Goals Localization Project">Sustainable Development Goals Localization Project</option>
                                                <option value="Sustainable SE">Sustainable SE</option>
                                            </select><br><br>
                                            program/component engaging
                                            <select id="select" style="width:40%; border-radius:0%" name="goal1engaging1">
                                                <option value="Alumni">Alumni</option>
                                                <option value="International Communities">International Communities</option>
                                                <option value="International Students">International Students</option>
                                                <option value="N/A">N/A</option>
                                                <option value="Parents">Parents</option>
                                            </select><br><br>check if not applicable: <input type="checkbox" name="goal1untrackable1" value="untrackable"/>
                                            <br><br>
                                        </td>
                                    </tr>
                                    <tr>    
                                        <td><textarea required style='border-radius:0px;' rows = "2" cols = "50%" name ="goal1measure2"></textarea></td>
                                        <td><textarea required style='border-radius:0px;' rows = "2" cols = "50%" name ="goal1description2"></textarea></td>
                                        <td>
                                            <br><input style="width:15%; border-radius:0%" type="number" value="0" name="goal1numtarget2"/>&nbsp;
                                            <select id="select" style="width:20%; border-radius:0%" name="goal1numtypetarget2">
                                                <option value="Count">Count/s</option>
                                                <option value="Percent">Percent</option>
                                            </select>
                                            of
                                            <select id="select" style="width:40%; border-radius:0%" name="goal1unittarget2">
                                                <option value="Administrators">Administrators</option>
                                                <option value="Alumni">Alumni</option>
                                                <option value="APSP Employees">APSP</option>
                                                <option value="ASF Employees">ASF</option>
                                                <option value="CAP Employees">CAP</option>
                                                <option value="Departments">Departments</option>
                                                <option value="Faculty Employees">Faculty</option>
                                                <option value="Faculty Departments">Faculty Departments</option>
                                                <option value="Graduate Students">Graduate Students</option>
                                                <option value="International Students">International Students</option>
                                                <option value="No Specified Unit">No Specified Unit</option>
                                                <option value="SE Programs Per Unit">SE Programs Per Unit</option>
                                                <option value="Social Engagement Programs">Social Engagement Programs</option>
                                                <option value="Staff">Staff</option>
                                                <option value="Student Organizations">Student Orgs</option>
                                                <option value="Undergraduate Students">Undergraduate Students</option>
                                            </select><br><br>
                                            have undergone/conducted/contains a 
                                            <select id="select" style="width:40%; border-radius:0%" name="goal1typetarget2">
                                                <option value="Faith Formation">Faith Formation</option>
                                                <option value="Interdisciplinary Fora">Interdisciplinary Fora</option>
                                                <option value="Service-Learning">Service-Learning</option>
                                                <option value="Social Engagement">Social Engagement</option>
                                                <option value="Sustainable Development Goals Localization Project">Sustainable Development Goals Localization Project</option>
                                                <option value="Sustainable SE">Sustainable SE</option>
                                            </select><br><br>
                                            program/component engaging
                                            <select id="select" style="width:40%; border-radius:0%" name="goal1engaging2">
                                                <option value="Alumni">Alumni</option>
                                                <option value="International Communities">International Communities</option>
                                                <option value="International Students">International Students</option>
                                                <option value="N/A">N/A</option>
                                                <option value="Parents">Parents</option>
                                            </select><br><br>check if not applicable: <input type="checkbox" name="goal1untrackable2" value="untrackable"/>
                                            <br><br>
                                        </td>
                                    </tr>
                                    <tr>    
                                        <td><textarea required style='border-radius:0px;' rows = "2" cols = "50%" name ="goal1measure3"></textarea></td>
                                        <td><textarea required style='border-radius:0px;' rows = "2" cols = "50%" name ="goal1description3"></textarea></td>
                                        <td>
                                            <br><input style="width:15%; border-radius:0%" type="number" value="0" name="goal1numtarget3"/>&nbsp;
                                            <select id="select" style="width:20%; border-radius:0%" name="goal1numtypetarget3">
                                                <option value="Count">Count/s</option>
                                                <option value="Percent">Percent</option>
                                            </select>
                                            of
                                            <select id="select" style="width:40%; border-radius:0%" name="goal1unittarget3">
                                                <option value="Administrators">Administrators</option>
                                                <option value="Alumni">Alumni</option>
                                                <option value="APSP Employees">APSP</option>
                                                <option value="ASF Employees">ASF</option>
                                                <option value="CAP Employees">CAP</option>
                                                <option value="Departments">Departments</option>
                                                <option value="Faculty Employees">Faculty</option>
                                                <option value="Faculty Departments">Faculty Departments</option>
                                                <option value="Graduate Students">Graduate Students</option>
                                                <option value="International Students">International Students</option>
                                                <option value="No Specified Unit">No Specified Unit</option>
                                                <option value="SE Programs Per Unit">SE Programs Per Unit</option>
                                                <option value="Social Engagement Programs">Social Engagement Programs</option>
                                                <option value="Staff">Staff</option>
                                                <option value="Student Organizations">Student Orgs</option>
                                                <option value="Undergraduate Students">Undergraduate Students</option>
                                            </select><br><br>
                                            have undergone/conducted/contains a 
                                            <select id="select" style="width:40%; border-radius:0%" name="goal1typetarget3">
                                                <option value="Faith Formation">Faith Formation</option>
                                                <option value="Interdisciplinary Fora">Interdisciplinary Fora</option>
                                                <option value="Service-Learning">Service-Learning</option>
                                                <option value="Social Engagement">Social Engagement</option>
                                                <option value="Sustainable Development Goals Localization Project">Sustainable Development Goals Localization Project</option>
                                                <option value="Sustainable SE">Sustainable SE</option>
                                            </select><br><br>
                                            program/component engaging
                                            <select id="select" style="width:40%; border-radius:0%" name="goal1engaging3">
                                                <option value="Alumni">Alumni</option>
                                                <option value="International Communities">International Communities</option>
                                                <option value="International Students">International Students</option>
                                                <option value="N/A">N/A</option>
                                                <option value="Parents">Parents</option>
                                            </select><br><br>check if not applicable: <input type="checkbox" name="goal1untrackable3" value="untrackable"/>
                                            <br><br>
                                        </td>
                                    </tr>
                                    <input type="hidden" value="4" id="countmeasuregoal1" name="countmeasuregoal1">
                                </table></center>
                            <br>
                            <center>
                                <input type ="button" id="addRowButton" onclick ="addRow()" value="Add row">
                                <input type ="button" id="deleteRowButton" onclick ="deleteRow()" value="Delete row">
                            </center>
                            <br>
                        </div>
                        
                        <div id="container"></div>
                        
                        <input type="hidden" value="1" id="countgoals" name="countgoals">
                        <center><button class="button" type ="button" id="addgoal" onclick="addTotalGoal()">Add Goal</button>
                        <button class="button" style="background-color:red" type ="button" id="deletegoal" onclick="subtractTotalGoal()">Delete Goal</button></center>                        
                        <br>
                        <center><button class="button" type="submit" value="Submit">Create KRA</button></center>
                    </form>
                </div>
            </div>

        </div>


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