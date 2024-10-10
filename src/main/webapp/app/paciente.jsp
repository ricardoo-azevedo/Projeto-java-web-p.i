<%@page import="com.medic.model.Especialidade"%>
<%@page import="com.medic.interfaces.EspecialidadeInterface"%>
<%@page import="com.medic.dao.EspecialidadeDAO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.medic.auxiliar.Funcoes"%>
<%@page import="com.medic.model.Medico"%>
<%@page import="java.util.List"%>
<%@page import="com.medic.dao.MedicoDAO"%>
<%@page import="com.medic.interfaces.MedicoInterface"%>
<%@page import="com.medic.interfaces.PacienteInterface"%>
<%@page import="com.medic.dao.PacienteDAO"%>
<%@page import="com.medic.model.Paciente"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

// simulacao de paciente cadastrado
int idPaciente = 34;
PacienteInterface iPaciente = new PacienteDAO();
Paciente paciente = iPaciente.consultar(idPaciente);

%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Agendamento de Consulta</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <!-- Estilos personalizados -->
  <style>
    /* Faz o body ocupar toda a altura da tela */
    html, body {
      height: 100%;
    }

    /* Configuração do rodapé fixo */
    .footer {
      position: fixed;
      bottom: 0;
      width: 100%;      
      color: white;
      text-align: center;
      padding: 10px 0;
    }

    /* Garantir que o conteúdo da página preencha o espaço restante antes do footer */
    .container {
      padding-bottom: 10px; /* Para evitar que o conteúdo cubra o footer */
    }
  </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-success">
  <div class="container">
    <a class="navbar-brand" href="index.jsp"><h2>iMedic</h2></a>    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link active" href="#">Agendar Consulta</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Meus Agendamentos</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Sair</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container mt-4">
  <div class="row justify-content-center">
    <div class="col-12 col-md-8 col-lg-6">
      <h2>Agendar Consulta</h2>
      <form action="#" method="post">
      	<div class="mb-3">
          <label for="especialidade" class="form-label">Paciente:</label>
          <input type="text" class="form-control form-control-lg" id="inputPaciente" value="<%= paciente.getNome() %>" readonly="readonly">
        </div>
        <div class="mb-3">
          <label for="inputEspecialidade" class="form-label">Especialidade:</label>
          	<%
				String especialidade = request.getParameter("inputEspecialidade");          	
          	%>
          	
          	<select class="form-control form-control-lg" id="selecao" name="inputEspecialidade" required>
			    <option value="" disabled<%= (especialidade == null) ? " selected" : "" %>>Selecione</option>
			    <%
			    EspecialidadeInterface iEspecialidade = new EspecialidadeDAO();
			    List<Especialidade> listaEspecialidade = iEspecialidade.lista();
			    
			    for (int i = 0; i < listaEspecialidade.size(); i++) {
			        Especialidade esp = listaEspecialidade.get(i);
			        String selected = (especialidade != null && especialidade.equals(String.valueOf(esp.getId()))) ? " selected" : "";
			    %>
			    <option value="paciente.jsp?inputEspecialidade=<%= esp.getId() %>"<%= selected %>><%= esp.getNome() %></option>
			    <%
			    }
			    %>
			</select>          	
          		
        </div>
        <div class="mb-3">
          <label for="inputMedico" class="form-label">Médico:</label>
          	<select class="form-control form-control-lg" id="inputMedico" name="inputMedico" required>
				<option value="" selected disabled>Selecione</option>
				<%
				
				MedicoInterface iMedico = new MedicoDAO();
				List<Medico> listaMedico = null;

				especialidade = request.getParameter("inputEspecialidade");
				if (especialidade != null) {
					
					int idEspecialidade = Integer.parseInt(especialidade);				    
				    listaMedico = iMedico.listarPorEspecialidade(idEspecialidade);
				    
					for(int i = 0; i < listaMedico.size(); i++) {				
						
					%>
					<option value="<%= listaMedico.get(i).getId() %>"><%= listaMedico.get(i).getCrm()+" :: "+listaMedico.get(i).getNome() %></option>
					<%
					}
				    
				}
								
				%>
			</select>
        </div>
        <div class="mb-3">
          <label for="data" class="form-label">Data da Consulta:</label>
          <select class="form-control form-control-lg" id="inputData" name="inputData" required>
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
        </div>        
        <div class="mb-3">
          <label for="observacoes" class="form-label">Observações:</label>
          <textarea class="form-control" id="observacoes" rows="3"></textarea>
        </div>
        <div class="mb-3 justify-content-end" style="text-align: center;">
	        <button type="button" onclick="window.location.href='paciente.jsp';" class="btn btn-danger btn-lg w-25">Cancelar</button>
	        <button type="submit" class="btn btn-success btn-lg w-25">Agendar</button>
        </div>
        
      </form>
    </div>
  </div>
</div>

<footer class="footer bg-success">
  <div class="container text-center">
    &copy; 2024 iMedic - Todos os direitos reservados
  </div>
</footer>

<!-- Bootstrap JS e dependências opcionais -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script>

$('#selecao').change(function() {
    window.location = $(this).val();
});
</script>

</body>
</html>
