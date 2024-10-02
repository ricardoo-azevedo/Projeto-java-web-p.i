package com.medic.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.medic.interfaces.AgendamentoInterface;
import com.medic.model.Agendamento;
import com.medic.model.Medico;
import com.medic.model.Paciente;
import com.medic.service.ConnectionFactory;

public class AgendamentoDAO implements AgendamentoInterface {

    private Connection connection;
    private ConnectionFactory connectionFactory = new ConnectionFactory();

    public AgendamentoDAO(){
        try {
            connection = connectionFactory.getConexao();
        } catch (Exception e) {
            System.out.println("[Erro ao retornar a Conexão: "+e.getMessage()+"]");
        }
    }

    @Override
    public int inserirAgendamento(Agendamento agendamento) {
    	String sql = "INSERT INTO AGENDAMENTO (idPaciente, idMedico, DATA_HORA, statusAgendamento, observacoes) VALUES (?, ?, ?, ?, ?)";
        int id = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, agendamento.getPaciente().getId());
            ps.setInt(2, agendamento.getMedico().getId());
            ps.setTimestamp(3, Timestamp.valueOf(agendamento.getDataHora()));
            ps.setString(4, agendamento.getStatusAgendamento());
            ps.setString(5, agendamento.getObservacoes());
            ps.execute();
            ResultSet idAuto = ps.getGeneratedKeys();
            if(idAuto.next()){
                id = idAuto.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("[Erro ao inserir Agendamento: "+e.getMessage()+"]");
        }
        return id;
    }

    @Override
    public Agendamento consultarAgendamento(int idAgendamento) {
        String sql = "SELECT * FROM AGENDAMENTO WHERE idAgendamento = ?";
        Agendamento agendamento = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, idAgendamento);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                int idPaciente = rs.getInt("IDPACIENTE");
                Paciente paciente = new PacienteDAO().consultar(idPaciente);
                int idMedico = rs.getInt("IDMEDICO");
                Medico medico = new MedicoDAO().consultarMedico(idMedico);
                Timestamp dataHora = rs.getTimestamp("DATA_HORA");
                LocalDateTime localDateTime = dataHora.toLocalDateTime();
                String statusAgendamento = rs.getString("STATUSAGENDAMENTO");
                String observacoes = rs.getString("OBSERVACOES");
                agendamento = new Agendamento(idAgendamento, paciente, medico, localDateTime, statusAgendamento, observacoes);
            }
        } catch (Exception e) {
            System.out.println("[Erro ao consultar Agendamento: "+e.getMessage()+"]");
        }
        return agendamento;
    }

    @Override
    public void editarAgendamento(Agendamento agendamento) {
        String sql = "UPDATE AGENDAMENTO SET IDPACIENTE = ?, IDMEDICO = ?, DATA_HORA = ?, STATUSAGENDAMENTO = ?, OBSERVACOES = ? WHERE IDAGENDAMENTO = ?";
        try {
            PreparedStatement ps  = connection.prepareStatement(sql);
            ps.setInt(1, agendamento.getPaciente().getId());
            ps.setInt(2, agendamento.getMedico().getId());
            ps.setTimestamp(3, Timestamp.valueOf(agendamento.getDataHora()));
            ps.setString(4, agendamento.getStatusAgendamento());
            ps.setString(5, agendamento.getObservacoes());
            ps.setInt(6, agendamento.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("[Erro ao editar Agendamento: "+e.getMessage()+"]");
        }
    }

    @Override
    public void excluirAgendamento(int idAgendamento) {
        String sql = "DELETE FROM AGENDAMENTO WHERE IDAGENDAMENTO = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, idAgendamento);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("[Erro ao excluir Agendamento: "+e.getMessage()+"]");
        }
    }

    @Override
    public List<Agendamento> listarAgendamento() {
        List<Agendamento> agendamentos = new ArrayList<>();
        String sql = "SELECT * FROM AGENDAMENTO";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Agendamento agendamento = new Agendamento();
                agendamento.setId(rs.getInt("IDAGENDAMENTO"));
                int idPaciente = rs.getInt("IDPACIENTE");
                Paciente paciente = new PacienteDAO().consultar(idPaciente);
                agendamento.setPaciente(paciente);
                int idMedico = rs.getInt("IDMEDICO");
                Medico medico = new MedicoDAO().consultarMedico(idMedico);
                agendamento.setMedico(medico);
                Timestamp dataHora = rs.getTimestamp("DATA_HORA");
                LocalDateTime localDateTime = dataHora.toLocalDateTime();
                agendamento.setDataHora(localDateTime);
                agendamento.setStatusAgendamento(rs.getString("STATUSAGENDAMENTO"));
                agendamento.setObservacoes(rs.getString("OBSERVACOES"));
                agendamentos.add(agendamento);
            }
        } catch (Exception e) {
            System.out.println("[Erro ao listar Agendamentos: "+e.getMessage()+"]");
        }
        return agendamentos;
    }
}
