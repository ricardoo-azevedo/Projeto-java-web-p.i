package com.medic.model;

import java.time.LocalDateTime;

public class Agendamento {
    
    public Agendamento(){

    }
    
    public Agendamento(int id, Paciente paciente, Medico medico, LocalDateTime dataHora, String statusAgendamento,
            String observacoes) {
        this.id = id;
        this.paciente = paciente;
        this.medico = medico;
        this.dataHora = dataHora;
        this.statusAgendamento = statusAgendamento;
        this.observacoes = observacoes;
    }


    private int id;
    private Paciente paciente;
    private Medico medico;
    LocalDateTime dataHora;
    String statusAgendamento;
    String observacoes;
    
    
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
    public LocalDateTime getDataHora() {
        return dataHora;
    }
    public void setDataHora(LocalDateTime dataHora) {
        this.dataHora = dataHora;
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
        return"[Id: "+this.id+" | Paciente: "+this.paciente+" | Medico: "+this.medico+" | Data e Hora: "+this.dataHora+" | Status Agendamento: "+this.statusAgendamento+" | Obsercações: "+this.observacoes+"]";
    }

}
