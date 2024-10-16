<%@page import="com.medic.model.Funcionario"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="com.medic.model.Especialidade"%>
<%@page import="com.medic.dao.EspecialidadeDAO"%>
<%@page import="com.medic.interfaces.EspecialidadeInterface"%>
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
							String nome = request.getParameter("exibirAlert");
							%>
							
							<div class="alert alert-success alert-dismissible fade show" role="alert" id="alertEpecialidade">
							  Especialidade <%= nome %> modificada!
							  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
							</div>
							
							<script>
							    setTimeout(function(){
							        window.location.href = 'form-especialidade.jsp';
							    }, 3000);
							</script>
														
							<%
							
						}
						
						%>			
					
						<h1 class="mt-4">Especialidades</h1>
					
						<form action="controle.jsp?op=12" method="post" id="formulario">

							<div class="row">

								<div class="form-floating mb-3 col-md-12">
									<input type="text" class="form-control" id="inputNome" name="inputNome" placeholder=" " required autocomplete="off"> 
									<label for="inputNome" style="margin-left: 10px;">Nome</label>
								</div>								

							</div>							

							<div class="form-floating mb-3 col-md-12 justify-content-end" style="text-align: right;">
								<button type="reset" id="btnLimpar" class="btn btn-lg btn-success">Limpar</button>
								<button type="submit" id="btnSalvar" class="btn btn-lg btn-success">Salvar</button>
							</div>
							
							<input type="hidden" id="inputIdEspecialidade" name="inputIdEspecialidade">
						
						</form>		
						
						<div class="table-overflow mt-4">
	                      <table class="table table-bordered table-light table-striped table-hover" style="border-radius: 8px;">
						    <thead>
						      <tr>
						        <th scope="col" style="width: 7%; text-align: center;">#</th>
						        <th scope="col">NOME</th>
						        <th colspan="2" scope="col" style="width: 20%; text-align: center;">AÇÕES</th>
						      </tr>
						    </thead>
						    <tbody id="clientesTableBody">
						       <%
				              	
								EspecialidadeInterface iEspecialidade = new EspecialidadeDAO();
								List<Especialidade> lista = iEspecialidade.lista();
								
						      for(int i = 0; i < lista.size(); i++) {
						    	  						    	  
						      %>
						      <tr>
						        <th scope="row" style="text-align: center;"><%= i + 1 %></th>
						        <td><%= lista.get(i).getNome() %></td>
						        <td style="text-align: center;">						          
						          <a href="#" class="edit-especialidade-btn" 
								     data-idEspecialidade="<%= lista.get(i).getId() %>"
								     data-nome="<%= lista.get(i).getNome() %>">
								     <img src="./assets/editado.svg" alt="Editar" width="25" height="25">
								  </a>
																  
						        </td>
						        <td style="text-align: center;">
						          <a href="controle.jsp?op=14&id=<%= lista.get(i).getId() %>"><img src="./assets/lata.svg" alt="Excluir" width="20" height="20"></a>
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
                    	<%@ include file="indicadores.jsp" %>						
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
	        var alertElement = document.getElementById('alertEspecialidade');
	        var alert = new bootstrap.Alert(alertElement);
	        alert.close();
	    }, 2000);
	    	   
	    document.querySelectorAll('.edit-especialidade-btn').forEach(button => {
	        button.addEventListener('click', function(event) {
	            event.preventDefault();
	           
	            let btnSalvar = document.getElementById('btnSalvar');
	            btnSalvar.innerText = 'Editar';
	            
	            document.getElementById('formulario').action = "controle.jsp?op=13";
	        });
	    });

	    // Captura o evento de clique no botão de limpar
	    document.getElementById('btnLimpar').addEventListener('click', function() {
	        let btnSalvar = document.getElementById('btnSalvar');
	        btnSalvar.innerText = 'Salvar';
	        
	        document.getElementById('formulario').action = "controle.jsp?op=14";
	    });
		
		
	</script>

</body>
</html>