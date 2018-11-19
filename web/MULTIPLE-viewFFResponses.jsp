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
                <form action="viewFFResponses2" method="post">
                    <%
                        UserDAO UserDAO = new UserDAO();
                        FF FF = new FF();
                        FF = UserDAO.retrieveFFByFFID(Integer.parseInt(request.getAttribute("ffID").toString()));

                        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-mm-dd");
                        java.util.Date javaDate = new java.util.Date();
                        java.sql.Date sqlDate = new java.sql.Date(javaDate.getTime());
                    %>
                    
                                        <div class="container-fluid panels">
                        <%
                            double overall = ((double) UserDAO.countq9(FF.getId(), 5) * 5 + UserDAO.countq9(FF.getId(), 4) * 4 + UserDAO.countq9(FF.getId(), 3) * 3 + UserDAO.countq9(FF.getId(), 2) * 2 + UserDAO.countq9(FF.getId(), 1) * 1) / (UserDAO.countq9(FF.getId(), 5) + UserDAO.countq9(FF.getId(), 4) + UserDAO.countq9(FF.getId(), 3) + UserDAO.countq9(FF.getId(), 2) + UserDAO.countq9(FF.getId(), 1));
                        %>


                        <h2 class="kraheading">Overall Rating - <%=overall%></h2>
                        <div class="card-deck">
                            <div class="card bg-white">
                                <div class="card-body text-center">
                                    <div id="canvas-holder" style="width:50%" >
                                        <canvas id="chartVIEWSEOVERALL" style="margin-left:380px"></canvas>
                                    </div>
                                    <script>
                                        Chart.defaults.global.legend.display = true;
                                        var ctx = document.getElementById('chartVIEWSEOVERALL').getContext('2d');
                                        ctx.canvas.width = 35;
                                        ctx.canvas.height = 15;
                                        var chartVIEWSEOVERALL = new Chart(ctx, {
                                            type: 'pie',
                                            data: {
                                                labels: ['5', '4', '3', '2', '1', 'NEI', 'N/A'],
                                                datasets:
                                                        [{
                                                                data: [<%=UserDAO.countq9(FF.getId(), 5)%>, <%=UserDAO.countq9(FF.getId(), 4)%>, <%=UserDAO.countq9(FF.getId(), 3)%>, <%=UserDAO.countq9(FF.getId(), 2)%>, <%=UserDAO.countq9(FF.getId(), 1)%>, <%=UserDAO.countq9(FF.getId(), 6)%>, <%=UserDAO.countq9(FF.getId(), 7)%>],
                                                                backgroundColor: ['#F80000', '#C000F8', '#F89D00', '#0077F8', '#F8F400', '#18F800', '#0077F8']
                                                            }],
                                            },
                                            options: {
                                                legend: {
                                                    display: true,
                                                    position: 'bottom',
                                                    labels: {
                                                        boxWidth: 60,
                                                        fontSize: 20
                                                    }
                                                },
                                                tooltips: {
                                                    titleFontSize: 18,
                                                    bodyFontSize: 18
                                                }
                                            }

                                        });
                                    </script> 
                                </div>
                            </div>
                        </div>
                    </div>
                                                                
                    <div class="container-fluid panels">
                        <h2><%=FF.getProjectName()%> Evaluation Responses - <%=sqlDate%></h2>
                    </div>

                    <!--Criterias-->
                    <div class="container-fluid panels">

                        <h2>Criterias</h2>

                        <p></p>

                        <div class="card-deck">
                            <div class="card chartscardslong">
                                <h3>1. The announcements and reminders about the retreat were enough.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartFFQ1"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                            </div>
                            <div class="card chartscardslong">
                                <h3>2. The registration process was simple and easy.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartFFQ2"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                            </div>
                            <div class="card chartscardslong">
                                <h3>3. The venue was suited for the activity.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartFFQ3"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                            </div>

                            <script>
                                Chart.defaults.global.legend.display = false;
                                var ctx = document.getElementById('chartFFQ1').getContext('2d');
                                var chartFFQ1 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "# of Programs",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countq1(FF.getId(), 5)%>, <%=UserDAO.countq1(FF.getId(), 4)%>, <%=UserDAO.countq1(FF.getId(), 3)%>, <%=UserDAO.countq1(FF.getId(), 2)%>, <%=UserDAO.countq1(FF.getId(), 1)%>, <%=UserDAO.countq1(FF.getId(), 6)%>, <%=UserDAO.countq1(FF.getId(), 7)%>]
                                            }
                                        ]
                                    },
                                    options: {
                                        legend: {display: false},
                                        title: {
                                            display: true,
                                        },
                                        scales: {
                                            yAxes: [{
                                                    ticks: {
                                                        beginAtZero: true,
                                                        fontSize: 16
                                                    }
                                                }],
                                            xAxes: [{
                                                    ticks: {
                                                        fontSize: 16
                                                    }
                                                }]
                                        },
                                        tooltips: {
                                            titleFontSize: 18,
                                            bodyFontSize: 18
                                        }
                                    }
                                });
                            </script>
                            <script>
                                Chart.defaults.global.legend.display = false;
                                var ctx = document.getElementById('chartFFQ2').getContext('2d');
                                var chartFFQ2 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "# of Programs",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countq2(FF.getId(), 5)%>, <%=UserDAO.countq2(FF.getId(), 4)%>, <%=UserDAO.countq2(FF.getId(), 3)%>, <%=UserDAO.countq2(FF.getId(), 2)%>, <%=UserDAO.countq2(FF.getId(), 1)%>, <%=UserDAO.countq2(FF.getId(), 6)%>, <%=UserDAO.countq2(FF.getId(), 7)%>]
                                            }
                                        ]
                                    },
                                    options: {
                                        legend: {display: false},
                                        title: {
                                            display: true,
                                        },
                                        scales: {
                                            yAxes: [{
                                                    ticks: {
                                                        beginAtZero: true,
                                                        fontSize: 16
                                                    }
                                                }],
                                            xAxes: [{
                                                    ticks: {
                                                        fontSize: 16
                                                    }
                                                }]
                                        },
                                        tooltips: {
                                            titleFontSize: 18,
                                            bodyFontSize: 18
                                        }
                                    }
                                });
                            </script>
                            <script>
                                Chart.defaults.global.legend.display = false;
                                var ctx = document.getElementById('chartFFQ3').getContext('2d');
                                var chartFFQ3 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "# of Programs",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countq3(FF.getId(), 5)%>, <%=UserDAO.countq3(FF.getId(), 4)%>, <%=UserDAO.countq3(FF.getId(), 3)%>, <%=UserDAO.countq3(FF.getId(), 2)%>, <%=UserDAO.countq3(FF.getId(), 1)%>, <%=UserDAO.countq3(FF.getId(), 6)%>, <%=UserDAO.countq3(FF.getId(), 7)%>]
                                            }
                                        ]
                                    },
                                    options: {
                                        legend: {display: false},
                                        title: {
                                            display: true,
                                        },
                                        scales: {
                                            yAxes: [{
                                                    ticks: {
                                                        beginAtZero: true,
                                                        fontSize: 16
                                                    }
                                                }],
                                            xAxes: [{
                                                    ticks: {
                                                        fontSize: 16
                                                    }
                                                }]
                                        },
                                        tooltips: {
                                            titleFontSize: 18,
                                            bodyFontSize: 18
                                        }
                                    }
                                });
                            </script>
                        </div>
                        <p></p>

                        <div class="card-deck">
                            <div class="card chartscardslong">
                                <h3>4. The food was sufficient, balanced/healthy, and delicious.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartFFQ4"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                            </div>
                            <div class="card chartscardslong">
                                <h3>5. The rooms allowed me to rest well and provided what I needed.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartFFQ5"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                            </div>
                            <div class="card chartscardslong">
                                <h3>6. Transportation was comfortable and safe.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartFFQ6"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                            </div>
                            <script>
                                Chart.defaults.global.legend.display = false;
                                var ctx = document.getElementById('chartFFQ4').getContext('2d');
                                var chartFFQ4 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "# of Programs",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countq4(FF.getId(), 5)%>, <%=UserDAO.countq4(FF.getId(), 4)%>, <%=UserDAO.countq4(FF.getId(), 3)%>, <%=UserDAO.countq4(FF.getId(), 2)%>, <%=UserDAO.countq4(FF.getId(), 1)%>, <%=UserDAO.countq4(FF.getId(), 6)%>, <%=UserDAO.countq4(FF.getId(), 7)%>]
                                            }
                                        ]
                                    },
                                    options: {
                                        legend: {display: false},
                                        title: {
                                            display: true,
                                        },
                                        scales: {
                                            yAxes: [{
                                                    ticks: {
                                                        beginAtZero: true,
                                                        fontSize: 16
                                                    }
                                                }],
                                            xAxes: [{
                                                    ticks: {
                                                        fontSize: 16
                                                    }
                                                }]
                                        },
                                        tooltips: {
                                            titleFontSize: 18,
                                            bodyFontSize: 18
                                        }
                                    }
                                });
                            </script>
                            <script>
                                Chart.defaults.global.legend.display = false;
                                var ctx = document.getElementById('chartFFQ5').getContext('2d');
                                var chartFFQ5 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "# of Programs",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countq5(FF.getId(), 5)%>, <%=UserDAO.countq5(FF.getId(), 4)%>, <%=UserDAO.countq5(FF.getId(), 3)%>, <%=UserDAO.countq5(FF.getId(), 2)%>, <%=UserDAO.countq5(FF.getId(), 1)%>, <%=UserDAO.countq5(FF.getId(), 6)%>, <%=UserDAO.countq5(FF.getId(), 7)%>]
                                            }
                                        ]
                                    },
                                    options: {
                                        legend: {display: false},
                                        title: {
                                            display: true,
                                        },
                                        scales: {
                                            yAxes: [{
                                                    ticks: {
                                                        beginAtZero: true,
                                                        fontSize: 16
                                                    }
                                                }],
                                            xAxes: [{
                                                    ticks: {
                                                        fontSize: 16
                                                    }
                                                }]
                                        },
                                        tooltips: {
                                            titleFontSize: 18,
                                            bodyFontSize: 18
                                        }
                                    }
                                });
                            </script>
                            <script>
                                Chart.defaults.global.legend.display = false;
                                var ctx = document.getElementById('chartFFQ6').getContext('2d');
                                var chartFFQ6 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "# of Programs",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countq6(FF.getId(), 5)%>, <%=UserDAO.countq6(FF.getId(), 4)%>, <%=UserDAO.countq6(FF.getId(), 3)%>, <%=UserDAO.countq6(FF.getId(), 2)%>, <%=UserDAO.countq6(FF.getId(), 1)%>, <%=UserDAO.countq6(FF.getId(), 6)%>, <%=UserDAO.countq6(FF.getId(), 7)%>]
                                            }
                                        ]
                                    },
                                    options: {
                                        legend: {display: false},
                                        title: {
                                            display: true,
                                        },
                                        scales: {
                                            yAxes: [{
                                                    ticks: {
                                                        beginAtZero: true,
                                                        fontSize: 16
                                                    }
                                                }],
                                            xAxes: [{
                                                    ticks: {
                                                        fontSize: 16
                                                    }
                                                }]
                                        },
                                        tooltips: {
                                            titleFontSize: 18,
                                            bodyFontSize: 18
                                        }
                                    }
                                });
                            </script>
                        </div>
                        <p></p>

                        <div class="card-deck">
                            <div class="card chartscardslong">
                                <h3>7. Overall, my experience in the retreat was meaningful.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartFFQ7"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                            </div>
                            <div class="card chartscardslong">
                                <h3>8. Coordination with LSPO regarding this retreat was efficient.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartFFQ8"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                            </div>
                            <script>
                                Chart.defaults.global.legend.display = false;
                                var ctx = document.getElementById('chartFFQ7').getContext('2d');
                                var chartFFQ7 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "# of Programs",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countq7(FF.getId(), 5)%>, <%=UserDAO.countq7(FF.getId(), 4)%>, <%=UserDAO.countq7(FF.getId(), 3)%>, <%=UserDAO.countq7(FF.getId(), 2)%>, <%=UserDAO.countq7(FF.getId(), 1)%>, <%=UserDAO.countq7(FF.getId(), 6)%>, <%=UserDAO.countq7(FF.getId(), 7)%>]
                                            }
                                        ]
                                    },
                                    options: {
                                        legend: {display: false},
                                        title: {
                                            display: true,
                                        },
                                        scales: {
                                            yAxes: [{
                                                    ticks: {
                                                        beginAtZero: true,
                                                        fontSize: 16
                                                    }
                                                }],
                                            xAxes: [{
                                                    ticks: {
                                                        fontSize: 16
                                                    }
                                                }]
                                        },
                                        tooltips: {
                                            titleFontSize: 18,
                                            bodyFontSize: 18
                                        }
                                    }
                                });
                            </script>
                            <script>
                                Chart.defaults.global.legend.display = false;
                                var ctx = document.getElementById('chartFFQ8').getContext('2d');
                                var chartFFQ8 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "# of Programs",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countq8(FF.getId(), 5)%>, <%=UserDAO.countq8(FF.getId(), 4)%>, <%=UserDAO.countq8(FF.getId(), 3)%>, <%=UserDAO.countq8(FF.getId(), 2)%>, <%=UserDAO.countq8(FF.getId(), 1)%>, <%=UserDAO.countq8(FF.getId(), 6)%>, <%=UserDAO.countq8(FF.getId(), 7)%>]
                                            }
                                        ]
                                    },
                                    options: {
                                        legend: {display: false},
                                        title: {
                                            display: true,
                                        },
                                        scales: {
                                            yAxes: [{
                                                    ticks: {
                                                        beginAtZero: true,
                                                        fontSize: 16
                                                    }
                                                }],
                                            xAxes: [{
                                                    ticks: {
                                                        fontSize: 16
                                                    }
                                                }]
                                        },
                                        tooltips: {
                                            titleFontSize: 18,
                                            bodyFontSize: 18
                                        }
                                    }
                                });
                            </script>
                        </div>
                        <p></p>

                    </div>

                    <!--Important Learnings-->
                    <div class="container-fluid panels">

                        <h2>Important Learnings</h2>

                        <p></p>
                        <%
                            ArrayList<String> learnings = new ArrayList();
                            learnings = UserDAO.getLearningEvaluation(FF.getId());
                        %>
                        <div class="card-deck">
                            <%
                                for (int i = 0; i < learnings.size(); i++) {
                            %>
                            <div class="card chartscardslong2">
                                <%=learnings.get(i)%>
                            </div>
                            <%
                                }
                            %>
                        </div>
                        <p></p>

                    </div>

                    <br>

                    <center>
                        <button name="ffID" value="<%=FF.getId()%>" type="submit" class="btn btn-primary" style="padding-left: 20px; padding-right: 20px;">
                            <i class="fa fa-angle-double-right"></i>
                        </button>
                    </center>

                    <br>
                </form>
            </div>

        </div>

    </body>
</html>