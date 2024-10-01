package com.medic.model;

public class Especialidade {
private int  id;
private String nome;

public Especialidade () {}


public Especialidade(int idEspecialidade, String nome) {
	this.id = idEspecialidade;
	this.nome = nome;
	
}


public int getIdEspecialidade() {
	return id;
}

public void setIdEspecialidade(int idEspecialidade) {
	this.id = idEspecialidade;
}


public String getNome() {
	return nome;
}


public void setNome(String nome) {
	this.nome = nome;
}

public String toString() {
	return "Especialidade{"  +"idEspecialidade = " + id + ", nome = "+ nome + "}"; 
} 
}
