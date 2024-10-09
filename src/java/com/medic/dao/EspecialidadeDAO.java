package com.medic.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.medic.interfaces.EspecialidadeInterface;
import com.medic.model.Especialidade;
import com.medic.service.ConnectionFactory;

public class EspecialidadeDAO implements EspecialidadeInterface {

	private Connection conn;
	private ConnectionFactory cf = new ConnectionFactory();

	public EspecialidadeDAO() {
		try {
			conn = cf.getConexao();
		} catch (ClassNotFoundException e) {
			System.err.println(">>> " + e);
		}
	}

	@Override
	public void inserir(Especialidade especialidade) {

		String sql = "INSERT INTO ESPECIALIDADE (NOME) VALUES (?);";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, especialidade.getNome());
			ps.execute();
		} catch (SQLException e) {
			System.err.println(">>> Erro ao inserir especialidade: " + e);
		}

	}

	@Override
	public Especialidade consultar(int id) {

		String sql = "SELECT * FROM ESPECIALIDADE WHERE IDESPECIALIDADE=?;";
		Especialidade especialidade = null;

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				id = rs.getInt("IDESPECIALIDADE");
				String nome = rs.getString("NOME");
				especialidade = new Especialidade();
				especialidade.setId(id);
				especialidade.setNome(nome);

			}
		} catch (SQLException e) {
			System.err.println(">>> Erro ao consultar especialidade: " + e);
		}

		return especialidade;
	}

	@Override
	public void editar(Especialidade especialidade) {

		String sql = "UPDATE ESPECIALIDADE SET NOME=? WHERE IDESPECIALIDADE=?;";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, especialidade.getNome());
			ps.setInt(2, especialidade.getId());			
			ps.execute();
		} catch (SQLException e) {
			System.err.println(">>> Erro ao editar especialidade: " + e);
		}

	}

	@Override
	public void excluir(int id) {
		
		String sql = "DELETE FROM ESPECIALIDADE WHERE IDESPECIALIDADE=?;";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);			
			ps.execute();
		} catch (SQLException e) {
			System.err.println(">>> Erro ao excluir especialidade: " + e);
		}

	}

	@Override
	public List<Especialidade> lista(){
		
		String sql = "SELECT * FROM ESPECIALIDADE ORDER BY NOME ASC;";
		List<Especialidade> lista = null;

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			lista = new ArrayList<>();
			while (rs.next()) {
				int id = rs.getInt("IDESPECIALIDADE");
				String nome = rs.getString("NOME");
				Especialidade especialidade = new Especialidade();
				especialidade.setId(id);
				especialidade.setNome(nome);
				lista.add(especialidade);
			}
		} catch (SQLException e) {
			System.err.println(">>> Erro ao listar especialidades: " + e);
		}

		return lista;
	}

}
