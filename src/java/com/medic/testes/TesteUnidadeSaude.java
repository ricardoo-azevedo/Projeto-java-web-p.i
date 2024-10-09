package com.medic.testes;

import com.medic.dao.EnderecoDAO;
import com.medic.dao.UnidadeSaudeDAO;
import com.medic.dao.UnidadeSaudeDAO;
import com.medic.interfaces.EnderecoInterface;
import com.medic.interfaces.UnidadeSaudeInterface;
import com.medic.model.Endereco;
import com.medic.model.UnidadeSaude;

public class TesteUnidadeSaude {
	
	public static void main(String[] args) {
		
		EnderecoInterface iEndereco = new EnderecoDAO();
		UnidadeSaudeInterface iUS = new UnidadeSaudeDAO();
		
		Endereco endereco = new Endereco();
		endereco.setLogradouro("RUA SEVERINO VASCONCELOS ARAGAO");
		endereco.setNumero("02");
		endereco.setBairro("JOSE FERNANDES SALSA");
		endereco.setComplemento("");
		endereco.setCidade("LIMOEIRO");
		endereco.setUf("PE");
		endereco.setCep("55700000");
		
				
		//int idEndereco = iEndereco.inserir(endereco);
		//endereco.setId(idEndereco); // inserir (retorno)
		endereco.setId(2); // editar
		//iEndereco.editar(endereco);
		
		
		UnidadeSaude us = new UnidadeSaude();
		us.setId(2);
		us.setNome("CASA DE SAUDE E MATERNIDADE DE LIMOEIRO");
		us.setEndereco(endereco);
		//iUS.inserir(us);
		//iUS.editar(us);
		
		
		//us = iUS.consultar(100);
		//System.out.println(us);
		
		//
		iEndereco.excluir(5);
		iUS.excluir(5);
		
		
	}

}
