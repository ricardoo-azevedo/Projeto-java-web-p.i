package com.medic.interfaces;

import java.util.List;

import com.medic.model.Funcionario;

public interface FuncionarioInterface {
    int inserirFuncionario(Funcionario funcionario);
    Funcionario consultaFuncionario(int idFuncionario);
    void editarFuncionario(Funcionario funcionario);    
    void excluirFuncionario(int idFuncionario);
    List<Funcionario> listarFuncionario();
    Funcionario autenticacaoFuncionario(int idFuncionario, String senha);
}