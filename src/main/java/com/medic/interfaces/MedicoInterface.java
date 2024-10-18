package com.medic.interfaces;

import java.util.List;

import com.medic.model.Medico;

public interface MedicoInterface {
	
	int inserirMedico(Medico medico);
    Medico consultarMedico(int idMedico);
    void editarMedico(Medico medico);
    void excluirMedico(int idMedico);
    List<Medico> listarMedico();
    List<Medico> listarPorEspecialidade(int idEspecialidade);
    boolean verificarMedico(String crm, String telefone);
    
}
