<%-- 
    Document   : MULTIPLE-evaluateFF
    Created on : 07 24, 18, 5:56:37 PM
    Author     : Karl Madrid
--%>

<%@page import="entity.FFreport"%>
<%@page import="entity.FF"%>
<%@page import="dao.UserDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>FF Program Evaluation</title>

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
            
            #inputText{
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
                padding: 8px 15px;
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

        <script type='text/javascript'>

            function addField() {
                container.appendChild(document.createTextNode("Name: "));
                var input = document.createElement("input");
                input.type = "text";
                input.name = "member";
                container.appendChild(input);
                container.appendChild(document.createElement("br"));
                container.appendChild(document.createElement("br"));
            }

            function addRow() {
                var table = document.getElementById("projectplantable");
                var rows = document.getElementById("projectplantable").rows.length;
                var row = table.insertRow(rows);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                var cell4 = row.insertCell(3);
                cell1.innerHTML = '<td><input type ="date"/></td>';
                cell2.innerHTML = '<textarea rows = "2" cols = "25%" name ="planoutput"></textarea>';
                cell3.innerHTML = '<textarea rows = "2" cols = "25%" name ="planoutput"></textarea>';
                cell4.innerHTML = '<textarea rows = "2" cols = "25%" name ="planoutput"></textarea>';
            }

            function deleteRow() {
                var rows = document.getElementById("projectplantable").rows.length;
                if (rows - 1 > 0) {
                    document.getElementById("projectplantable").deleteRow(rows - 1);
                } else {

                }

            }

        </script>

    </head>

    <body>
    <center><h1>FAITH FORMATION - EVALUATION</h1></center>

    <form action = "addFFevaluation" method="post">
        <%
            UserDAO UserDAO = new UserDAO();
            FF FF = new FF();
            FF = UserDAO.retrieveFFByFFID(Integer.parseInt(request.getAttribute("ffID").toString()));

            FFreport FFreport = new FFreport();
            FFreport = UserDAO.retrieveFFreportByFFID(Integer.parseInt(request.getAttribute("ffID").toString()));
        %>
        <div class="form-style-5">

            <fieldset>
                <legend><b>Date of Activity: <%=FF.getActualDate()%></b></legend>
                <br><br>
            </fieldset>

            <fieldset>
                <legend><b>Location of Activity: <%=FF.getVenue()%></b></legend>
                <br><br>
            </fieldset>

            <fieldset>
                <legend><b>Facilitator: <%=FFreport.getNameOfFacilitator()%></b></legend>
                <br>
            </fieldset>

            <fieldset>
                <legend><b>Name (optional):</b></legend>
                <center><input type = "text" name ="name"></center>
                <br><br>
            </fieldset>

            <p>SCALE:<br> 
                <b>5</b>- Highest Rating<br>
                <b>1</b>- Lowest Rating<br></p>
            <br><br>

            <fieldset>
                <center><table style = "width:100%" id = "FFEvaluation">
                        <tr>
                            <th>Criteria</th>
                            <th>5</th>
                            <th>4</th>
                            <th>3</th>
                            <th>2</th>
                            <th>1</th>
                            <th>NEI</th>
                            <th>N/A</th>
                        </tr>
                        <tr>
                            <td><p>The announcements and reminders about the retreat were enough. </p></td>
                            <td><center><input type="radio" size = "10%" name="q1" value="5"></center></td>
                        <td><center><input type="radio" size = "10%" name="q1" value="4"></center></td>
                        <td><center><input type="radio" size = "10%" name="q1" value="3"></center></td>
                        <td><center><input type="radio" size = "10%" name="q1" value="2"></center></td>
                        <td><center><input type="radio" size = "10%" name="q1" value="1"></center></td>
                        <td><center><input type="radio" size = "10%" name="q1" value="6"></center></td>
                        <td><center><input type="radio" size = "10%" name="q1" value="7"></center></td>
                        </tr>
                        <tr>
                            <td><p>The registration process was simple and easy.</p></td>
                            <td><center><input type="radio" size = "10%" name="q2" value="5"></center></td>
                        <td><center><input type="radio" size = "10%" name="q2" value="4"></center></td>
                        <td><center><input type="radio" size = "10%" name="q2" value="3"></center></td>
                        <td><center><input type="radio" size = "10%" name="q2" value="2"></center></td>
                        <td><center><input type="radio" size = "10%" name="q2" value="1"></center></td>
                        <td><center><input type="radio" size = "10%" name="q2" value="6"></center></td>
                        <td><center><input type="radio" size = "10%" name="q2" value="7"></center></td>
                        </tr>
                        <tr>
                            <td><p>The venue was suited for the activity.</p></td>
                            <td><center><input type="radio" size = "10%" name="q3" value="5"></center></td>
                        <td><center><input type="radio" size = "10%" name="q3" value="4"></center></td>
                        <td><center><input type="radio" size = "10%" name="q3" value="3"></center></td>
                        <td><center><input type="radio" size = "10%" name="q3" value="2"></center></td>
                        <td><center><input type="radio" size = "10%" name="q3" value="1"></center></td>
                        <td><center><input type="radio" size = "10%" name="q3" value="6"></center></td>
                        <td><center><input type="radio" size = "10%" name="q3" value="7"></center></td>
                        </tr>
                        <tr>
                            <td><p>The food was sufficient, balanced/healthy, and delicious.</p></td>
                            <td><center><input type="radio" size = "10%" name="q4" value="5"></center></td>
                        <td><center><input type="radio" size = "10%" name="q4" value="4"></center></td>
                        <td><center><input type="radio" size = "10%" name="q4" value="3"></center></td>
                        <td><center><input type="radio" size = "10%" name="q4" value="2"></center></td>
                        <td><center><input type="radio" size = "10%" name="q4" value="1"></center></td>
                        <td><center><input type="radio" size = "10%" name="q4" value="6"></center></td>
                        <td><center><input type="radio" size = "10%" name="q4" value="7"></center></td>
                        </tr>
                        <tr>
                            <td><p>The rooms allowed me to rest well and provided what I needed.</p></td>
                            <td><center><input type="radio" size = "10%" name="q5" value="5"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5" value="4"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5" value="3"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5" value="2"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5" value="1"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5" value="6"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5" value="7"></center></td>
                        </tr>
                        <tr>
                            <td><p>Transportation was comfortable and safe.</p></td>
                            <td><center><input type="radio" size = "10%" name="q6" value="5"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6" value="4"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6" value="3"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6" value="2"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6" value="1"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6" value="6"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6" value="7"></center></td>
                        </tr>
                        <tr>
                            <td><p>Overall, my experience in the retreat was meaningful.</p></td>
                            <td><center><input type="radio" size = "10%" name="q7" value="5"></center></td>
                        <td><center><input type="radio" size = "10%" name="q7" value="4"></center></td>
                        <td><center><input type="radio" size = "10%" name="q7" value="3"></center></td>
                        <td><center><input type="radio" size = "10%" name="q7" value="2"></center></td>
                        <td><center><input type="radio" size = "10%" name="q7" value="1"></center></td>
                        <td><center><input type="radio" size = "10%" name="q7" value="6"></center></td>
                        <td><center><input type="radio" size = "10%" name="q7" value="7"></center></td>
                        </tr>
                        <tr>
                            <td><p><b>[THIS QUESTION IS FOR ORGANIZERS ONLY]</b> Coordination with LSPO regarding this retreat was efficient.</p></td>
                            <td><center><input type="radio" size = "10%" name="q8" value="5"></center></td>
                        <td><center><input type="radio" size = "10%" name="q8" value="4"></center></td>
                        <td><center><input type="radio" size = "10%" name="q8" value="3"></center></td>
                        <td><center><input type="radio" size = "10%" name="q8" value="2"></center></td>
                        <td><center><input type="radio" size = "10%" name="q8" value="1"></center></td>
                        <td><center><input type="radio" size = "10%" name="q8" value="6"></center></td>
                        <td><center><input type="radio" size = "10%" name="q8" value="7"></center></td>
                        </tr>
                        <tr>
                            <td><p>Please give an overall rating for the program</p></td>
                            <td><center><input type="radio" size = "10%" name="q9" value="5"></center></td>
                        <td><center><input type="radio" size = "10%" name="q9" value="4"></center></td>
                        <td><center><input type="radio" size = "10%" name="q9" value="3"></center></td>
                        <td><center><input type="radio" size = "10%" name="q9" value="2"></center></td>
                        <td><center><input type="radio" size = "10%" name="q9" value="1"></center></td>
                        <td><center><input type="radio" size = "10%" name="q9" value="6"></center></td>
                        <td><center><input type="radio" size = "10%" name="q9" value="7"></center></td>
                        </tr>
                    </table></center>
                <br>
                <p>One important learning I had was...</p>
                <center><input id="inputText" type = "text" name ="learning"></center>
                <p>One memorable activity was...</p>
                <center><input id="inputText" type = "text" name ="memorable"></center>
                <p>Comments, suggestions, and recommendations</p>
                <center><input id="inputText" type = "text" name ="feedback"></center>
                <br>
                <center><p>Thank you very much!</p></center>
            </fieldset>

            <center><button class="btn-success" type="submit" name="ffID" value="<%=FF.getId()%>">Submit</button></center>

        </div>
    </form>
</body>

</html>
