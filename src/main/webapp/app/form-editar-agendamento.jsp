<%@page import="javax.swing.JOptionPane"%>
<%@page import="com.medic.model.Funcionario"%>
<%@page import="com.medic.dao.AgendamentoDAO"%>
<%@page import="com.medic.model.Agendamento"%>
<%@page import="com.medic.interfaces.AgendamentoInterface"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.medic.auxiliar.Funcoes"%>
<%@page import="com.medic.model.Paciente"%>
<%@page import="com.medic.dao.PacienteDAO"%>
<%@page import="com.medic.interfaces.PacienteInterface"%>
<%@page import="com.medic.model.Medico"%>
<%@page import="com.medic.dao.MedicoDAO"%>
<%@page import="com.medic.interfaces.MedicoInterface"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
		<div id="page-content-wrapper">
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
			<div class="container-fluid fade-in-element">

				<div class="row justify-content-between">

					<div class="col-md-7">
					
						<%
						
						if(request.getParameter("exibirAlert") != null){	
							String valor = request.getParameter("exibirAlert");
							%>
							
							<div class="alert alert-success alert-dismissible fade show" role="alert" id="alert">
							   <%= valor %>
							  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
							</div>
							
							<script>
							    setTimeout(function(){
							        window.location.href = 'form-agendamento.jsp';
							    }, 3000);
							</script>
														
							<%							
						}
						
						%>						
					
						<h1 class="mt-3">Agendamentos</h1>
						
						<%
						int idAgendamento = Integer.parseInt(request.getParameter("id"));
						AgendamentoInterface iAgendamento = new AgendamentoDAO();
						Agendamento agendamento = iAgendamento.consultarAgendamento(idAgendamento);						
						%>
					
						<form action="controle.jsp?op=17" method="post" id="formulario">
                        
                        	<div class="row">

								<div class="form-floating mb-3 col-md-12">
									<input type="text" class="form-control" placeholder=" " value="<%= agendamento.getUnidadeSaude().getNome() %>" readonly="readonly"> 
									<label for="inputNome" style="margin-left: 10px;">Unidade de Saúde</label>
								</div>

							</div>
							
							<div class="row">

								<div class="form-floating mb-3 col-md-12">
									<select class="form-select" id="inputIdMedico" name="inputIdMedico" required>
										<option value="" selected disabled>Selecione</option>
										<%
										
										MedicoInterface iMedico = new MedicoDAO();
										List<Medico> listaMedico = iMedico.listarMedico();
										
										for(int i = 0; i < listaMedico.size(); i++) {
										
										%>
										<option value="<%= listaMedico.get(i).getId() %>"><%= listaMedico.get(i).getEspecialidade().getNome()+" | "+listaMedico.get(i).getCrm()+" :: "+listaMedico.get(i).getNome() %></option>
										<%
										}
										%>
										</select> 
										<label for="inputIdMedico" style="margin-left: 10px;">Médico</label>
								</div>

							</div>
                        
                        	<div class="row">

								<div class="form-floating mb-3 col-md-12">
									<select class="form-select" id="inputIdPaciente" name="inputIdPaciente" required>
										<option value="" selected disabled>Selecione</option>
										<%
										
										PacienteInterface iPaciente = new PacienteDAO();
										List<Paciente> listaPaciente = iPaciente.listar();
										
										for(int i = 0; i < listaPaciente.size(); i++) {
										
										%>
										<option value="<%= listaPaciente.get(i).getId() %>"><%= listaPaciente.get(i).getCpf()+" :: "+listaPaciente.get(i).getNome() %></option>
										<%
										}
										%>
										</select>
										<label for="inputIdPaciente" style="margin-left: 10px;">Paciente</label>
								</div>

							</div>
                        
                            <div class="row">
                                
								<div class="form-floating mb-3 col-md-4">
								    <select class="form-control" id="inputData" name="inputData" required>
								        <option value="" selected disabled>Selecione</option>
								        <%
								            /*_*/
								            Funcoes f = new Funcoes();
								            
								            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
								    		LocalDate now = LocalDate.now();
								            
								            int limiteDias = 14;
								            for (int i = 0; i <= limiteDias; i += 3) {
								            									                
								                out.println("<option value='" +dtf.format(now.plusDays(i))+ "'>" + dtf.format(now.plusDays(i)) +" - "+dtf.format(now.plusDays(i+2)) + "</option>");								               
								            }
								            
								        %>
								    </select>
								    <label for="inputData" style="margin-left: 10px;">Data do Agendamento</label>
								     
								</div>
								
								<div class="form-floating mb-3 col-md-8">                                    
                                    <textarea id="inputObs" name="inputObs" class="form-control"></textarea>
                                    <label for="inputObs" style="margin-left: 10px;">Observações</label>                                  
                                </div>

                            </div>

                            <div class="form-floating mb-3 col-md-12 justify-content-end" style="text-align: right;">
                                <a href="form-lista-agendamento.jsp" class="btn btn-lg btn-dark">Listar</a>
                                <button type="reset" id="btnLimpar" class="btn btn-lg btn-success">Limpar</button>
                                <button type="submit" id="btnSalvar" class="btn btn-lg btn-success">Salvar</button>
                            </div>
                            
                            <input type="hidden" id="idAgendamento" name="idAgendamento">
                            <input type="hidden" id="idPaciente" name="idPaciente">
                            <input type="hidden" id="idMedico" name="idMedico">
                            
                        </form>	
						
						</div>		
					
					<div class="col-md-5 coluna-direita">
                        <!-- Conteúdo da coluna direita -->
                        <%@ include file="indicadores.jsp" %>
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
		
	    setTimeout(function() {
	        var alertElement = document.getElementById('alert');
	        var alert = new bootstrap.Alert(alertElement);
	        alert.close();
	    }, 2000);
	    	   
	    document.querySelectorAll('.edit-agendamento-btn').forEach(button => {
	        button.addEventListener('click', function(event) {
	            event.preventDefault();
	           
	            let btnSalvar = document.getElementById('btnSalvar');
	            btnSalvar.innerText = 'Editar';
	            
	            document.getElementById('formulario').action = "controle.jsp?op=18";
	        });
	    });

	    // Captura o evento de clique no botão de limpar
	    document.getElementById('btnLimpar').addEventListener('click', function() {
	        let btnSalvar = document.getElementById('btnSalvar');
	        btnSalvar.innerText = 'Salvar';
	        
	        document.getElementById('formulario').action = "controle.jsp?op=17";
	    });
		
	</script>

</body>
</html>