package com.medic.model;

public class Especialidade {
private int  idEspecialidade;
private String nome;

public Especialidade () {}


public Especialidade(int idEspecialidade, String nome) {
	this.idEspecialidade = idEspecialidade;
	this.nome = nome;
	
}


public int getIdEspecialidade() {
	return idEspecialidade;
}

public void setIdEspecialidade(int idEspecialidade) {
	this.idEspecialidade = idEspecialidade;
}


public String getNome() {
	return nome;
}


public void setNome(String nome) {
	this.nome = nome;
}

public String toString() {
	return "Especialidade{"  +"idEspecialidade = " + idEspecialidade + ", nome = "+ nome + "}"; 
} 
}
