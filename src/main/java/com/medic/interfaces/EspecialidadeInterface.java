package com.medic.interfaces;

import java.util.List;

import com.medic.model.Especialidade;

public interface EspecialidadeInterface {
    public void inserirEspecialidade(Especialidade especialidade);
    public void consultarEspecialidade(int IdEspecialidade);
    public void editarEspecialidade(Especialidade especialidade);
    public void excluirEspecialidade(int IdEspecialidade);
    public List<Especialidade> listarEspecialidade(); 
}
