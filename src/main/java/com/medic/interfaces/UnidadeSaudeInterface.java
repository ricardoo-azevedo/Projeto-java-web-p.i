package com.medic.interfaces;

import java.util.List;

import com.medic.model.UnidadeSaude;

public interface UnidadeSaudeInterface {
    int inserirUnidadeSaude(UnidadeSaude unidadeSaude);
    UnidadeSaude consultarUnidadeSaude(int idUnidadeSaude);
    void editarUnidadeSaude(UnidadeSaude unidadeSaude);
    void excluirUnidadeSaude(int idUnidadeSaude);
    List<UnidadeSaude> listarUnidadeSaude();
}
