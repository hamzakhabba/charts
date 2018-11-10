$(document).ready(function () {


                function remplir(data) {
                    var ligne = "";
                    for (i = 0; i < data.length; i++) {
                         var now = new Date(data[i].dateEmbauche);
                        var day = now.getDate();
                        var month = ((now.getMonth() + 1));
                        var today = now.getFullYear() + "-" + (month) + "-" + (day);
                        ligne += '<tr></td><td>' + data[i].nom + '</td><td>' + data[i].prenom + '</td> <td>' + today + '</td> <td>' + data[i].email + '</td></tr>';
                    }
                    return ligne;
                }
                ;



                $("#profil").change(function () {

                    let id = $("#profil").val();

                    let date2 = $("#deuxie_date").val();

                    let date1 = $("#premier_date").val();



                    $.ajax({
                        url: 'AfficheEmployeparprofileentredate',
                        type: 'GET',
                        data: {id: id, date1: date1, date2: date2},
                        success: function (data, textStatus, jqXHR) {

                            $("#container").empty();
                            $("#container").html(remplir(data));
                        },
                        error: function (errorThrown) {
                            console.log(errorThrown);
                        }
                    });
                });

            });

