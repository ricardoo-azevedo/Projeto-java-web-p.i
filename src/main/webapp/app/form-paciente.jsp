

	
	<%@page import="com.medic.dao.UnidadeSaudeDAO"%>
<%@page import="com.medic.interfaces.UnidadeSaudeInterface"%>
<%@page import="com.medic.model.UnidadeSaude"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	


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
            <div class="sidebar-heading border-bottom bg-success text-center ">Paciente</div>
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
                            <li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a></li>
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
			<div class="container-fluid fade-in-element">

				<div class="row justify-content-between">

					<div class="col-md-7">
					
						<h1 class="mt-4">Inserir Paciente</h1>
					
						<form action="controle.jsp?op=1" method="post">

							<div class="row">

								<div class="form-floating mb-3 col-md-8">
									<input type="text" class="form-control" id="inputNome" name="inputNome" placeholder=" " required> 
									<label for="inputNome" style="margin-left: 10px;">Nome</label>
								</div>

								<div class="form-floating mb-3 col-md-4">
									<input type="text" class="form-control" id="inputTelefone" name="inputTelefone" placeholder=" " required>
									<label for="inputTelefone" style="margin-left: 10px;">Telefone</label>
								</div>
								<div class="form-floating mb-3 col-md-4">
									<input type="text" class="form-control" id="inputCpf" name="inputCpf" placeholder=" " required>
									<label for="inputCpf" style="margin-left: 10px;">CPF</label>
								</div>
								<div class="form-floating mb-3 col-md-8">
									<input type="date" class="form-control " id="inputDate" name="inputDate" placeholder=" " required>
									<label  for="inputDate" style="margin-left: 30px;">Data de nascimento</label>
								</div> 

							</div>

							<div class="row">

								<div class="form-floating mb-3 col-md-6">
									<input type="text" class="form-control" id="inputLogradouro" name="inputLogradouro" placeholder=" " required>
									<label for="inputLogradouro" style="margin-left: 10px;">Logradouro</label>
								</div>

								<div class="form-floating mb-3 col-md-2">
									<input type="text" class="form-control" id="inputNumero" name="inputNumero" placeholder=" " required>
									<label for="inputNumero" style="margin-left: 10px;">Número</label>
								</div>

								<div class="form-floating mb-3 col-md-4">
									<input type="text" class="form-control" id="inputComplemento" name="inputComplemento" placeholder=" ">
									<label for="inputComplemento" style="margin-left: 10px;">Complemento</label>
								</div>

							</div>

							<div class="row">

								<div class="form-floating mb-3 col-md-3">
									<input type="text" class="form-control" id="inputBairro" name="inputBairro" placeholder=" " required>
									<label for="inputBairro" style="margin-left: 10px;">Bairro</label>
								</div>

								<div class="form-floating mb-3 col-md-4">
									<input type="text" class="form-control" id="inputCidade" name="inputCidade" placeholder=" " required>
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
									<input type="text" class="form-control" id="inputCep" name="inputCep" placeholder=" " required>
									<label for="inputCep" style="margin-left: 10px;">CEP</label>
								</div>

							</div>

							<div class="form-floating mb-3 col-md-12 justify-content-end" style="text-align: right;">
								<button type="submit" class="btn btn-lg btn-success">Salvar</button>
							</div>

						</form>

				
					<%
					// TEMP                	
					UnidadeSaudeInterface iUnidadeSaude = new UnidadeSaudeDAO();
					List<UnidadeSaude> lista = iUnidadeSaude.listarUnidadeSaude();

					for (int i = 0; i < lista.size(); i++) {
						out.println("ID: " + lista.get(i).getId());
						out.println(" - NOME: " + lista.get(i).getNome() + "<br>");
						out.println(lista.get(i).getEndereco() + "<br><br>");
					}
					%>	
				
				
					
					</div>
					
					<div class="col-md-5 coluna-direita">
                        <!-- Conteúdo da coluna direita aqui -->
                        
                        
                        
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
	</script>

</body>
</html>
