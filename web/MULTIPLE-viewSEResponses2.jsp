<%-- 
    Document   : OVPLM-termEndReport
    Created on : 06 18, 18, 7:59:10 PM
    Author     : Karl Madrid
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entity.SE"%>
<%@page import="dao.UserDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>SE Evaluation Responses</title>

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
                <form action="viewSEResponses2">
                    <%
                        UserDAO UserDAO = new UserDAO();
                        SE SE = new SE();
                        SE = UserDAO.retrieveSEBySEID(Integer.parseInt(request.getAttribute("seID").toString()));

                        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-mm-dd");
                        java.util.Date javaDate = new java.util.Date();
                        java.sql.Date sqlDate = new java.sql.Date(javaDate.getTime());
                    %>

                    <div class="container-fluid panels">
                        <h2><%=SE.getName()%> Evaluation Responses - <%=sqlDate%></h2>
                    </div>

                    <!--Question 6-->
                    <div class="container-fluid panels">

                        <h2>6. Program Management</h2>

                        <p></p>

                        <div class="card-deck">
                            <div class="card chartscardslong">
                                <h3>6.1. The social engagement project can be continued or sustained by the partner organization on their own.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartSEQ61"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                                <center><b><p>Average Score: <%=UserDAO.averagepm61(SE.getId())%></p></b></center>
                            </div>
                            <div class="card chartscardslong">
                                <h3>6.2. Everyone in our group was able to perform and complete her / his assigned tasks.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartSEQ62"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                                <center><b><p>Average Score: <%=UserDAO.averagepm62(SE.getId())%></p></b></center>
                            </div>
                            <div class="card chartscardslong">
                                <h3>6.3. The group received clear, relevant, and immediate communication from partner coordinators for project-related concerns.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartSEQ63"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                                <center><b><p>Average Score: <%=UserDAO.averagepm63(SE.getId())%></p></b></center>
                            </div>
                            <script>
                                Chart.defaults.global.legend.display = false;
                                var ctx = document.getElementById('chartSEQ61').getContext('2d');
                                var chartSEQ61 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "Count",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countpm61(SE.getId(), 5)%>, <%=UserDAO.countpm61(SE.getId(), 4)%>, <%=UserDAO.countpm61(SE.getId(), 3)%>, <%=UserDAO.countpm61(SE.getId(), 2)%>, <%=UserDAO.countpm61(SE.getId(), 1)%>, <%=UserDAO.countpm61(SE.getId(), 6)%>, <%=UserDAO.countpm61(SE.getId(), 7)%>]
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
                                var ctx = document.getElementById('chartSEQ62').getContext('2d');
                                var chartSEQ62 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "Count",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countpm62(SE.getId(), 5)%>, <%=UserDAO.countpm62(SE.getId(), 4)%>, <%=UserDAO.countpm62(SE.getId(), 3)%>, <%=UserDAO.countpm62(SE.getId(), 2)%>, <%=UserDAO.countpm62(SE.getId(), 1)%>, <%=UserDAO.countpm62(SE.getId(), 6)%>, <%=UserDAO.countpm62(SE.getId(), 7)%>]
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
                                var ctx = document.getElementById('chartSEQ63').getContext('2d');
                                var chartSEQ63 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "Count",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countpm63(SE.getId(), 5)%>, <%=UserDAO.countpm63(SE.getId(), 4)%>, <%=UserDAO.countpm63(SE.getId(), 3)%>, <%=UserDAO.countpm63(SE.getId(), 2)%>, <%=UserDAO.countpm63(SE.getId(), 1)%>, <%=UserDAO.countpm63(SE.getId(), 6)%>, <%=UserDAO.countpm63(SE.getId(), 7)%>]
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
                                <h3>6.4. The Social Engagement Coordinator provided briefing/orientation.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartSEQ64"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                                <center><b><p>Average Score: <%=UserDAO.averagepm64(SE.getId())%></p></b></center>
                            </div>
                            <div class="card chartscardslong">
                                <h3>6.5. The partner organization/community provided in-depth organizational profile and program orientation.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartSEQ65"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                                <center><b><p>Average Score: <%=UserDAO.averagepm65(SE.getId())%></p></b></center>
                            </div>
                            <div class="card chartscardslong">
                                <h3>6.6. The partner organization provided orientation and levelling-off on project outputs.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartSEQ66"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                                <center><b><p>Average Score: <%=UserDAO.averagepm66(SE.getId())%></p></b></center>
                            </div>
                            <script>
                                Chart.defaults.global.legend.display = false;
                                var ctx = document.getElementById('chartSEQ64').getContext('2d');
                                var chartSEQ64 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "Count",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countpm64(SE.getId(), 5)%>, <%=UserDAO.countpm64(SE.getId(), 4)%>, <%=UserDAO.countpm64(SE.getId(), 3)%>, <%=UserDAO.countpm64(SE.getId(), 2)%>, <%=UserDAO.countpm64(SE.getId(), 1)%>, <%=UserDAO.countpm64(SE.getId(), 6)%>, <%=UserDAO.countpm64(SE.getId(), 7)%>]
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
                                var ctx = document.getElementById('chartSEQ65').getContext('2d');
                                var chartSEQ65 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "Count",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countpm65(SE.getId(), 5)%>, <%=UserDAO.countpm65(SE.getId(), 4)%>, <%=UserDAO.countpm65(SE.getId(), 3)%>, <%=UserDAO.countpm65(SE.getId(), 2)%>, <%=UserDAO.countpm65(SE.getId(), 1)%>, <%=UserDAO.countpm65(SE.getId(), 6)%>, <%=UserDAO.countpm65(SE.getId(), 7)%>]
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
                                var ctx = document.getElementById('chartSEQ66').getContext('2d');
                                var chartSEQ66 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "Count",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countpm66(SE.getId(), 5)%>, <%=UserDAO.countpm66(SE.getId(), 4)%>, <%=UserDAO.countpm66(SE.getId(), 3)%>, <%=UserDAO.countpm66(SE.getId(), 2)%>, <%=UserDAO.countpm66(SE.getId(), 1)%>, <%=UserDAO.countpm66(SE.getId(), 6)%>, <%=UserDAO.countpm66(SE.getId(), 7)%>]
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
                                <h3>6.7. There was proper coordination and cooperation between Lasallians and leaders of the partner organization.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartSEQ67"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                                <center><b><p>Average Score: <%=UserDAO.averagepm67(SE.getId())%></p></b></center>
                            </div>
                            <div class="card chartscardslong">
                                <h3>6.8. The social engagement coordinator was involved in the entire process of service activity especially during project implementation.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartSEQ68"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                                <center><b><p>Average Score: <%=UserDAO.averagepm68(SE.getId())%></p></b></center>
                            </div>
                            <div class="card chartscardslong">
                                <h3>6.9. The meeting venue in the community / organization was conducive for our activity.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartSEQ69"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                                <center><b><p>Average Score: <%=UserDAO.averagepm69(SE.getId())%></p></b></center>
                            </div>
                            <script>
                                Chart.defaults.global.legend.display = false;
                                var ctx = document.getElementById('chartSEQ67').getContext('2d');
                                var chartSEQ67 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "Count",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countpm67(SE.getId(), 5)%>, <%=UserDAO.countpm67(SE.getId(), 4)%>, <%=UserDAO.countpm67(SE.getId(), 3)%>, <%=UserDAO.countpm67(SE.getId(), 2)%>, <%=UserDAO.countpm67(SE.getId(), 1)%>, <%=UserDAO.countpm67(SE.getId(), 6)%>, <%=UserDAO.countpm67(SE.getId(), 7)%>]
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
                                var ctx = document.getElementById('chartSEQ68').getContext('2d');
                                var chartSEQ68 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "Count",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countpm68(SE.getId(), 5)%>, <%=UserDAO.countpm68(SE.getId(), 4)%>, <%=UserDAO.countpm68(SE.getId(), 3)%>, <%=UserDAO.countpm68(SE.getId(), 2)%>, <%=UserDAO.countpm68(SE.getId(), 1)%>, <%=UserDAO.countpm68(SE.getId(), 6)%>, <%=UserDAO.countpm68(SE.getId(), 7)%>]
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
                                var ctx = document.getElementById('chartSEQ69').getContext('2d');
                                var chartSEQ69 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "Count",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countpm69(SE.getId(), 5)%>, <%=UserDAO.countpm69(SE.getId(), 4)%>, <%=UserDAO.countpm69(SE.getId(), 3)%>, <%=UserDAO.countpm69(SE.getId(), 2)%>, <%=UserDAO.countpm69(SE.getId(), 1)%>, <%=UserDAO.countpm69(SE.getId(), 6)%>, <%=UserDAO.countpm69(SE.getId(), 7)%>]
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
                                <h3>6.10. The organization was able to impart valuable contribution in the formation of Lasallians s to become service-driven citizens.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartSEQ610"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                                <center><b><p>Average Score: <%=UserDAO.averagepm610(SE.getId())%></p></b></center>
                            </div>
                            <div class="card chartscardslong">
                                <h3>6.11. The partner organization/community member(s) was very helpful during project implementation.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartSEQ611"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                                <center><b><p>Average Score: <%=UserDAO.averagepm611(SE.getId())%></p></b></center>
                            </div>
                            <script>
                                Chart.defaults.global.legend.display = false;
                                var ctx = document.getElementById('chartSEQ610').getContext('2d');
                                var chartSEQ610 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "Count",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countpm610(SE.getId(), 5)%>, <%=UserDAO.countpm610(SE.getId(), 4)%>, <%=UserDAO.countpm610(SE.getId(), 3)%>, <%=UserDAO.countpm610(SE.getId(), 2)%>, <%=UserDAO.countpm610(SE.getId(), 1)%>, <%=UserDAO.countpm610(SE.getId(), 6)%>, <%=UserDAO.countpm610(SE.getId(), 7)%>]
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
                                var ctx = document.getElementById('chartSEQ611').getContext('2d');
                                var chartSEQ611 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "Count",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countpm611(SE.getId(), 5)%>, <%=UserDAO.countpm611(SE.getId(), 4)%>, <%=UserDAO.countpm611(SE.getId(), 3)%>, <%=UserDAO.countpm611(SE.getId(), 2)%>, <%=UserDAO.countpm611(SE.getId(), 1)%>, <%=UserDAO.countpm611(SE.getId(), 6)%>, <%=UserDAO.countpm611(SE.getId(), 7)%>]
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
                                <h3>6.12. Community leaders and focal persons were available most of the time during area visits or whenever we needed to consult them on the project.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartSEQ612"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                                <center><b><p>Average Score: <%=UserDAO.averagepm612(SE.getId())%></p></b></center>
                            </div>
                            <div class="card chartscardslong">
                                <h3>6.13. The partner organization provided counterpart (e.g. time, venue, etc) in the implementation of our project.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartSEQ613"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                                <center><b><p>Average Score: <%=UserDAO.averagepm613(SE.getId())%></p></b></center>
                            </div>
                            <script>
                                Chart.defaults.global.legend.display = false;
                                var ctx = document.getElementById('chartSEQ612').getContext('2d');
                                var chartSEQ612 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "Count",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countpm612(SE.getId(), 5)%>, <%=UserDAO.countpm612(SE.getId(), 4)%>, <%=UserDAO.countpm612(SE.getId(), 3)%>, <%=UserDAO.countpm612(SE.getId(), 2)%>, <%=UserDAO.countpm612(SE.getId(), 1)%>, <%=UserDAO.countpm612(SE.getId(), 6)%>, <%=UserDAO.countpm612(SE.getId(), 7)%>]
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
                                var ctx = document.getElementById('chartSEQ613').getContext('2d');
                                var chartSEQ613 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "Count",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countpm613(SE.getId(), 5)%>, <%=UserDAO.countpm613(SE.getId(), 4)%>, <%=UserDAO.countpm613(SE.getId(), 3)%>, <%=UserDAO.countpm613(SE.getId(), 2)%>, <%=UserDAO.countpm613(SE.getId(), 1)%>, <%=UserDAO.countpm613(SE.getId(), 6)%>, <%=UserDAO.countpm613(SE.getId(), 7)%>]
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

                    <!--Question 6-->
                    <div class="container-fluid panels">

                        <h2>Feedbacks and Suggestions</h2>

                        <p></p>

                        <%
                            ArrayList<String> feedbacks = new ArrayList();
                            feedbacks = UserDAO.getFeedbackEvaluation(SE.getId());
                        %>
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
                        <p></p>
                    </div>
                    <br>
                    <center><button name="back2" value="<%=SE.getId()%>" type="button btn-primary" class="btn btn-primary" style="padding-left: 20px; padding-right: 20px;">
                        <i class="fa fa-angle-double-left"></i>
                        </button></center>
                </form>
            </div>
        </div>
    </body>
</html>