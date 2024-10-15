package com.medic.testes;

import com.medic.dao.AgendamentoDAO;
import com.medic.model.Agendamento;

public class TesteAgendamento {
	public static void main(String[] args) {
		AgendamentoDAO dao = new AgendamentoDAO();
		Agendamento agendamento = dao.consultarAgendamento(30);
		agendamento.toString();
	}
}
