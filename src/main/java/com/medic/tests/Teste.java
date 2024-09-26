package com.medic.tests;

import com.medic.model.Endereco;
import com.medic.model.Especialidade;
import com.medic.service.ConnectionFactory;
import com.medic.interfaces.EspecialidadeInterface;

import java.util.List;

import com.medic.dao.EnderecoDAO;
import com.medic.dao.EspecialidadeDAO;
/*
 * Endereco: 
 * Inserir [ok]
 * consultar [ok]
 * excluir [ok]
 * listar [ok]
 * editar [ok]
 * 
 * */

public class Teste {
    public static void main(String[] args) throws ClassNotFoundException {
        EspecialidadeInterface iEspecialidade = new EspecialidadeDAO();
        Especialidade especialidade3 = new Especialidade();
     
        /*Especialidade consulta = iEspecialidade.consultarEspecialidade(7);
        System.out.println("Id: "+consulta.getId());
        System.out.println("nome: "+consulta.getNome());*/
        

         EnderecoDAO enderecoDAO = new EnderecoDAO();

        // Criar e inserir um novo endereço
        /*Endereco enderecoInserido = new Endereco(0, "Rua A", "123", "Apto 101", "Centro", "CidadeX", "UF", "12345-678");
        enderecoDAO.inserirEndereco(enderecoInserido);
        System.out.println("Endereço inserido.");*/

        // Consultar o endereço inserido (assumindo que o ID é 1 para exemplo)
        Endereco enderecoConsultado = enderecoDAO.consultarEndereco(1);
        //if (enderecoConsultado != null) {
           // System.out.println("Endereço consultado: " + enderecoConsultado);
       // } else {
       //     System.out.println("Endereço não encontrado.");
        //}

        // Editar o endereço consultado
       // if (enderecoConsultado != null) {
           // enderecoConsultado.setLogradouro("Rua B");
           // enderecoConsultado.setNumero("456");
           // enderecoDAO.editarEndereco(enderecoConsultado);
           // System.out.println("Endereço editado.");
       //}

        // Listar todos os endereços
        //List<Endereco> listaEnderecos = enderecoDAO.listarEndereco();
        //System.out.println("Lista de endereços:");
        //for (Endereco endereco : listaEnderecos) {
           // System.out.println(endereco);
        //}

        // Excluir o endereço
        //if (enderecoConsultado != null) {
            //enderecoDAO.excluirEndereco(enderecoConsultado.getIdEndereco());
            //System.out.println("Endereço excluído.");
        //}
        
        
        			
        
        
    }
        
    
}