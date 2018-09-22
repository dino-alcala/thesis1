<%-- 
    Document   : MULTIPLE-createAccomplishmentReport2
    Created on : 07 4, 18, 7:20:35 PM
    Author     : Karl Madrid
--%>

<%@page import="entity.SEexpenses"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.SE"%>
<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Project Proposal</title>


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

                max-width: 100%;
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
                margin-bottom: -5px;
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
            th{
                padding:15px;
            }

            #addRowButton {
                padding: 10px;
                padding-right: 17px;
                padding-left: 17px;
            }

            #deleteRowButton {
                padding: 10px;
                background-color: red;
            }

            #addRowButton, #deleteRowButton {
                display:inline-block;
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

        <script type='text/javascript'>


            function addRow() {
                var count = document.getElementById("countobjectives").value;
                var table = document.getElementById("objectives");
                var rows = document.getElementById("objectives").rows.length;
                var row = table.insertRow(rows - 1);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                cell1.innerHTML = "<td><textarea rows = '2' cols = '20%' name='expected" + count + "'></textarea></td>";
                cell2.innerHTML = "<td><textarea rows = '2' cols = '20%' name='actual" + count + "'></textarea></td>";
                cell3.innerHTML = "<td><textarea rows = '2' cols = '20%' name='hinder" + count + "'></textarea></td>";
                count++;
                document.getElementById("countobjectives").setAttribute('value', count);
            }

            function addRow2() {
                var count = document.getElementById("countovplm").value;
                var table = document.getElementById("uce");
                var rows = document.getElementById("uce").rows.length;
                var row = table.insertRow(rows - 1);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                var cell4 = row.insertCell(3);
                var cell5 = row.insertCell(4);
                cell1.innerHTML = "<td><textarea rows = '2' cols = '20%' name='item" + count + "'></textarea></td>";
                cell2.innerHTML = "<td><textarea rows = '2' cols = '20%' name='approved" + count + "'></textarea></td>";
                cell3.innerHTML = "<td><textarea rows = '2' cols = '20%' name='expended" + count + "'></textarea></td>";
                cell4.innerHTML = "<td><textarea rows = '2' cols = '20%' name='variance" + count + "'></textarea></td>";
                cell5.innerHTML = "<td><textarea rows = '2' cols = '20%' name='reason" + count + "'></textarea></td>";
                count++;
                document.getElementById("countovplm").setAttribute('value', count);

            }

            function addRow3() {
                var count = document.getElementById("countothers").value;
                var table = document.getElementById("others");
                var rows = document.getElementById("others").rows.length;
                var row = table.insertRow(rows - 1);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                var cell4 = row.insertCell(3);
                var cell5 = row.insertCell(4);
                cell1.innerHTML = "<td><textarea rows = '2' cols = '20%' name='item" + count + "'></textarea></td>";
                cell2.innerHTML = "<td><textarea rows = '2' cols = '20%' name='approved" + count + "'></textarea></td>";
                cell3.innerHTML = "<td><textarea rows = '2' cols = '20%' name='expended" + count + "'></textarea></td>";
                cell4.innerHTML = "<td><textarea rows = '2' cols = '20%' name='variance" + count + "'></textarea></td>";
                cell5.innerHTML = "<td><textarea rows = '2' cols = '20%' name='reason" + count + "'></textarea></td>";
                count++;
                document.getElementById("countothers").setAttribute('value', count);

            }

            function deleteRow() {
                var count = document.getElementById("countobjectives").value;
                var rows = document.getElementById("objectives").rows.length;
                if (rows - 1 > 1) {
                    document.getElementById("objectives").deleteRow(rows - 2);
                    count--;
                    document.getElementById("countobjectives").setAttribute('value', count);
                } else {

                }
            }

            function deleteRow2() {
                var count = document.getElementById("countovplm").value;
                var rows = document.getElementById("uce").rows.length;
                if (rows - 1 > 1) {
                    document.getElementById("uce").deleteRow(rows - 2);
                    count--;
                    document.getElementById("countovplm").setAttribute('value', count);
                } else {

                }
            }

            function deleteRow3() {
                var count = document.getElementById("countothers").value;
                var rows = document.getElementById("others").rows.length;
                if (rows - 1 > 1) {
                    document.getElementById("others").deleteRow(rows - 2);
                    count--;
                    document.getElementById("countothers").setAttribute('value', count);
                } else {

                }
            }

        </script>

    </head>
    <body>

        <hr size="5" noshade>    
    <center><h1>Program Accomplishment Report Form</h1></center>
    <hr size="5" noshade>

    <div class="form-style-5">
        <form action="createSEreport3" method="post">
            <%
                UserDAO UserDAO = new UserDAO();
                SE SE = new SE();
                SE = UserDAO.retrieveSEBySEID(Integer.parseInt(request.getParameter("seID")));
            %>
            <fieldset>
                <h2><span class="number">2</span><b> Executive Summary</b></h2>              
            </fieldset>


            <fieldset>
                <legend><b> What is the significance of the project?<b></legend>
                            <center><textarea rows="10" cols="90%" name="significance"></textarea> </center>
                            <br>
                            </fieldset>

                            <fieldset>
                                <legend> What happened in the implementation of the project?</legend>
                                <center><textarea rows="10" cols="90%" name="implementation"></textarea> </center>
                                <br>
                            </fieldset>

                            <fieldset>
                                <legend> When and where was the project implemented?</legend>
                                <center><textarea rows="10" cols="90%" name="whenwhere"></textarea> </center>
                                <br>
                            </fieldset>

                            <fieldset>
                                <legend> Who were the participants?</legend>
                                <center><textarea rows="10" cols="90%" name="whoparticipants"></textarea> </center>
                                <br>
                            </fieldset>

                            <fieldset>
                                <legend> What are the highlights of the project?</legend>
                                <center><textarea rows="10" cols="90%" name="highlights"></textarea> </center>
                                <br>
                            </fieldset>

                            <fieldset>
                                <h2><span class="number">3</span><b> Accomplishment of Objectives</b></h2>              
                            </fieldset>

                            <fieldset>
                                <input type="hidden" name="countobjectives" id="countobjectives" value="1">
                                <center><table style = "width:100%" id="objectives">
                                        <tr>
                                            <th>Expected Outcomes</th>
                                            <th>Actual Accomplishment</th>
                                            <th>Hindering Factors</th>
                                        </tr>
                                        <tr>
                                            <td><textarea rows = "2" cols = "20%" name ="expected0"></textarea></td>
                                            <td><textarea rows = "2" cols = "20%" name ="actual0"></textarea></td>
                                            <td><textarea rows = "2" cols = "20%" name ="hinder0"></textarea></td>
                                        </tr>

                                    </table></center>
                                <br>
                                <center><input type ="button" id="addRowButton" onclick ="addRow()" value="Add Row">
                                    <input id="deleteRowButton" type ="button" onclick ="deleteRow()" value="Delete Row"></center>
                                <br>
                            </fieldset>

                            <fieldset>
                                <h2><span class="number">4</span><b> Financial Aspect</b></h2>              
                            </fieldset>

                            <fieldset>
                                <%
                                    ArrayList<SEexpenses> expenses = new ArrayList();
                                    expenses = UserDAO.retrieveExpenses(Integer.parseInt(request.getParameter("seID").toString()));
                                %>
                                <%
                                    if (SE.getSourceOfFunds().equals("OVPLM")) {
                                %>
                                <input type="hidden" name="countovplm" id="countovplm" value="<%=expenses.size()%>">
                                <legend><b> Grant from OVPLM fund</b></legend>
                                <center><table style = "width:100%" id="uce">
                                        <tr>
                                            <th>Line Item</th>
                                            <th>Approved Amount</th>
                                            <th>Expended Amount</th>
                                            <th>Variance (Approved minus Expended Amount)</th>
                                            <th>Reason for Variance</th>
                                        </tr>
                                        <%
                                            for (int i = 0; i < expenses.size(); i++) {
                                        %>
                                        <tr>
                                            <td><textarea rows = "2" cols = "20%" name ="item<%=i%>" readonly><%=expenses.get(i).getItem()%></textarea></td>
                                            <td><textarea rows = "2" cols = "20%" name ="approved<%=i%>" readonly><%=expenses.get(i).getUnitcost() * expenses.get(i).getQuantity()%></textarea></td>
                                            <td><textarea rows = "2" cols = "20%" name ="expended<%=i%>" readonly><%=expenses.get(i).getAmountUsed()%></textarea></td>
                                            <td><textarea rows = "2" cols = "20%" name ="variance<%=i%>" readonly><%=(expenses.get(i).getUnitcost() * expenses.get(i).getQuantity()) - expenses.get(i).getAmountUsed()%></textarea></td>
                                            <td><textarea rows = "2" cols = "20%" name ="reason<%=i%>"></textarea></td>
                                        </tr>
                                        <%
                                            }
                                        %>

                                    </table></center>
                                <br>
                                <center><input type ="button" id="addRowButton" onclick ="addRow2()" value="Add Row">
                                    <input id="deleteRowButton" type ="button" onclick ="deleteRow2()" value="Delete Row"></center>
                                <br>
                                <br>
                                <%
                                } else {
                                %>
                                <input type="hidden" name="countothers" id="countothers" value="1">
                                <legend><b> Grant from other sources</b></legend>
                                <center><table style = "width:100%" id="others">
                                        <tr>
                                            <th>Line Item</th>
                                            <th>Approved Amount</th>
                                            <th>Expended Amount</th>
                                            <th>Variance (Approved minus Expended Amount)</th>
                                            <th>Reason for Variance</th>
                                        </tr>
                                        <%
                                            for (int i = 0; i < expenses.size(); i++) {
                                        %>
                                        <tr>
                                            <td><textarea rows = "2" cols = "20%" name ="item<%=i%>" readonly><%=expenses.get(i).getItem()%></textarea></td>
                                            <td><textarea rows = "2" cols = "20%" name ="approved<%=i%>" readonly><%=expenses.get(i).getUnitcost() * expenses.get(i).getQuantity()%></textarea></td>
                                            <td><textarea rows = "2" cols = "20%" name ="expended<%=i%>" readonly><%=expenses.get(i).getAmountUsed()%></textarea></td>
                                            <td><textarea rows = "2" cols = "20%" name ="variance<%=i%>" readonly><%=(expenses.get(i).getUnitcost() * expenses.get(i).getQuantity()) - expenses.get(i).getAmountUsed()%></textarea></td>
                                            <td><textarea rows = "2" cols = "20%" name ="reason<%=i%>"></textarea></td>
                                        </tr>
                                        <%
                                            }
                                        %>

                                    </table></center>
                                <br>
                                <center><input type ="button" id="addRowButton" onclick ="addRow3()" value="Add Row">
                                    <input id="deleteRowButton" type ="button" onclick ="deleteRow3()" value="Delete Row"></center>
                                    <%
                                        }
                                    %>
                            </fieldset>

                            <br><br>
                            <button type="submit" name="funds" value="<%=SE.getSourceOfFunds()%>">Next</button>
                            </form>
                            </div>
                            </body>



                            </html>
