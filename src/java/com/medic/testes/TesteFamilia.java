package com.medic.testes;

import java.util.List;

import com.medic.auxiliar.Funcoes;
import com.medic.dao.EnderecoDAO;
import com.medic.dao.FamiliaDAO;
import com.medic.dao.PacienteDAO;
import com.medic.interfaces.EnderecoInterface;
import com.medic.interfaces.FamiliaInterface;
import com.medic.interfaces.PacienteInterface;
import com.medic.model.Endereco;
import com.medic.model.Familia;
import com.medic.model.Paciente;

public class TesteFamilia {
	
	public static void main(String[] args) {
				
		EnderecoInterface iEndereco = new EnderecoDAO();

		Endereco endereco = new Endereco();
		endereco.setLogradouro("1");
		endereco.setNumero("2");
		endereco.setBairro("3");
		endereco.setComplemento("4");
		endereco.setCidade("5");
		endereco.setUf("6");
		endereco.setCep("7");
		endereco.setId(12); // pessoas de mesmo endereco
		//endereco.setId(iEndereco.inserir(endereco));
		endereco = iEndereco.consultar(12);
		
		FamiliaInterface iFamilia = new FamiliaDAO();
		Familia familia = new Familia();
		familia.setEndereco(endereco);
		familia.setId(2); // pessoas de mesma familia
		//familia.setId(iFamilia.inserir(familia));
		
		Funcoes f = new Funcoes();
		
		PacienteInterface iPaciente = new PacienteDAO();
		Paciente paciente = new Paciente();
		paciente.setNome("Ricardo");
		paciente.setCpf("123.456.789-02");
		paciente.setDataNascimento(f.converterDateSQL("28/09/2024"));
		paciente.setFamilia(familia);
		//paciente.setId(iPaciente.inserir(paciente));
				
		List<Paciente> lista = iPaciente.listar();
		for(int i=0; i<lista.size(); i++) {
			System.out.print(lista.get(i).getNome()+" - ");
			System.out.println(lista.get(i).getDataNascimento());
			System.out.println("LOGRADOURO: "+lista.get(i).getFamilia().getEndereco().getLogradouro());
			System.out.println("NUMERO: "+lista.get(i).getFamilia().getEndereco().getNumero());
			System.out.println("BAIRRO: "+lista.get(i).getFamilia().getEndereco().getBairro());
			System.out.println("COMPLEMENTO: "+lista.get(i).getFamilia().getEndereco().getComplemento());
			System.out.println("CIDADE: "+lista.get(i).getFamilia().getEndereco().getCidade());
			System.out.println("UF: "+lista.get(i).getFamilia().getEndereco().getUf());
			System.out.println("CEP: "+lista.get(i).getFamilia().getEndereco().getCep());
			System.out.println();
		}

	}
}
