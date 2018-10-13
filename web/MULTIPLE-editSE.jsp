<%-- 
    Document   : MULTIPLE-createSE
    Created on : 06 12, 18, 1:25:42 PM
    Author     : Karl Madrid
--%>

<%@page import="entity.SE"%>
<%@page import="entity.KRA"%>
<%@page import="dao.OvplmDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entity.Community"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Edit SE Proposal</title>
        
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

        <script type="text/javascript">
            <%
                UserDAO UserDAO = new UserDAO();

                SE SE = new SE();
                SE = UserDAO.retrieveSEBySEID(Integer.parseInt(request.getAttribute("seID").toString()));

                OvplmDAO OvplmDAO = new OvplmDAO();
                ArrayList<KRA> k = new ArrayList();
                k = OvplmDAO.retrieveKRA();

            %>

            function changegoal(c1, c2) {

            var c1 = document.getElementById(c1);
            var c2 = document.getElementById(c2);
            c2.innerHTML = "";
            <%                    for (int i = 0; i < k.size(); i++) {
            %>
            if (c1.value == "<%=k.get(i).getId()%>") {
            var optionArray = ["|",<%for (int j = 0; j < k.get(i).getGoals().size(); j++) {%>"<%=k.get(i).getGoals().get(j).getGoalID()%>|<%=k.get(i).getGoals().get(j).getName()%>",<%}%>];
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

                function changemeasure(c1, c2) {

                var c1 = document.getElementById(c1);
                var c2 = document.getElementById(c2);
                c2.innerHTML = "";
            <%
                for (int i = 0; i < k.size(); i++) {
                    for (int j = 0; j < k.get(i).getGoals().size(); j++) {
            %>

                if (c1.value == "<%=k.get(i).getGoals().get(j).getGoalID()%>") {
                var optionArray = ["|",<%for (int l = 0; l < k.get(i).getGoals().get(j).getMeasures().size(); l++) {%>"<%=k.get(i).getGoals().get(j).getMeasures().get(l).getMeasureID()%>|<%=k.get(i).getGoals().get(j).getMeasures().get(l).getDescription()%>",<%}%>];
                    }

            <%
                    }
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
        <hr size="5" noshade>    
    <center><h1>Social Engagement Proposal</h1></center>
    <hr size="5" noshade>


    <div class="form-style-5">
        <form action = "editSE" method="post">



            <%
                SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-mm-dd");
                java.util.Date javaDate = new java.util.Date();
                java.sql.Date sqlDate = new java.sql.Date(javaDate.getTime());
            %>

            <fieldset>
                <legend><b>Unit: <%=SE.getUnit()%></b></legend>
            </fieldset>

            <fieldset>
                <legend><b>Department: <%=SE.getDepartment()%></b></legend>
            </fieldset>

            <fieldset>
                <legend><b>Date:<%=SE.getDate()%></b></legend>
            </fieldset>

            <fieldset>
                <legend><b>Program Name:</b></legend>
                <center><input type = "text" name ="programname" value="<%=SE.getName()%>"></center>
            </fieldset>

            <fieldset>
                <legend><b>Program Head:</b></legend>
                <center><input type = "text" name ="programhead" value="<%=SE.getProgramHead()%>"></center>
            </fieldset>

            <fieldset>
                <legend><b>Activity Classification:</b></legend>
                Ex: Seminar/Workshop
                <center><input type = "text" name ="classification" value="<%=SE.getActivityClassification()%>"></center>
                <br><br>
            </fieldset>

            <fieldset>
                <legend><b>Target Community:</b></legend>
                <%
                    ArrayList<Community> c = new ArrayList();
                    c = UserDAO.retrieveCommunity();
                %>
                <select name="community" >
                    <%
                        for (int m = 0; m < c.size(); m++) {
                    %>
                    <option value="<%=c.get(m).getId()%>"<% if (c.get(m).getName().equals(SE.getTargetCommunity())) {%> selected="selected" <%}%> ><%=c.get(m).getName()%></option>
                    <%
                        }
                    %>
                </select>
                <br>
            </fieldset>

            <fieldset>
                <legend><b>Target KRA:</b></legend>
                <select name="kra" id="kra" onchange="changegoal(this.id, 'goals')">
                    <option></option>
                    <%
                        for (int m = 0; m < k.size(); m++) {
                    %>
                    <option value="<%=k.get(m).getId()%>"><%=k.get(m).getName()%></option>
                    <%
                        }
                    %>
                </select>
                <br>
            </fieldset>

            <fieldset>
                <legend><b>Target Goal:</b></legend>
                <select name="goal" id="goals" onchange="changemeasure(this.id, 'measures')">
                </select>
                <br>
            </fieldset>

            <fieldset>
                <legend><b>Target Measure:</b></legend>
                <select name="measure" id="measures">
                </select>
                <br><br><br><br>
            </fieldset>

            <fieldset>
                <legend><span class="number">1</span><b>Title of Activity:</b></legend>
                <center><input type = "text" name ="title" value="<%=SE.getTitleActivity()%>"></center>
                <br>
            </fieldset>

            <fieldset>
                <legend><span class="number">2</span><b> Actual Implementation Date:</b></legend>
                <center><input type = "date" name ="actualdate" value="<%=SE.getActualDate()%>" min="<%=sqlDate%>"></center>
                <br>
            </fieldset>

            <fieldset>
                <legend><span class="number">3</span><b> Total Amount Requested:</b></legend>
                <center><input type = "text" name ="totalamount" value="<%=SE.getTotalAmount()%>"></center>
                <br>
            </fieldset>

            <fieldset>
                <legend><span class="number">4</span><b>Explain the Social/Community Problem being Addressed</b></legend>
                <center><textarea rows = "6" cols = "100%" name ="problemaddressed"><%=SE.getSocialCommunityProblem()%></textarea></center>
                <br>
            </fieldset>

            <fieldset>
                <legend><span class="number">5</span> <b>Social Engagement Partner(s)/Beneficiaries</b><br></legend>
                <legend>Name of Partner: <input type='text' name='partnername' value="<%=SE.getNameSEbeneficiaries()%>"/><br><br>
                    Address: <input type='text' name='partneraddress' value="<%=SE.getAddressSEbeneficiaries()%>"/><br><br>
                    Contact Person: <input type='text' name='partnercontact' value="<%=SE.getContactPersonSEbeneficiaries()%>"/><br><br>
                    Mobile Number: <input type='text' name='partnernumber' value="<%=SE.getMobileSEbeneficiaries()%>"/><br><br>
                    Email: <input type='text' name='partneremail' value="<%=SE.getEmailSEbeneficiaries()%>"/><br><br>
                    Brief Description of Partner: <textarea name='partnerdescription' rows='5'><%=SE.getDescriptionSEbeneficiaries()%></textarea></legend>
                <br><br>
            </fieldset>

            <fieldset>
                <legend><span class="number">6</span><b >Measurable Outcomes/Objectives of the Project:</b></legend>
                <center><textarea rows = "6" cols = "100%" name ="measureableoutcome"><%=SE.getObjectives()%></textarea></center>
                <br>
            </fieldset>

            <fieldset>
                <legend><span class="number">7</span><b> Sustainability Component (Check all that apply)</b>
                    <br><br>
                    <input type='checkbox' name="component" value="None" <% for(int i = 0; i < SE.getComponent().size(); i++){ if(SE.getComponent().get(i).equals("none")){%> checked <%}}%>/>None<br>
                    <input type='checkbox' name="component" value="Training/Capacity Building for the Partner" <% for(int i = 0; i < SE.getComponent().size(); i++){ if(SE.getComponent().get(i).equals("Training/Capacity Building for the Partner")){%> checked <%}}%>/>Training/Capacity Building for the Partner<br>
                    <input type='checkbox' name="component" value="Policy Advocacy/Development related to the Social Problem being Addressed" <% for(int i = 0; i < SE.getComponent().size(); i++){ if(SE.getComponent().get(i).equals("Policy Advocacy/Development related to the Social Problem being Addressed")){%> checked <%}}%>/>Policy Advocacy/Development related to the Social Problem being Addressed<br>
                    <input type='checkbox' name="component" value="Continuing and Developmental Partnership" <% for(int i = 0; i < SE.getComponent().size(); i++){ if(SE.getComponent().get(i).equals("Continuing and Developmental Partnership")){%> checked <%}}%>/>Continuing and Developmental Partnership<br>
                    <input type='checkbox' name="component" value="Others"/>Others:</legend><textarea name='otherscomponent' rows='2'></textarea><br><br>
                <legend>Explanation:</legend>
                <textarea name='sustainabilityexplanation' rows='4'><%=SE.getExplanation()%></textarea>
                <br>
            </fieldset>

            <fieldset>
                <legend><span class="number">8</span><b >Source of Funds:</b></legend>
                <center><select name="funds">
                        <option value="OVPLM" <% if(SE.getSourceOfFunds().equals("OVPLM")){%> selected="selected" <%}%> >OVPLM</option>
                        <option value="Others" <% if(SE.getSourceOfFunds().equals("Others")){%> selected="selected" <%}%> >Others</option>
                    </select></center>
                <br>
            </fieldset>
            <br><br>

            <button type="submit" name="seID" value="<%=SE.getId()%>">Next</button>
        </form>
    </div>
</body>

</html>