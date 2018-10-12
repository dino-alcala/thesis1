<%-- 
    Document   : MULTIPLE-createAccomplishmentReport3
    Created on : 07 4, 18, 8:11:55 PM
    Author     : Karl Madrid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Create SE Completion Report</title>

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
                var table = document.getElementById("participants");
                var rows = document.getElementById("participants").rows.length;
                var row = table.insertRow(rows - 1);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                cell1.innerHTML = '<td><textarea rows = "2" cols = "20%" name="classification"></textarea></td>';
                cell2.innerHTML = '<td><textarea rows = "2" cols = "20%" name="number"></textarea></td>';
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
                var rows = document.getElementById("participants").rows.length;
                if (rows - 1 > 1) {
                    document.getElementById("participants").deleteRow(rows - 2);
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


        <form action="createSEreport4" method="post" enctype="multipart/form-data">
            <fieldset>
                <h2><span class="number">5</span> Major Problems Encountered</h2>
                <center><textarea rows="20" cols="90%" name="problem"></textarea> </center>
            </fieldset>

            <fieldset>
                <h2><span class="number">6</span> Other Recommendations (Comments / Feedbacks / Participation of Stakeholders)</h2>
                <center><textarea rows="20" cols="90%" name="recommendation"></textarea> </center>
                <br>
            </fieldset>

            <fieldset>
                <h2><span class="number">6</span> Annexes</h2>
                Upload Photo: <input type ="file" name ="uploadphoto"><br>
                <br>
                Upload Attendance Sheets of Beneficiaries: <input type ="file" name ="uploadbeneficiaries"><br>
                <br>
                Upload Attendance Sheets for DLSU Participants: <input type ="file" name ="uploadparticipants">
                <br>
                Upload Beneficiaries' letters / feedbacks: <input type ="file" name ="uploadletters">
                <br>
            </fieldset>
            <br><br>
            <button type="submit">Next</button>
        </form>
    </div>
</body>



</html>