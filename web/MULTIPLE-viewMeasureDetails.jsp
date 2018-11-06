<%-- 
    Document   : MULTIPLE-createSE
    Created on : 06 12, 18, 1:25:42 PM
    Author     : Karl Madrid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>KRA Measure Details</title>

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

            p{
                margin-left: 10px;
            }

            td{
                padding: 7px;
                font-size: 17px;
            }
            
            h3{
                font-family: "Times New Roman", Times, serif;
                font-size: 25px;
            }

            legend, th, td{
                font-family: "Times New Roman", Times, serif;
                font-size: 18px;
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

        <hr size="5" noshade>    
    <center><h3>Measure Details</h3></center>
    <hr size="5" noshade>


    <div class="form-style-5">
        <form>

            <fieldset>
                <center><table style = "width:100%" id = "SEchecklist">
                        <tr>
                            <th style="width:20%">Measure</th>
                            <th>Description</th>
                        </tr>
                        <tr>
                            <td>KRA3-G1-M1</td>
                            <td>Integration in curricular and co-curricular programs of formation based on Lasallian sprituality and mission</td>
                        </tr>
                        <tr>
                            <td>KRA3-G1-M2</td>
                            <td>Participation of administrators, faculty, and personnel in Lasallian formation activity</td>
                        </tr>
                        <tr>
                            <td>KRA3-G1-M3</td>
                            <td>Number of Lasallian formation activities available for other sectors in the DLSU community</td>
                        </tr>
                        <tr>
                            <td>KRA3-G2-M1</td>
                            <td>Number of fora and other interdisciplinary activities focused on bridging faith and scholarship (e.g. ethics, heritage, culture, science, theology, philosophy)</td>
                        </tr>
                        <tr>
                            <td>KRA3-G2-M2 </td>
                            <td>Integration of faith dimension using the Lasallian Reflection Framework (LRF) in GE courses</td>
                        </tr>
                        <tr>
                            <td>KRA3-G2-M3 </td>
                            <td>Participation of international students in co-curricular activities promoting interfaith and multicultural diversity</td>
                        </tr>
                        <tr>
                            <td>KRA3-G3-M1 </td>
                            <td>Number of Lasallian communities committed to the Lasallian mission</td>
                        </tr>
                        <tr>
                            <td>KRA5-G1-M1 </td>
                            <td>Number of sustainable social engagement project of units</td>
                        </tr>
                        <tr>
                            <td>KRA5-G1-M2 </td>
                            <td>Involvement of faculty, student, and personnel in DLSU community engagement programs and activities<br><br>
                                A. Percentage of student organizations involved in community engagement programs and activities <br>
                                B. Percentage of staff engaged in community engagement programs and activities <br>
                                C. Percentage of departments with community engagement projects</td>
                        </tr>
                        <tr>
                            <td>KRA5-G1-M3 </td>
                            <td>Number of social engagement choices under the four components of the Sustainable Development Goals Localization Project<br><br>
                                - L-ARAL (Education) <br>
                                - L-SEED (Social Enterprise) <br>
                                - L-Envisage (Environment/DRR)<br>
                                - L-HEARTS (Health and Wellness)</td>
                        </tr>
                        <tr>
                            <td>KRA5-G2-M1 </td>
                            <td>Service learning (SL) components of academic programs A. Percentage of undergraduate programs with SL component B. Percentage of graduate programs with SL component</td>
                        </tr>
                        <tr>
                            <td>KRA5-G2-M2</td>
                            <td>Number of international SL activities</td>
                        </tr>
                        <tr>
                            <td>KRA5-G2-M3</td>
                            <td>Student satisfaction in service learning experience</td>
                        </tr>
                        <tr>
                            <td>KRA5-G3-M1</td>
                            <td>Percentage of members of Lasallian Community engaged in activities related to the realization of the SDGs</td>
                        </tr>
                        <tr>
                            <td>KRA5-G3-M2</td>
                            <td>Number of public engagements that allows sharing of expertise for the realization of the SDGs</td>
                        </tr>
                        <tr>
                            <td>KRA5-G3-M3</td>
                            <td>Metrics to gauge SD impact of DLSU initiatives</td>
                        </tr>
                        <tr>
                            <td>KRA5-G4-M1</td>
                            <td>Compliance with green building standards for both existing and new construction</td>
                        </tr>
                        <tr>
                            <td>KRA5-G4-M2</td>
                            <td>Resource use efficiency (i.e. material resources, utilities, etc.)</td>
                        </tr>
                        <tr>
                            <td>KRA5-G4-M3</td>
                            <td>University's per Capita Carbon Footprint</td>
                        </tr>
                        <tr>
                            <td>KRA5-G4-M4</td>
                            <td>Percentage of total energy requirements provided by alternative energy sources</td>
                        </tr>
                        <tr>
                            <td>KRA5-G4-M5</td>
                            <td>University's per Capita Water Footprint</td>
                        </tr>
                        <tr>
                            <td>KRA5-G4-M6</td>
                            <td>Percentage of spaces dedicated to biodiversity 'green zones' and open spaces</td>
                        </tr>
                    </table></center>
                <br>
            </fieldset>

        </form>
    </div>
</body>

</html>