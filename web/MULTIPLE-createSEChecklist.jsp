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
        <title>SE Proposal Checklist</title>
        
        
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
            
            p{
                margin-left: 10px;
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
    
            function addField(){
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
            
            function deleteRow(){
                var rows = document.getElementById("projectplantable").rows.length;
                if(rows-1 > 0){
                    document.getElementById("projectplantable").deleteRow(rows-1);
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
            <form>
                
                <fieldset>
                    <center><table style = "width:100%" id = "SEchecklist">
                            <tr>
                                <th>Criteria</th>
                            </tr>
                            <tr>
                                <td><p>Proponent(s) are DLSU academic or support staff.</p></td>
                            </tr>
                            <tr>
                            <td><p>The proposal has been noted/approved by the following:<br>
                                    &nbsp;&nbsp;1. Chair of the Unit(s)/Department(s) involved<br>
                                    &nbsp;&nbsp;2. External Affairs Director/Social Engagement Coordinator<br>
                                    &nbsp;&nbsp;3. Dean/VP/VC</p></td>
                            </tr>
                            <tr>
                                <td><p>The proposal describes the Social/Community Problem being addressed by the project.</p></td>
                            </tr>
                            <tr>
                            <td><p>The proposal contributes to <b><u>ANY</u></b> of the following Social Engagement Strategic Goal/Measure:<br>
                                    1.% of DLSU Units with at least 1 sustainable social engagement project (KRA5-G1-M1)<br><br>
                                    2. % of student organizations, support staff, and academic staff involved in social engagement programs and activities (KRA5-G1-M2)<br><br>
                                    3. Number of social engagement options under the four components of the Sustainable Development Goals Location Project (KRA5-G1-M3)<br><br>
                                    4. % of UG and GS programs with Service-Learning Component (KRA5-G2-M1)<br><br>
                                    5. Number of International Service-Learning Activities (KRA5-G2-M2)<br><br>
                                    6. Student satisfaction in service learning experience (KRA5-G2-M3)<br><br>
                                    7. % of members of the Lasallian Community engaged in activities related to the realization of the SDGs (KRA5-G3-M1)<br><br>
                                    8. Number of public engagements that allows sharing of expertise for the realization of the SDGs (KRA5-G3-M2)</p></td>
                            </tr>
                            <tr>
                            <td><p>The proposal has <b><u>ALL</u></b> of the following components:<br>
                                    &nbsp;&nbsp;1. Specific and Measurable Outcomes/Objectives<br>
                                    &nbsp;&nbsp;2. Work Plan and Detailed Project Cost<br>
                                    &nbsp;&nbsp;3. Sustainability Component (if applicable)<br>
                                    &nbsp;&nbsp;4. Expected Participants from the unit<br>
                                    &nbsp;&nbsp;5. Brief Background and Contact information of the Partner</p></td>
                            </tr>
                            <tr>
                                <td><p>The project or activity would benefit any of the following:<br>
                                    1. People's ORganization/Non-Government Organizations<br>
                                    2. Faith-based, government or industry-based programs, projects and activities dealing with poverty,
                                    environmental sustainability, good governance and youth-at-risk<br>
                                    3. Marginalized communities of sectors of society<br></td>
                            </tr>
                    </table></center>
                    <br>
                </fieldset>

        </form>
        </div>
    </body>
    
</html>