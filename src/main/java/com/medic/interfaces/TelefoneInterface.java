package com.medic.interfaces;

import java.util.List;

import com.medic.model.Telefone;

public interface TelefoneInterface {
	
	int inserir(Telefone telefone);
	Telefone consultar(int idTelefone);
    void editar(Telefone telefone);
    void excluir(int idTelefone);
    List<Telefone> listar();
    
    Telefone buscarUnidadeSaude(int idTelefone);
    Telefone buscarPaciente(int idPaciente);

}
