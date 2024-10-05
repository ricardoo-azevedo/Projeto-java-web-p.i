<%@page import="com.medic.model.Medico"%>
<%@page import="com.medic.model.Especialidade"%>
<%@page import="com.medic.dao.MedicoDAO"%>
<%@page import="com.medic.interfaces.MedicoInterface"%>
<%@page import="com.medic.dao.EspecialidadeDAO"%>
<%@page import="com.medic.interfaces.EspecialidadeInterface"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="com.medic.auxiliar.Funcoes"%>
<%@page import="com.medic.interfaces.PacienteInterface"%>
<%@page import="com.medic.dao.PacienteDAO"%>
<%@page import="com.medic.model.Paciente"%>
<%@page import="com.medic.interfaces.FamiliaInterface"%>
<%@page import="com.medic.dao.FamiliaDAO"%>
<%@page import="com.medic.model.Familia"%>
<%@page import="com.medic.dao.UnidadeSaudeDAO"%>
<%@page import="com.medic.model.UnidadeSaude"%>
<%@page import="com.medic.model.Telefone"%>
<%@page import="com.medic.dao.UnidadeSaudeDAO"%>
<%@page import="com.medic.dao.TelefoneDAO"%>
<%@page import="com.medic.interfaces.UnidadeSaudeInterface"%>
<%@page import="com.medic.interfaces.TelefoneInterface"%>
<%@page import="com.medic.model.Endereco"%>
<%@page import="com.medic.dao.EnderecoDAO"%>
<%@page import="com.medic.interfaces.EnderecoInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
int op = Integer.parseInt(request.getParameter("op"));

EnderecoInterface iEndereco = new EnderecoDAO();
TelefoneInterface iTelefone = new TelefoneDAO();
UnidadeSaudeInterface iUnidadeSaude = new UnidadeSaudeDAO();
FamiliaInterface iFamilia = new FamiliaDAO();
PacienteInterface iPaciente = new PacienteDAO();
EspecialidadeInterface iEspecialidade = new EspecialidadeDAO();
MedicoInterface iMedico = new MedicoDAO();


