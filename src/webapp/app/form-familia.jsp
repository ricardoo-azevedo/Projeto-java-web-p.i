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
</head>
<body>
	<div class="d-flex" id="wrapper">
		<!-- Sidebar-->
		<div class="border-end coluna-esquerda bg-success" id="sidebar-wrapper">
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
						
						if(request.getParameter("exibirAlert") != null){	
							String nomeUS = request.getParameter("exibirAlert");
							%>
							
							<div class="alert alert-success alert-dismissible fade show" role="alert" id="alertFamilia">
							  Família <%= nomeUS %> modificada!
							  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
							</div>
							
							<script>
							    setTimeout(function(){
							        window.location.href = 'form-familia.jsp';
							    }, 3000);
							</script>
														
							<%							
						}
						
						%>						
					
						<h1 class="mt-4">Famílias</h1>
					
						<form action="controle.jsp?op=8" method="post" id="formulario">

							<div class="row">

								<div class="form-floating mb-3 col-md-6">
									<input type="text" class="form-control" id="inputLogradouro" name="inputLogradouro" placeholder=" " required autocomplete="off">
									<label for="inputLogradouro" style="margin-left: 10px;">Logradouro</label>
								</div>

								<div class="form-floating mb-3 col-md-2">
									<input type="text" class="form-control" id="inputNumero" name="inputNumero" placeholder=" " required autocomplete="off">
									<label for="inputNumero" style="margin-left: 10px;">Número</label>
								</div>

								<div class="form-floating mb-3 col-md-4">
									<input type="text" class="form-control" id="inputComplemento" name="inputComplemento" placeholder=" " autocomplete="off">
									<label for="inputComplemento" style="margin-left: 10px;">Complemento</label>
								</div>

							</div>

							<div class="row">

								<div class="form-floating mb-3 col-md-3">
									<input type="text" class="form-control" id="inputBairro" name="inputBairro" placeholder=" " required autocomplete="off">
									<label for="inputBairro" style="margin-left: 10px;">Bairro</label>
								</div>

								<div class="form-floating mb-3 col-md-4">
									<input type="text" class="form-control" id="inputCidade" name="inputCidade" placeholder=" " required autocomplete="off">
									<label for="inputCidade" style="margin-left: 10px;">Cidade</label>
								</div>

								<div class="form-floating mb-3 col-md-3">
									<select class="form-select" id="uf" name="inputUf" required>
										<option value="" selected disabled>Selecione o estado</option>
										<option value="AC">Acre</option>
										<option value="AL">Alagoas</option>
										<option value="AP">Amapá</option>
										<option value="AM">Amazonas</option>
										<option value="BA">Bahia</option>
										<option value="CE">Ceará</option>
										<option value="DF">Distrito Federal</option>
										<option value="ES">Espírito Santo</option>
										<option value="GO">Goiás</option>
										<option value="MA">Maranhão</option>
										<option value="MT">Mato Grosso</option>
										<option value="MS">Mato Grosso do Sul</option>
										<option value="MG">Minas Gerais</option>
										<option value="PA">Pará</option>
										<option value="PB">Paraíba</option>
										<option value="PR">Paraná</option>
										<option value="PE">Pernambuco</option>
										<option value="PI">Piauí</option>
										<option value="RJ">Rio de Janeiro</option>
										<option value="RN">Rio Grande do Norte</option>
										<option value="RS">Rio Grande do Sul</option>
										<option value="RO">Rondônia</option>
										<option value="RR">Roraima</option>
										<option value="SC">Santa Catarina</option>
										<option value="SP">São Paulo</option>
										<option value="SE">Sergipe</option>
										<option value="TO">Tocantins</option>
									</select> <label for="uf" style="margin-left: 10px;">UF</label>
								</div>

								<div class="form-floating mb-3 col-md-2">
									<input type="text" class="form-control" id="inputCep" maxlength="9" name="inputCep" placeholder=" " required autocomplete="off">
									<label for="inputCep" style="margin-left: 10px;">CEP</label>
								</div>

							</div>

							<div class="form-floating mb-3 col-md-12 justify-content-end" style="text-align: right;">							
								<button type="reset" id="btnLimpar" class="btn btn-lg btn-success">Limpar</button>
								<button type="submit" id="btnSalvar" class="btn btn-lg btn-success">Salvar</button>
							</div>
							
							<input type="hidden" id="inputIdFamilia" name="inputIdFamilia">
							<input type="hidden" id="inputIdEndereco" name="inputIdEndereco">							
							
						</form>		
						
						<div class="table-overflow mt-4">
	                      <table class="table table-bordered table-light table-striped table-hover" style="border-radius: 8px;">
						    <thead>
						      <tr>
						        <th scope="col" style="width: 7%; text-align: center;">#</th>						        
						        <th scope="col">ID</th>
						        <th scope="col">LOGRADOURO</th>
						        <th scope="col">NÚMERO</th>
						        <th scope="col">CIDADE</th>
						        <th scope="col">UF</th>
						        <th colspan="2" scope="col" style="text-align: center;">AÇÕES</th>
						      </tr>
						    </thead>
						    <tbody id="clientesTableBody">
						      <%
				              	
								FamiliaInterface iFamilia = new FamiliaDAO();
								List<Familia> lista = iFamilia.listar();
								
						      for(int i = 0; i < lista.size(); i++) {
						    	  
						      %>
						      <tr>
						        <th scope="row" style="text-align: center;"><%= i + 1 %></th>
						        <td><%= lista.get(i).getId() %></td>
						        <td><%= lista.get(i).getEndereco().getLogradouro() %></td>
						        <td><%= lista.get(i).getEndereco().getNumero() %></td>
						        <td><%= lista.get(i).getEndereco().getCidade() %></td>
						        <td><%= lista.get(i).getEndereco().getUf() %></td>
						        <td style="text-align: center;">						          
						          <a href="#" class="edit-familia-btn" 
								     data-idFamilia="<%= lista.get(i).getId() %>"
								     data-idEndereco="<%= lista.get(i).getEndereco().getId() %>"
								     data-logradouro="<%= lista.get(i).getEndereco().getLogradouro() %>"
								     data-numero="<%= lista.get(i).getEndereco().getNumero() %>"
								     data-complemento="<%= lista.get(i).getEndereco().getComplemento() %>"
								     data-bairro="<%= lista.get(i).getEndereco().getBairro() %>"
								     data-cidade="<%= lista.get(i).getEndereco().getCidade() %>"
								     data-uf="<%= lista.get(i).getEndereco().getUf() %>"
								     data-cep="<%= lista.get(i).getEndereco().getCep() %>">
								     <img src="./assets/editado.svg" alt="Editar" width="25" height="25">
								  </a>
																  
						        </td>
						        <td style="text-align: center;">
						          <a href="controle.jsp?op=10&id=<%= lista.get(i).getId() %>"><img src="./assets/lata.svg" alt="Excluir" width="25" height="25"></a>
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
		
		$(document).ready(function() {
            $('#inputCep').on('input', function() {
                let cep = $(this).val().replace(/\D/g, ''); // Remove tudo que não é dígito
                if (cep.length > 5) {
                    cep = cep.replace(/^(\d{5})(\d)/, '$1-$2'); // Aplica o traço no meio
                }
                $(this).val(cep);
            });
        });
		
	    setTimeout(function() {
	        var alertElement = document.getElementById('alertUS');
	        var alert = new bootstrap.Alert(alertElement);
	        alert.close();
	    }, 2000);
	    	   
	    document.querySelectorAll('.edit-familia-btn').forEach(button => {
	        button.addEventListener('click', function(event) {
	            event.preventDefault();
	           
	            let btnSalvar = document.getElementById('btnSalvar');
	            btnSalvar.innerText = 'Editar';
	            
	            document.getElementById('formulario').action = "controle.jsp?op=9";
	        });
	    });

	    // Captura o evento de clique no botão de limpar
	    document.getElementById('btnLimpar').addEventListener('click', function() {
	        let btnSalvar = document.getElementById('btnSalvar');
	        btnSalvar.innerText = 'Salvar';
	        
	        document.getElementById('formulario').action = "controle.jsp?op=8";
	    });
		
	</script>

</body>
</html>