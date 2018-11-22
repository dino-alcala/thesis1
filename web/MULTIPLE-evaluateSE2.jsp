<%-- 
    Document   : MULTIPLE-evaluateSE2
    Created on : 07 24, 18, 5:39:44 PM
    Author     : Karl Madrid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>SE Program Evaluation</title>

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
    <center><h1>STUDENT / EMPLOYEE EVALUATION OF SOCIAL-ENGAGEMENT EXPERIENCE / ACTIVITY</h1></center>

    <div class="form-style-5">
        <form action = "addSEevaluation2" method="post">
            <fieldset>
                <center><table style = "width:100%" id = "SEEvaluation">
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
                            <td><b><p>5. LASALLIAN VALUES</b></p></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><p>5.1. There was an opportunity to see and experience the situation of the community.</p></td>
                            <td><center><input type="radio" size = "10%" name="q5.1" value="5"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5.1" value="4"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5.1" value="3"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5.1" value="2"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5.1" value="1"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5.1" value="6"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5.1" value="7"></center></td>
                        </tr>
                        <tr>
                            <td><p>5.2. There was an opportunity to analyze and reflect on the symptoms and causes of the community issue / problem being addressed.</p></td>
                            <td><center><input type="radio" size = "10%" name="q5.2" value="5"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5.2" value="4"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5.2" value="3"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5.2" value="2"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5.2" value="1"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5.2" value="6"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5.2" value="7"></center></td>
                        </tr>
                        <tr>
                            <td><p>5.3. The project was a result of an analysis-reflection process on the community / partner situation.</p></td>
                            <td><center><input type="radio" size = "10%" name="q5.3" value="5"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5.3" value="4"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5.3" value="3"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5.3" value="2"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5.3" value="1"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5.3" value="6"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5.3" value="7"></center></td>
                        </tr>
                        <tr>
                            <td><p>5.4. The project respected the dignity of all stakeholders.</p></td>
                            <td><center><input type="radio" size = "10%" name="q5.4" value="5"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5.4" value="4"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5.4" value="3"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5.4" value="2"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5.4" value="1"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5.4" value="6"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5.4" value="7"></center></td>
                        </tr>
                        <tr>
                            <td><p>5.5. The partner organization/community members were involved in the consultation, planning, implementation and evaluation of the program/ project.</p></td>
                            <td><center><input type="radio" size = "10%" name="q5.5" value="5"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5.5" value="4"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5.5" value="3"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5.5" value="2"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5.5" value="1"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5.5" value="6"></center></td>
                        <td><center><input type="radio" size = "10%" name="q5.5" value="7"></center></td>
                        </tr>
                        <tr>
                            <td><b><p>6. PROGRAM MANAGEMENT</b></p></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><p>6.1. The social engagement project can be continued or sustained by the partner organization on their own.</p></td>
                            <td><center><input type="radio" size = "10%" name="q6.1" value="5"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.1" value="4"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.1" value="3"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.1" value="2"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.1" value="1"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.1" value="6"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.1" value="7"></center></td>
                        </tr>
                        <tr>
                            <td><p>6.2. Everyone in our group was able to perform and complete her / his assigned tasks.</p></td>
                            <td><center><input type="radio" size = "10%" name="q6.2" value="5"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.2" value="4"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.2" value="3"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.2" value="2"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.2" value="1"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.2" value="6"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.2" value="7"></center></td>
                        </tr>
                        <tr>
                            <td><p>6.3. The group received clear, relevant, and immediate communication from partner coordinators for project-related concerns.</p></td>
                            <td><center><input type="radio" size = "10%" name="q6.3" value="5"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.3" value="4"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.3" value="3"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.3" value="2"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.3" value="1"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.3" value="6"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.3" value="7"></center></td>
                        </tr>
                        <tr>
                            <td><p>6.4. The Social Engagement Coordinator provided briefing/orientation.</p></td>
                            <td><center><input type="radio" size = "10%" name="q6.4" value="5"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.4" value="4"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.4" value="3"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.4" value="2"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.4" value="1"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.4" value="6"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.4" value="7"></center></td>
                        </tr>
                        <tr>
                            <td><p>6.5. The partner organization/community provided in-depth organizational profile and program orientation.</p></td>
                            <td><center><input type="radio" size = "10%" name="q6.5" value="5"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.5" value="4"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.5" value="3"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.5" value="2"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.5" value="1"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.5" value="6"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.5" value="7"></center></td>
                        </tr>
                        <tr>
                            <td><p>6.6. The partner organization provided orientation and levelling-off on project outputs.</p></td>
                            <td><center><input type="radio" size = "10%" name="q6.6" value="5"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.6" value="4"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.6" value="3"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.6" value="2"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.6" value="1"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.6" value="6"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.6" value="7"></center></td>
                        </tr>
                        <tr>
                            <td><p>6.7. There was proper coordination and cooperation between Lasallians and leaders of the partner organization.</p></td>
                            <td><center><input type="radio" size = "10%" name="q6.7" value="5"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.7" value="4"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.7" value="3"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.7" value="2"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.7" value="1"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.7" value="6"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.7" value="7"></center></td>
                        </tr>
                        <tr>
                            <td><p>6.8. The social engagement coordinator was involved in the entire process of service activity especially during project implementation.</p></td>
                            <td><center><input type="radio" size = "10%" name="q6.8" value="5"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.8" value="4"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.8" value="3"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.8" value="2"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.8" value="1"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.8" value="6"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.8" value="7"></center></td>
                        </tr>
                        <tr>
                            <td><p>6.9. The meeting venue in the community / organization was conducive for our activity.</p></td>
                            <td><center><input type="radio" size = "10%" name="q6.9" value="5"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.9" value="4"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.9" value="3"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.9" value="2"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.9" value="1"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.9" value="6"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.9" value="7"></center></td>
                        </tr>
                        <tr>
                            <td><p>6.10. The organization was able to impart valuable contribution in the formation of Lasallians s to become service-driven citizens.</p></td>
                            <td><center><input type="radio" size = "10%" name="q6.10" value="5"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.10" value="4"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.10" value="3"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.10" value="2"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.10" value="1"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.10" value="6"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.10" value="7"></center></td>
                        </tr>
                        <tr>
                            <td><p>6.11. The partner organization/community member(s) was very helpful during project implementation.</p></td>
                            <td><center><input type="radio" size = "10%" name="q6.11" value="5"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.11" value="4"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.11" value="3"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.11" value="2"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.11" value="1"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.11" value="6"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.11" value="7"></center></td>
                        </tr>
                        <tr>
                            <td><p>6.12. Community leaders and focal persons were available most of the time during area visits or whenever we needed to consult them on the project.</p></td>
                            <td><center><input type="radio" size = "10%" name="q6.12" value="5"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.12" value="4"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.12" value="3"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.12" value="2"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.12" value="1"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.12" value="6"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.12" value="7"></center></td>
                        </tr>
                        <tr>
                            <td><p>6.13. The partner organization provided counterpart (e.g. time, venue, etc) in the implementation of our project.</p></td>
                            <td><center><input type="radio" size = "10%" name="q6.13" value="5"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.13" value="4"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.13" value="3"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.13" value="2"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.13" value="1"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.13" value="6"></center></td>
                        <td><center><input type="radio" size = "10%" name="q6.13" value="7"></center></td>
                        </tr>       
                        <tr>
                            <td><b><p>7. OVERALL RATING</p></b></p></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><p>7.1. Please give an overall rating for the program</p></td>
                            <td><center><input type="radio" size = "10%" name="q7.1" value="5"></center></td>
                        <td><center><input type="radio" size = "10%" name="q7.1" value="4"></center></td>
                        <td><center><input type="radio" size = "10%" name="q7.1" value="3"></center></td>
                        <td><center><input type="radio" size = "10%" name="q7.1" value="2"></center></td>
                        <td><center><input type="radio" size = "10%" name="q7.1" value="1"></center></td>
                        <td><center><input type="radio" size = "10%" name="q7.1" value="6"></center></td>
                        <td><center><input type="radio" size = "10%" name="q7.1" value="7"></center></td>
                        </tr>
                    </table></center>
                <br>
                <p>Other feedbacks or suggestions to further improve our social engagement program, if any:</p>
                <center><textarea id="inputText" rows="15" cols="90%" name="feedback"></textarea> </center>
                <br>
                <center><p>Thank you very much!</p></center>
            </fieldset>
            <br><br>
            <center><button class="btn-success" type="submit">Submit</button></center>
        </form>
    </div>
</body>

</html>
