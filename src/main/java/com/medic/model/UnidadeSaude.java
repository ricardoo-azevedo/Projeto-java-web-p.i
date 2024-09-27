package com.medic.model;

public class UnidadeSaude {
    
    
    
    public UnidadeSaude(){
    
    }
    
    public UnidadeSaude(int id, String nome, Endereco endereco) {
        this.id = id;
        this.nome = nome;
        this.endereco = endereco;
    }

    private int id;
    private String nome;
    private Endereco endereco;
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }


    @Override
    public String toString() {
        return"[Id: "+this.id+" | Nome: "+this.nome+" | Endereco: "+this.endereco+"]";
    }


    
}
