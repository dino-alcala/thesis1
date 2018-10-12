<%-- 
    Document   : MULTIPLE-createFF2
    Created on : 06 12, 18, 1:40:31 PM
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
            th{
                padding:15px;
            }
        </style>


        <script>

            function addRow() {
                var count = document.getElementById("countattendees").value;
                var table = document.getElementById("attendeestable");
                var rows = document.getElementById("attendeestable").rows.length;
                var row = table.insertRow(rows);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                cell1.innerHTML = "<textarea rows = '1' cols = '45%' name ='attendee" + count + "'></textarea>";
                cell2.innerHTML = "<textarea rows = '1' cols = '45%' name ='email" + count + "'></textarea>";
                count++;
                document.getElementById("countattendees").setAttribute('value', count);
            }

            function deleteRow() {
                var count = document.getElementById("countattendees").value;

                var rows = document.getElementById("attendeestable").rows.length;
                if (rows - 1 > 0) {
                    document.getElementById("attendeestable").deleteRow(rows - 1);
                    count--;
                    document.getElementById("countattendees").setAttribute('value', count);
                } else {

                }
            }
        </script>
    </head>

    <body>
        <hr size="5" noshade>    
    <center><h1>Faith Formation Program Attendees</h1></center>
    <hr size="5" noshade>


    <div class="form-style-5">
        <form action="editFF2" method="post">
            <%
                UserDAO UserDAO = new UserDAO();
                FF FF = new FF();
                FF = UserDAO.retrieveFFByFFID(Integer.parseInt(request.getAttribute("ffID").toString()));
            %>
            <input type="text" value="<%=FF.getAttendees().size()%>" id="countattendees" name="countattendees">
            <fieldset>
                <center><table style = "width:90%" id="attendeestable">
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                        </tr>
                        <%
                            for (int i = 0; i < FF.getAttendees().size(); i++) {
                        %>
                        <tr>    
                            <td><textarea rows = "1" cols = "45%" name ="attendee<%=i%>"><%=FF.getAttendees().get(i).getName()%></textarea></td>
                            <td><textarea rows = "1" cols = "45%" name ="email<%=i%>"><%=FF.getAttendees().get(i).getEmail()%></textarea></td>
                        </tr>

                        <%
                            }
                        %>
                    </table></center>
                <br>
                <center><input type ="button" onclick ="addRow()" value="Click to Add Row">
                    <input style="background-color:red; border: red;" type ="button" onclick ="deleteRow()" value="Click to Delete Row"></center>
            </fieldset>    
            <br><br><br><br>
            <center><button type = "submit">Submit</button></center>
        </form>
    </div>
</body>
</html>