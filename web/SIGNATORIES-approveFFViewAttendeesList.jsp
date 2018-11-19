<%-- 
    Document   : MULTIPLE-createSE
    Created on : 06 12, 18, 1:25:42 PM
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
        <title>Project Proposal Checklist</title>

        <link rel="stylesheet" href="css/formstyle5.css">

        <style>
            p{
                margin-bottom: 0;
                font-size: 15px;
            }

            table, td, th {
                border: 1px solid black;
                border-collapse: collapse;
                text-align: center;
            }

            h4{
                color: white;
            }

            .panel-success > .panel-heading {
                background-color: #4CAF50;
                border-color: #ddd;
                border: 1px solid;
            }

            .panel-body{
                border: 1px solid;
            }

            .panel-upper{
                border: 3px solid #4CAF50;
            }

            h3{
                font-size: 40px;   
                border-bottom: 2px solid #4CAF50;
                padding-bottom: 5px;
            }

            .card-header{
                background-color: #4CAF50;
            }

            .card-body{
                background-color: whitesmoke;
            }

            .card{
                border: 1px solid black;
            }


            th,tr,td{
                padding:15px;
            }
        </style>
    </head>

    <body>
        <%
            UserDAO UserDAO = new UserDAO();
            FF FF = new FF();
            FF = UserDAO.retrieveFFByFFID(Integer.parseInt(request.getAttribute("ffID").toString()));
        %>
        <hr size="5" noshade>    
    <center><h1><%=FF.getProjectName()%></h1></center>
    <hr size="5" noshade>


    <div class="form-style-5">

        <fieldset>
            <center><table style = "width:100%" id = "SEchecklist">
                    <tr>
                        <th style="width:50%">Name</th>
                        <th>Email</th>
                    </tr>
                    <%
                        for (int i = 0; i < FF.getAttendees().size(); i++) {
                    %>
                    <tr>
                        <td><%=FF.getAttendees().get(i).getName()%></td>
                        <td><%=FF.getAttendees().get(i).getEmail()%></td>
                    </tr>

                    <%
                        }
                    %>
                </table></center>
            <br>
        </fieldset>


    </div>
</body>

</html>