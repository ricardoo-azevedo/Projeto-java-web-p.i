package com.medic.interfaces;

import java.util.List;

import com.medic.model.UnidadeSaude;

public interface UnidadeSaudeInterface {
	
	int inserir(UnidadeSaude unidadeSaude);
	UnidadeSaude consultar(int idUnidadeSaude);
    void editar(UnidadeSaude unidadeSaude);
    void excluir(int idUnidadeSaude);
    List<UnidadeSaude> listar();

}