switch(op){

case 1:{

	String logradouro = request.getParameter("inputLogradouro");	
	String numero = request.getParameter("inputNumero");	
	String complemento = request.getParameter("inputComplemento");	
	String bairro = request.getParameter("inputBairro");	
	String cidade = request.getParameter("inputCidade");	
	String uf = request.getParameter("inputUf");	
	String cep = request.getParameter("inputCep");	
	
	Endereco endereco = new Endereco();
	endereco.setLogradouro(logradouro);
	endereco.setNumero(numero);
	endereco.setBairro(bairro);
	endereco.setComplemento(complemento);
	endereco.setCidade(cidade);
	endereco.setUf(uf);
	endereco.setCep(cep);
	int idEndereco = iEndereco.inserir(endereco);
	endereco.setId(idEndereco);
	
	String nome = request.getParameter("inputNome");
	UnidadeSaude unidadeSaude = new UnidadeSaude();
	unidadeSaude.setNome(nome);
	unidadeSaude.setEndereco(endereco);
	int idUnidadeSaude = iUnidadeSaude.inserir(unidadeSaude);
	unidadeSaude.setId(idUnidadeSaude);

	String nTelefone = request.getParameter("inputTelefone");	
	Telefone telefone = new Telefone();
	telefone.setNumero(nTelefone);
	telefone.setUnidadeSaude(unidadeSaude);
	iTelefone.inserir(telefone);	
	
	response.sendRedirect("form-unidade-saude.jsp?exibirAlertUS="+unidadeSaude.getNome());

	break;
}
case 2:{

	int idEndereco = Integer.parseInt(request.getParameter("inputIdEndereco"));
	String logradouro = request.getParameter("inputLogradouro");	
	String numero = request.getParameter("inputNumero");	
	String complemento = request.getParameter("inputComplemento");	
	String bairro = request.getParameter("inputBairro");	
	String cidade = request.getParameter("inputCidade");	
	String uf = request.getParameter("inputUf");	
	String cep = request.getParameter("inputCep");	
	
	Endereco endereco = new Endereco();
	endereco.setId(idEndereco);
	endereco.setLogradouro(logradouro);
	endereco.setNumero(numero);
	endereco.setBairro(bairro);
	endereco.setComplemento(complemento);
	endereco.setCidade(cidade);
	endereco.setUf(uf);
	endereco.setCep(cep);
	iEndereco.editar(endereco);
	
	int idUnidadeSaude = Integer.parseInt(request.getParameter("inputIdUS"));
	String nome = request.getParameter("inputNome");
	UnidadeSaude unidadeSaude = new UnidadeSaude();
	unidadeSaude.setId(idUnidadeSaude);
	unidadeSaude.setNome(nome);
	unidadeSaude.setEndereco(endereco);
	iUnidadeSaude.editar(unidadeSaude);

	int idTelefone = Integer.parseInt(request.getParameter("inputIdTelefone"));
	String nTelefone = request.getParameter("inputTelefone");	
	Telefone telefone = new Telefone();
	telefone.setId(idTelefone);
	telefone.setNumero(nTelefone);	
	iTelefone.editar(telefone);	
	
	response.sendRedirect("form-unidade-saude.jsp?exibirAlertUS="+unidadeSaude.getNome());
	
	break;
}
case 3:{
	
	int idUnidadeSaude = Integer.parseInt(request.getParameter("id"));
	UnidadeSaude unidadeSaude = iUnidadeSaude.consultar(idUnidadeSaude);
	iEndereco.excluir(unidadeSaude.getEndereco().getId());
	iUnidadeSaude.excluir(idUnidadeSaude);
	
	response.sendRedirect("form-unidade-saude.jsp");
	
	break;
}
case 4:{
	
	int idFamilia = Integer.parseInt(request.getParameter("inputFamilia"));
	Familia familia = iFamilia.consultar(idFamilia);
	
	String nome = request.getParameter("inputNome");
	String cpf = request.getParameter("inputCpf");
	String nascimento = request.getParameter("inputNascimento");
	out.println(nascimento);
	Funcoes f = new Funcoes();	
	Paciente paciente = new Paciente();
	paciente.setNome(nome);
	paciente.setCpf(cpf);
	paciente.setDataNascimento(f.converterDateStringSQL(nascimento));
	paciente.setFamilia(familia);
	int idPaciente = iPaciente.inserir(paciente);
	paciente.setId(idPaciente);
		
	String nTelefone = request.getParameter("inputTelefone");	
	Telefone telefone = new Telefone();
	telefone.setNumero(nTelefone);
	telefone.setPaciente(paciente);	
	int idTelefone = iTelefone.inserir(telefone);
	telefone.setId(idTelefone);
	out.println(telefone);
	
	response.sendRedirect("form-paciente.jsp?exibirAlertPaciente="+paciente.getNome());

	break;
}

case 5:{
	
	int idFamilia = Integer.parseInt(request.getParameter("inputIdFamilia"));
	Familia familia = new Familia();
	familia.setId(idFamilia);
	iFamilia.editar(familia);
	
	int idPaciente = Integer.parseInt(request.getParameter("inputIdPaciente"));
	String nome = request.getParameter("inputNome");
	String cpf = request.getParameter("inputCpf");
	String nascimento = request.getParameter("inputNascimento");
	out.println(nascimento);
	Funcoes f = new Funcoes();	
	Paciente paciente = new Paciente();
	paciente.setId(idPaciente);
	paciente.setNome(nome);
	paciente.setCpf(cpf);
	paciente.setDataNascimento(f.converterDateStringSQL(nascimento));
	paciente.setFamilia(familia);
	iPaciente.editar(paciente);
	paciente.setId(idPaciente);
	out.println(paciente);
	out.println("<br>");
	
	int idTelefone = Integer.parseInt(request.getParameter("inputIdTelefone"));
	String nTelefone = request.getParameter("inputTelefone");	
	Telefone telefone = new Telefone();
	telefone.setId(idTelefone);
	telefone.setNumero(nTelefone);
	telefone.setPaciente(paciente);	
	iTelefone.editar(telefone);
	out.println(telefone);
	
	response.sendRedirect("form-paciente.jsp?exibirAlertPaciente="+paciente.getNome());
	
	break;
}

case 6:{
	
	int idPaciente = Integer.parseInt(request.getParameter("id"));
	iPaciente.excluir(idPaciente);
	response.sendRedirect("form-paciente.jsp");
	break;
}

case 7:{
	
	int idFamilia = Integer.parseInt(request.getParameter("inputFamilia"));
	Familia familia = iFamilia.consultar(idFamilia);	
		
	String nome = request.getParameter("inputNome");
	String cpf = request.getParameter("inputCpf");
	String nascimento = request.getParameter("inputNascimento");
	Funcoes f = new Funcoes();	
	Paciente paciente = new Paciente();
	paciente.setNome(nome);
	paciente.setCpf(cpf);
	paciente.setDataNascimento(f.converterDateStringSQL(nascimento));
	paciente.setFamilia(familia);
	int idPaciente = iPaciente.inserir(paciente);
	paciente.setId(idPaciente);
	
	String nTelefone = request.getParameter("inputTelefone");	
	Telefone telefone = new Telefone();
	telefone.setNumero(nTelefone);
	telefone.setPaciente(paciente);	
	int idTelefone = iTelefone.inserir(telefone);
	telefone.setId(idTelefone);
	
	response.sendRedirect("form-adicionar-paciente.jsp?exibirAlertPaciente="+paciente.getNome());
	
	break;
	
}
case 8:{

	String logradouro = request.getParameter("inputLogradouro");	
	String numero = request.getParameter("inputNumero");	
	String complemento = request.getParameter("inputComplemento");	
	String bairro = request.getParameter("inputBairro");	
	String cidade = request.getParameter("inputCidade");	
	String uf = request.getParameter("inputUf");	
	String cep = request.getParameter("inputCep");		
	Endereco endereco = new Endereco();
	endereco.setLogradouro(logradouro);
	endereco.setNumero(numero);
	endereco.setBairro(bairro);
	endereco.setComplemento(complemento);
	endereco.setCidade(cidade);
	endereco.setUf(uf);
	endereco.setCep(cep);
	int idEndereco = iEndereco.inserir(endereco);	
	endereco.setId(idEndereco);
		
	Familia familia = new Familia();
	familia.setEndereco(endereco);
	iFamilia.inserir(familia);
		
	response.sendRedirect("form-familia.jsp?exibirAlert="+familia.getEndereco().getLogradouro());
	
	break;

}
case 9:{

	int idEndereco = Integer.parseInt(request.getParameter("inputIdEndereco"));
	String logradouro = request.getParameter("inputLogradouro");	
	String numero = request.getParameter("inputNumero");	
	String complemento = request.getParameter("inputComplemento");	
	String bairro = request.getParameter("inputBairro");	
	String cidade = request.getParameter("inputCidade");	
	String uf = request.getParameter("inputUf");	
	String cep = request.getParameter("inputCep");		
	Endereco endereco = new Endereco();
	endereco.setId(idEndereco);
	endereco.setLogradouro(logradouro);
	endereco.setNumero(numero);
	endereco.setBairro(bairro);
	endereco.setComplemento(complemento);
	endereco.setCidade(cidade);
	endereco.setUf(uf);
	endereco.setCep(cep);
	iEndereco.editar(endereco);
	
	int idFamilia = Integer.parseInt(request.getParameter("inputIdFamilia"));
	Familia familia = new Familia();
	familia.setEndereco(endereco);
	familia.setId(idFamilia);
	iFamilia.editar(familia);
	
	response.sendRedirect("form-familia.jsp?exibirAlert="+familia.getEndereco().getLogradouro());
	
	break;

}

case 10:{
	
	int idFamilia = Integer.parseInt(request.getParameter("id"));
	Familia familia = iFamilia.consultar(idFamilia);	
	iEndereco.excluir(familia.getEndereco().getId());
	iFamilia.excluir(idFamilia);

	response.sendRedirect("form-familia.jsp");
	
	break;
}

case 11:{

	String crm = request.getParameter("inputCrm");
	String nome = request.getParameter("inputNome");
	String ntelefone = request.getParameter("inputTelefone");
	int idEspecialidade = Integer.parseInt(request.getParameter("inputEspecialidade"));
	Especialidade especialidade = iEspecialidade.consultar(idEspecialidade);
	Medico medico = new Medico();
	medico.setNome(nome);
	medico.setCrm(crm);
	medico.setEspecialidade(especialidade);
	
	//inserindo tudo de medico aqui
	
    int idMedico =	iMedico.inserirMedico(medico);
 Medico medicor = iMedico.consultarMedico(idMedico);
    medico.setId(idMedico);
    medicor.setId(idMedico);
   
  


	Telefone telefone = new Telefone();
	
	telefone.setNumero(ntelefone);
	telefone.setMedico(medico);
	iTelefone.inserir(telefone);
	
	



	
	
	response.sendRedirect("form-medico.jsp");
	
	break;
}
case 12:{
	String nome = request.getParameter("inputNome");
	Especialidade especialidade = new Especialidade(nome);
	iEspecialidade.inserir(especialidade);
	response.sendRedirect("form-especialidade.jsp?exibirAlert="+nome);
	
	break;
}

case 13:{
//resevado para editar especialidade.
	break;
}
case 14:{
	int idEspecialidade = Integer.parseInt(request.getParameter("id"));
	iEspecialidade.excluir(idEspecialidade);
	response.sendRedirect("form-especialidade.jsp");
	break;
}

case 15:{
	 
     //excluindo idMedico todo 
	int idMedico = Integer.parseInt(request.getParameter("id"));
	iMedico.excluirMedico(idMedico);
	response.sendRedirect("form-medico.jsp");
	break;
}

default:{
	

	break;
}

}
%>