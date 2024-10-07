<%@page import="com.medic.dao.TelefoneDAO"%>
<%@page import="com.medic.interfaces.TelefoneInterface"%>
<%@page import="com.medic.model.Medico"%>
<%@page import="com.medic.dao.MedicoDAO"%>
<%@page import="com.medic.interfaces.MedicoInterface"%>
<%@page import="com.medic.model.Especialidade"%>
<%@page import="com.medic.dao.EspecialidadeDAO"%>
<%@page import="com.medic.interfaces.EspecialidadeInterface"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>iMEDIC</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link href="css/styles.css" rel="stylesheet" />
<link href="css/estilo.css" rel="stylesheet" />
</head>
<body>
	<div class="d-flex" id="wrapper">
		<!-- Sidebar-->
		<div class="border-center coluna-esquerda bg-success"
			id="sidebar-wrapper">
			<div class="sidebar-heading border-bottom bg-success text-center ">Médico</div>
			<div class="list-group list-group-flush">
				<%@ include file="menu.jsp"%>
			</div>
		</div>
		<!-- Page content wrapper-->
		<div class="col" id="page-content-wrapper">
			<!-- Top navigation-->
			<nav
				class="navbar navbar-expand-lg navbar-light  bg-Light border-bottom">
				<div class="container-fluid">
					<button class="btn btn-success" id="sidebarToggle">
						<i class="bi bi-list"></i>
					</button>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ms-auto mt-2 mt-lg-0">
							<li class="nav-item active"><a class="nav-link"
								href="index.jsp">Home</a></li>

							<li class="nav-item dropdown"><a
								class=" icone nav-link dropdown-toggle text-success  fs-5  bi bi-person-circle"
								id="navbarDropdown" href="#" role="button"
								data-bs-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"></a>
								<div class="dropdown-menu dropdown-menu-end"
									aria-labelledby="navbarDropdown">
									<a class="dropdown-item " href="form-unidade-saude.jsp">Unidade
										de Saúde</a> <a class="dropdown-item" href="form-paciente.jsp">Paciente</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="form-medico.jsp">Médico(a)</a>
								</div></li>
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
							String nome = request.getParameter("exibirAlert");
							%>
							
							<div class="alert alert-success alert-dismissible fade show" role="alert" id="alertMedico">
							  Médico <%= nome %> modificado!
							  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
							</div>
							
							<script>
							    setTimeout(function(){
							        window.location.href = 'form-medico.jsp';
							    }, 3000);
							</script>
														
							<%							
						}
						
						%>

						<h1 class="mt-3">Cadastro do Médico(a)</h1>

						<form action="controle.jsp?op=11" method="post" id="formulario">

							<div class="row">

								<div class="form-floating mb-3 col-md-4">
									<input type="text" class="form-control" id="inputCrm"
										name="inputCrm" placeholder=" " required> <label
										for="inputCrm" style="margin-left: 10px;">CRM</label>
								</div>

								<div class="form-floating mb-3 col-md-8">
									<input type="text" class="form-control" id="inputNome"
										name="inputNome" placeholder=" " required> <label
										for="inputNome" style="margin-left: 10px;">Nome</label>
								</div>

							</div>

							<div class="row">
								<div class="form-floating mb-3 col-md-6">
									<input type="text" class="form-control" id="inputTelefone" name="inputTelefone" placeholder=" " required>
									<label for="inputTelefone" style="margin-left: 10px;">Telefone</label>
								</div>

								<div class="form-floating mb-3 col-md-6">
									<select class="form-select" id="inputEspecialidade"	name="inputEspecialidade" required>
									<option value="" selected disabled>Selecione</option>
										<%
										
										EspecialidadeInterface iEspecialidade = new EspecialidadeDAO();
										List<Especialidade> listaEspecialidade = iEspecialidade.lista();
										
										for(int i = 0; i < listaEspecialidade.size(); i++) {
										
										%>
										<option value="<%= listaEspecialidade.get(i).getId() %>"><%= listaEspecialidade.get(i).getNome() %></option>
										<%
										}
										%>
									</select> <label for="familia" style="margin-left: 10px;">Especialidade</label>
								</div> 
								
								 </div>

							<div class="form-floating mb-3 col-md-12 justify-content-end" style="text-align: right;">
								<button type="reset" id="btnLimpar" class="btn btn-lg btn-success">Limpar</button>
								<button type="submit" id="btnSalvar" class="btn btn-lg btn-success">Salvar</button>
							</div>
					 			<input type="hidden" id="idMedico" name="idMedico"> 
							<input type="hidden" id="inputIdTelefone" name="inputIdTelefone">
							 <input type="hidden" id="inputIdEspecialidade" name="inputIdEspecialidade">

						</form>

                         <div class="table-overflow mt-4">
	                      <table class="table table-bordered table-light table-striped table-hover" style="border-radius: 8px;">
						    <thead>
						      <tr>
						        <th scope="col" style="width: 7%; text-align: center;">#</th>
						        <th scope="col">CRM</th>
						        <th scope="col">NOME</th>
						        <th scope="col">TELEFONE</th>
						        <th scope="col">ESPECIALIDADE</th>
						        <th colspan="2" scope="col" style="width: 20%; text-align: center;">AÇÕES</th>
						      </tr>
						    </thead>
						    <tbody id="clientesTableBody">
						      <%
				              	
								MedicoInterface iMedico = new MedicoDAO();
					 			List<Medico> lista = iMedico.listarMedico(); 	
								TelefoneInterface iTelefone = new TelefoneDAO(); 
								
								
						      for(int i = 0; i < lista.size(); i++) {
						    	  
						      %>
						      <tr>
						      <th scope="row" style="text-align: center;"><%= i + 1 %></th>
						      
						   		<td><%= lista.get(i).getCrm() %></td>
                            	<td><%= lista.get(i).getNome() %></td>
                         	    <td><%= iTelefone.buscarMedico(lista.get(i).getId()).getNumero() %></td>
                         	    <td><%= lista.get(i).getEspecialidade().getNome() %></td>
						    
						        <td style="text-align: center;">	
		          
						          <a href="#" class="edit-medico-btn" 
								     data-idMedico="<%= lista.get(i).getId() %>"
								     data-CRM = "<%=  lista.get(i).getCrm() %>"
								     data-nome = "<%= lista.get(i).getNome() %>"
								     data-idTelefone="<%=  iTelefone.buscarMedico(lista.get(i).getId()).getId() %>"
								     data-telefone="<%=  iTelefone.buscarMedico(lista.get(i).getId()).getNumero() %>"
								     data-idEspecialidade="<%= lista.get(i).getEspecialidade().getId() %>"
								     data-nomeEspecialidade="<%= lista.get(i).getEspecialidade().getNome() %>"
								     >
								     <img src="./assets/editado.svg" alt="Editar" width="25" height="25">
								  </a>
																  
						        </td>
						        <td style="text-align: center;">
						          <a href="controle.jsp?op=15&id=<%= lista.get(i).getId() %>"><img src="./assets/lata.svg" alt="Excluir" width="25" height="25"></a>
						        </td>
						      </tr>
						      <%
						      }
						      %>
						    </tbody>
						  </table>
						</div>

					</div>

					<div class="col-md-5 coluna-direita">
						<!-- Conteúdo da coluna direita aqui -->
						
						
					</div>


				</div>

			</div>

		</div>
	</div>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>

	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>

	<script>
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
	        var alertElement = document.getElementById('alertMedico');
	        var alert = new bootstrap.Alert(alertElement);
	        alert.close();
	    }, 2000);
	    	   
	    document.querySelectorAll('.edit-medico-btn').forEach(button => {
	        button.addEventListener('click', function(event) {
	            event.preventDefault();

	          
	            let btnSalvar = document.getElementById('btnSalvar');
	            btnSalvar.innerText = 'Editar';

	        
	            document.getElementById('idMedico').value = button.getAttribute('data-idMedico');
	            document.getElementById('inputCrm').value = button.getAttribute('data-CRM');
	            document.getElementById('inputNome').value = button.getAttribute('data-nome');
	            document.getElementById('inputIdTelefone').value = button.getAttribute('data-idTelefone');
	            document.getElementById('inputTelefone').value = button.getAttribute('data-telefone');
	            document.getElementById('inputIdEspecialidade').value = button.getAttribute('data-idEspecialidade');
	            document.getElementById('inputEspecialidade').value = button.getAttribute('data-idEspecialidade');

	           
	            document.getElementById('formulario').action = "controle.jsp?op=16";
	        });
	    });


	    // Captura o evento de clique no botão de limpar
	    document.getElementById('btnLimpar').addEventListener('click', function() {
	        let btnSalvar = document.getElementById('btnSalvar');
	        btnSalvar.innerText = 'Salvar';
	        
	        document.getElementById('formulario').action = "controle.jsp?op=11";
	    });
		
	</script>

</body>
</html>