<%@page import="com.medic.auxiliar.Indicadores"%>
<%
   	
	Indicadores qual = new Indicadores();
  	
%>
                    
<div class="dashboard d-block">
	
	<h1 class="mt-4 texto fade-in-element bg-light-subtle text-center ">Indicadores</h1>

               <div class="col-md-12">
           <div class="card mt-3 p-3">
               <i class="icon bi bi-person-workspace text-secondary text-center fs-3"> Funcionários</i>
               <div class="count text-secondary text-center fs-1"><%= qual.indicador(7) %></div>
            </div>
        </div>
   <div class="row">
       <div class="col-md-6">
           <div class="card mt-2 p-3">
               <i class="icon bi bi-hospital-fill text-primary text-center fs-3"> Unidade de saúde </i>
               <div class="count text-primary text-center fs-1"><%= qual.indicador(1) %></div>
           </div>
       </div>
       <div class="col-md-6">
           <div class="card mt-2 p-3">
               <i class="icon bi bi-clipboard-fill text-success text-center fs-3"> Agendamentos</i>
               <div class="count text-success text-center fs-1"><%= qual.indicador(2) %></div>
           </div>
       </div>						        
   </div>
   <div class="row">
    <div class="col-md-6">
           <div class="card mt-3 p-3">
               <i class="icon bi bi-people-fill text-warning text-center fs-3"> Familias</i>
               <div class="count text-warning text-center fs-1"><%= qual.indicador(5) %></div>
           </div>
       </div>
       <div class="col-md-6">
           <div class="card mt-3 p-3">
               <i class="icon bi bi-person-heart text-danger text-center fs-3"> Pacientes</i>
               <div class="count text-danger text-center fs-1"><%= qual.indicador(6) %></div>
           </div>
       </div>
       						        
   </div>
   <div class="row">
    <div class="col-md-6">
           <div class="card mt-3 p-3">						            
               <i class="icon bi bi-heart-pulse-fill text-info text-center fs-3"> Médicos</i>
               <div class="count text-info text-center fs-1"><%= qual.indicador(3) %></div>
           </div>
       </div>
       <div class="col-md-6">
           <div class="card mt-3 p-3">
               <i class="icon bi bi-list-check text-secondary text-center fs-3"> Especialidades</i>
               <div class="count text-secondary text-center fs-1"><%= qual.indicador(4) %></div>
            </div>
        </div>

          						        
    </div>
</div>