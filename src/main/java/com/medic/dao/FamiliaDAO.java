package com.medic.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.medic.interfaces.EnderecoInterface;
import com.medic.interfaces.FamiliaInterface;
import com.medic.model.Endereco;
import com.medic.model.Familia;
import com.medic.service.ConnectionFactory;

public class FamiliaDAO implements FamiliaInterface {

	private Connection conn;
	private ConnectionFactory cf = new ConnectionFactory();
	private EnderecoInterface iEndereco = new EnderecoDAO();

	public FamiliaDAO() {
		try {
			conn = cf.getConexao();
		} catch (ClassNotFoundException e) {
			System.err.println(" >>> " + e.getMessage());

		}
	}

	@Override
	public int inserir(Familia familia) {
		
		String sql = "INSERT INTO FAMILIA (IDENDERECO) VALUES (?);";
		int id = 0;

		try {
			PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, familia.getEndereco().getId());
			ps.execute();
			
			ResultSet idAuto = ps.getGeneratedKeys();

			if (idAuto.next()) {
				id = idAuto.getInt(1);
			}
			
		} catch (SQLException e) {
			System.err.println(">>> Erro ao inserir familia: " + e);
		}
		return id;
	}
	
	@Override
	public Familia consultar(int id) {
		
		String sql = "SELECT *  FROM FAMILIA WHERE IDFAMILIA = ?";
		Familia familia = null;

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				int idEndereco = rs.getInt("IDENDERECO");
				Endereco endereco = iEndereco.consultar(idEndereco);
				familia = new Familia(id, endereco);
			}
			
		} catch (SQLException e) {
			System.err.println(">>> Erro ao consultar familia: " + e);
		}
		return familia;
	}
	
	@Override
	public void editar(Familia familia) {
		String sql = "UPDATE FAMILIA SET IDENDERECO = ? WHERE IDFAMILIA = ?;";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, familia.getEndereco().getId());
			ps.setInt(2, familia.getId());
			ps.executeUpdate();
		} catch (SQLException e) {
			System.err.println(">>> Erro ao editar familia: " + e);
		}

	}

	@Override
	public void excluir(int id) {
		String sql = "DELETE FROM FAMILIA WHERE IDFAMILIA = ?;";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			System.err.println(">>> Erro ao excluir familia: " + e);
		}
	}

	@Override
	public List<Familia> listar() {
		List<Familia> lista = new ArrayList<>();

		String sql = "SELECT * FROM FAMILIA ORDER BY IDFAMILIA ASC;";

		try {
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Familia familia = new Familia();
				familia.setId(rs.getInt("IDFAMILIA"));
				int idEndereco = rs.getInt("IDENDERECO");
				Endereco endereco = iEndereco.consultar(idEndereco);
				familia.setEndereco(endereco);
				lista.add(familia);
			}
			
		} catch (SQLException e) {
			System.err.println(">>> Erro ao listar familia: " + e);
		}
		return lista;
	}
	
	@Override
	public List<Familia> listarFamiliaPaciente() {
		List<Familia> lista = new ArrayList<>();
		
		String sql = "SELECT DISTINCT F.* FROM PACIENTE P JOIN FAMILIA F ON F.IDFAMILIA = P.IDFAMILIA ORDER BY F.IDFAMILIA;";
		
		try {
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				Familia familia = new Familia();
				familia.setId(rs.getInt("IDFAMILIA"));
				int idEndereco = rs.getInt("IDENDERECO");
				Endereco endereco = iEndereco.consultar(idEndereco);
				familia.setEndereco(endereco);
				lista.add(familia);
			}
			
		} catch (SQLException e) {
			System.err.println(">>> Erro ao listar familia: " + e);
		}
		return lista;
	}

}
