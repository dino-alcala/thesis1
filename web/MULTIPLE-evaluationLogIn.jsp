<%-- 
    Document   : MULTIPLE-evaluationLogIn
    Created on : 06 12, 18, 12:09:10 PM
    Author     : Karl Madrid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>

        <title>Log In!</title>    

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/homepagestyle.css">

        <!-- jQuery library -->
        <script src="js/jquery-3.2.1.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="js/bootstrap.min.js"></script>

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">

        <style>
            html{
                font-size:14px;
            }
            .navbar{
                height:8%;
            }
            .sidebar-expanded{
                margin-top:0.1%;
            }
            
            #notifsScroll {
                overflow-y: auto; 
                overflow-x: hidden;
                height: 250px;
            }

            .loginWrapper {	
                margin-top: 30px;
                margin-bottom: 40px;
            }

            .loginForm-signin {
                max-width: 380px;
                padding: 15px 35px 45px;
                margin: 0 auto;
                background-color: #fff;
                border: 1px solid rgba(0,0,0,0.1); 
            }

            .loginForm-signin-heading{
                margin-bottom: 10px;
                text-align: center;      
            }

            .Form-control {
                position: relative;
                font-size: 16px;
                height: auto;
                margin-bottom: 10px;    
                margin-top: 10px; 
                padding: 10px;
                width: 100%;

            }

            .loginDept{
                text-align: center; 
                margin-top: 20px;
                font-size: 30px;    
                font-family: 'Open Sans', sans-serif;
                color: black;
            }    

            p{
                padding-top: 20px;
                text-align: center;        
            }    

            #logo{
                width:150px;
                height:150px;
                display: block;
                margin-top: 50px;
                margin-left: auto;
                margin-right: auto;
            }
        </style>

        <script type="text/javascript">
            <%
                if (request.getAttribute("code") != null) {

            %>
            $("document").ready(function () {

                alert("<%=request.getAttribute("code")%>");
            });

            <%
                }
                if (request.getAttribute("successEvaluation") != null) {

            %>
            $("document").ready(function () {

                alert("<%=request.getAttribute("successEvaluation")%>");
            });

            <%
                }
            %>
        </script>

    </head>

    <body>

        <img id="logo" src="img/dlsu.png" alt="HTML5 Icon" />   

        <h3 class="loginDept"><b>Office of the Vice President for Lasallian Mission</b></h3>

        <div class="loginWrapper">

            <form class="loginForm-signin" action="loginCode" method="post">       

                <input type="text" class="Form-control" name="code" placeholder="Enter Access Code" required="" autofocus="" /> 

                <button class="btn btn-lg btn-primary btn-block" type="submit">Enter</button>

                <p>Existing User? <a href="index.jsp"><b><i>Login!</i></b></a></p>

            </form>

        </div>

    </body>    
</html>