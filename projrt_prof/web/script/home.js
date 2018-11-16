$(document).ready(function () {
                $(window).load(
                        $.ajax({
                            url: "Graphe_employe_par_profil",
                            type: 'GET',
                            cache: false,
                            dataType: 'json',
                            data: {},
                            error: function (jqXHR, textStatus, errorThrown) {
                                  console.load("erreur");
                            },
                            success: function (data) {

                                var a = [];
                                var b = [];
                                console.log(data);
                                
                                for (var i = 0; i < data.length; i++) {

                                    a[i] = data[i][0];
                                    b[i] = data[i][1];
                                }
                                                          

                                var ctx = $("#myChart");
                                var myChart = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: a,
                                        datasets: [{
                                                label:'# of Votes',
                                                data: b,
                                                backgroundColor: [
                                                    'rgba(255, 99, 132, 0.2)',
                                                    'rgba(54, 162, 235, 0.2)',
                                                    'rgba(255, 206, 86, 0.2)',
                                                    'rgba(75, 192, 192, 0.2)',
                                                    'rgba(153, 102, 255, 0.2)',
                                                    'rgba(255, 159, 64, 0.2)'
                                                ],
                                                borderColor: [
                                                    'rgba(255,99,132,1)',
                                                    'rgba(54, 162, 235, 1)',
                                                    'rgba(255, 206, 86, 1)',
                                                    'rgba(75, 192, 192, 1)',
                                                    'rgba(153, 102, 255, 1)',
                                                    'rgba(255, 159, 64, 1)'
                                                ],
                                                borderWidth: 1
                                            }]
                                    },
                                    options: {
                                        scales: {
                                            yAxes: [{
                                                    ticks: {
                                                        beginAtZero: true
                                                    }
                                                }]
                                        }
                                    }
                                });






                            }
                        })

                        );


            });

