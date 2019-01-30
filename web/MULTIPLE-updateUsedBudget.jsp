<%-- 
    Document   : MULTIPLE-createSE
    Created on : 06 12, 18, 1:25:42 PM
    Author     : Karl Madrid
--%>

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
        <title>Update Used Budget SE</title>

        <link rel="stylesheet" href="css/formstyle5.css">

        <style>
            
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
                font-family: "Arial", Helvetica, sans-serif;
                font-size: 16px;
                line-height: 1.5;
                margin: 0 auto;
                max-width: 800px;
                padding: 2em 2em 4em;
            }

            h1{
                font-family: "Arial", Helvetica, sans-serif;
                font-size: 20px;
                border-bottom: 2px solid green;
                border-top: 2px solid green;
                padding-bottom: 10px;
                padding-top: 10px;
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
                font-family: "Arial", Helvetica, sans-serif;
            }

            table {
                border-collapse: collapse;

            }
            
            th{
                padding:15px;
            }

            p{
                margin-left: 10px;
                font-family: "Arial", Helvetica, sans-serif;
            }
            
            .btn-success{
                background-color: darkgreen;
                border: none;
                border-radius: 5px;
                color: white;
                padding: 8px 10px;
                text-align: center;
                display: inline-block;
                margin: 4px 2px;
                font-size: 12px;
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
        
        <script>
            function goBack() {
                window.history.back()
              }
        </script>
    </head>

    <body>
    <center><h1>Social Engagement Proposal</h1></center>


    <div class="form-style-5">
        <form action="updateBudget" method="post" enctype="multipart/form-data">
            <%
                UserDAO UserDAO = new UserDAO();
            %>

            <h4>Breakdown of Expenses</h4>
            <%
                ArrayList<SEexpenses> expenses = new ArrayList();
                expenses = UserDAO.retrieveExpenses(Integer.parseInt(request.getAttribute("seID").toString()));
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
                            <th>Date</th>
                        </tr>
                        <%
                            double total = 0;
                            for (int i = 0; i < expenses.size(); i++) {
                                total += expenses.get(i).getQuantity() * expenses.get(i).getUnitcost();
                        %>
                        <tr>
                            <td><textarea style='border-radius:0px;' rows = "2" cols = "25%" name ="seitem<%=i%>" readonly><%=expenses.get(i).getItem()%></textarea></td>
                            <td><textarea style='border-radius:0px;' rows = "2" cols = "25%" name ="seunitcost<%=i%>" readonly><%=expenses.get(i).getUnitcost()%></textarea></td>
                            <td><textarea style='border-radius:0px;' rows = "2" cols = "25%" name ="sequantity<%=i%>" readonly><%=expenses.get(i).getQuantity()%></textarea></td>
                            <td><textarea style='border-radius:0px;' rows = "2" cols = "25%" name ="sesubtotal<%=i%>" readonly><%=expenses.get(i).getQuantity() * expenses.get(i).getUnitcost()%></textarea></td>
                            <td><textarea style='border-radius:0px;' rows = "2" cols = "25%" name ="seamountused<%=i%>"><%=expenses.get(i).getAmountUsed()%></textarea></td>
                            <td><textarea style='border-radius:0px;' rows = "2" cols = "25%" readonly><%=expenses.get(i).getDatetime()%></textarea></td>
                        </tr>
                        <input type="hidden" name="seID<%=i%>" value="<%=expenses.get(i).getSeproposalID()%>">
                        <%
                            }
                        %>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>Grand Total: <%=total%></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table></center>
                <br>
            </fieldset>

            <br><br>
            <center><button type="submit" name="SE" value="<%=request.getAttribute("seID")%>" class="btn-success">Update</button>
                <button type="submit" name="back" value="<%=request.getAttribute("seID")%>" class="btn-success" style="background-color:red">Back</button></center>
            
        </form>
    </div>
</body>

</html>