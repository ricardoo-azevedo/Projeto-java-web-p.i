package com.medic.model;

import java.time.LocalDate;

public class Agendamento {

	private int id;
	private Paciente paciente;
	private Medico medico;
	private Funcionario funcionario;
	private UnidadeSaude unidadeSaude;
	private LocalDate dataAgendamento;
	private String statusAgendamento;
	private String observacoes;
	
	public Agendamento() {
		
	}
	
	public Agendamento(Paciente paciente, Medico medico, Funcionario funcionario, UnidadeSaude unidadeSaude, LocalDate dataAgendamento,
	String statusAgendamento, String observacoes) {
		this.paciente = paciente;
		this.medico = medico;
		this.funcionario = funcionario;
		this.unidadeSaude = unidadeSaude;
		this.dataAgendamento = dataAgendamento;
		this.statusAgendamento = statusAgendamento;
		this.observacoes = observacoes;
	}
	
	public Agendamento(int id, Paciente paciente, Medico medico, Funcionario funcionario, UnidadeSaude unidadeSaude, LocalDate dataAgendamento,
	String statusAgendamento, String observacoes) {
		this.id = id;
		this.paciente = paciente;
		this.medico = medico;
		this.funcionario = funcionario;
		this.unidadeSaude = unidadeSaude;
		this.dataAgendamento = dataAgendamento;
		this.statusAgendamento = statusAgendamento;
		this.observacoes = observacoes;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
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
	
	public Funcionario getFuncionario() {
		return funcionario;
	}
	
	public void setFuncionario(Funcionario funcionario) {
		this.funcionario = funcionario;
	}
	public UnidadeSaude getUnidadeSaude() {
		return unidadeSaude;
	}
	public void setUnidadeSaude(UnidadeSaude unidadeSaude) {
		this.unidadeSaude = unidadeSaude;
	}
	public LocalDate getDataAgendamento() {
		return dataAgendamento;
	}

	public void setDataAgendamento(LocalDate dataAgendamento) {
		this.dataAgendamento = dataAgendamento;
	}

	public String getStatusAgendamento() {
		return statusAgendamento;
	}

	public void setStatusAgendamento(String statusAgendamento) {
		this.statusAgendamento = statusAgendamento;
	}

	public String getObservacoes() {
		return observacoes;
	}

	public void setObservacoes(String observacoes) {
		this.observacoes = observacoes;
	}

	@Override
	public String toString() {
		return "[ID: "+this.id+" | PACIENTE: "+this.paciente+" | MEDICO: "+this.medico+" | FUNCIONARIO: "+this.funcionario+" | UNIDADESAUDE: "+this.unidadeSaude+" | DATAAGENDAMENTO: "+this.dataAgendamento+" | STATUSAGENDAMENTO: "+this.statusAgendamento+" | OBSERVAÇÕES: "+this.observacoes+"]";
	}
	

}
