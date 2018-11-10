
<%@page import="beans.Profil"%>
<%@page import="service.ProfileService" %> 
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

        <script src="script/sweet.js"></script>
        <script src="script/jquery-3.3.1.min.js"></script>
    </head>
    <body>
        <%@include  file="menu.jsp" %>
        <div style="margin-left:20%;padding:1px 16px;height:1000px;">


            <h1>Affichage Employe Par Profile</h1>
            <div class="form-group">
                <label>Selects</label>
                <select class="form-control" name="profil" id="profil">
                    <option>Select Profil</option>
                    <%                                    ProfileService p = new ProfileService();
                        for (Profil elem : p.findAll()) {

                    %>
                    <option value="<%= elem.getId()%>"><%= elem.getLibelle()%></option>
                    <%
                        }
                    %>
                </select>
            </div>

            <div class="container" style="width: 20%">
                <div class="row">

                    <div class="col-sm-3">

                        <input type="hidden" id="pdf" name="pdf" value="">
                        <button id="h1" type="submit"  disabled="" class="btn btn-circle btn-danger">P</button>

                    </div>
                    <div>
                        <input type="hidden" id="excel" name="excel" value="">
                        <button id="h2" type="submit" disabled=""  class="btn btn-circle btn-success">E</button>

                    </div>
                </div>
            </div>

            <h1>Liste des Profile</h1>
            <table border="0" id="customers" class="table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                        <th>Nom  </th>
                        <th>Prenom  </th>
                        <th>Date Embauche  </th>
                        <th>Email  </th>

                    </tr>
                </thead>
                <tbody id="container">



                </tbody>
            </table>

        </div>
        <script src="script/employeparprofil.js"></script>

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