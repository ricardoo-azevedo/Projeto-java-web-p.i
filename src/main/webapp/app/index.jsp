<%@page import="com.medic.model.Agendamento"%>
<%@page import="com.medic.model.Funcionario"%>
<%@page import="com.medic.model.Especialidade"%>
<%@page import="com.medic.model.Paciente"%>
<%@page import="com.medic.model.Familia"%>
<%@page import="com.medic.model.UnidadeSaude"%>
<%@page import="com.medic.model.Medico"%>
<%@page import="java.util.List"%>
<%@page import="com.medic.dao.AgendamentoDAO"%>
<%@page import="com.medic.dao.FuncionarioDAO"%>
<%@page import="com.medic.dao.MedicoDAO"%>
<%@page import="com.medic.dao.EspecialidadeDAO"%>
<%@page import="com.medic.dao.PacienteDAO"%>
<%@page import="com.medic.dao.FamiliaDAO"%>
<%@page import="com.medic.dao.UnidadeSaudeDAO"%>
<%@page import="com.medic.interfaces.AgendamentoInterface"%>
<%@page import="com.medic.interfaces.FuncionarioInterface"%>
<%@page import="com.medic.interfaces.MedicoInterface"%>
<%@page import="com.medic.interfaces.EspecialidadeInterface"%>
<%@page import="com.medic.interfaces.PacienteInterface"%>
<%@page import="com.medic.interfaces.FamiliaInterface"%>
<%@page import="com.medic.interfaces.UnidadeSaudeInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
if(session.getAttribute("funcionarioAutenticado") == null){
	response.sendRedirect("autentica.jsp");
}
Funcionario funcionario = (Funcionario) session.getAttribute("funcionarioAutenticado");


%>
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
    <link href="css/Acordeon.css" rel="stylesheet" />
</head>
<body>
    <div class="d-flex fundo" id="wrapper">
        <!-- Sidebar-->
        <div class="border-end coluna-esquerda" id="sidebar-wrapper">
            <div class="sidebar-heading border-bottom">SISTEMA MEDIC</div>
            <div class="list-group list-group-flush">
               <%@ include file="menu.jsp" %>
            </div>
        </div>
        <!-- Page content wrapper-->
        <div class="col" id="page-content-wrapper">
            <!-- Top navigation-->
            <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom shadow-sm">
    <div class="container-fluid">
        <!-- Botão do sidebar com estilo mais moderno -->
        <button class="btn btn-outline-primary" id="sidebarToggle" aria-label="Toggle Sidebar">
            <i class="bi bi-list"></i>
        </button>

        <!-- Botão de alternância para dispositivos móveis -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" 
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Links da barra de navegação -->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                <% if(session.getAttribute("funcionarioAutenticado") != null){ 
                    String nomeFuncionario = funcionario.getNome();
                %>
                    <li class="nav-item">
                        <a class="nav-link fw-bold text-primary" style="font-size: 18px;">Seja Bem-vindo, <%= nomeFuncionario %>!</a>
                    </li>
                <% } %>
            	</ul>
        		</div>
   	 		</div>
		</nav>
            <!-- Page content-->
            <div class="container-fluid">
            	
                <div class="row">
                    <div class="col-md-7">
                        <h1 class="mt-4 texto fade-in-element bg-light-subtle">Bem Vindo ao Sistema iMEDIC!</h1>
                        
                        <p class="text-justify texto fade-in-element fs-5 bg-light-subtle" style="line-height: 1.8; text-indent: 2em; text-align: justify; padding: 15px; border-radius: 5px;">
						    O iMedic é um sistema de agendamento desenvolvido para otimizar o gerenciamento de consultas e atendimentos no Programa de Saúde da Família (PSF). Com uma interface amigável e intuitiva, o iMedic facilita o controle de agendamentos médicos, garantindo uma gestão eficiente de pacientes, médicos, unidades de saúde e especialidades. O sistema é totalmente responsivo, permitindo acesso de qualquer dispositivo, e oferece recursos para o acompanhamento em tempo real, melhorando a organização e reduzindo o tempo de espera. Ideal para equipes que buscam agilidade e precisão no atendimento à comunidade.
						</p>

                    </div>
                    <div class="col-md-5 coluna-direita">
                        <!-- Conteúdo da coluna direita aqui -->                    
                    	<%@ include file="indicadores.jsp" %>						
					</div> 
                </div>                
            </div>
        </div>
    </div>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
</body>
</html>

