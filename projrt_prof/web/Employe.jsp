<%@page import="service.EmployeService"%>
<%@page import="beans.Profil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="beans.Employe"%>
<%@page import="service.ProfileService"%>
<%@page import="service.EmployeService"%>
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

            <h1>Ajouter Employe</h1>
            <div class="container" style="width: 80%">
                <div class="row">
                    <div class="form-group col-sm-4">
                        <input id="operation" type="hidden" name="operation" value="add" v="" />
                        <label>Nom : </label>
                        <input class="form-control" id="nom"  name="nom">
                    </div>
                    <div class="form-group col-sm-4">
                        <label>Prenom : </label>
                        <input class="form-control" id="prenom"  name="prenom">
                    </div>
                    <div class="form-group col-sm-4">
                        <label>Date Empauch : </label>
                        <input type="date" class="form-control" id="date_e"  name="date_e">
                    </div>
                    <div class="form-group col-sm-4">
                        <label>Email : </label>
                        <input class="form-control" id="email"  name="email">
                    </div>
                    <div class="form-group col-sm-4">
                        <label>Password : </label>
                        <input class="form-control" type="password" id="password"  name="password">
                    </div>

                    <div class="form-group col-sm-4">
                        <label>Select Profil</label>
                        <select class="form-control" name="profil" id="profil" >
                            <option>Select Profil</option>
                            <% ProfileService ms = new ProfileService();
                                for (Profil m : ms.findAll()) {
                            %>
                            <option value="<%= m.getId()%>"><%= m.getLibelle()%></option>
                            <% }%>
                        </select>
                    </div>
                    <div class="form-group col-md-12 text-center">
                        <button id="save" type="button" class="btn btn-success ">Ajouter</button>
                    </div>

                </div>
            </div>


            <h1>Liste des Employes</h1>
            <table border="0" id="customers" class="table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nom</th>
                        <th>Prenom</th>
                        <th>Date Embauche</th>
                        <th>Email</th>
                        <th>Profil</th>
                        <th>Supprition</th>
                        <th>Modification</th>

                    </tr>
                </thead>
                <tbody id="container">

                    <%
                        EmployeService m = new EmployeService();
                        for (Employe e : m.findAll()) {

                            Profil p = e.getProfil();
                    %>
                    <tr>
                        <td><%= e.getId()%></td>
                        <td><%= e.getNom()%></td>   
                        <td><%= e.getPrenom()%></td> 
                        <td><%= e.getDateEmbauche()%></td> 
                        <td><%= e.getEmail()%></td>
                        <td><%= p.getLibelle()%></td>




                        <td><button class="delete btn btn-danger btn-block" v="<%= e.getId()%>">Supprimer</button></td>
                        <td><button class="update btn btn-success btn-block" v="<%= e.getId()%>">Modifier</button></td>
                    </tr>
                    <% }%>

                </tbody>
            </table>
        </fieldset>
    </div>
    <script src="script/employe.js"></script>

    <script src="vendor/jquery/jquery.min.js"></script>

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