package com.medic.interfaces;

import java.util.List;

import com.medic.model.Endereco;

public interface EnderecoInterface {
    public void inserirEndereco(Endereco endereco);
    public Endereco consultarEndereco(int idEndereco);
    public void editarEndereco(Endereco endereco);
    public void excluirEndereco(int idEndereco);
    public List<Endereco> listarEndereco();
    
}
