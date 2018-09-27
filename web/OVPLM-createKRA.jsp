<%-- 
    Document   : OVPLM-createKRA
    Created on : 06 12, 18, 1:18:28 PM
    Author     : Karl Madrid
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Create KRA</title>


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


                margin: 10px auto;
                padding: 20px;
                border-radius: 8px;
                font-family: Georgia, "Times New Roman", Times, serif;
                font-size: 13px;
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
                border: 5;
                border-radius: 4px;
                font-size: 16px;
                margin: 0;
                outline: 0;
                padding: 7px;
                width: 100%;
                box-sizing: border-box; 
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box; 
                background-color: #e8eeef;
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

            body {
                background: #fff;
                box-shadow: 0 0 2px rgba(0, 0, 0, 0.06);
                color: #545454;
                font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
                font-size: 16px;
                line-height: 1.5;
                margin: 0 auto;
                max-width: 800px;
                padding: 2em 2em 4em;
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

            img {
                animation: colorize 2s cubic-bezier(0, 0, .78, .36) 1;
                background: transparent;
                border: 10px solid rgba(0, 0, 0, 0.12);
                border-radius: 4px;
                display: block;
                margin: 1.3em auto;
                max-width: 95%;
            }

            th {
                background-color: green;
                color: white;
            }

            table {
                border-collapse: collapse;

            }

            #addRowButton {
                padding: 10px;
                padding-right: 17px;
                padding-left: 17px;
            }

            #deleteRowButton {
                padding: 10px;
            }

            #addRowButton, #deleteRowButton {
                display:inline-block;
            }


        </style>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script type='text/javascript'>


            function addRow2() {
                var count = document.getElementById("countmeasuregoal1").value;
                var table = document.getElementById("goaltable");
                var rows = document.getElementById("goaltable").rows.length;
                var row = table.insertRow(rows);

                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);

                cell1.innerHTML = "<textarea rows = '2' cols = '10%' name ='goal1measure" + count + "'></textarea>";
                cell2.innerHTML = "<textarea rows = '2' cols = '10%' name ='goal1target" + count + "'></textarea>";
                count++;
                document.getElementById("countmeasuregoal1").setAttribute('value', count);
            }

            function deleteRow2() {
                var count = document.getElementById("countmeasuregoal1").value;
                var rows = document.getElementById("goaltable").rows.length;
                if (rows - 1 > 0) {
                    document.getElementById("goaltable").deleteRow(rows - 1);
                    count--;
                    document.getElementById("countmeasuregoal1").setAttribute('value', count);
                } else {

                }
            }

            function addRow3() {
                var count = document.getElementById("countmeasuregoal2").value;
                var table = document.getElementById("goaltable2");
                var rows = document.getElementById("goaltable2").rows.length;
                var row = table.insertRow(rows);

                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);

                cell1.innerHTML = "<textarea rows = '2' cols = '10%' name ='goal2measure" + count + "'></textarea>";
                cell2.innerHTML = "<textarea rows = '2' cols = '10%' name ='goal2target" + count + "'></textarea>";
                count++;
                document.getElementById("countmeasuregoal2").setAttribute('value', count);

            }

            function deleteRow3() {
                var count = document.getElementById("countmeasuregoal2").value;
                var rows = document.getElementById("goaltable2").rows.length;
                if (rows - 1 > 0) {
                    document.getElementById("goaltable2").deleteRow(rows - 1);
                    count--;
                    document.getElementById("countmeasuregoal2").setAttribute('value', count);
                } else {

                }
            }

            function addRow4() {
                var count = document.getElementById("countmeasuregoal3").value;
                var table = document.getElementById("goaltable3");
                var rows = document.getElementById("goaltable3").rows.length;
                var row = table.insertRow(rows);

                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);

                cell1.innerHTML = "<textarea rows = '2' cols = '10%' name ='goal3measure" + count + "'></textarea>";
                cell2.innerHTML = "<textarea rows = '2' cols = '10%' name ='goal3target" + count + "'></textarea>";
                count++;
                document.getElementById("countmeasuregoal3").setAttribute('value', count);

            }

            function deleteRow4() {
                var count = document.getElementById("countmeasuregoal3").value;
                var rows = document.getElementById("goaltable3").rows.length;
                if (rows - 1 > 0) {
                    document.getElementById("goaltable3").deleteRow(rows - 1);
                    count--;
                    document.getElementById("countmeasuregoal3").setAttribute('value', count);
                } else {

                }
            }

            $(document).ready(function () {
                $("#addgoal").click(function () {
                    $("#container").append('<h2>Goal 1: </h2><textarea rows = "1" cols = "1%" name ="goalnumber"></textarea><center><table style = "width:100%" id="goaltable"><tr><th>Measure</th><th>Description</th><th>Target</th></tr><tr><td><textarea rows = "2" cols = "1%" name ="measure"></textarea></td><td><textarea rows = "2" cols = "10%" name ="description"></textarea></td><td><textarea rows = "2" cols = "1%" name ="target"></textarea></td></tr><tr><td><textarea rows = "2" cols = "1%" name ="measure"></textarea></td><td><textarea rows = "2" cols = "10%" name ="description"></textarea></td><td><textarea rows = "2" cols = "1%" name ="target"></textarea></td></tr><tr><td><textarea rows = "2" cols = "1%" name ="measure"></textarea></td><td><textarea rows = "2" cols = "10%" name ="description"></textarea></td><td><textarea rows = "2" cols = "1%" name ="target"></textarea></td></tr></table></center><br><center><input type ="button" id="addRowButton" onclick ="addRow2()" value="Add row">&nbsp;<input type ="button" id="deleteRowButton" onclick ="deleteRow2()" value="Delete row"></center>');

                });
            });


        </script>

    </head>

    <body>
        <hr size="5" noshade>    
    <center><h1>Create KRA</h1></center>
    <hr size="5" noshade>

    <form action = "addKRA" method="post">
        <div class="form-style-5">
            <%
                SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
                java.util.Date javaDate = new java.util.Date();
                java.sql.Date Datejava = new java.sql.Date(javaDate.getTime());
            %>

            <h2>Date: </h2><input type = "date" rows = "1" cols = "1%" name ="date" value="<%=Datejava%>"></textarea>
            <h2>KRA Name: </h2><textarea rows = "1" cols = "1%" name ="kraname"></textarea>
            <br><br><br><br>

            <div class="add-goal">
                <h2>Goal 1: </h2><textarea rows = "1" cols = "1%" name ="goalname1"></textarea>
                <center><table style = "width:100%" id="goaltable">
                        <tr>
                            <th>Measure</th>
                            <th>Target</th>
                        </tr>
                        <tr>    
                            <td><textarea rows = "2" cols = "50%" name ="goal1measure1"></textarea></td>
                            <td><textarea rows = "2" cols = "50%" name ="goal1target1"></textarea></td>
                        </tr>
                        <tr>    
                            <td><textarea rows = "2" cols = "50%" name ="goal1measure2"></textarea></td>
                            <td><textarea rows = "2" cols = "50%" name ="goal1target2"></textarea></td>
                        </tr>
                        <tr>    
                            <td><textarea rows = "2" cols = "50%" name ="goal1measure3"></textarea></td>
                            <td><textarea rows = "2" cols = "50%" name ="goal1target3"></textarea></td>
                        </tr>

                        <input type="hidden" value="4" id="countmeasuregoal1" name="countmeasuregoal1">
                    </table></center>
                <br>
                <center>
                    <input type ="button" id="addRowButton" onclick ="addRow2()" value="Add row">  
                    <input type ="button" id="deleteRowButton" onclick ="deleteRow2()" value="Delete row">
                </center>
                <br>
            </div>

            <div class="add-goal">
                <h2>Goal 2: </h2><textarea rows = "1" cols = "1%" name ="goalname2"></textarea>
                <center><table style = "width:100%" id="goaltable2">
                        <tr>
                            <th>Measure</th>
                            <th>Target</th>
                        </tr>
                        <tr>    
                            <td><textarea rows = "2" cols = "50%" name ="goal2measure1"></textarea></td>
                            <td><textarea rows = "2" cols = "50%" name ="goal2target1"></textarea></td>
                        </tr>
                        <tr>    
                            <td><textarea rows = "2" cols = "50%" name ="goal2measure2"></textarea></td>
                            <td><textarea rows = "2" cols = "50%" name ="goal2target2"></textarea></td>
                        </tr>
                        <tr>    
                            <td><textarea rows = "2" cols = "50%" name ="goal2measure3"></textarea></td>
                            <td><textarea rows = "2" cols = "50%" name ="goal2target3"></textarea></td>
                        </tr>

                        <input type="hidden" value="4" id="countmeasuregoal2" name="countmeasuregoal2">
                    </table></center>
                <br>
                <center>
                    <input type ="button" id="addRowButton" onclick ="addRow3()" value="Add row">  
                    <input type ="button" id="deleteRowButton" onclick ="deleteRow3()" value="Delete row">
                </center>
                <br>
            </div>

            <div class="add-goal">
                <h2>Goal 3: </h2><textarea rows = "1" cols = "1%" name ="goalname3"></textarea>
                <center><table style = "width:100%" id="goaltable3">
                        <tr>
                            <th>Measure</th>
                            <th>Target</th>
                        </tr>
                        <tr>    
                            <td><textarea rows = "2" cols = "50%" name ="goal3measure1"></textarea></td>
                            <td><textarea rows = "2" cols = "50%" name ="goal3target1"></textarea></td>
                        </tr>
                        <tr>    
                            <td><textarea rows = "2" cols = "50%" name ="goal3measure2"></textarea></td>
                            <td><textarea rows = "2" cols = "50%" name ="goal3target2"></textarea></td>
                        </tr>
                        <tr>    
                            <td><textarea rows = "2" cols = "50%" name ="goal3measure3"></textarea></td>
                            <td><textarea rows = "2" cols = "50%" name ="goal3target3"></textarea></td>
                        </tr>
                        
                         <input type="hidden" value="4" id="countmeasuregoal3" name="countmeasuregoal3">
                    </table></center>
                <br>
                <center>
                    <input type ="button" id="addRowButton" onclick ="addRow4()" value="Add row">  
                    <input type ="button" id="deleteRowButton" onclick ="deleteRow4()" value="Delete row">
                </center>
                <br>

                <div id="container"></div>
            </div>
            <br>
            <button type="submit" value="Submit" >Create KRA</button>
        </div>
    </form>

</body>

</html>