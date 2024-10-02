
 

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
	int idEndereco = iEndereco.inserirEndereco(endereco);
	endereco.setIdEndereco(idEndereco);
	
	String nome = request.getParameter("inputNome");
	UnidadeSaude unidadeSaude = new UnidadeSaude();
	unidadeSaude.setNome(nome);
	unidadeSaude.setEndereco(endereco);
	int idUnidadeSaude = iUnidadeSaude.inserirUnidadeSaude(unidadeSaude);
	unidadeSaude.setId(idUnidadeSaude);

	String nTelefone = request.getParameter("inputTelefone");	
	Telefone telefone = new Telefone();
	telefone.setNumero(nTelefone);
	telefone.setUnidadeSaude(unidadeSaude);
	iTelefone.inserir(telefone);	
	
	response.sendRedirect("form-unidade-saude.jsp");

	break;
}
default:{
	

	break;
}

}
%>




