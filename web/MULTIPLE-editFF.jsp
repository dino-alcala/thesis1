<%-- 
    Document   : MULTIPLE-createFF
    Created on : 06 12, 18, 1:32:21 PM
    Author     : Karl Madrid
--%>

<%@page import="entity.FF"%>
<%@page import="dao.UserDAO"%>
<%@page import="entity.Community"%>
<%@page import="entity.KRA"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.OvplmDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Edit FF Proposal</title>

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

            th{
                padding:15px;
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
        </style>

        <script>
            function addRow(){

            var count = document.getElementById("countexpenses").value;
            var table = document.getElementById("breakdowntable");
            var rows = document.getElementById("breakdowntable").rows.length;
            var row = table.insertRow(rows - 1);
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
            cell1.innerHTML = "<td><textarea rows = '2' cols = '25%' name ='ffitem" + count + "'></textarea></td>";
            cell2.innerHTML = "<td><textarea rows = '2' cols = '25%' name ='ffunitcost" + count + "'></textarea></td>";
            cell3.innerHTML = "<td><textarea rows = '2' cols = '25%' name ='ffquantity" + count + "'></textarea></td>";
            cell4.innerHTML = "<td><textarea rows = '2' cols = '25%' name ='ffsubtotal" + count + "'></textarea></td>";
            count++;
            document.getElementById("countexpenses").setAttribute('value', count);
            }
            function deleteRow(){
            var count = document.getElementById("countexpenses").value;
            var rows = document.getElementById("breakdowntable").rows.length;
            if (rows - 1 > 0){
            document.getElementById("breakdowntable").deleteRow(rows - 2);
            count--;
            document.getElementById("countexpenses").setAttribute('value', count);
            } else {

            }
            }
        </script>

        <script type="text/javascript">
            <%
                UserDAO UserDAO = new UserDAO();

                FF FF = new FF();
                FF = UserDAO.retrieveFFByFFID(Integer.parseInt(request.getAttribute("ffID").toString()));

                OvplmDAO OvplmDAO = new OvplmDAO();
                ArrayList<KRA> k = new ArrayList();
                k = OvplmDAO.retrieveKRA();

            %>

            function changegoal(c1, c2) {

            var c1 = document.getElementById(c1);
            var c2 = document.getElementById(c2);
            c2.innerHTML = "";
            <%                    for (int i = 0; i < k.size(); i++) {
            %>
            if (c1.value == "<%=k.get(i).getId()%>") {
            var optionArray = ["|",<%for (int j = 0; j < k.get(i).getGoals().size(); j++) {%>"<%=k.get(i).getGoals().get(j).getGoalID()%>|<%=k.get(i).getGoals().get(j).getName()%>",<%}%>];
                }

            <%
                }
            %>

                for (var option in optionArray) {
                var pair = optionArray[option].split("|");
                var newOption = document.createElement("option");
                newOption.value = pair[0];
                newOption.innerHTML = pair[1];
                c2.options.add(newOption);
                }

                }

                function changemeasure(c1, c2) {

                var c1 = document.getElementById(c1);
                var c2 = document.getElementById(c2);
                c2.innerHTML = "";
            <%
                for (int i = 0; i < k.size(); i++) {
                    for (int j = 0; j < k.get(i).getGoals().size(); j++) {
            %>

                if (c1.value == "<%=k.get(i).getGoals().get(j).getGoalID()%>") {
                var optionArray = ["|",<%for (int l = 0; l < k.get(i).getGoals().get(j).getMeasures().size(); l++) {%>"<%=k.get(i).getGoals().get(j).getMeasures().get(l).getMeasureID()%>|<%=k.get(i).getGoals().get(j).getMeasures().get(l).getMeasure()%>",<%}%>];
                    }

            <%
                    }
                }
            %>

                    for (var option in optionArray) {
                    var pair = optionArray[option].split("|");
                    var newOption = document.createElement("option");
                    newOption.value = pair[0];
                    newOption.innerHTML = pair[1];
                    c2.options.add(newOption);
                    }

                    }
        </script>
    </head>

    <body>
        <hr size="5" noshade>    
    <center><h1>Faith Formation Program Proposal</h1></center>
    <hr size="5" noshade>

    <div class="form-style-5">
        <form action = "editFF" method="post">

            <fieldset>
                <legend>Unit: <%=FF.getUnit()%></legend>
            </fieldset>

            <fieldset>
                <legend>Department: <%=FF.getDepartment()%></legend>
            </fieldset>

            <fieldset>
                <legend>Program Head:</legend>
                <center><input type = "text" name ="programhead" value="<%=FF.getProgramHead()%>"></center>
            </fieldset>

            <fieldset>
                <legend>Activity Classification:</legend>
                Ex: Seminar/Workshop
                <center><input type = "text" name ="classification" value="<%=FF.getActivityClassification()%>"></center>
                <br><br>
            </fieldset>

            <fieldset>
                <legend><span class="number">1</span> Project Name:</legend>
                <center><input type = "text" name ="pname" value="<%=FF.getProjectName()%>"></center>
                <br>
            </fieldset>

            <fieldset>
                <legend><span class="number">2</span> Venue:</legend>
                <center><input type = "text" name ="pvenue" value="<%=FF.getVenue()%>"></center>
                <br>
            </fieldset>

            <fieldset>
                <legend><span class="number">3</span> Speaker:</legend>
                <center><input type = "text" name ="pspeaker" value="<%=FF.getSpeaker()%>"></center>
                <br>
            </fieldset>

            <fieldset>
                <legend><span class="number">4</span> Objectives:</legend>
                <center><textarea rows="3" cols = "50%" name="objectives"><%=FF.getObjectives()%></textarea></center>
                <br>
            </fieldset>

            <fieldset>
                <legend><span class="number">5</span><b> Actual Implementation Date:</b></legend>
                <center><input type = "date" name ="actualdate" value="<%=FF.getActualDate()%>"></center>
                <br>
            </fieldset>

            <fieldset>
                <legend><span class="number">6</span> Total Amount Requested:</legend>
                <center><input type = "text" name ="pbudget" value="<%=FF.getTotalAmount()%>"></center>
                <br>
            </fieldset>

            <fieldset>
                <legend><span class="number">7</span><b >Source of Funds:</b></legend>
                <center><select name="funds">
                        <option value="OVPLM" <% if (FF.getSourceOfFunds().equals("OVPLM")) {%> selected="selected" <%}%> >OVPLM</option>
                        <option value="Others" <% if (FF.getSourceOfFunds().equals("Others")) {%> selected="selected" <%}%> >Others</option>
                    </select></center>
                <br>
            </fieldset>


            <h2>Breakdown of Expenses:</h2>
            <input type="hidden" value="<%=FF.getExpenses().size()%>" id="countexpenses" name="countexpenses">
            <fieldset>
                <center><table style = "width:100%" id="breakdowntable">
                        <tr>

                            <th>Item</th>
                            <th>Unit Cost</th>
                            <th>Quantity</th>
                            <th>Subtotal</th>
                        </tr>
                        <%
                            for (int i = 0; i < FF.getExpenses().size(); i++) {
                        %>
                        <tr>
                            <td><textarea rows = "2" cols = "25%" name ="ffitem<%=i%>"><%=FF.getExpenses().get(i).getItem()%></textarea></td>
                            <td><textarea rows = "2" cols = "25%" name ="ffunitcost<%=i%>"><%=FF.getExpenses().get(i).getUnitcost()%></textarea></td>
                            <td><textarea rows = "2" cols = "25%" name ="ffquantity<%=i%>"><%=FF.getExpenses().get(i).getQuantity()%></textarea></td>
                            <td><textarea rows = "2" cols = "25%" name ="ffsubtotal<%=i%>"><%=FF.getExpenses().get(i).getSubtotal()%></textarea></td>
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
                <center><input type ="button" onclick ="addRow()" value="Click to Add Row">
                    <input style="background-color:red; border: red;" type ="button" onclick ="deleteRow()" value="Click to Delete Row"></center>
            </fieldset>

            <br><br><br><br>
            <center><button type = "submit" name="ffID" value="<%=FF.getId()%>">Next</button></center>
        </form>
    </div>
</body>
</html>
