package com.medic.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import com.medic.interfaces.AgendamentoInterface;
import com.medic.interfaces.FuncionarioInterface;
import com.medic.interfaces.MedicoInterface;
import com.medic.interfaces.PacienteInterface;
import com.medic.interfaces.UnidadeSaudeInterface;
import com.medic.model.Agendamento;
import com.medic.model.Funcionario;
import com.medic.model.Medico;
import com.medic.model.Paciente;
import com.medic.model.UnidadeSaude;
import com.medic.service.ConnectionFactory;

public class AgendamentoDAO implements AgendamentoInterface {

    private Connection connection;
    private ConnectionFactory connectionFactory = new ConnectionFactory();
    private FuncionarioInterface iFuncionario = new FuncionarioDAO();
    private MedicoInterface iMedico = new MedicoDAO();
    private PacienteInterface iPaciente = new PacienteDAO();
    private UnidadeSaudeInterface iUnidadeSaude = new UnidadeSaudeDAO();

    public AgendamentoDAO() {
        try {
            connection = connectionFactory.getConexao();
        } catch (Exception e) {
            System.out.println("[Erro ao retornar a Conexão: " + e.getMessage() + "]");
        }
    }

    @Override
    public int inserirAgendamento(Agendamento agendamento) {
        String sql = "INSERT INTO AGENDAMENTO (idPaciente, idMedico, idFuncionario, idUnidadeSaude, data_agendamento, status_agendamento, observacoes) VALUES (?, ?, ?, ?, ?, ?, ?)";
        int id = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, agendamento.getPaciente().getId());
            ps.setInt(2, agendamento.getMedico().getId());
            ps.setInt(3, agendamento.getFuncionario().getId());
            ps.setInt(4, agendamento.getUnidadeSaude().getId());
            LocalDate localDate = agendamento.getDataAgendamento();
            Date sqlDate = Date.valueOf(localDate);
            ps.setDate(5, sqlDate);
            ps.setString(6, agendamento.getStatusAgendamento());
            ps.setString(7, agendamento.getObservacoes());
            ps.execute();
            System.out.println(ps);
            ResultSet idAuto = ps.getGeneratedKeys();
            if (idAuto.next()) {
                id = idAuto.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("[Erro ao inserir Agendamento: " + e.getMessage() + "]");
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
            if (rs.next()) {
                idAgendamento = rs.getInt("idAgendamento");
                int idPaciente = rs.getInt("IDPACIENTE");
                Paciente paciente = iPaciente.consultar(idPaciente);
                int idMedico = rs.getInt("IDMEDICO");
                Medico medico = iMedico.consultarMedico(idMedico);
                int idFuncionario = rs.getInt("IDFUNCIONARIO");
                Funcionario funcionario = iFuncionario.consultaFuncionario(idFuncionario);
                int idUnidadeSaude = rs.getInt("idUnidadeSaude");
                UnidadeSaude unidadeSaude = iUnidadeSaude.consultar(idUnidadeSaude);
                LocalDate localDate = rs.getDate("data_agendamento").toLocalDate();
                String statusAgendamento = rs.getString("STATUS_AGENDAMENTO");
                String observacoes = rs.getString("OBSERVACOES");
                agendamento = new Agendamento(idAgendamento, paciente, medico, funcionario, unidadeSaude, localDate,
                        statusAgendamento, observacoes);
            }
        } catch (Exception e) {
            System.out.println("[Erro ao consultar Agendamento: " + e.getMessage() + "]");
        }
        return agendamento;
    }

    @Override
    public void editarAgendamento(Agendamento agendamento) {
        String sql = "UPDATE AGENDAMENTO SET idFuncionario = ?, DATA_AGENDAMENTO = ?, STATUS_AGENDAMENTO = ?, OBSERVACOES = ? WHERE IDAGENDAMENTO = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            LocalDate localDate = agendamento.getDataAgendamento();
            Date sqlDate = Date.valueOf(localDate);
            ps.setDate(1, sqlDate);
            ps.setInt(2, agendamento.getFuncionario().getId());
            ps.setString(3, agendamento.getStatusAgendamento());
            ps.setString(4, agendamento.getObservacoes());
            ps.setInt(5, agendamento.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("[Erro ao editar Agendamento: " + e.getMessage() + "]");
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
            System.out.println("[Erro ao excluir Agendamento: " + e.getMessage() + "]");
        }
    }

    @Override
    public List<Agendamento> listarAgendamento() {
        List<Agendamento> lista = new ArrayList<>();
        String sql = "SELECT * FROM AGENDAMENTO WHERE STATUS_AGENDAMENTO = 'CONFIRMADO'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idAgendamento = rs.getInt("IDAGENDAMENTO");
                int idPaciente = rs.getInt("IDPACIENTE");
                Paciente paciente = iPaciente.consultar(idPaciente);
                int idMedico = rs.getInt("IDMEDICO");
                Medico medico = iMedico.consultarMedico(idMedico);
                int idFuncionario = rs.getInt("IDFUNCIONARIO");
                Funcionario funcionario = iFuncionario.consultaFuncionario(idFuncionario);
                int idUnidadeSaude = rs.getInt("idUnidadeSaude");
                UnidadeSaude unidadeSaude = iUnidadeSaude.consultar(idUnidadeSaude);
                LocalDate localDate = rs.getDate("data_agendamento").toLocalDate();
                String statusAgendamento = rs.getString("STATUS_AGENDAMENTO");
                String observacoes = rs.getString("OBSERVACOES");
                Agendamento agendamento = new Agendamento(idAgendamento, paciente, medico, funcionario, unidadeSaude,
                        localDate, statusAgendamento, observacoes);
                lista.add(agendamento);
            }
        } catch (Exception e) {
            System.out.println("[Erro ao listar Agendamentos: " + e.getMessage() + "]");
        }
        return lista;
    }

    @Override
    public boolean verificarAgendamento(int idPaciente, int idMedico, Date dataAgendamento) {
        String sql = "SELECT idAgendamento, idPaciente, idMedico, data_agendamento FROM agendamento WHERE idPaciente = ? AND idMedico = ? AND data_agendamento = ?";
        boolean inserir = true;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, idPaciente);
            ps.setInt(2, idMedico);
            ps.setDate(3, dataAgendamento);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                inserir = false;
            }
        } catch (Exception e) {
            System.out.println("[Erro ao varificar Agendamento: " + e.getMessage() + "]");
        }
        return inserir;
    }
}
