package com.medic.interfaces;

import java.util.List;

import com.medic.model.Especialidade;

public interface EspecialidadeInterface {
    int inserir(Especialidade especialidade);
    List<Especialidade> listar();
   void excluir(Especialidade especialidade);
   void editar(Especialidade especialidade);
   public Especialidade consultar(int IdEspecialidade);
	
	
}
