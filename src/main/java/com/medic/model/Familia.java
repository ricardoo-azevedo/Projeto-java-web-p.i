package com.medic.model;

public class Familia {

	private int id;
	private Endereco endereco;

	public Familia() {
	}

	public Familia(Endereco endereco) {
		this.endereco = endereco;
	}

	public Familia(int id, Endereco endereco) {
		this.id = id;
		this.endereco = endereco;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}
}
