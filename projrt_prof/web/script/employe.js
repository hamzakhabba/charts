$(document).ready(function () {


            $('#container').on('click', '.update', function () {
                var id = $(this).attr("v");
                $.ajax({
                    url: "LoadEmploye",
                    type: 'GET',
                    data: {id: id},
                    success: function (data) {

                        $("#nom").val(data[0][3]);
                        $("#prenom").val(data[0][5]);
                        var now = new Date(data[0][1]);
                        var day = ("0" + now.getDate()).slice(-2);
                        var month = ("0" + (now.getMonth() + 1)).slice(-2);
                        var today = now.getFullYear() + "-" + (month) + "-" + (day);

                        $('#date_e').val(today);
                        $("#email").val(data[0][2]);
                        $("#password").val(data[0][4]);

                        $("#profil option:first").text(data[0][7]);
                        $("#profil option:first").val(data[0][6]);


                        $("#save").html("Modifier");
                        $("#operation").val("update");
                        $("#operation").attr("v", id);
                        



                    },
                    error: function (errorThrown) {
                        console.log("erreur");
                    }
                });
            });


            $('#container').on('click', '.delete', function () {
                var id = $(this).attr("v");
                if (confirm("Voulez-vous Vraiement supprimer cette machine ?")) {
                    $.ajax({
                        url: "DeleteEmploye",
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


            $("#save").click(function () {
                var nom = $("#nom").val();
                var prenom = $("#prenom").val();
                var date_r = $("#date_e").val();
                var email = $("#email").val();
                var pass = $("#password").val();
                var profil = $("#profil").val();
                var operation = $("#operation").val();
                var id = $("#operation").attr("v");
                $.ajax({
                    url: "AddEmploye",
                    type: 'GET',
                    data: {id: id, nom: nom, prenom: prenom, date_r: date_r, email: email, pass: pass, operation: operation, profil: profil},
                    success: function (data) {
                        
                        init();
                        $("#container").empty(); //vider le tableau
                        $("#container").html(remplir(data)); // remplir le tableau
                        $("#save").html("Ajouter");
                    }
                });
            });

            function remplir(data) {
                var ligne = "";

                for (i = 0; i < data.length; i++) {

                    var now = new Date(data[i][1]);
                    var day = ("0" + now.getDate()).slice(-2);
                    var month = ("0" + (now.getMonth() + 1)).slice(-2);
                    var today = now.getFullYear() + "/" + (month) + "/" + (day);
                    ligne += "<tr><td>" + data[i][0] + "</td><td>" + data[i][3] + "</td><td>" + data[i][5] + "</td><td>" + today + "</td><td>" + data[i][2] + "</td><td>" + data[i][7] + "</td><td><button class='delete btn btn-danger btn-block' v='" + data[i][0] + "'>Supprimer</button></td><td><button class='update btn btn-success btn-block' v='" + data[i][0] + "'>Modifier</button></td></tr>";
                }
                return ligne;
            }
            ;


        });

        function init() {

            $("#nom").val("");
            $("#prenom").val("");
            $("#password").val("");
            $("#email").val("");
            $("#profil").val("");
            $("#date_e").val("");
        }
        ;


