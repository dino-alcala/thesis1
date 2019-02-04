<%-- 
    Document   : OVPLM-termEndReport
    Created on : 06 18, 18, 7:59:10 PM
    Author     : Karl Madrid
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entity.FF"%>
<%@page import="dao.UserDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>FF Evaluation Responses</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/sidebar.css">
        <link rel="stylesheet" href="css/homepagestyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
        <script src="https://cdn.rawgit.com/emn178/Chart.PieceLabel.js/master/build/Chart.PieceLabel.min.js"></script>


        <style>
            .chartscardslong2{
                background-color: white;
                color: black;
                padding: 10px;
            }

            tr:hover {
                background-color: lightgreen;
            }

            h2{
                font-size: 30px;
                text-align: center;
                margin-top: 10px;
                border-bottom: 2px solid green;
                padding-bottom: 10px;
                margin-bottom: 25px;
            }

            h3{
                font-size: 15px;
                text-align: center;
                margin-top: 10px;
                border-bottom: 2px solid green;
                padding-bottom: 10px;
                margin-bottom: 25px;
            }

            .panels{
                margin-top: 20px;
                background-color: white;
                padding-bottom: 15px;
                border-style: solid;
                border-color: lightgray;
                border-width: 1px;
                border-radius: 8px;
            }

            .daterange{
                text-align: right;
            }

            .pbutton{
                margin-top: 40px;
                text-align: center;
            }

            .chartscards{
                background-color: white;
                color: black;
            }

            .chartscardslong{
                background-color: white;
                color: black;
            }
        </style>

    </head>

    <body>

        <!-- Bootstrap row -->
        <div class="row" id="body-row">

            <!-- MAIN -->
            <div class="col py-3">
                <form action="viewFFResponses2">
                    <%
                        UserDAO UserDAO = new UserDAO();
                        FF FF = new FF();
                        FF = UserDAO.retrieveFFByFFID(Integer.parseInt(request.getAttribute("ffID").toString()));

                        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-mm-dd");
                        java.util.Date javaDate = new java.util.Date();
                        java.sql.Date sqlDate = new java.sql.Date(javaDate.getTime());
                    %>

                    <div class="container-fluid panels">
                        <h2><%=FF.getProjectName()%> Evaluation Responses - <%=sqlDate%></h2>
                    </div>

                    <!--Memorable Activities-->
                    <div class="container-fluid panels">

                        <h2>Memorable Activities</h2>

                        <p></p>

                        <%
                            ArrayList<String> memorable = new ArrayList();
                            memorable = UserDAO.getMemorableEvaluation(FF.getId());
                        %>
                        <div class="card-deck">
                            <%
                                for (int i = 0; i < memorable.size(); i++) {
                            %>
                            <div class="card chartscardslong2">
                                <%=memorable.get(i)%>
                            </div>
                            <%
                                }
                            %>
                        </div>
                        <p></p>

                    </div>

                    <!--Feedbacks and Suggestions-->
                    <div class="container-fluid panels">

                        <%
                            ArrayList<String> feedbacks = new ArrayList();
                            feedbacks = UserDAO.getFeedbackFFEvaluation(FF.getId());
                        %>

                        <h2>Feedbacks and Suggestions</h2>

                        <p></p>

                        <div class="card-deck">
                            <%
                                for (int i = 0; i < feedbacks.size(); i++) {
                            %>
                            <div class="card chartscardslong2">
                                <%=feedbacks.get(i)%>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <br>
                    <center>
                        <button name="back2" value="<%=FF.getId()%>" type="button btn-primary" class="btn btn-primary" style="padding-left: 20px; padding-right: 20px;">
                            <i class="fa fa-angle-double-left"></i>
                        </button>
                    </center>
                </form>
            </div>
        </div>
    </body>
</html>