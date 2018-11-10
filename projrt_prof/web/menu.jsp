
<!--
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nom = session.getAttribute("nom").toString();
    if(nom.isEmpty())
    response.sendRedirect("index.jsp");

%>
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">Gestion</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                
                <!-- /.dropdown -->
                
                <!-- /.dropdown -->
                
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                       
                        <li class="divider"></li>
                        <li>
                            <a><%= nom%></a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="logout">
                                <i class="fa fa-sign-out fa-fw"></i> Logout
                            </a>
                        </li>
                        
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                       
                        <li>
                            <a href="Home.jsp"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Gestions<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="machine.jsp"><i class="fa fa-table fa-fw"></i> Gestion des machines</a>
                                </li>
                                <li>
                                    <a href="profile.jsp"><i class="fa fa-table fa-fw"></i> Gestion des Profils</a>
                                </li>
                                <li>
                                    <a href="Employe.jsp"><i class="fa fa-table fa-fw"></i> Gestion des Employes</a>
                                </li>
                                 <li>
                                    <a href="EmployeparProfil.jsp"><i class="fa fa-table fa-fw"></i>Employes par Profil</a>
                                </li>
                                <li>
                                    <a href="EmployeparProfileentredate.jsp"><i class="fa fa-table fa-fw"></i>Employes par Profile Entre Date</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
