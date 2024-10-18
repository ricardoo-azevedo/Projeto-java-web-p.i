package com.medic.interfaces;

import java.util.List;

import com.medic.model.Paciente;

public interface PacienteInterface {

	int inserir(Paciente paciente);
	Paciente consultar(int id);
    void editar(Paciente paciente );
    void excluir(int id);
	List<Paciente> listar();
	List<Paciente> listarPacientesFamilia(int idFamilia);
	boolean verificarPaciente(String cpf);

}
