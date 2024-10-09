package com.medic.interfaces;

import java.util.List;

import com.medic.model.Endereco;

public interface EnderecoInterface {
	
	int inserir(Endereco endereco);
    Endereco consultar(int idEndereco);
    void editar(Endereco endereco);
    void excluir(int idEndereco);
    List<Endereco> listar();

}
