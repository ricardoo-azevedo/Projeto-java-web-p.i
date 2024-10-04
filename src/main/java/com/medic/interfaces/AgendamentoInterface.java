package com.medic.interfaces;

import java.util.List;

import com.medic.model.Agendamento;

public interface AgendamentoInterface {
	
	int inserirAgendamento(Agendamento agendamento);
    Agendamento consultarAgendamento(int idAgendamento);
    void editarAgendamento(Agendamento agendamento);
    void excluirAgendamento(int idAgendamento);
    List<Agendamento> listarAgendamento();

}
