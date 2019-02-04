<%-- 
    Document   : OVPLM-termEndReport
    Created on : 06 18, 18, 7:59:10 PM
    Author     : Karl Madrid
--%>

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
                <form action="viewSEResponses2" method="post">

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

                    <!---pie chart-->
                    <div class="container-fluid panels">
                        <%
                            double overall = ((double) UserDAO.countor71(SE.getId(), 5) * 5 + UserDAO.countor71(SE.getId(), 4) * 4 + UserDAO.countor71(SE.getId(), 3) * 3 + UserDAO.countor71(SE.getId(), 2) * 2 + UserDAO.countor71(SE.getId(), 1) * 1) / (UserDAO.countor71(SE.getId(), 5) + UserDAO.countor71(SE.getId(), 4) + UserDAO.countor71(SE.getId(), 3) + UserDAO.countor71(SE.getId(), 2) + UserDAO.countor71(SE.getId(), 1));
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
                                                                data: [<%=UserDAO.countor71(SE.getId(), 5)%>, <%=UserDAO.countor71(SE.getId(), 4)%>, <%=UserDAO.countor71(SE.getId(), 3)%>, <%=UserDAO.countor71(SE.getId(), 2)%>, <%=UserDAO.countor71(SE.getId(), 1)%>, <%=UserDAO.countor71(SE.getId(), 6)%>, <%=UserDAO.countor71(SE.getId(), 7)%>],
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
                    <!--- pie chart-->

                    <!--Question 1-->
                    <div class="container-fluid panels">

                        <h2>1. Student Learning</h2>

                        <p></p>

                        <div class="card-deck">
                            <div class="card chartscardslong">
                                <h3>1.1. Service-Learning is relevant to the course I am taking</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartSEQ11"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                            </div>
                            <div class="card chartscardslong">
                                <h3>1.2. We were provided with course-based knowledge and skills necessary for project implementation.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartSEQ12"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                            </div>
                            <div class="card chartscardslong">
                                <h3>1.3. The learning outcomes of the course have been attained.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartSEQ13"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                            </div>

                            <script>
                                Chart.defaults.global.legend.display = false;
                                var ctx = document.getElementById('chartSEQ11').getContext('2d');
                                var chartSEQ11 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "# of Programs",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countsl11(SE.getId(), 5)%>, <%=UserDAO.countsl11(SE.getId(), 4)%>, <%=UserDAO.countsl11(SE.getId(), 3)%>, <%=UserDAO.countsl11(SE.getId(), 2)%>, <%=UserDAO.countsl11(SE.getId(), 1)%>, <%=UserDAO.countsl11(SE.getId(), 6)%>, <%=UserDAO.countsl11(SE.getId(), 7)%>]
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
                                var ctx = document.getElementById('chartSEQ12').getContext('2d');
                                var chartSEQ12 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "# of Programs",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countsl12(SE.getId(), 5)%>, <%=UserDAO.countsl12(SE.getId(), 4)%>, <%=UserDAO.countsl12(SE.getId(), 3)%>, <%=UserDAO.countsl12(SE.getId(), 2)%>, <%=UserDAO.countsl12(SE.getId(), 1)%>, <%=UserDAO.countsl12(SE.getId(), 6)%>, <%=UserDAO.countsl12(SE.getId(), 7)%>]
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
                                var ctx = document.getElementById('chartSEQ13').getContext('2d');
                                var chartSEQ13 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "# of Programs",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countsl13(SE.getId(), 5)%>, <%=UserDAO.countsl13(SE.getId(), 4)%>, <%=UserDAO.countsl13(SE.getId(), 3)%>, <%=UserDAO.countsl13(SE.getId(), 2)%>, <%=UserDAO.countsl13(SE.getId(), 1)%>, <%=UserDAO.countsl13(SE.getId(), 6)%>, <%=UserDAO.countsl13(SE.getId(), 7)%>]
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
                                <h3>1.4. The service component of the course has strengthened my belief that 
                                    students like me can contribute to the empowerment of poor and marginalized communities/sectors.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartSEQ14"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                            </div>
                            <div class="card chartscardslong">
                                <h3>1.5. I have gained better understanding of Service-Learning because of course.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartSEQ15"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                            </div>
                            <script>
                                Chart.defaults.global.legend.display = false;
                                var ctx = document.getElementById('chartSEQ14').getContext('2d');
                                var chartSEQ14 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "# of Programs",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countsl14(SE.getId(), 5)%>, <%=UserDAO.countsl14(SE.getId(), 4)%>, <%=UserDAO.countsl14(SE.getId(), 3)%>, <%=UserDAO.countsl14(SE.getId(), 2)%>, <%=UserDAO.countsl14(SE.getId(), 1)%>, <%=UserDAO.countsl14(SE.getId(), 6)%>, <%=UserDAO.countsl14(SE.getId(), 7)%>]
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
                                var ctx = document.getElementById('chartSEQ15').getContext('2d');
                                var chartSEQ15 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "# of Programs",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countsl15(SE.getId(), 5)%>, <%=UserDAO.countsl15(SE.getId(), 4)%>, <%=UserDAO.countsl15(SE.getId(), 3)%>, <%=UserDAO.countsl15(SE.getId(), 2)%>, <%=UserDAO.countsl15(SE.getId(), 1)%>, <%=UserDAO.countsl15(SE.getId(), 6)%>, <%=UserDAO.countsl15(SE.getId(), 7)%>]
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


                    </div>

                    <!--Question 2-->
                    <div class="container-fluid panels">

                        <h2>2. Student Safety</h2>

                        <p></p>

                        <div class="card-deck">
                            <div class="card chartscardslong">
                                <h3>2.1. We were oriented about the partner organization and off-campus policies prior to the actual visit.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartSEQ21"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                            </div>
                            <div class="card chartscardslong">
                                <h3>2.2. The vehicle drivers were alert and careful. (If DLSU Provided)</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartSEQ22"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                            </div>
                            <div class="card chartscardslong">
                                <h3>2.3. The vehicles are in good condition. (If DLSU Provided)</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartSEQ23"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                            </div>

                            <script>
                                Chart.defaults.global.legend.display = false;
                                var ctx = document.getElementById('chartSEQ21').getContext('2d');
                                var chartSEQ21 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "# of Programs",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countss21(SE.getId(), 5)%>, <%=UserDAO.countss21(SE.getId(), 4)%>, <%=UserDAO.countss21(SE.getId(), 3)%>, <%=UserDAO.countss21(SE.getId(), 2)%>, <%=UserDAO.countss21(SE.getId(), 1)%>, <%=UserDAO.countss21(SE.getId(), 6)%>, <%=UserDAO.countss21(SE.getId(), 7)%>]
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
                                var ctx = document.getElementById('chartSEQ22').getContext('2d');
                                var chartSEQ22 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "# of Programs",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countss22(SE.getId(), 5)%>, <%=UserDAO.countss22(SE.getId(), 4)%>, <%=UserDAO.countss22(SE.getId(), 3)%>, <%=UserDAO.countss22(SE.getId(), 2)%>, <%=UserDAO.countss22(SE.getId(), 1)%>, <%=UserDAO.countss22(SE.getId(), 6)%>, <%=UserDAO.countss22(SE.getId(), 7)%>]
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
                                var ctx = document.getElementById('chartSEQ23').getContext('2d');
                                var chartSEQ23 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "# of Programs",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countss23(SE.getId(), 5)%>, <%=UserDAO.countss23(SE.getId(), 4)%>, <%=UserDAO.countss23(SE.getId(), 3)%>, <%=UserDAO.countss23(SE.getId(), 2)%>, <%=UserDAO.countss23(SE.getId(), 1)%>, <%=UserDAO.countss23(SE.getId(), 6)%>, <%=UserDAO.countss23(SE.getId(), 7)%>]
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
                                <h3>2.4. The partner coordinators and adult companions were proactive in ensuring the safety of the students at all times.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartSEQ24"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                            </div>
                            <div class="card chartscardslong">
                                <h3>2.5. We felt safe and secure in the community during the community service / social engagement activity.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartSEQ25"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                            </div>
                            <script>
                                Chart.defaults.global.legend.display = false;
                                var ctx = document.getElementById('chartSEQ24').getContext('2d');
                                var chartSEQ24 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "# of Programs",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countss24(SE.getId(), 5)%>, <%=UserDAO.countss24(SE.getId(), 4)%>, <%=UserDAO.countss24(SE.getId(), 3)%>, <%=UserDAO.countss24(SE.getId(), 2)%>, <%=UserDAO.countss24(SE.getId(), 1)%>, <%=UserDAO.countss24(SE.getId(), 6)%>, <%=UserDAO.countss24(SE.getId(), 7)%>]
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
                                var ctx = document.getElementById('chartSEQ25').getContext('2d');
                                var chartSEQ25 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "# of Programs",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countss25(SE.getId(), 5)%>, <%=UserDAO.countss25(SE.getId(), 4)%>, <%=UserDAO.countss25(SE.getId(), 3)%>, <%=UserDAO.countss25(SE.getId(), 2)%>, <%=UserDAO.countss25(SE.getId(), 1)%>, <%=UserDAO.countss25(SE.getId(), 6)%>, <%=UserDAO.countss25(SE.getId(), 7)%>]
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
                    </div>

                    <!--Question 3-->
                    <div class="container-fluid panels">

                        <h2>3. Project Effectiveness</h2>

                        <p></p>

                        <div class="card-deck">
                            <div class="card chartscardslong">
                                <h3>3.1. Our project contributed to the efforts of the organization / community to respond to their own needs.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartSEQ31"  width="80" height="20" style="margin-left:100px"></canvas>
                                </div>
                            </div>
                            <script>
                                Chart.defaults.global.legend.display = false;
                                var ctx = document.getElementById('chartSEQ31').getContext('2d');
                                var chartSEQ31 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "# of Programs",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countpe31(SE.getId(), 5)%>, <%=UserDAO.countpe31(SE.getId(), 4)%>, <%=UserDAO.countpe31(SE.getId(), 3)%>, <%=UserDAO.countpe31(SE.getId(), 2)%>, <%=UserDAO.countpe31(SE.getId(), 1)%>, <%=UserDAO.countpe31(SE.getId(), 6)%>, <%=UserDAO.countpe31(SE.getId(), 7)%>]
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
                    </div>

                    <!--Question 4-->
                    <div class="container-fluid panels">

                        <h2>4.1. A project / activity plan was formulated.</h2>

                        <p></p>

                        <div class="card-deck">
                            <div class="card chartscardslong">
                                <h3>4.1. A project / activity plan was formulated.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartSEQ41"  width="80" height="20" style="margin-left:100px"></canvas>
                                </div>
                            </div>
                            <script>
                                Chart.defaults.global.legend.display = false;
                                var ctx = document.getElementById('chartSEQ41').getContext('2d');
                                var chartSEQ41 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "# of Programs",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countpj41(SE.getId(), 5)%>, <%=UserDAO.countpj41(SE.getId(), 4)%>, <%=UserDAO.countpj41(SE.getId(), 3)%>, <%=UserDAO.countpj41(SE.getId(), 2)%>, <%=UserDAO.countpj41(SE.getId(), 1)%>, <%=UserDAO.countpj41(SE.getId(), 6)%>, <%=UserDAO.countpj41(SE.getId(), 7)%>]
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
                    </div>

                    <!--Question 5-->
                    <div class="container-fluid panels">

                        <h2>5. Lasallian Values</h2>

                        <p></p>

                        <div class="card-deck">
                            <div class="card chartscardslong">
                                <h3>5.1. There was an opportunity to see and experience the situation of the community.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartSEQ51"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                            </div>
                            <div class="card chartscardslong">
                                <h3>5.2. There was an opportunity to analyze and reflect on the symptoms and causes of the community issue / problem being addressed.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartSEQ52"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                            </div>
                            <div class="card chartscardslong">
                                <h3>5.3. The project was a result of an analysis-reflection process on the community / partner situation.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartSEQ53"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                            </div>

                            <script>
                                Chart.defaults.global.legend.display = false;
                                var ctx = document.getElementById('chartSEQ51').getContext('2d');
                                var chartSEQ51 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "# of Programs",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countlv51(SE.getId(), 5)%>, <%=UserDAO.countlv51(SE.getId(), 4)%>, <%=UserDAO.countlv51(SE.getId(), 3)%>, <%=UserDAO.countlv51(SE.getId(), 2)%>, <%=UserDAO.countlv51(SE.getId(), 1)%>, <%=UserDAO.countlv51(SE.getId(), 6)%>, <%=UserDAO.countlv51(SE.getId(), 7)%>]
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
                                var ctx = document.getElementById('chartSEQ52').getContext('2d');
                                var chartSEQ52 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "# of Programs",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countlv52(SE.getId(), 5)%>, <%=UserDAO.countlv52(SE.getId(), 4)%>, <%=UserDAO.countlv52(SE.getId(), 3)%>, <%=UserDAO.countlv52(SE.getId(), 2)%>, <%=UserDAO.countlv52(SE.getId(), 1)%>, <%=UserDAO.countlv52(SE.getId(), 6)%>, <%=UserDAO.countlv52(SE.getId(), 7)%>]
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
                                var ctx = document.getElementById('chartSEQ53').getContext('2d');
                                var chartSEQ53 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "# of Programs",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countlv53(SE.getId(), 5)%>, <%=UserDAO.countlv53(SE.getId(), 4)%>, <%=UserDAO.countlv53(SE.getId(), 3)%>, <%=UserDAO.countlv53(SE.getId(), 2)%>, <%=UserDAO.countlv53(SE.getId(), 1)%>, <%=UserDAO.countlv53(SE.getId(), 6)%>, <%=UserDAO.countlv53(SE.getId(), 7)%>]
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
                                <h3>5.4. The project respected the dignity of all stakeholders.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartSEQ54"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                            </div>
                            <div class="card chartscardslong">
                                <h3>5.5. The partner organization/community members were involved in the consultation, planning, implementation and evaluation of the program/ project.</h3>
                                <div id="canvas-holder" style="width:80%">
                                    <canvas id="chartSEQ55"  width="100" height="50" style="margin-left:20px"></canvas>
                                </div>
                            </div>
                            <script>
                                Chart.defaults.global.legend.display = false;
                                var ctx = document.getElementById('chartSEQ54').getContext('2d');
                                var chartSEQ54 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "# of Programs",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countlv54(SE.getId(), 5)%>, <%=UserDAO.countlv54(SE.getId(), 4)%>, <%=UserDAO.countlv54(SE.getId(), 3)%>, <%=UserDAO.countlv54(SE.getId(), 2)%>, <%=UserDAO.countlv54(SE.getId(), 1)%>, <%=UserDAO.countlv54(SE.getId(), 6)%>, <%=UserDAO.countlv54(SE.getId(), 7)%>]
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
                                var ctx = document.getElementById('chartSEQ55').getContext('2d');
                                var chartSEQ55 = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["5", "4", "3", "2", "1", "NEI", "N/A"],
                                        datasets: [
                                            {
                                                label: "# of Programs",
                                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#EA4F2D", "#2DEA86"],
                                                data: [<%=UserDAO.countlv55(SE.getId(), 5)%>, <%=UserDAO.countlv55(SE.getId(), 4)%>, <%=UserDAO.countlv55(SE.getId(), 3)%>, <%=UserDAO.countlv55(SE.getId(), 2)%>, <%=UserDAO.countlv55(SE.getId(), 1)%>, <%=UserDAO.countlv55(SE.getId(), 6)%>, <%=UserDAO.countlv55(SE.getId(), 7)%>]
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
                    </div>

                    <br>

                    <center>
                        <button name="back" value="<%=SE.getId()%>" type="button btn-primary" class="btn btn-primary" style="padding-left: 20px; padding-right: 20px;">
                            <i class="fa fa-angle-double-left"></i>
                        </button>
                        <button name="seID" value="<%=SE.getId()%>" type="submit" class="btn btn-primary" style="padding-left: 20px; padding-right: 20px;">
                            <i class="fa fa-angle-double-right"></i>
                        </button>
                    </center>

                    <br>
                </form>
            </div>

        </div>

    </body>
</html>