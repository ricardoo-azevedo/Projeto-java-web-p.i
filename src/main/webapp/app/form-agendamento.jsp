<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.medic.auxiliar.Funcoes"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.medic.model.Medico"%>
<%@page import="com.medic.dao.MedicoDAO"%>
<%@page import="com.medic.interfaces.MedicoInterface"%>
<%@page import="com.medic.model.Paciente"%>
<%@page import="com.medic.interfaces.PacienteInterface"%>
<%@page import="com.medic.dao.PacienteDAO"%>
<%@page import="com.medic.dao.AgendamentoDAO"%>
<%@page import="com.medic.interfaces.AgendamentoInterface"%>
<%@page import="com.medic.model.Agendamento"%>
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
                <%@ include file="menu.jsp" %>
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
                        <h1 class="mt-3">Agendamento</h1>

                        <form action="controle.jsp?op=17" method="post" id="formulario">
                        
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
										</select> <label for="familia" style="margin-left: 10px;">Médico</label>
								</div>

							</div>
                        
                        	<div class="row">

								<div class="form-floating mb-3 col-md-12">
									<select class="form-select" id="inputPaciente" name="inputPaciente" required>
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
										</select> <label for="familia" style="margin-left: 10px;">Paciente</label>
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
                                <button type="reset" id="btnLimpar" class="btn btn-lg btn-success">Limpar</button>
                                <button type="submit" id="btnSalvar" class="btn btn-lg btn-success">Salvar</button>
                            </div>
                            
                            <input type="hidden" id="idMedico" name="idMedico">
                            
                        </form>
                        <div class="table-overflow mt-4">
	                      <table class="table table-bordered table-light table-striped table-hover" style="border-radius: 8px;">
						    <thead>
						      <tr>
						        <th scope="col" style="width: 7%; text-align: center;">#</th>
						        <th scope="col">MEDICO</th>
						        <th scope="col">PACIENTE</th>
						        <th scope="col">DATA</th>
						        <th scope="col">OBSERVACOES</th>
						        <th scope="col">STATUS</th>
						        <th colspan="2" scope="col" style="width: 20%; text-align: center;">AÇÕES</th>
						      </tr>
						    </thead>
						    <tbody id="clientesTableBody">
						       <%
				              	
								AgendamentoInterface iAgendamento = new AgendamentoDAO();
								List<Agendamento> lista = iAgendamento.listarAgendamento();
								
								/*VER PRA MAIS TARDE*/
						      for(int i = 0; i < lista.size(); i++) {
						    	  /*String obs = null;
						    	  if(lista.get(i).getObservacoes().isEmpty()){
						    		  obs = "";  
						    	  }*/
						    	  						    	  
						      %>
						      <tr>
						        <th scope="row" style="text-align: center;"><%= i + 1 %></th>
						        <td><%= lista.get(i).getMedico().getNome()%></td>
						        <td><%= lista.get(i).getPaciente().getNome()%></td>
						        <td><%= lista.get(i).getDataAgendamento() %></td>
						        <td><%= lista.get(i).getObservacoes()%></td>
						        <td><%= lista.get(i).getStatusAgendamento() %></td>
						        <td style="text-align: center;">						          
						          <a href="#" class="edit-agendamento-btn" 
								     data-idAgendamento="<%= lista.get(i).getId() %>"
								     data-idMedico="<%= lista.get(i).getMedico().getId() %>"
								     data-idPaciente="<%= lista.get(i).getPaciente().getId() %>"
								     data-observacoes="<%= lista.get(i).getObservacoes() %>"
								     data-statusAgendamento="<%= lista.get(i).getObservacoes() %>"
								     data-dataAgendamento="<%= lista.get(i).getDataAgendamento() %>"
								     
		
								     >
								     <img src="./assets/edit.svg" alt="Editar" width="20" height="20">
								  </a>
																  
						        </td>
						        <td style="text-align: center;">
						          <a href="controle.jsp?op=19&id=<%= lista.get(i).getId() %>"><img src="./assets/trash.svg" alt="Excluir" width="20" height="20"></a>
						        </td>
						      </tr>
						      <%
						      }
						      %>
						    </tbody>
						  </table>
						</div>			
					
					</div>
                    </div>

                    <div class="col-md-5 coluna-direita">
                        <!-- Conteúdo da coluna direita -->
                        
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