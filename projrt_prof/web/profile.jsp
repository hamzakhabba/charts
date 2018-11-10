<%@page import="beans.Profil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="beans.Machine"%>
<%@page import="service.MachineService"%>
<%@page import="service.ProfileService"%>
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

            <h1>Ajouter Profile</h1>


            <div class="container" style="width: 80%">
                <div class="row">
                    <div class="form-group col-md-6">
                        <input id="operation" type="hidden" name="operation" value="add" v="" />
                        <label>Code : </label>
                        <input class="form-control" id="code"  name="code">
                    </div>
                    <div class="form-group col-md-6">
                        <label>Libelle : </label>
                        <input class="form-control" id="libelle"  name="libelle">
                    </div>
                    <div class="form-group col-md-12 text-center">
                        <button id="save" type="button" class="btn btn-success ">Ajouter</button>

                    </div>
                </div>
            </div>


            <h1>Liste des Profile</h1>
            <table border="0" id="customers"  class="table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Code</th>
                        <th>Libelle</th>
                        <th>Supprition</th>
                        <th>Modification</th>

                    </tr>
                </thead>
                <tbody id="container">
                    <%  ProfileService ms = new ProfileService();
                        for (Profil m : ms.findAll()) {
                    %>
                    <tr>
                        <td><%= m.getId()%></td>
                        <td><%= m.getCode()%></td>
                        <td><%= m.getLibelle()%></td>                                              
                        <td><button class="delete btn btn-danger btn-block" v="<%= m.getId()%>" type="button">Supprimer</button></td>
                        <td><button class="update btn btn-success btn-block" v="<%= m.getId()%>" type="button">Modifier</button></td>
                    </tr>
                    <% }%>
                </tbody>
            </table>

        </div>
        <script src="script/profil.js"></script>

        <script src="vendor/jquery/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="vendor/metisMenu/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="dist/js/sb-admin-2.js"></script>

    </body>
</html>