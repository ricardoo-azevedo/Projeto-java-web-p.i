package com.medic.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.medic.interfaces.AgendamentoInterface;
import com.medic.interfaces.FuncionarioInterface;
import com.medic.interfaces.MedicoInterface;
import com.medic.interfaces.PacienteInterface;
import com.medic.model.Agendamento;
import com.medic.model.Funcionario;
import com.medic.model.Medico;
import com.medic.model.Paciente;
import com.medic.service.ConnectionFactory;

public class AgendamentoDAO implements AgendamentoInterface {

    private Connection connection;
    private ConnectionFactory connectionFactory = new ConnectionFactory();
    private FuncionarioInterface iFuncionario = new FuncionarioDAO();
    private MedicoInterface iMedico = new MedicoDAO();
    private PacienteInterface iPaciente = new PacienteDAO();
    
    
    public AgendamentoDAO(){
        try {
            connection = connectionFactory.getConexao();
        } catch (Exception e) {
            System.out.println("[Erro ao retornar a Conexão: "+e.getMessage()+"]");
        }
    }

    @Override
    public int inserirAgendamento(Agendamento agendamento) {
    	String sql = "INSERT INTO AGENDAMENTO (idPaciente, idMedico, idFuncionario, data_agendamento, status_agendamento, observacoes) VALUES (?, ?, ?, ?, ?, ?)";
        int id = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, agendamento.getPaciente().getId());
            ps.setInt(2, agendamento.getMedico().getId());
            ps.setInt(3, agendamento.getFuncionario().getId());
            LocalDate localDate = agendamento.getDataAgendamento();
            Date sqlDate = Date.valueOf(localDate);
            ps.setDate(4, sqlDate);
            ps.setString(5, agendamento.getStatusAgendamento());
            ps.setString(6, agendamento.getObservacoes());
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
            	idAgendamento = rs.getInt(idAgendamento);
                int idPaciente = rs.getInt("IDPACIENTE");
                Paciente paciente = iPaciente.consultar(idPaciente);
                int idMedico = rs.getInt("IDMEDICO");
                Medico medico = iMedico.consultarMedico(idMedico);
                int idFuncionario = rs.getInt("IDFUNCIONARIO");
                Funcionario funcionario = iFuncionario.consultaFuncionario(idFuncionario);
                LocalDate localDate = rs.getDate("data_agendamento").toLocalDate();
                String statusAgendamento = rs.getString("STATUS_AGENDAMENTO");
                String observacoes = rs.getString("OBSERVACOES");
                agendamento = new Agendamento(idAgendamento, paciente, medico, funcionario, localDate, statusAgendamento, observacoes);
            }
        } catch (Exception e) {
            System.out.println("[Erro ao consultar Agendamento: "+e.getMessage()+"]");
        }
        return agendamento;
    }

    @Override
    public void editarAgendamento(Agendamento agendamento) {
        String sql = "UPDATE AGENDAMENTO SET IDPACIENTE = ?, IDMEDICO = ?, DATA_HORA = ?, STATUS_AGENDAMENTO = ?, OBSERVACOES = ? WHERE IDAGENDAMENTO = ?";
        try {
            PreparedStatement ps  = connection.prepareStatement(sql);
            ps.setInt(1, agendamento.getPaciente().getId());
            ps.setInt(2, agendamento.getMedico().getId());
            LocalDate localDate = agendamento.getDataAgendamento();
            Date sqlDate = Date.valueOf(localDate);
            ps.setDate(3, sqlDate);
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
        List<Agendamento> lista = new ArrayList<>();
        String sql = "SELECT * FROM AGENDAMENTO WHERE STATUS_AGENDAMENTO = 'CONFIRMADO'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            	int idAgendamento = rs.getInt("IDAGENDAMENTO");
            	int idPaciente = rs.getInt("IDPACIENTE");
                Paciente paciente = iPaciente.consultar(idPaciente);
                int idMedico = rs.getInt("IDMEDICO");
                Medico medico = iMedico.consultarMedico(idMedico);
                int idFuncionario = rs.getInt("IDFUNCIONARIO");
                Funcionario funcionario = iFuncionario.consultaFuncionario(idFuncionario);
                LocalDate localDate = rs.getDate("data_agendamento").toLocalDate();
                String statusAgendamento = rs.getString("STATUS_AGENDAMENTO");
                String observacoes = rs.getString("OBSERVACOES");
                Agendamento agendamento = new Agendamento(idAgendamento, paciente, medico, funcionario, localDate, statusAgendamento, observacoes);
                lista.add(agendamento);
            }
        } catch (Exception e) {
            System.out.println("[Erro ao listar Agendamentos: "+e.getMessage()+"]");
        }
        return lista;
    }
    
    

	
}
