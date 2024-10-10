package com.medic.interfaces;

import java.util.List;

import com.medic.model.Especialidade;

public interface EspecialidadeInterface {
	
	void inserir(Especialidade especialidade);
	Especialidade consultar(int idEspecialidade);
	void editar(Especialidade especialidade);
	void excluir(int idEspecialidade);
	List<Especialidade> lista();

}
