package com.medic.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.medic.interfaces.MedicoInterface;
import com.medic.model.Especialidade;
import com.medic.model.Medico;
import com.medic.service.ConnectionFactory;

public class MedicoDAO implements MedicoInterface {

	private Connection connection;
	private ConnectionFactory connectionFactory = new ConnectionFactory();

	public MedicoDAO() {
		try {
			connection = connectionFactory.getConexao();
		} catch (Exception e) {
			System.out.println("[Erro ao retornar Conexão: " + e.getMessage() + "]");
		}
	}

	@Override
	public int inserirMedico(Medico medico) {
		String sql = "INSERT INTO MEDICO (NOME, CRM, IDESPECIALIDADE) VALUES (?, ?, ?)";

		int id = 0;

		try {
			PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, medico.getNome());
			ps.setString(2, medico.getCrm());
			ps.setInt(3, medico.getEspecialidade().getId());
			ps.execute();

			ResultSet idAuto = ps.getGeneratedKeys();

			if (idAuto.next()) {
				id = idAuto.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("[Erro ao inserir Medico: " + e.getMessage() + "]");
		}
		return id;

	}

	@Override
	public Medico consultarMedico(int idMedico) {
		String sql = "SELECT * FROM MEDICO WHERE IDMEDICO = ?";
		Medico medico = null;

		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, idMedico);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("IDMEDICO");
				String nome = rs.getString("NOME");
				String crm = rs.getString("CRM");
				int idEspecialidade = rs.getInt("IDESPECIALIDADE");

				Especialidade especialidade = new EspecialidadeDAO().consultar(idEspecialidade);

				medico = new Medico(id, nome, crm, especialidade);
			}
		} catch (Exception e) {
			System.out.println("[Erro ao consultar Medico: " + e.getMessage() + "]");
		}
		return medico;
	}

	@Override
	public void editarMedico(Medico medico) {
		String sql = "UPDATE MEDICO SET NOME = ?, CRM = ?, IDESPECIALIDADE = ? WHERE IDMEDICO = ?";

		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, medico.getNome());
			ps.setString(2, medico.getCrm());
			ps.setInt(3, medico.getEspecialidade().getId());
			ps.setInt(4, medico.getId());
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println("[Erro ao editar Medico: " + e.getMessage() + "]");
		}
	}

	@Override
	public void excluirMedico(int idMedico) {
		String sql = "DELETE FROM MEDICO WHERE IDMEDICO = ?";

		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, idMedico);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("[Erro ao excluir Medico: " + e.getMessage() + "]");
		}
	}

	@Override
	public List<Medico> listarMedico() {
		List<Medico> medicos = new ArrayList<>();
		String sql = "SELECT * FROM MEDICO";

		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Medico medico = new Medico();
				medico.setId(rs.getInt("idMedico"));
				medico.setNome(rs.getString("NOME"));
				medico.setCrm(rs.getString("CRM"));	
				
				int idEspecialidade = rs.getInt("idEspecialidade");

				Especialidade especialidade = new EspecialidadeDAO().consultar(idEspecialidade);

				medico.setEspecialidade(especialidade);

				medicos.add(medico);

			}

		} catch (Exception e) {
			System.out.println("[Erro: ao listar Medico: " + e.getMessage() + "]");
		}
		return medicos;
	}

}
