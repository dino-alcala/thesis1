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
            
            td{
                padding:15px;
                font-size: 15px;
            }

            th {
                background-color: green;
                color: white;
                font-size: 15px;
            }

            table {
                border-collapse: collapse;

            }
            th{
                padding:15px;
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