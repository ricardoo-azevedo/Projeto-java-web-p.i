



<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>iMEDIC</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="css/styles.css" rel="stylesheet" />        
    <link href="css/estilo.css" rel="stylesheet" />
</head>
<body>

    <div class="d-flex" id="wrapper">
        <!-- Sidebar-->
        <div class="border-center coluna-esquerda bg-success" id="sidebar-wrapper">
            <div class="sidebar-heading border-bottom bg-success text-center ">SISTEMA MEDIC</div>
            <div class="list-group list-group-flush">
                

                <a class="list-group-item list-group-item-action list-group-item-success p-3" href="index.jsp">Painel</a>
                <a class="list-group-item list-group-item-action list-group-item-success p-3" href="form-unidade-saude.jsp">Unidade de Saúde</a>
                <a class="list-group-item list-group-item-action list-group-item-success p-3" href="form-paciente.jsp">Paciente</a>
                <a class="list-group-item list-group-item-action list-group-item-success p-3" href="form-medico.jsp">Medico(a)</a>
                <a class="list-group-item list-group-item-action list-group-item-success p-3" href="Agendamento.jsp">Agendamento</a>
                <a class="list-group-item list-group-item-action list-group-item-success p-3" href="../index.jsp">Sair</a>
            </div>
        </div>
        <!-- Page content wrapper-->
        <div class="col" id="page-content-wrapper">
            <!-- Top navigation-->
            <nav class="navbar navbar-expand-lg navbar-light  bg-Light border-bottom">
                <div class="container-fluid">
                    <button class="btn btn-success" id="sidebarToggle"><i class="bi bi-list"></i></button>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                            <li class="nav-item active"><a class="nav-link text-primary" href="index.jsp">Home</a></li>
                           
                            <li class="nav-item dropdown">
                                <a class=" icone nav-link dropdown-toggle text-success  fs-5  bi bi-person-circle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></a>
                                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item " href="form-unidade-saude.jsp">Unidade de Saúde</a>
                                    <a class="dropdown-item" href="form-paciente.jsp">Paciente</a>
                                    <div class="dropdown-divider"></div>
                                     <a class="dropdown-item" href="form-medico.jsp">Médico(a)</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Page content-->
            <div class="container-fluid">
            	
             <div class="row">
    <div class="col-md-5">
        <div class="dashboard d-block">
            <div class="card mt-3">
                <i class="icon bi bi-clipboard2-pulse text-success"> Médicos</i>
                <div class="count text-success text-center"><%= request.getAttribute("numDoutores") %></div>
            </div>
            <div class="card mt-3">
                <i class="icon bi bi-capsule text-danger"> Pacientes</i>
                <div class="count text-danger text-center"><%= request.getAttribute("numPacientes") %></div>
            </div>
        </div>
    </div>

    <div class="col-md-5 coluna-direita">
        <div class="card mt-3">
            <i class="icon bi bi-hospital-fill text-danger"> Unidades</i>
            <div class="count text-danger text-center"><%= request.getAttribute("numUnidade") %></div>
        </div>
        <div class="card mt-3">
            <i class="icon bi bi-people-fill  text-warning"> Famílias</i>
            <div class="count text-warning text-center"><%= request.getAttribute("numFamilia") %></div>
        </div>
    </div>
</div>
             
                
            </div>
        </div>
    </div>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
</body>
</html>

