<%@page import="java.text.SimpleDateFormat"%>
<%@page import="beans.Machine"%>
<%@page import="service.MachineService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">


        <!-- Bootstrap Core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="dist/css/sb-admin-2.css" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="vendor/morrisjs/morris.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script src="script/jquery-3.3.1.min.js"></script>

    </head>
    <body>
        <%@include  file="menu.jsp" %>
        <div style="margin-left:20%;padding:1px 16px;height:1000px;">

            <H1>Ajouter Machine</H1>
            <div class="container" style="width: 80%">
                <div class="row">
                    <input id="operation" type="hidden" name="operation" value="add" v="" />
                    <div class="form-group col-md-6">
                        <label>Marque : </label>
                        <input class="form-control" id="marque"  name="marque">
                    </div>
                    <div class="form-group col-md-6">
                        <label>Référence : </label>
                        <input class="form-control" id="referenece"  name="referenece">
                    </div>
                    <div class="form-group col-md-6">
                        <label>Date Achat : </label>
                        <input type="date" class="form-control" id="date"  name="date">
                    </div>
                    <div class="form-group col-md-6">
                        <label>Prix : </label>
                        <input class="form-control" type="number" id="prix"  name="prix">
                    </div>
                    <div class="form-group col-md-12 text-center">
                        <button id="save" class="btn btn-success">Ajouter</button>
                    </div>
                </div>
            </div>

          

                <h1>Liste des machines</h1>
                <table border="0" id="customers" class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Marque</th>
                            <th>Reference</th>
                            <th>Date Achat</th>
                            <th>Prix</th>
                            <th>Supprimer</th>
                            <th>Modifier</th>
                        </tr>
                    </thead>
                    <tbody id="container">
                        <%                            MachineService ms = new MachineService();
                            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                            for (Machine m : ms.findAll()) {
                        %>
                        <tr>
                            <td><%= m.getId()%></td>
                            <td><%= m.getMarque()%></td>
                            <td><%= m.getReference()%></td>
                            <td><%= sdf.format(m.getDateAchat())%></td>
                            <td><%= m.getPrix()%></td>
                            <td><button class="delete btn btn-danger btn-block" v="<%= m.getId()%>">Supprimer</button></td>
                            <td><button class="update btn btn-success btn-block" v="<%= m.getId()%>">Modifier</button></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>

        </div>

        <script src="script/machines.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="vendor/metisMenu/metisMenu.min.js"></script>

        <!-- Morris Charts JavaScript -->
        <script src="vendor/raphael/raphael.min.js"></script>
        <script src="vendor/morrisjs/morris.min.js"></script>
        <script src="data/morris-data.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="dist/js/sb-admin-2.js"></script>
    </body>
</html>