package com.medic.tests;

import com.medic.model.Endereco;

import com.medic.model.Especialidade;
import com.medic.model.UnidadeSaude;
import com.medic.service.ConnectionFactory;
import com.medic.interfaces.EspecialidadeInterface;

import java.util.List;

import com.medic.dao.EnderecoDAO;
import com.medic.dao.EspecialidadeDAO;
import com.medic.dao.UnidadeSaudeDAO;

/*
 * UnidadeSaude: 
 * Inserir [ok]
 * consultar [ok]
 * excluir [ok]
 * listar [ok]
 * editar [ok]
 * 
 * */

public class Teste {
    public static void main(String[] args) throws ClassNotFoundException {
       
    	
UnidadeSaudeDAO unidadeSaudeDAO = new UnidadeSaudeDAO();
        
        // Criar um Endereço para a Unidade de Saúde
        Endereco endereco = new Endereco();
        endereco.setIdEndereco(2); // Supondo que você já tenha um endereço com esse ID
        
        // Criar uma nova Unidade de Saúde
        UnidadeSaude novaUnidade = new UnidadeSaude();
        novaUnidade.setNome("Unidade de Saúde Central");
        novaUnidade.setEndereco(endereco);
        
        // Inserir a nova Unidade de Saúde
        int idInserido = unidadeSaudeDAO.inserirUnidadeSaude(novaUnidade);
        System.out.println("Unidade de Saúde inserida com ID: " + idInserido);
        
        // Consultar a Unidade de Saúde inserida
        UnidadeSaude unidadeConsultada = unidadeSaudeDAO.consultarUnidadeSaude(idInserido);
        System.out.println("Unidade de Saúde consultada: " + unidadeConsultada);
        
        // Editar a Unidade de Saúde
        unidadeConsultada.setNome("Unidade de Saúde Norte");
        unidadeSaudeDAO.editarUnidadeSaude(unidadeConsultada);
        System.out.println("Unidade de Saúde editada: " + unidadeSaudeDAO.consultarUnidadeSaude(idInserido));
        
        // Listar todas as Unidades de Saúde
        List<UnidadeSaude> listaUnidades = unidadeSaudeDAO.listarUnidadeSaude();
        System.out.println("Lista de Unidades de Saúde:");
        for (UnidadeSaude unidade : listaUnidades) {
            System.out.println(unidade);
        }
        
        // Excluir a Unidade de Saúde
        unidadeSaudeDAO.excluirUnidadeSaude(idInserido);
        System.out.println("Unidade de Saúde com ID " + idInserido + " excluída.");
    	
    	
    	
    }
        
    
}