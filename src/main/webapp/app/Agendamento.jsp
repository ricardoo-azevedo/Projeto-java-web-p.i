<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>iMEDIC</title>
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="css/styles.css" rel="stylesheet" />
    <link href="css/estilo.css" rel="stylesheet" />
</head>
<body>
    <div class="d-flex" id="wrapper">
        <!-- Sidebar -->
        <div class="border-center coluna-esquerda bg-success" id="sidebar-wrapper">
            <div class="sidebar-heading border-bottom bg-success text-center">Medic</div>
            <div class="list-group list-group-flush">
                <a class="list-group-item list-group-item-action list-group-item-success p-3" href="index.jsp">Painel</a>
                <a class="list-group-item list-group-item-action list-group-item-success p-3" href="form-unidade-saude.jsp">Unidade Saúde (temp)</a>
                <a class="list-group-item list-group-item-action list-group-item-success p-3" href="form-paciente.jsp">Paciente</a>
                <a class="list-group-item list-group-item-action list-group-item-success p-3" href="form-medico.jsp">Medico(a)</a>
                <a class="list-group-item list-group-item-action list-group-item-success p-3" href="#!">Events</a>
                <a class="list-group-item list-group-item-action list-group-item-success p-3" href="#!">Profile</a>
                <a class="list-group-item list-group-item-action list-group-item-success p-3" href="../index.jsp">Sair</a>
            </div>
        </div>
        <!-- Page content wrapper -->
        <div class="col" id="page-content-wrapper">
            <!-- Top navigation -->
            <nav class="navbar navbar-expand-lg navbar-light bg-Light border-bottom">
                <div class="container-fluid">
                    <button class="btn btn-success" id="sidebarToggle">
                        <i class="bi bi-list"></i>
                    </button>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                            <li class="nav-item active">
                                <a class="nav-link" href="index.jsp">Home</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="icone nav-link dropdown-toggle text-success fs-5 bi bi-person-circle" id="navbarDropdown" href="#"
                                    role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></a>
                                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="form-unidade-saude.jsp">Unidade de Saúde</a>
                                    <a class="dropdown-item" href="form-paciente.jsp">Paciente</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="form-medico.jsp">Médico(a)</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Page content -->
            <div class="container-fluid fade-in-element">
                <div class="row justify-content-between">
                    <div class="col-md-7">
                        <h1 class="mt-3">Agendamento de Consulta</h1>

                        <form action="controle.jsp?op=4" method="post">
                            <div class="row">
                                <div class="form-floating mb-3 col-md-2">
                                    <label class="text-dark mt-1" for="paciente"></label>
                                    <select id="paciente" name="paciente">
                                        <!-- Parte BD Paciente -->
                                        <option value="1">Paciente 1</option>
                                        <option value="2">Paciente 2</option>
                                    </select>
                                    <br><br>
                                </div>

                                <div class="form-floating mb-3 col-md-4">
                                    <label for="medico"></label>
                                    <select id="medico" name="medico">
                                        <!-- Parte BD Médico -->
                                        <option value="1">Médico 1</option>
                                        <option value="2">Médico 2</option>
                                    </select>
                                    <br><br>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-floating mb-3 col-md-4">
                                    <label for="data_hora"></label>
                                    <input type="datetime-local" id="data_hora" name="data_hora" required>
                                    <br><br>
                                </div>

                                <div class="form-floating mb-3 col-md-3">
                                    <!-- Status do Agendamento -->
                                    <label for="status"></label>
                                    <select id="status" name="status">
                                        <option value="pendente">Ativo</option>
                                        <option value="confirmado">Inativo</option>
                                    </select>
                                    <br><br>
                                </div>

                                <div class="form-floating mb-3 col-md-4">
                                    <!-- Observações -->
                                    <label for="observacoes">Obs:</label>
                                    <textarea id="observacoes" name="observacoes"></textarea>
                                    <br><br>
                                </div>
                            </div>
                            <div class="form-floating mb-3 col-md-12 justify-content-end" style="text-align: right;">
                                <button type="submit" class="btn btn-lg btn-success">Salvar</button>
                            </div>
                        </form>
                    </div>

                    <div class="col-md-5 coluna-direita">
                        <!-- Conteúdo da coluna direita -->
                        <iframe style="width: 100%; height: 90vh;"
                            src="https://cnes2.datasus.gov.br/Lista_Es_Municipio.asp?VEstado=26&VCodMunicipio=260890&NomeEstado="></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap core JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <!-- Core theme JS -->
    <script src="js/scripts.js"></script>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>

    <script>
        $(document).ready(function () {
            $('#inputTelefone').mask('(00) 00000-0000');
            $('#inputTelefone').blur(function () {
                var fone = $(this).val().replace(/\D/g, '');
                if (fone.length === 10) {
                    $(this).mask('(00) 0000-0000');
                } else {
                    $(this).mask('(00) 00000-0000');
                }
            });
        });
    </script>
</body>
</html>
