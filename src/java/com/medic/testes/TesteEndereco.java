package com.medic.testes;

import java.util.ArrayList;
import java.util.List;

import com.medic.dao.EnderecoDAO;
import com.medic.interfaces.EnderecoInterface;
import com.medic.model.Endereco;

public class TesteEndereco {

	public static void main(String[] args) {

		EnderecoInterface iEndereco = new EnderecoDAO();

		// Inserir
		
		Endereco endereco = new Endereco();
		endereco.setLogradouro("1");
		endereco.setNumero("2");
		endereco.setBairro("3");
		endereco.setComplemento("4");
		endereco.setCidade("5");
		endereco.setUf("6");
		endereco.setCep("7");

		//iEndereco.inserir(endereco);

		// Consultar
		
		Endereco enderecoConsulta = iEndereco.consultar(2); 
		System.out.println("(CONSULTA) LOGRADOURO: "+enderecoConsulta.getLogradouro());
		System.out.println();
		
		// Alterar

		String pre = "a";
		Endereco enderecoAlterar = new Endereco();
		enderecoAlterar.setId(1);
		enderecoAlterar.setLogradouro(pre+"1");
		enderecoAlterar.setNumero(pre+"2");
		enderecoAlterar.setBairro(pre+"3");
		enderecoAlterar.setComplemento(pre+"4");
		enderecoAlterar.setCidade(pre+"5");
		enderecoAlterar.setUf(pre+"6");
		enderecoAlterar.setCep(pre+"7");
		iEndereco.editar(enderecoAlterar);
		
		// Excluir
		
		int idExcluir = 4;
		iEndereco.excluir(idExcluir);
		
		// Listar
		
		List<Endereco> lista = iEndereco.listar();

		for (int i = 0; i < lista.size(); i++) {

			//System.out.println(lista);
			System.out.println("ID: "+lista.get(i).getId());
			System.out.println("LOGRADOURO: "+lista.get(i).getLogradouro());
			System.out.println("NUMERO: "+lista.get(i).getNumero());
			System.out.println("BAIRRO: "+lista.get(i).getBairro());
			System.out.println("COMPLEMENTO: "+lista.get(i).getComplemento());
			System.out.println("CIDADE: "+lista.get(i).getCidade());
			System.out.println("UF: "+lista.get(i).getUf());
			System.out.println("CEP: "+lista.get(i).getCep());
			System.out.println();

		}

	}

}
