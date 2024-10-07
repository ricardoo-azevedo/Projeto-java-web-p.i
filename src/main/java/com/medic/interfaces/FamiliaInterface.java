	package com.medic.interfaces;

import java.util.List;

import com.medic.model.Familia;

public interface FamiliaInterface {
	
	int inserir(Familia familia);
	Familia consultar(int id);
    void editar(Familia familia);
    void excluir(int id);
	List<Familia> listar();
	
	List<Familia> listarFamiliaPaciente();

}
