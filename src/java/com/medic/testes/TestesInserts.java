package com.medic.testes;

import java.util.List;

import com.medic.dao.EspecialidadeDAO;
import com.medic.interfaces.EspecialidadeInterface;
import com.medic.model.Especialidade;

public class TestesInserts {
	
	public static void main(String[] args) {
		
		EspecialidadeInterface iEspecialidade = new EspecialidadeDAO();
		
		// Inserir
		
		Especialidade eInserir = new Especialidade();
		eInserir.setNome("especialidade011");
		iEspecialidade.inserir(eInserir);
		
		// Consultar
		
//		Especialidade eConsulta = iEspecialidade.consultar(20);
//		System.out.println("Consulta");
//		System.out.println("ID: "+eConsulta.getId());
//		System.out.println("NOME: "+eConsulta.getNome());
//		System.out.println("");
		
		/*
		// Editar
		
		Especialidade eEditar = new Especialidade();
		eEditar.setId(11);
		eEditar.setNome("especialidade02");
		iEspecialidade.editar(eEditar);
		
		// Excluir
		
		Especialidade eExcluir = new Especialidade();
		eExcluir.setId(200);
		
		
		// Listar
		
		List<Especialidade> lista = iEspecialidade.lista();
		
		for(int i=0; i<lista.size(); i++) {
			
			System.out.println("ID ESPECIALIDADE: "+lista.get(i).getId());
			System.out.println("NOME ESPECIALIDADE: "+lista.get(i).getNome());
			
		}
		*/
	}

}