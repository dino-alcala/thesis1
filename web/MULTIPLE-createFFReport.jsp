<%-- 
    Document   : MULTIPLE-createFFReport
    Created on : 07 10, 18, 7:27:16 PM
    Author     : Karl Madrid
--%>

<%@page import="entity.FF"%>
<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Create FF Completion Report</title>

        <link rel="stylesheet" href="css/formstyle5.css">


        <style>
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
                var count = document.getElementById("countparticipants").value;
                var table = document.getElementById("participants");
                var rows = document.getElementById("participants").rows.length;
                var row = table.insertRow(rows - 1);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                cell1.innerHTML = "<td><textarea rows = '2' cols = '20%' name='classification" + count + "'></textarea></td>";
                cell2.innerHTML = "<td><textarea rows = '2' cols = '20%' name='number" + count + "'></textarea></td>";
                count++;
                document.getElementById("countparticipants").setAttribute('value', count);
            }

            function addRow2() {
                var table = document.getElementById("expenditures");
                var rows = document.getElementById("expenditures").rows.length;
                var row = table.insertRow(rows - 1);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                cell1.innerHTML = '<td><textarea rows = "2" cols = "20%" name="source"></textarea></td>';
                cell2.innerHTML = '<td><textarea rows = "2" cols = "20%" name="amount"></textarea></td>';
            }

            function deleteRow() {
                var count = document.getElementById("countparticipants").value;
                var rows = document.getElementById("participants").rows.length;
                if (rows - 1 > 1) {
                    document.getElementById("participants").deleteRow(rows - 2);
                    count--;
                    document.getElementById("countparticipants").setAttribute('value', count);
                } else {

                }
            }

            function deleteRow2() {
                var rows = document.getElementById("expenditures").rows.length;
                if (rows - 1 > 1) {
                    document.getElementById("expenditures").deleteRow(rows - 2);
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


        <form action="createFFreport2" method="post">
            <%
                UserDAO UserDAO = new UserDAO();
                FF FF = new FF();
                FF = UserDAO.retrieveFFByFFID(Integer.parseInt(request.getAttribute("ffID").toString()));
            %>
            <fieldset>
                <h2><span class="number">1</span><b> Information Identification</b></h2>              
            </fieldset>

            <fieldset>
                <legend><b>Activity Title</b></legend>
                <center><input id="fname" name="name" size="50" type="text" readonly value="<%=FF.getProjectName()%>"></center>
                <br>
            </fieldset>

            <fieldset>
                <legend><b>Target KRA:</b> </legend>
                <input name="kra" size="50" type="text" readonly value="<%=UserDAO.getKRAnameByID(FF.getTargetKRA())%>">
                <br><br>
            </fieldset>

            <fieldset>
                <legend><b>Target Goal:</b> </legend>
                <input name="goal" size="50" type="text" readonly value="<%=UserDAO.getGoalnameByID(FF.getTargetGoal())%>">
                <br><br>
            </fieldset>

            <fieldset>
                <legend><b>Target Measure:</b> </legend>
                <input name="measure" size="50" type="text" readonly value="<%=UserDAO.getMeasurenameByID(FF.getTargetMeasure())%>">
                <br>
            </fieldset>
            <br/>

            <fieldset>  
                <legend><b>Project Proponents/s (College / Department / Unit)</b></legend>
                <center><input id="fname" name="proponents" size="50" type="text"></center>
                <br>
            </fieldset>

            <fieldset>  
                <legend><b>Person Responsible</b></legend>
                <center><input id="fname" name="responsible" size="50" type="text"></center>
                <br>
            </fieldset>

            <fieldset>  
                <legend><b>Name of Facilitator:</b></legend>
                <center><input id="fname" name="facilitator" size="50" type="text"></center>
                <br>
            </fieldset>

            <fieldset>
                <input type="hidden" name="countparticipants" id="countparticipants" value="1">
                <legend><b>List of DLSU Participants</b></legend>
                <center><table style = "width:100%" id="participants">
                        <tr>
                            <th>Classification (ASF, CAP, etc.)</th>
                            <th>Number of Individuals</th>
                        </tr>
                        <tr>
                            <td><textarea rows = "2" cols = "20%" name ="classification0"></textarea></td>
                            <td><textarea rows = "2" cols = "20%" name ="number0"></textarea></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>Total:</td>
                        </tr>

                    </table></center>
                <br>
                <center><input type ="button" id="addRowButton" onclick ="addRow()" value="Add Row">
                    <input id="deleteRowButton" type ="button" onclick ="deleteRow()" value="Delete Row"></center>
                <br>
            </fieldset>

            <fieldset>  
                <legend><b>Amount of Grants Received from OVPLM or Others:</b></legend>
                <center><input id="fname" name="source" size="50" readonly value="<%=FF.getTotalAmount()%>" type="text"></center>
                <br>
            </fieldset>

            <br><br>
            <button type="submit" name="ffID" value="<%=FF.getId()%>">Next</button>
        </form>
    </div>
</body>



</html>
