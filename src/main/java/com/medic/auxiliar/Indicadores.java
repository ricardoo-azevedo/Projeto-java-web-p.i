package com.medic.auxiliar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.medic.service.ConnectionFactory;

public class Indicadores {
	
	Connection connection;

	ConnectionFactory connectionFactory = new ConnectionFactory();

	public Indicadores() {
		try {
			connection = connectionFactory.getConexao();
		} catch (ClassNotFoundException e) {
			System.out.println("[Erro ao retornar conexão: " + e.getMessage() + "]");
		}
	}
	
	// INDICADORES
	public int indicador(int opcao) {
		
		String sql = null;
		
		switch(opcao) {
			case 1:{
				sql = "SELECT count(idUnidadeSaude) as 'qtd' FROM unidadesaude";
				break;
			}
			case 2:{
				sql = "SELECT count(idAgendamento) as 'qtd' FROM agendamento;";
				break;
			}
			case 3:{
				sql = "SELECT count(idMedico) as 'qtd' FROM medico;";
				break;
			}
			case 4:{
				sql = "SELECT count(idEspecialidade) as 'qtd' FROM especialidade;";
				break;
			}
			case 5:{
				sql = "SELECT count(idFamilia) as 'qtd' FROM familia;";
				break;
			}
			case 6:{
				sql = "SELECT count(idpaciente) as 'qtd' FROM paciente; ";
				break;
			}
			default:{
				break;
			}
		}
		
		int qtd = 0;
		
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				qtd = rs.getInt("QTD");
			}
			
		} catch (Exception e) {
			System.out.println("Erro nos indicadores: " + e.getMessage());
		}
		return qtd;
	}

}
