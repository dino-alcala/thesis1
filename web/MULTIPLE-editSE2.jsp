<%-- 
    Document   : MULTIPLE-createSE
    Created on : 06 12, 18, 1:25:42 PM
    Author     : Karl Madrid
--%>

<%@page import="dao.UserDAO"%>
<%@page import="entity.SE"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Edit SE Proposal</title>

        <link rel="stylesheet" href="css/formstyle5.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
                var count = document.getElementById("countresponsible").value;
                var table = document.getElementById("responsibletable");
                var rows = document.getElementById("responsibletable").rows.length;
                var row = table.insertRow(rows);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                cell1.innerHTML = "<td><textarea rows = '1' cols = '50%' name ='responsiblename" + count + "'></textarea></td>";
                cell2.innerHTML = "<td><textarea rows = '1' cols = '50%' name ='responsibleemail" + count + "'></textarea></td>";
                count++;
                document.getElementById("countresponsible").setAttribute('value', count);
            }

            function deleteRow() {
                var count = document.getElementById("countresponsible").value;
                var rows = document.getElementById("responsibletable").rows.length;
                if (rows - 1 > 0) {
                    document.getElementById("responsibletable").deleteRow(rows - 1);
                    count--;
                    document.getElementById("countresponsible").setAttribute('value', count);
                } else {

                }

            }

            function addRow2() {

                var count = document.getElementById("countproject").value;
                var table = document.getElementById("projectplantable");
                var rows = document.getElementById("projectplantable").rows.length;
                var row = table.insertRow(rows);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                var cell4 = row.insertCell(3);
                var cell5 = row.insertCell(4);
                cell1.innerHTML = "<td><input type ='date' name='date" + count + "'/></td>";
                cell2.innerHTML = "<textarea rows = '2' cols = '25%' name ='activity" + count + "'></textarea>";
                cell3.innerHTML = "<textarea rows = '2' cols = '25%' name ='time" + count + "'></textarea>";
                cell4.innerHTML = "<textarea rows = '2' cols = '25%' name ='timeend" + count + "'></textarea>";
                cell5.innerHTML = "<textarea rows = '2' cols = '25%' name ='venue" + count + "'></textarea>";
                count++;
                document.getElementById("countproject").setAttribute('value', count);
            }

            function deleteRow2() {
                var count = document.getElementById("countproject").value;

                var rows = document.getElementById("projectplantable").rows.length;
                if (rows - 1 > 0) {
                    document.getElementById("projectplantable").deleteRow(rows - 1);
                    count--;
                    document.getElementById("countproject").setAttribute('value', count);
                } else {

                }

            }

            function addRow3() {
                var count = document.getElementById("countexpenses").value;
                var table = document.getElementById("breakdowntable");
                var rows = document.getElementById("breakdowntable").rows.length;
                var row = table.insertRow(rows - 1);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                var cell4 = row.insertCell(3);
                cell1.innerHTML = "<td><textarea rows = '2' cols = '20%' name ='seitem" + count + "'></textarea></td>";
                cell2.innerHTML = "<td><textarea rows = '2' cols = '20%' name ='seunitcost" + count + "'></textarea></td>";
                cell3.innerHTML = "<td><textarea rows = '2' cols = '20%' name ='sequantity" + count + "'></textarea></td>";
                cell4.innerHTML = "<td><textarea rows = '2' cols = '20%' name ='sesubtotal" + count + "'></textarea></td>";
                count++;
                document.getElementById("countexpenses").setAttribute('value', count);
            }

            function deleteRow3() {
                var count = document.getElementById("countexpenses").value;
                var rows = document.getElementById("breakdowntable").rows.length;
                if (rows - 1 > 0) {
                    document.getElementById("breakdowntable").deleteRow(rows - 2);
                    count--;
                    document.getElementById("countexpenses").setAttribute('value', count);
                } else {

                }

            }

            function addRow4() {
                var table = document.getElementById("provisionstable");
                var rows = document.getElementById("provisionstable").rows.length;
                var row = table.insertRow(rows);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                cell1.innerHTML = '<td><textarea rows = "1" cols = "50%" name ="provisionsname"></textarea></td>';
                cell2.innerHTML = '<td><textarea rows = "1" cols = "50%" name ="provisionsemail"></textarea></td>';
            }

            function deleteRow4() {
                var rows = document.getElementById("provisionstable").rows.length;
                if (rows - 1 > 0) {
                    document.getElementById("provisionstable").deleteRow(rows - 1);
                } else {

                }

            }

        </script>

    </head>

    <body>
        <hr size="5" noshade>    
    <center><h1>Social Engagement Proposal</h1></center>
    <hr size="5" noshade>


    <div class="form-style-5">
        <form action = "editSE2" method="post">
            <%
                UserDAO UserDAO = new UserDAO();
                SE SE = new SE();
                SE = UserDAO.retrieveSEBySEID(Integer.parseInt(request.getParameter("seID").toString()));
            %>
            <h2>Work Plan - <%=SE.getActualDate()%></h2>    
            <fieldset>
                <center><table style = "width:100%" id = "projectplantable">
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

                            <td><input type ="date" name="date<%=i%>" value="<%=SE.getWorkplan().get(i).getDate()%>"/></td>
                            <td><textarea rows = "2" cols = "25%" name ="activity<%=i%>"><%=SE.getWorkplan().get(i).getActivity()%></textarea></td>
                            <td><textarea rows = "2" cols = "25%" name ="time<%=i%>"><%=SE.getWorkplan().get(i).getTimestarttimeend()%></textarea></td>
                            <td><textarea rows = "2" cols = "25%" name ="timeend<%=i%>"><%=SE.getWorkplan().get(i).getTimestarttimeend2()%></textarea></td>
                            <td><textarea rows = "2" cols = "25%" name ="venue<%=i%>"><%=SE.getWorkplan().get(i).getVenue()%></textarea></td>

                        </tr>
                        <%
                            }
                        %>
                        <input type="hidden" value="<%=SE.getWorkplan().size()%>" id="countproject" name="countproject">
                    </table></center>
                <br>
                <div>
                    <center><input type ="button" id="addRowButton" onclick ="addRow2()" value="Add Row">
                        <input style="background-color:red; border: red;" type ="button" id="addRowButton" onclick ="deleteRow2()" value="Delete Row"></center>
                </div>
            </fieldset>


            <h2>Breakdown of Expenses</h2>
            <input type="hidden" value="<%=SE.getExpenses().size()%>" id="countexpenses" name="countexpenses">
            <fieldset>
                <center><table style = "width:100%" id="breakdowntable">
                        <tr>
                            <th>Item</th>
                            <th>Unit Cost</th>
                            <th>Quantity</th>
                            <th>Subtotal</th>
                        </tr>
                        <%
                            for (int i = 0; i < SE.getExpenses().size(); i++) {
                        %>
                        <tr>
                            <td><textarea rows = "2" cols = "25%" name ="seitem<%=i%>"><%=SE.getExpenses().get(i).getItem()%></textarea></td>
                            <td><textarea rows = "2" cols = "25%" name ="seunitcost<%=i%>"><%=SE.getExpenses().get(i).getUnitcost()%></textarea></td>
                            <td><textarea rows = "2" cols = "25%" name ="sequantity<%=i%>"><%=SE.getExpenses().get(i).getQuantity()%></textarea></td>
                            <td><textarea rows = "2" cols = "25%" name ="sesubtotal<%=i%>"><%=SE.getExpenses().get(i).getSubtotal()%></textarea></td>
                        </tr>
                        <%
                            }
                        %>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>Grand Total: </td>
                        </tr>
                    </table></center>
                <br>
                <center><input type ="button" id="addRowButton" onclick ="addRow3()" value="Add Row">
                    <input style="background-color:red; border: red;" type ="button" id="deleteRowButton" onclick ="deleteRow3()" value="Delete Row"></center>
            </fieldset>

            <h2>Expected Participants vs. Total Population of the Unit</h2>
            <fieldset>
                <center><table style = "width:75%" id="breakdowntable">
                        <tr>
                            <th>Sector</th>
                            <th>Total<br> Population</th>
                            <th>Expected Number<br> of Participants</th>
                        </tr>
                        <tr>
                            <td>&nbsp;&nbsp;Academic Staff from the Unit</td>
                            <td><textarea rows = "1" cols = "10%" name ="seacademictotal"><%=SE.getTotalpopulationAcademicStaff()%></textarea></td>
                            <td><textarea rows = "1" cols = "10%" name ="seacademicexpected"><%=SE.getExpectedAcademicStaff()%></textarea></td>
                        </tr>
                        <tr>
                            <td>&nbsp;&nbsp;Support Staff from the Unit</td>
                            <td><textarea rows = "1" cols = "10%" name ="sesupporttotal"><%=SE.getTotalpopulationSupportStaff()%></textarea></td>
                            <td><textarea rows = "1" cols = "10%" name ="sesupportexpected"><%=SE.getExpectedSupportStaff()%></textarea></td>
                        </tr>
                        <tr>
                            <td>&nbsp;&nbsp;Undergraduate Students</td>
                            <td><textarea rows = "1" cols = "10%" name ="seundergraduatetotal"><%=SE.getTotalpopulationUndergraduate()%></textarea></td>
                            <td><textarea rows = "1" cols = "10%" name ="seundergraduateexpected"><%=SE.getExpectedUndergraduate()%></textarea></td>
                        </tr>
                        <tr>
                            <td>&nbsp;&nbsp;Graduate Students</td>
                            <td><textarea rows = "1" cols = "10%" name ="segraduatetotal"><%=SE.getTotalPopulationGraduate()%></textarea></td>
                            <td><textarea rows = "1" cols = "10%" name ="segraduateexpected"><%=SE.getExpectedGraduate()%></textarea></td>
                        </tr>

                    </table></center>
                <br>
            </fieldset>

            <fieldset>
                <h2>Persons Responsible</h2>
                <input type="hidden" value="<%=SE.getResponsible().size()%>" id="countresponsible" name="countresponsible">
                <center><table style = "width:100%" id="responsibletable">
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                        </tr>
                        <%
                            for (int i = 0; i < SE.getResponsible().size(); i++) {
                        %>
                        <tr>    
                            <td><textarea rows = "1" cols = "50%" name ="responsiblename<%=i%>"><%=SE.getResponsible().get(i).getName()%></textarea></td>
                            <td><textarea rows = "1" cols = "50%" name ="responsibleemail<%=i%>"><%=SE.getResponsible().get(i).getEmail()%></textarea></td>
                        </tr>
                        <%
                            }
                        %>
                    </table></center>
                <br>
                <center><input type ="button" id="addRowButton" onclick ="addRow()" value="Add Row">
                    <input style="background-color:red; border: red;" type ="button" id="deleteRowButton" onclick ="deleteRow()" value="Delete Row"></center>
            </fieldset>

            <button type="submit">Submit</button>
        </form>
    </div>
</body>

</html>