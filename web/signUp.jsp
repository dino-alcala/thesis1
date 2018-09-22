<%-- 
    Document   : signUp
    Created on : 06 12, 18, 12:16:02 PM
    Author     : Karl Madrid
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="entity.Unit"%>
<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <html>

        <head>

            <title>Register!</title>    

            <!-- Latest compiled and minified CSS -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
            <link rel="stylesheet" type="text/css" href="css/styles.css">

            <!-- jQuery library -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

            <!-- Latest compiled JavaScript -->
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

            <!-- Fonts -->
            <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">

            <style>    

                body{
                    background-color:  whitesmoke;
                }

                .loginWrapper {	
                    margin-top: 20px;
                }

                .loginForm-signin {
                    max-width: 380px;
                    padding: 15px 35px 45px;
                    margin: 0 auto;
                    margin-bottom: 100px;
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

                .signUpHeading{
                    text-align: center; 
                    margin-top: 30px;
                    margin-bottom: 20px;    
                    font-size: 40px;    
                    font-family: 'Open Sans', sans-serif;
                    color: black;
                }    

                .dropdown-toggle {
                    width: 308px;
                }
                p{
                    text-align: center;     
                }
                #type, #dept{
                    margin-top: 0px;
                }

                .hint{
                    margin-bottom: 0px;
                    text-align: left;
                }
            </style>  
            <script type="text/javascript">
                function department(c1, c2) {
                    
                    <%
                        UserDAO UserDAO = new UserDAO();
                        ArrayList<Unit> units = new ArrayList();
                        units = UserDAO.retrieveUnits();
                    %>
                            
                    var c1 = document.getElementById(c1);
                    var c2 = document.getElementById(c2);

                    c2.innerHTML = "";
                    
                    <%
                        for(int i = 0; i < units.size(); i++){
                            ArrayList<Integer> departmentID = new ArrayList();
                            departmentID = UserDAO.retrieveDepartmentByUnitID(units.get(i).getUnitID());
                        %>
                                
                        if(c1.value == "<%=units.get(i).getName()%>"){
                            var optionArray = [<%for(int j = 0; j<departmentID.size(); j++){%>"<%=UserDAO.getDepartmentByID(departmentID.get(j)).getDepartmentID()%>|<%=UserDAO.getDepartmentByID(departmentID.get(j)).getName()%>",<%}%>];
                        }
                        
                        <%
                            }
                            %>

                    for (var option in optionArray) {
                        var pair = optionArray[option].split("|");
                        var newOption = document.createElement("option");
                        newOption.value = pair[0];
                        newOption.innerHTML = pair[1];
                        c2.options.add(newOption);
                    }

                }
            </script>

        </head>

        <body>

            <img id="logo" src="https://upload.wikimedia.org/wikipedia/en/thumb/c/c2/De_La_Salle_University_Seal.svg/1200px-De_La_Salle_University_Seal.svg.png" alt="HTML5 Icon" />   

            <h3 class="signUpHeading"><b>Sign Up</b></h3>

            <p><i>Fields with "*" are required</i></p>

            <div class="loginWrapper">

                <form class="loginForm-signin" action="signUp" method="post">       

                    <input type="text" class="Form-control" name="firstname" placeholder="First Name*" required="" autofocus="" />
                    <input type="text" class="Form-control" name="lastname" placeholder="Last Name*" required="" autofocus="" />
                    <p class="hint"><i>(e.g. firstname_lastname@dlsu.edu.ph)</i></p>   
                    <input type="email" class="Form-control" name="email" placeholder="Email Address*" required="" autofocus="" />

                    <div class="form-group">
                        <label for="sel1">Unit:</label>
                        <select class="form-control" id="type" name="unit" onchange="department(this.id, 'dept')">
                            <optgroup label="Added Units">
                                <option></option>
                                <%
                                    for (int k = 0; k < units.size(); k++) {
                                %>
                                <option><%=units.get(k).getName()%></option>
                                <%
                                    }
                                %>
                            </optgroup>

                        </select>
                    </div>

                    <div class="form-group">
                        <label for="sel1">Department:</label>
                        <select class="form-control" id="dept" name="dept">
                        </select>

                    </div>
                    
                    <input type="text" class="Form-control" name="username" placeholder="Username*" required="" autofocus="" />
                    <input type="password" class="Form-control" name="password" placeholder="Password*" required=""/>
                    <input type="password" class="Form-control" name="password2" placeholder="Confirm Password*" required=""/>

                    <button class="btn btn-lg btn-info btn-block" type="submit">Register</button>

                </form>

            </div>

        </body>    

    </html>