<%-- 
    Document   : MULTIPLE-createSE
    Created on : 06 12, 18, 1:25:42 PM
    Author     : Karl Madrid
--%>

<%@page import="entity.FFexpenses"%>
<%@page import="entity.SEexpenses"%>
<%@page import="entity.KRA"%>
<%@page import="dao.OvplmDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entity.Community"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Update Used Budget FF</title>

        <link rel="stylesheet" href="css/formstyle5.css">

        <style>
            html {
                background: #e6e9e9;
                background-image: linear-gradient(270deg, rgb(230, 233, 233) 0%, rgb(216, 221, 221) 100%);
                -webkit-font-smoothing: antialiased;
                font-size:14px;
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

            b{
                font-weight: 600;
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
            h3{
                border-bottom: 2px solid green;
                border-top: 2px solid green;
                padding-bottom: 10px;
                padding-top: 10px;
                font-family: "Arial", Helvetica, sans-serif;
            }
            .btn-success{
                background-color: darkgreen;
                border: none;
                border-radius: 5px;
                color: white;
                padding: 10px 20px;
                text-align: center;
                display: inline-block;
                margin: 4px 2px;
                font-size: 16px;
                font-family: "Arial", Helvetica, sans-serif;
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

        <script type="text/javascript">
            <%
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
                var optionArray = ["|",<%for (int l = 0; l < k.get(i).getGoals().get(j).getMeasures().size(); l++) {%>"<%=k.get(i).getGoals().get(j).getMeasures().get(l).getMeasureID()%>|<%=k.get(i).getGoals().get(j).getMeasures().get(l).getDescription()%>",<%}%>];
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
    <center><h3>Faith Formation Engagement Proposal</h3></center>


    <div class="form-style-5">
        <form action="updateBudgetFF" method="post">
            <%
                UserDAO UserDAO = new UserDAO();
            %>

            <h2>Breakdown of Expenses</h2>
            <%
                ArrayList<FFexpenses> expenses = new ArrayList();
                expenses = UserDAO.retrieveExpensesFF(Integer.parseInt(request.getAttribute("ffID").toString()));
            %>
            <input type="hidden" value="<%=expenses.size()%>" id="countexpenses" name="countexpenses">
            <fieldset>
                <center><table style = "width:100%" id="breakdowntable">
                        <tr>
                            <th>Item</th>
                            <th>Unit Cost</th>
                            <th>Quantity</th>
                            <th>Subtotal</th>
                            <th>Amount Used</th>
                        </tr>

                        <%

                            double total = 0;

                            for (int i = 0; i < expenses.size(); i++) {
                                total += expenses.get(i).getQuantity() * expenses.get(i).getUnitcost();
                        %>
                        <tr>
                            <td><textarea style='border-radius:0px;' rows = "2" cols = "25%" name ="ffitem<%=i%>" readonly><%=expenses.get(i).getItem()%></textarea></td>
                            <td><textarea style='border-radius:0px;' rows = "2" cols = "25%" name ="ffunitcost<%=i%>" readonly><%=expenses.get(i).getUnitcost()%></textarea></td>
                            <td><textarea style='border-radius:0px;' rows = "2" cols = "25%" name ="ffquantity<%=i%>" readonly><%=expenses.get(i).getQuantity()%></textarea></td>
                            <td><textarea style='border-radius:0px;' rows = "2" cols = "25%" name ="ffsubtotal<%=i%>" readonly><%=expenses.get(i).getQuantity() * expenses.get(i).getUnitcost()%></textarea></td>
                            <td><textarea style='border-radius:0px;' rows = "2" cols = "25%" name ="ffamountused<%=i%>"><%=expenses.get(i).getAmountUsed()%></textarea></td>
                            <td></td>
                        </tr>
                        <input type="hidden" name="ffID<%=i%>" value="<%=expenses.get(i).getFfproposalID()%>">
                        <%
                            }
                        %>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>Grand Total: <%=total%></td>
                            <td></td>
                        </tr>
                    </table></center>
                <br>
            </fieldset>

            <br><br>
            
            <center><button type="submit" name="FF" value="<%=request.getAttribute("ffID")%>" class="btn-success">Update</button></center>
        </form>
    </div>
</body>

</html>