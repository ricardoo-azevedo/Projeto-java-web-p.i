package com.medic.interfaces;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import com.medic.model.Agendamento;

public interface AgendamentoInterface {
	
	int inserirAgendamento(Agendamento agendamento);
    Agendamento consultarAgendamento(int idAgendamento);
    void editarAgendamento(Agendamento agendamento);
    void excluirAgendamento(int idAgendamento);
    List<Agendamento> listarAgendamento();
    boolean verificarAgendamento(int idPaciente, int idMedico, LocalDate dataAgendamento);

}
