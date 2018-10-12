<%-- 
    Document   : logInPage
    Created on : 06 12, 18, 12:09:10 PM
    Author     : Karl Madrid
--%>

<%@page import="java.util.Collections"%>
<%@page import="entity.KRA"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>

        <title>Log In</title>    

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

            body{
                background-color: whitesmoke;
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

    </head>

    <body>

        <img id="logo" src="img/dlsu.png" alt="HTML5 Icon" />   

        <h3 class="loginDept"><b>Office of the Vice President for Lasallian Mission</b></h3>

        <div class="loginWrapper">

            <form class="loginForm-signin" action="login" method="post">       

                <input type="text" class="Form-control" name="username" placeholder="Username" required="" autofocus="" />
                <input type="password" class="Form-control" name="password" placeholder="Password" required=""/>      

                <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
                <br>
                <p>Evaluation? <a href="MULTIPLE-evaluationLogIn.jsp"><b><i>Evaluate!</i></b></a></p>

            </form>

            <%
                UserDAO UserDAO = new UserDAO();
                ArrayList<KRA> kra = new ArrayList();
                kra = UserDAO.retrieveSORTEDKRA();
                for (int i = 0; i < kra.size(); i++) {
                    System.out.print(kra.get(i).getName() + " - " + kra.get(i).getTotal());
                }

                kra = UserDAO.insertPercentage(kra);

                for (int i = 0; i < kra.size(); i++) {
                    System.out.println(kra.get(i).getName() + " - " + kra.get(i).getTotal() + " - " + kra.get(i).getPercentage());
                }

                Collections.sort(kra, KRA.compareDESCPercentage);

                for (int i = 0; i < kra.size(); i++) {
                    System.out.println("Sorted: " + kra.get(i).getName() + " - " + kra.get(i).getTotal() + " - " + kra.get(i).getPercentage() + " - " + kra.get(i).getId());
                }
            %>

        </div>

    </body>    
</html>