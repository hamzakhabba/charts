$(document).ready(function () {

                function remplir(data) {
                    var ligne = "";

                    for (i = 0; i < data.length; i++) {

                        var now = new Date(data[i].dateEmbauche);
                        var day = now.getDate();
                        var month = ((now.getMonth() + 1));
                        var today = now.getFullYear() + "-" + (month) + "" + (day);
                        ligne += '<tr></td><td>' + data[i].nom + '</td><td>' + data[i].prenom + '</td> <td>' + today + '</td> <td>' + data[i].email + '</td></tr>';
                    }
                    return ligne;
                }
                ;

                $("#profil").change(function () {

                    let id = $("#profil").val();
                    $("#pdf").attr("value", id);
                    $("#excel").attr("value", id);
                    $.ajax({
                        url: 'AfficherEmployeparProfil',
                        type: 'GET',
                        data: {id: id},
                        success: function (data, textStatus, jqXHR) {
                            if (data != "") {

                                $("#h1").removeAttr("disabled");
                                $("#h2").removeAttr("disabled")
                            }
                            $("#container").empty();
                            $("#container").html(remplir(data));
                        },
                        error: function (errorThrown) {
                            console.log(errorThrown);
                        }
                    });
                });

                $("#h1").click(function () {
                    var pdf=$("#pdf").val();
                     $.ajax({
                        url: 'pdf',
                        type: 'GET',
                        data: {pdf:pdf},
                        success: function (data, textStatus, jqXHR) {
                            
                            swal("Parfait", data, "success");
                        },
                        error: function (errorThrown) {
                            console.log(errorThrown);
                        }
                    });


                });
                $("#h2").click(function () {
                    var excel=$("#excel").val();
                     $.ajax({
                        url: 'excel',
                        type: 'GET',
                        data: {excel:excel},
                        success: function (data, textStatus, jqXHR) {
                            
                            swal("Parfait ", data, "success");
                        },
                        error: function (errorThrown) {
                            console.log(errorThrown);
                        }
                    });


                });

            });

