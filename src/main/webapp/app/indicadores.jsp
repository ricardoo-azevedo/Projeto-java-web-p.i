<%@page import="com.medic.dao.PacienteDAO"%>
<%@page import="com.medic.dao.EspecialidadeDAO"%>
<%@page import="com.medic.dao.MedicoDAO"%>
<%@page import="com.medic.dao.AgendamentoDAO"%>
<%@page import="com.medic.interfaces.AgendamentoInterface"%>
<%@page import="com.medic.interfaces.MedicoInterface"%>
<%@page import="com.medic.interfaces.EspecialidadeInterface"%>
<%@page import="com.medic.interfaces.PacienteInterface"%>
<%@page import="com.medic.model.Agendamento"%>
<%@page import="com.medic.model.Medico"%>
<%@page import="com.medic.model.Especialidade"%>
<%@page import="com.medic.model.Paciente"%>
<%@page import="com.medic.model.Familia"%>
<%@page import="com.medic.dao.FamiliaDAO"%>
<%@page import="com.medic.interfaces.FamiliaInterface"%>
<%@page import="com.medic.model.UnidadeSaude"%>
<%@page import="java.util.List"%>
<%@page import="com.medic.dao.UnidadeSaudeDAO"%>
<%@page import="com.medic.interfaces.UnidadeSaudeInterface"%>
<%
   	UnidadeSaudeInterface iUnidadeSaudeI = new UnidadeSaudeDAO();
   	List<UnidadeSaude> listaUnidadeSaudeI = iUnidadeSaudeI.listar();

   	FamiliaInterface iFamiliaI = new FamiliaDAO();
   	List<Familia> listaFamiliaI = iFamiliaI.listar();
   	
   	PacienteInterface iPacienteI = new PacienteDAO();
   	List<Paciente> listaPacienteI = iPacienteI.listar();
   	
   	EspecialidadeInterface iEspecialidadeI = new EspecialidadeDAO();
   	List<Especialidade> listaEspecialidadeI = iEspecialidadeI.lista();
   	
   	MedicoInterface iMedicoI = new MedicoDAO();
   	List<Medico> listaMedicoI = iMedicoI.listarMedico();
   	
   	AgendamentoInterface iAgendamentoI = new AgendamentoDAO(); 
   	List<Agendamento> listaAgendamentoI = iAgendamentoI.listarAgendamento();
  	
%>
                    
<div class="dashboard d-block">

	<h1 class="mt-3">Indicadores</h1>

   <div class="row">
       <div class="col-md-6">
           <div class="card mt-3 p-3">
               <i class="icon bi bi-hospital-fill text-primary text-center fs-3"> Unidade de saúde </i>
               <div class="count text-primary text-center fs-1"><%= listaUnidadeSaudeI.size() %></div>
           </div>
       </div>
       <div class="col-md-6">
           <div class="card mt-3 p-3">
               <i class="icon bi bi-capsule text-success text-center fs-3"> Agendamentos</i>
               <div class="count text-success text-center fs-1"><%= listaAgendamentoI.size() %></div>
           </div>
       </div>						        
   </div>
   <div class="row">
    <div class="col-md-6">
           <div class="card mt-3 p-3">
               <i class="icon bi bi-people-fill text-warning text-center fs-3"> Familias</i>
               <div class="count text-warning text-center fs-1"><%= listaFamiliaI.size() %></div>
           </div>
       </div>
       <div class="col-md-6">
           <div class="card mt-3 p-3">
               <i class="icon bi bi-person-heart text-danger text-center fs-3"> Pacientes</i>
               <div class="count text-danger text-center fs-1"><%= listaPacienteI.size() %></div>
           </div>
       </div>
       						        
   </div>
   <div class="row">
    <div class="col-md-6">
           <div class="card mt-3 p-3">						            
               <i class="icon bi bi-heart-pulse-fill text-info text-center fs-3"> Médicos</i>
               <div class="count text-info text-center fs-1"><%= listaMedicoI.size() %></div>
           </div>
       </div>
       <div class="col-md-6">
           <div class="card mt-3 p-3">
               <i class="icon bi bi-list-check text-secondary text-center fs-3"> Especialidades</i>
               <div class="count text-secondary text-center fs-1"><%= listaEspecialidadeI.size() %></div>
            </div>
        </div>						        
    </div>
</div>