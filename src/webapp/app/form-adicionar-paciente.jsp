<%@page import="com.medic.model.Familia"%>
<%@page import="com.medic.interfaces.FamiliaInterface"%>
<%@page import="com.medic.dao.FamiliaDAO"%>
<%@page import="com.medic.auxiliar.Funcoes"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="com.medic.model.Paciente"%>
<%@page import="com.medic.interfaces.PacienteInterface"%>
<%@page import="com.medic.dao.PacienteDAO"%>
<%@page import="com.medic.interfaces.TelefoneInterface"%>
<%@page import="com.medic.dao.TelefoneDAO"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

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

  <style>
    /* Opcional: Suavizar ainda mais a transição do colapso */
    .collapse {
      transition: height 1s ease;
    }
  </style>

</head>
<body>
	<div class="d-flex" id="wrapper">
		<!-- Sidebar-->
		<div class="border-end coluna-esquerda" id="sidebar-wrapper">
			<div class="sidebar-heading border-bottom">SISTEMA MEDIC</div>
			<div class="list-group list-group-flush">
				<%@ include file="menu.jsp" %>
			</div>
		</div>
		<!-- Page content wrapper-->
		<div id="page-content-wrapper">
			<!-- Top navigation-->
			<nav
				class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
				<div class="container-fluid">
					<a class="btn btn-secondary" id="sidebarToggle"><i class="bi bi-list"></i></a>
					<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"	aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ms-auto mt-2 mt-lg-0">
							<li class="nav-item active">
								<a class="nav-link" href="#!">Home</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#!">Link</a>
							</li>
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
								<div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="#!">Action</a>
									<a class="dropdown-item" href="#!">Another action</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#!">Something else here</a>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- Page content-->
			<div class="container-fluid fade-in-element">

				<div class="row justify-content-between">

					<div class="col-md-7">
					
						<%
						
						if(request.getParameter("exibirAlertUS") != null){	
							String nomeUS = request.getParameter("exibirAlertUS");
							%>
							
							<div class="alert alert-success alert-dismissible fade show" role="alert" id="alertUS">
							  Unidade de Saúde <%= nomeUS %> modificada!
							  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
							</div>
							
							<script>
							    setTimeout(function(){
							        window.location.href = 'form-unidade-saude.jsp';
							    }, 3000);
							</script>
														
							<%
							
						}
						
						%>						
					
						<h1 class="mt-4">Paciente - Família</h1>
						
						<div class="mt-4 table-overflow-accordion">
						
							<div class="accordion accordion-flush" id="accordionFlushExample">
							
							<%
								PacienteInterface iPaciente = new PacienteDAO();
								TelefoneInterface iTelefone = new TelefoneDAO();
								Funcoes f = new Funcoes();
								List<Paciente> lista = iPaciente.listar();
						      
								FamiliaInterface iFamilia = new FamiliaDAO();
								List<Familia >listaFamilia = iFamilia.listarFamiliaPaciente();
						     	for(int i = 0; i < listaFamilia.size(); i++) {
							%>
							
							  <div class="accordion-item">
							    <h2 class="accordion-header">
							      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse<%= (i+1) %>" aria-expanded="false" aria-controls="flush-collapse<%= (i+1) %>">
							        Família: <%= listaFamilia.get(i).getId() %>
							      </button>
							    </h2>
							    <div id="flush-collapse<%= (i+1) %>" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
							      <div class="accordion-body">
							      
							    	<%
							    	
							    	List<Paciente> listaPacientes = iPaciente.listarPacientesFamilia(listaFamilia.get(i).getId());
							    	for(int j=0; j<listaPacientes.size(); j++){
							    		
							    		out.println(listaPacientes.get(j));
							    		out.println("<br><br>");
							    		
							    	}
							    	
							    	%>  	
							      
							      </div>
							    </div>
							  </div>
							  
							   <%
						     	}	  
							   %>
							  
							</div>						
	                      
						</div>			
					
					</div>
					
					<div class="col-md-5 coluna-direita">
                        <!-- Conteúdo da coluna direita aqui -->
                        
                                       <div class="dashboard d-block">
            <div class="card mt-3 p-3">
                <i class="icon bi bi-hospital-fill text-primary text-center fs-3"> Unidade de saúde </i>
                <div class="count text-primary text-center fs-1"><%= lista.size() %></div>
            </div>
            <div class="card mt-3 p-3  ">
                <i class="icon bi bi-capsule text-danger text-center fs-3"> Pacientes</i>
                <div class="count text-danger text-center fs-1"><%= lista.size() %></div>
            </div>
            <div class="card mt-3 p-3 ">
                <i class="icon bi bi-people-fill text-warning text-center fs-3"> Familias</i>
                <div class="count text-warning text-center fs-1"><%= lista.size() %></div>
            </div>
            <div class="card mt-3 p-3 ">
                <i class="icon bi bi-capsule text-success text-center fs-3"> Médicos</i>
                <div class="count text-success text-center fs-1"><%= lista.size() %></div>
            </div>
            
      
        
							</div>						
							</div>						
						</div>                        
                    </div>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JS-->
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>

	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>

	<script>
	
	$(document).ready(function() {
	    $('#inputCpf').on('input', function() {
	        var cpf = $(this).val().replace(/\D/g, '');

	        if (cpf.length > 11) {
	            cpf = cpf.substring(0, 11);
	        }
	        
	        cpf = cpf.replace(/(\d{3})(\d)/, '$1.$2');
	        cpf = cpf.replace(/(\d{3})(\d)/, '$1.$2');
	        cpf = cpf.replace(/(\d{3})(\d{1,2})$/, '$1-$2');
	        $(this).val(cpf);

	        // Validação de comprimento do CPF
	        if ($(this).val().length < 14) {
	            $(this).get(0).setCustomValidity("O CPF deve obedecer o formato BR 000.000.000-00.");
	        } else {
	            $(this).get(0).setCustomValidity("");
	        }
	    });
	});
	
		$(document).ready(function() {
			$('#inputTelefone').mask('(00) 00000-0000');
			$('#inputTelefone').blur(function() {
				var fone = $(this).val().replace(/\D/g, '');
				if (fone.length === 10) {
					$(this).mask('(00) 0000-0000');
				} else {
					$(this).mask('(00) 00000-0000');
				}
			});
		});
		
	    setTimeout(function() {
	        var alertElement = document.getElementById('alertUS');
	        var alert = new bootstrap.Alert(alertElement);
	        alert.close();
	    }, 2000);	    	   

		
	</script>

</body>
</html>