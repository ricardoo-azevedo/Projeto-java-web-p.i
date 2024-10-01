package com.medic.model;

public class Medico {

    
    public Medico(int id, String nome, String crm, Especialidade Especialidade) {
        this.id = id;
        this.nome = nome;
        this.crm = crm;
        this.Especialidade = Especialidade;
    }

    public Medico(){

    }
    private int id;
    private String nome;
    private String crm;
    private Especialidade Especialidade;

    
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
    public String getCrm() {
        return crm;
    }
    public void setCrm(String crm) {
        this.crm = crm;
    }
    public Especialidade getEspecialidade() {
        return Especialidade;
    }
    public void setEspecialidade(Especialidade Especialidade) {
        this.Especialidade = Especialidade;
    }

    @Override
    public String toString() {
        return "[Id: "+this.id+" | Nome: "+this.nome+" | Crm: "+this.crm+" | Especialidade: "+this.Especialidade+"]";
    }

}
