$(document).ready(function () {
                $('#container').on('click', '.delete', function () {
                    var id = $(this).attr("v");
                    if (confirm("Voulez-vous Vraiement supprimer cette machine ?")) {
                        $.ajax({
                            url: "DeleteProfil",
                            type: 'GET',
                            cache: false,
                            data: {id: id},
                            success: function (data) {
                                $("#container").empty();
                                $("#container").html(remplir(data));
                            },
                            error: function (errorThrown) {
                                console.log("erreur");
                            }
                        });
                        return true;
                    } else {
                        return false;
                    }
                });


                $('#container').on('click', '.update', function () {
                    var id = $(this).attr("v");
                    $.ajax({
                        url: "LoadProfil",
                        type: 'GET',
                        data: {id: id},
                        success: function (data) {
                            $("#code").val(data.code);
                            $("#libelle").val(data.libelle);
                            $("#save").html("Modifier");
                            $("#operation").val("update");
                            $("#operation").attr("v", id);


                        },
                        error: function (errorThrown) {
                            console.log("erreur");
                        }
                    });
                });


                function init() {
                    $("#code").val("");
                    $("#libelle").val("");
                }



                $("#save").click(function () {
                    var code = $("#code").val();
                    var libelle = $("#libelle").val();
                    var operation = $("#operation").val();
                    var id = $("#operation").attr("v");
                    $.ajax({
                        url: "AddProfil",
                        type: 'GET',
                        data: {id: id, code: code, libelle: libelle, operation: operation},
                        success: function (data) {
                            init(); //vider les champs 
                            $("#container").empty(); //vider le tableau
                            $("#container").html(remplir(data)); // remplir le tableau
                            $("#save").html("Ajouter");

                        },
                        error: function (errorThrown) {
                            console.log("erreur");
                        }
                    });
                });

                function remplir(data) {
                    var ligne = "";
                    for (i = 0; i < data.length; i++) {


                        ligne += '<tr><td>' + data[i].id + '</td><td>' + data[i].code + '</td><td>' + data[i].libelle + '</td>' + '</td><td><button class="delete btn btn-danger btn-block" v="' + data[i].id + '">Supprimer</button></td><td><button class="update btn btn-success btn-block" v="' + data[i].id + '">Modifier</button></td></tr>';
                    }
                    return ligne;
                }



            });
