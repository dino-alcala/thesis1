<%-- 
    Document   : MULTIPLE-approveCoscaSE
    Created on : 06 18, 18, 7:21:12 PM
    Author     : Karl Madrid
--%>

<%@page import="entity.SE"%>
<%@page import="entity.Notification"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>Audit Trail SE</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/sidebar.css">
        <link rel="stylesheet" href="css/progressbar.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

        <style>
            #myInput {
                background-image: url('/css/searchicon.png'); /* Add a search icon to input */
                background-position: 10px 12px; /* Position the search icon */
                background-repeat: no-repeat; /* Do not repeat the icon image */
                width: 100%; /* Full-width */
                padding: 12px 20px 12px 40px; /* Add some padding */
                border: 1px solid #ddd; /* Add a grey border */
                margin-bottom: 12px; /* Add some space below the input */
                margin-top: 20px; 
            }

            #myTable {
                border-collapse: collapse; /* Collapse borders */
                width: 100%; /* Full-width */
                border: 1px solid #ddd; /* Add a grey border */

            }

            #myTable th, #myTable td {
                text-align: left; /* Left-align text */
                padding: 12px; /* Add padding */
            }

            #myTable tr {
                border-bottom: 1px solid #ddd; 
            }

            #myTable tr.header, #myTable tr:hover {
                background-color: #4CAF50;
            }

            .panel-title{
                font-size: 40px;
                text-align: left;
                margin-top: 20px;
                padding-bottom: 10px;
            }

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

            @media (max-width: 399px) {
                .progress-tracker-mobile {
                    overflow-x: auto;
                }
                .progress-tracker-mobile .progress-tracker {
                    min-width: 200%;
                }
            }

            @-webkit-keyframes scale-up {
                from {
                    opacity: 1;
                    -webkit-transform: translate(-50%, -50%) scale(0);
                    transform: translate(-50%, -50%) scale(0);
                }
                to {
                    opacity: 0;
                    -webkit-transform: translate(-50%, -50%) scale(1);
                    transform: translate(-50%, -50%) scale(1);
                }
            }

            @keyframes scale-up {
                from {
                    opacity: 1;
                    -webkit-transform: translate(-50%, -50%) scale(0);
                    transform: translate(-50%, -50%) scale(0);
                }
                to {
                    opacity: 0;
                    -webkit-transform: translate(-50%, -50%) scale(1);
                    transform: translate(-50%, -50%) scale(1);
                }
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

            .progress-title{
                color: darkgreen;
            }

            textarea{
                resize: none;
            }

        </style>
    </head>

    <body>

        <!-- MAIN -->

        <%
            UserDAO UserDAO = new UserDAO();
            SE SE = new SE();

            SE = UserDAO.retrieveSEBySEID(Integer.parseInt(request.getAttribute("auditSE").toString()));

            if (request.getAttribute("current") == null) {
                SE = UserDAO.retrieveSERevisionBySEID(Integer.parseInt(request.getAttribute("auditSE").toString()));
            }


        %>

        <div class="col py-3">
            <form action="approveSE4" method="post" enctype="multipart/form-data">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">

                            <!-- sidebar-container END -->
                            <div class="panel panel-success ">

                                <div class="card">
                                    <div class="card-body">
                                        <h3><%=SE.getName()%></h3>
                                        <p><b>Unit: </b><%=SE.getUnit()%></p>
                                        <p><b>Department: </b><%=SE.getDepartment()%></p>
                                        <p><b>Actual Date of Implementation: </b><%=SE.getActualDate()%></p>
                                        <br>
                                        <p><b>Program Head: </b><%=SE.getProgramHead()%></p>
                                        <p><b>Program Classification: </b><%=SE.getActivityClassification()%></p>
                                        <p><b>Total Amount Requested:</b> ₱<%=SE.getTotalAmount()%></p>
                                    </div>
                                </div>

                            </div>

                            <br/><br/>

                            <div class="card">
                                <div class="card-header">
                                    <h4>Targets</h4>
                                </div>
                                <div class="card-body">   
                                    <p><b>KRA:</b> <%=UserDAO.getKRAnameByID(SE.getTargetKRA())%></p><br>
                                    <p><b>Goal:</b> <%=UserDAO.getGoalnameByID(SE.getTargetGoal())%></p><br>
                                    <p><b>Measure/s:</b> 
                                        <%
                                            ArrayList<Integer> measures = new ArrayList();
                                            measures = UserDAO.GetMeasures(SE.getId());
                                            if (request.getAttribute("current") == null) {
                                                measures = UserDAO.GetRevisionsMeasures(SE.getId());
                                            }

                                            for (int x = 0; x < measures.size(); x++) {
                                        %>    
                                    <p><%=UserDAO.GetMeasureObject(measures.get(x)).getMeasure()%> - <%=UserDAO.GetMeasureObject(measures.get(x)).getDescription()%></p>

                                    <%
                                        }
                                    %>
                                    <br>
                                    <p><br><b>Community: </b> <%=UserDAO.getCommunitynameByID(SE.getTargetCommunity())%></p>
                                </div>  
                            </div>
                            <br/>

                            <div class="card">
                                <div class="card-header">
                                    <h4>Social/Community Problem being Addressed</h4>
                                </div>
                                <div class="card-body">   
                                    <p><%=SE.getSocialCommunityProblem()%></p>
                                </div>
                            </div>
                            <br/>

                            <div class="card">
                                <div class="card-header">
                                    <h4>Social Engagement Partner(s)/Beneficiaries</h4>
                                </div>
                                <div class="card-body">   
                                    <p>Name of Partner: <%=SE.getNameSEbeneficiaries()%></p>
                                    <p>Address: <%=SE.getAddressSEbeneficiaries()%></p>
                                    <p>Contact Person: <%=SE.getContactPersonSEbeneficiaries()%></p>
                                    <p>Mobile Number: <%=SE.getMobileSEbeneficiaries()%></p>
                                    <p>Email: <%=SE.getEmailSEbeneficiaries()%></p><br>
                                    <p>Brief Description of Partner: <%=SE.getDescriptionSEbeneficiaries()%></p>
                                </div>
                            </div>
                            <br>

                            <div class="card">
                                <div class="card-header">
                                    <h4>Measurable Outcomes/Objectives of the Project</h4>
                                </div>
                                <div class="card-body">   
                                    <p><%=SE.getObjectives()%></p>
                                </div>
                            </div>
                            <br/>

                            <div class="card">
                                <div class="card-header">
                                    <h4>Sustainability Component</h4>
                                </div>
                                <div class="card-body">
                                    <%
                                        for (int i = 0; i < SE.getComponent().size(); i++) {
                                    %>
                                    <p><%=SE.getComponent().get(i)%></p>

                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                            <br/>

                            <div class="card">
                                <div class="card-header">
                                    <h4>Work Plan</h4>
                                </div>
                            </div>
                            <table style="width:100%">
                                <tr>
                                    <th>Date</th>
                                    <th>Activity</th> 
                                    <th>Time Start</th>
                                    <th>Time End</th>
                                    <th>Venue</th>
                                </tr>
                                <%
                                    for (int i = 0; i < SE.getWorkplan().size(); i++) {
                                %>
                                <tr>
                                    <td><%=SE.getWorkplan().get(i).getDate()%></td>
                                    <td><%=SE.getWorkplan().get(i).getActivity()%></td>
                                    <td><%=SE.getWorkplan().get(i).getTimestarttimeend()%></td>
                                    <td><%=SE.getWorkplan().get(i).getTimestarttimeend2()%></td>
                                    <td><%=SE.getWorkplan().get(i).getVenue()%></td>
                                </tr>

                                <%
                                    }
                                %>

                            </table>
                            <br/>

                            <div class="card">
                                <div class="card-header">
                                    <h4>Breakdown of Expenses (Requested: ₱<%=SE.getTotalAmount()%>)</h4>
                                </div>
                            </div>
                            <table style="width:100%">
                                <tr>
                                    <th>Item</th>
                                    <th>Unit Cost</th> 
                                    <th>Quantity</th>
                                    <th>Subtotal</th>
                                </tr>
                                <%
                                    double count = 0;
                                    for (int i = 0; i < SE.getExpenses().size(); i++) {
                                %>
                                <tr>
                                    <td><%=SE.getExpenses().get(i).getItem()%></td>
                                    <td><%=SE.getExpenses().get(i).getUnitcost()%></td>
                                    <td><%=SE.getExpenses().get(i).getQuantity()%></td>
                                    <td><%=SE.getExpenses().get(i).getUnitcost() * SE.getExpenses().get(i).getQuantity()%></td>
                                </tr>
                                <%
                                        count += SE.getExpenses().get(i).getUnitcost() * SE.getExpenses().get(i).getQuantity();
                                    }
                                %>

                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>Grand Total: <%=count%></td>
                                </tr>
                            </table>
                            <br/>

                            <div class="card">
                                <div class="card-header">
                                    <h4>Expected Participants vs. Total Population of the Unit</h4>
                                </div>
                            </div>
                            <table style="width:100%">
                                <tr>
                                    <th>Sector</th>
                                    <th>Total Population</th>
                                    <th>Expected Number of Participants</th>
                                </tr>
                                <tr>
                                    <td>Academic Staff from Unit</td>
                                    <td><%=SE.getTotalpopulationAcademicStaff()%></td>
                                    <td><%=SE.getExpectedAcademicStaff()%></td>
                                </tr>
                                <tr>
                                    <td>Support Staff from Unit</td>
                                    <td><%=SE.getTotalpopulationSupportStaff()%></td>
                                    <td><%=SE.getExpectedSupportStaff()%></td>
                                </tr>
                                <tr>
                                    <td>Undergraduate Students</td>
                                    <td><%=SE.getTotalpopulationUndergraduate()%></td>
                                    <td><%=SE.getExpectedUndergraduate()%></td>
                                </tr>
                                <tr>
                                    <td>Graduate Students</td>
                                    <td><%=SE.getTotalPopulationGraduate()%></td>
                                    <td><%=SE.getExpectedGraduate()%></td>
                                </tr>
                            </table>
                            <br/>

                            <div class="card">
                                <div class="card-header">
                                    <h4>Persons Responsible</h4>
                                </div>
                            </div>
                            <table style="width:100%">
                                <tr>
                                    <th>Name</th>
                                    <th>Email</th>
                                </tr>
                                <%
                                    for (int i = 0; i < SE.getResponsible().size(); i++) {
                                %>
                                <tr>
                                    <td><%=SE.getResponsible().get(i).getName()%></td>
                                    <td><%=SE.getResponsible().get(i).getEmail()%></td>
                                </tr>

                                <%
                                    }
                                %>
                            </table>
                            <br/>

                            <div class="card">
                                <div class="card-header">
                                    <h4>Source of Funds: </h4>
                                </div>
                                <div class="card-body">   
                                    <p><%=SE.getSourceOfFunds()%></p>
                                </div>
                            </div>
                            <br/>
                            <div class="card">
                                <div class="card-header">
                                    <h4>Remarks: </h4>
                                </div>
                            </div>
                            <table style="width:100%">
                                <tr>
                                    <td>Department/Unit Chair</td>
                                    <td><%if (SE.getDeptunitRemarks() != null) {%><%=SE.getDeptunitRemarks()%> <%if (SE.getApprove1() == 1){%><br><b><font color = "green">Approved:</font></b> <%} else if(SE.getRevise1() == 1) {%><br><b><font color = "orange">Marked for revision:</font></b><%} else if(SE.getReject1() == 1) {%><br><b><font color = "red"><br>Rejected:</font></b><%}%> <%=SE.getDeptunitdatetime()%><%}%><%if (SE.getUnitChairRemarks() != null) {%><%=SE.getUnitChairRemarks()%><%if (SE.getApprove1() == 1){%><br><b><font color = "green"> Approved:</font></b> <%} else if(SE.getRevise1()== 1) {%><br><b><font color = "orange">Marked for revision:</font></b><%} else if(SE.getReject1()== 1) {%><br><b><font color = "red">Rejected:</font></b><%}%> <%=SE.getUnitchairdatetime()%><%}%></td>
                                    
                                </tr>
                                <tr>
                                    <td>College ADEALM/SE Director</td>
                                    <td><%if (SE.getExternaldirectorRemarks() != null) {%><%=SE.getExternaldirectorRemarks()%><%if (SE.getApprove2() == 1){%><br><b><font color = "green"> Approved:</font></b> <%} else if(SE.getRevise2()==1) {%><br><b><font color = "orange">Marked for revision:</font></b><%} else if(SE.getReject2()==1) {%><br><b><font color = "red"><br>Rejected:</font></b><%}%> <%=SE.getExternaldirectordatetime()%><%}%> <%if (SE.getSeDirectorRemarks()!= null){%><%=SE.getSeDirectorRemarks()%><%if (SE.getApprove2()==1){%><br><b><font color = "green"> Approved:</font></b> <%} else if(SE.getRevise2()==1) {%><br><b><font color = "orange">Marked for revision:</font></b><%} else if(SE.getReject2()==1) {%><br><b><font color = "red">Rejected:</font></b><%}%> <%=SE.getSedirectordatetime() %><%}%></td>
                                </tr>
                                <tr>
                                    <td>College Dean/VP/VC</td>
                                    <td><%if (SE.getDeanRemarks() != null) {%><%=SE.getDeanRemarks()%><%if (SE.getApprove3() == 1){%><br><b><font color = "green"> Approved:</font></b> <%} else if(SE.getRevise3() == 1) {%><br><b><font color = "orange">Marked for revision:</font></b><%} else if(SE.getReject3() == 1) {%><br><b><font color = "red">Rejected:</font></b><%}%> <%=SE.getDeandatetime() %><%}%><%if (SE.getVpVcRemarks() != null) {%><%=SE.getVpVcRemarks()%><%if (SE.getApprove3() == 1){%><br><b><font color = "green"> Approved:</font></b> <%} else if(SE.getRevise3()==1) {%><br><b><font color = "orange">Marked for revision:</font></b><%} else if(SE.getReject3()==1) {%><br><b><font color = "red">Rejected:</font></b><%}%><%=SE.getVpvcdatetime() %><%}%></td>
                                </tr>
                                <tr>
                                    <td>Evaluation by COSCA</td>
                                    <td><%if (SE.getCoscaRemarks() != null) {%><%=SE.getCoscaRemarks()%><%if (SE.getApprove4()==1){%><br><b><font color = "green"> Approved:</font></b> <%} else if(SE.getRevise4()==1) {%><br><b><font color = "orange">Marked for revision:</font></b><%} else if(SE.getReject4()==1) {%><br><b><font color = "red">Rejected:</font></b><%}%> <%=SE.getCoscadatetime() %><%}%></td>
                                </tr>
                            </table>
                        </div>

                    </div>

                </div>
            </form>
        </div>

        <script>
            // sandbox disable popups
            if (window.self !== window.top && window.name != "view1") {
                ;
                window.alert = function () {/*disable alert*/
                };
                window.confirm = function () {/*disable confirm*/
                };
                window.prompt = function () {/*disable prompt*/
                };
                window.open = function () {/*disable open*/
                };
            }

            // prevent href=# click jump
            document.addEventListener("DOMContentLoaded", function () {
                var links = document.getElementsByTagName("A");
                for (var i = 0; i < links.length; i++) {
                    if (links[i].href.indexOf('#') != -1) {
                        links[i].addEventListener("click", function (e) {
                            console.debug("prevent href=# click");
                            if (this.hash) {
                                if (this.hash == "#") {
                                    e.preventDefault();
                                    return false;
                                } else {
                                    /*
                                     var el = document.getElementById(this.hash.replace(/#/, ""));
                                     if (el) {
                                     el.scrollIntoView(true);
                                     }
                                     */
                                }
                            }
                            return false;
                        })
                    }
                }
            }, false);
        </script>
        <script>
            // Hide submenus
            $('#body-row .collapse').collapse('hide');
            // Collapse/Expand icon
            $('#collapse-icon').addClass('fa-angle-double-left');
            // Collapse click
            $('[data-toggle=sidebar-colapse]').click(function () {
                SidebarCollapse();
            });
            function SidebarCollapse() {
                $('.menu-collapsed').toggleClass('d-none');
                $('.sidebar-submenu').toggleClass('d-none');
                $('.submenu-icon').toggleClass('d-none');
                $('#sidebar-container').toggleClass('sidebar-expanded sidebar-collapsed');
                // Treating d-flex/d-none on separators with title
                var SeparatorTitle = $('.sidebar-separator-title');
                if (SeparatorTitle.hasClass('d-flex')) {
                    SeparatorTitle.removeClass('d-flex');
                } else {
                    SeparatorTitle.addClass('d-flex');
                }

                // Collapse/Expand icon
                $('#collapse-icon').toggleClass('fa-angle-double-left fa-angle-double-right');
            }
        </script>
    </body>
</html>