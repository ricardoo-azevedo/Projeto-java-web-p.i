package com.medic.model;

public class Telefone {

	private int id;
	private String numero;
	private Paciente paciente;
	private Medico medico;
	private UnidadeSaude unidadeSaude;
	
	public Telefone() {		
	}

	public Telefone(int id, String numero, Paciente paciente) {
		this.id = id;
		this.numero = numero;
		this.paciente = paciente;
	}

	public Telefone(int id, String numero, Medico medico) {
		this.id = id;
		this.numero = numero;
		this.medico = medico;
	}

	public Telefone(int id, String numero, UnidadeSaude unidadeSaude) {
		this.id = id;
		this.numero = numero;
		this.unidadeSaude = unidadeSaude;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public Paciente getPaciente() {
		return paciente;
	}

	public void setPaciente(Paciente paciente) {
		this.paciente = paciente;
	}

	public Medico getMedico() {
		return medico;
	}

	public void setMedico(Medico medico) {
		this.medico = medico;
	}

	public UnidadeSaude getUnidadeSaude() {
		return unidadeSaude;
	}

	public void setUnidadeSaude(UnidadeSaude unidadeSaude) {
		this.unidadeSaude = unidadeSaude;
	}

	@Override
	public String toString() {
		return "Telefone [id=" + id + ", numero=" + numero + ", paciente=" + paciente + ", medico=" + medico
				+ ", unidadeSaude=" + unidadeSaude + "]";
	}

}
