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

                    if (c1.value == "Assistant Dean for External Affairs of the Lasallian Mission (ADEALM) - CCS") {
                        var optionArray = ["0|N/A"];
                    }

                    if (c1.value == "Assistant Dean for External Affairs of the Lasallian Mission (ADEALM) - COB") {
                        var optionArray = ["0|N/A"];
                    }
                    ""
                    if (c1.value == "Assistant Dean for External Affairs of the Lasallian Mission (ADEALM) - CLA") {
                        var optionArray = ["0|N/A"];
                    }

                    if (c1.value == "Assistant Dean for External Affairs of the Lasallian Mission (ADEALM) - GCOE") {
                        var optionArray = ["0|N/A"];
                    }

                    if (c1.value == "Assistant Dean for External Affairs of the Lasallian Mission (ADEALM) - COS") {
                        var optionArray = ["0|N/A"];
                    }

                    if (c1.value == "Assistant Dean for External Affairs of the Lasallian Mission (ADEALM) - BAGCED") {
                        var optionArray = ["0|N/A"];
                    }

                    if (c1.value == "Assistant Dean for External Affairs of the Lasallian Mission (ADEALM) - SOE") {
                        var optionArray = ["0|N/A"];
                    }

                    if (c1.value == "Assistant Dean for External Affairs of the Lasallian Mission (ADEALM) - COL") {
                        var optionArray = ["0|N/A"];
                    }

                    if (c1.value == "Center for Social Concern and Action (COSCA)") {
                        var optionArray = ["0|N/A"];
                    }

                    if (c1.value == "Cultural Arts Office (CAO)") {
                        var optionArray = ["0|N/A"];
                    }

                    if (c1.value == "Dean of Student Affairs") {
                        var optionArray = ["0|N/A"];
                    }

                    if (c1.value == "Laguna Campus Lasallian Mission") {
                        var optionArray = ["0|N/A"];
                    }

                    if (c1.value == "Lasallian Mission Director") {
                        var optionArray = ["0|N/A"];
                    }

                    if (c1.value == "Lasallian Pastoral Office (LSPO)") {
                        var optionArray = ["0|N/A"];
                    }

                    if (c1.value == "National Service Training Program-Civic Welfare and Training Service (NSTP-CWTS)") {
                        var optionArray = ["0|N/A"];
                    }

                    if (c1.value == "Office of Personnel Management Director") {
                        var optionArray = ["0|N/A"];
                    }

                    if (c1.value == "Office of Sports Development (OSD)") {
                        var optionArray = ["0|N/A"];
                    }

                    if (c1.value == "Office of the Vice President for Lasallian Mission (OVPLM)") {
                        var optionArray = ["0|N/A"];
                    }

                    if (c1.value == "Reserve Officer's Training Corps (ROTC)") {
                        var optionArray = ["0|N/A"];
                    }

                    if (c1.value == "Student Discipline Formation Office (SDFO)") {
                        var optionArray = ["0|N/A"];
                    }

                    if (c1.value == "Student Media Office (SMO)") {
                        var optionArray = ["0|N/A"];
                    }

                    if (c1.value == "The Office of Student Leadership Involvement, Formation and Empowerment (SLIFE)") {
                        var optionArray = ["0|N/A"];
                    }

                    if (c1.value == "Br. Andrew Gonzales College of Education (BAGCED)") {
                        var optionArray = ["1|Counselling and Educational Psychology Department (CEPD)", "2|Departmentof English and Applied Linguistics (DEAL)", "3|Educational Leadership and Management Department (ELMD)", "4|Physical Education Department (PED)", "5|Science Education Department (SED)"];
                    }

                    if (c1.value == "College of Computer Studies (CCS)") {
                        var optionArray = ["6|Computer Technology (CT)", "7|Information Technology (IT)", "8|Software Technology (ST)"];
                    }

                    if (c1.value == "College of Liberal Arts (CLA)") {
                        var optionArray = ["9|Behavioral Sciences", "10|Communication", "11|Literature", "12|Filipino", "13|History", "14|International Studies"
                                    , "15|Philosophy", "16|Political Science", "17|Psychology", "18|Theology and Religious Education"];
                    }

                    if (c1.value == "College of Science (COS)") {
                        var optionArray = ["19|Biology", "20|Chemistry", "21|Mathematics", "22|Physics"];
                    }

                    if (c1.value == "Gokongwei College of Engineering (GCOE)") {
                        var optionArray = ["23|Chemical Engineering", "24|Civil Engineering", "25|Electronics and Communications Engineering", "26|Industrial Engineering", "27|Manufacturing Engineering and Management", "28|Mechanical Engineering"];
                    }

                    if (c1.value == "Ramon V. del Rosario College of Business (RVRCOB)") {
                        var optionArray = ["29|Accountancy", "30|Commercial Law", "31|Decision Sciences and Innovation Department", "32|Management of Financial Institutions", "33|Management and Organization Department", "34|Marketing Management"];
                    }

                    if (c1.value == "School of Economics (SOE)") {
                        var optionArray = ["35|Industrial Applied Economics", "36|Financial Appied Economics", "37|Ladderized Applied Economics", "38|Management of Financial Institutions", "39|Management and Organization Department", "40|Marketing Management"];
                    }
                    
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
                            <optgroup label="Offices">
                                <option></option>
                                <option>Assistant Dean for External Affairs of the Lasallian Mission (ADEALM) - CCS</option>
                                <option>Assistant Dean for External Affairs of the Lasallian Mission (ADEALM) - COB</option>
                                <option>Assistant Dean for External Affairs of the Lasallian Mission (ADEALM) - CLA</option>
                                <option>Assistant Dean for External Affairs of the Lasallian Mission (ADEALM) - GCOE</option>
                                <option>Assistant Dean for External Affairs of the Lasallian Mission (ADEALM) - COS</option>
                                <option>Assistant Dean for External Affairs of the Lasallian Mission (ADEALM) - BAGCED</option>
                                <option>Assistant Dean for External Affairs of the Lasallian Mission (ADEALM) - SOE</option>
                                <option>Assistant Dean for External Affairs of the Lasallian Mission (ADEALM) - COL</option>
                                <option>Dean - CCS</option>
                                <option>Dean - COB</option>
                                <option>Dean - CLA</option>
                                <option>Dean - GCOE</option>
                                <option>Dean - COS</option>
                                <option>Dean - BAGCED</option>s
                                <option>Dean - SOE</option>
                                <option>Dean - COL</option>
                                <option>Department Unit - CCS</option>
                                <option>Department Unit - COB</option>
                                <option>Department Unit - CLA</option>
                                <option>Department Unit - GCOE</option>
                                <option>Department Unit - COS</option>
                                <option>Department Unit - BAGCED</option>
                                <option>Department Unit - SOE</option>
                                <option>Department Unit - COL</option>
                                <option>Center for Social Concern and Action (COSCA)</option>
                                <option>Cultural Arts Office (CAO)</option>
                                <option>Dean of Student Affairs</option>
                                <option>Laguna Campus Lasallian Mission</option>
                                <option>Lasallian Mission Director</option>
                                <option>Lasallian Pastoral Office (LSPO)</option>
                                <option>National Service Training Program-Civic Welfare and Training Service (NSTP-CWTS)</option>
                                <option>Office of Personnel Management Director</option>
                                <option>Office of Sports Development (OSD)</option>
                                <option>Office of the Vice President for Lasallian Mission (OVPLM)</option>
                                <option>Reserve Officer's Training Corps (ROTC)</option>
                                <option>Student Discipline Formation Office (SDFO)</option>
                                <option>Student Media Office (SMO)</option>
                                <option>The Office of Student Leadership Involvement, Formation and Empowerment (SLIFE)</option>

                            </optgroup>
                            <optgroup label="Colleges">
                                <option>Br. Andrew Gonzales College of Education (BAGCED)</option>
                                <option>College of Computer Studies (CCS)</option>
                                <option>College of Law (COL)</option>
                                <option>College of Liberal Arts (CLA)</option>
                                <option>College of Science (COS)</option>
                                <option>Gokongwei College of Engineering (GCOE)</option>
                                <option>Ramon V. del Rosario College of Business (RVRCOB)</option>
                                <option>School of Economics (SOE)</option>
                            </optgroup>

                            <optgroup label="Added Units">
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