package com.medic.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.medic.interfaces.TelefoneInterface;
import com.medic.model.Especialidade;
import com.medic.model.Telefone;
import com.medic.service.ConnectionFactory;

public class TelefoneDAO implements TelefoneInterface{

	private Connection connection;
	private ConnectionFactory connectionFactory = new ConnectionFactory();

	public TelefoneDAO() {
		try {
			connection = connectionFactory.getConexao();
		} catch (Exception e) {
			System.out.println("[Erro ao retornar a conexão: " + e.getMessage() + "]");
		}
	}

	@Override
	public int inserir(Telefone telefone) {
		String sql = "INSERT INTO TELEFONE (NUMERO, IDPACIENTE, IDMEDICO, IDUNIDADESAUDE) VALUES (?, ?, ?, ?)";
		int id = 0;
		try {			
			PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, telefone.getNumero());
			
			if(telefone.getPaciente() == null) {
				ps.setString(2, null);	
			}else {			

				ps.setInt(2, telefone.getPaciente().getId());
			}
			
			if(telefone.getMedico() == null) {
				ps.setString(3, null);	
			}else {				
				ps.setInt(3, telefone.getMedico().getId());
			}
			
			if(telefone.getUnidadeSaude() == null) {
				ps.setString(4, null);	
			}else {				
				ps.setInt(4, telefone.getUnidadeSaude().getId());	
			}
			
			ps.execute();
			
			ResultSet idAuto = ps.getGeneratedKeys();
            if (idAuto.next()) {
                id = idAuto.getInt(1); 
            }
			
		} catch (Exception e) {
			System.out.println("[Erro ao inserir Telefone: " + e.getMessage() + "]");
		}
		return id;
	}

	@Override
	public Telefone consultar(int idTelefone) {
		
		String sql = "SELECT * FROM TELEFONE WHERE IDTELEFONE=?";
		Telefone telefone = null;

		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, idTelefone);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				idTelefone = rs.getInt("IDTELEFONE");
				String numero = rs.getString("NUMERO");
				telefone = new Telefone();
				telefone.setId(idTelefone);
				telefone.setNumero(numero);
				
			}
		} catch (SQLException e) {
			System.err.println(">>> Erro ao consultar telefone: " + e);
		}

		return telefone;
	}

	@Override
	public void editar(Telefone telefone) {

		String sql = "UPDATE TELEFONE SET NUMERO=? WHERE IDTELEFONE=?";

		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, telefone.getNumero());
			ps.setInt(2, telefone.getId());			
			ps.execute();
		} catch (SQLException e) {
			System.err.println(">>> Erro ao editar telefone: " + e);
		}

	}

	@Override
	public void excluir(int idTelefone) {
		
		String sql = "DELETE FROM TELEFONE WHERE IDTELEFONE=?";

		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, idTelefone);						
			ps.execute();
		} catch (SQLException e) {
			System.err.println(">>> Erro ao excluirr telefone: " + e);
		}
		
	}

	@Override
	public List<Telefone> listar() {
		
		String sql = "SELECT * FROM TELEFONE;";
		List<Telefone> lista = new ArrayList<>();

		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int idTelefone = rs.getInt("IDTELEFONE");
				String numero = rs.getString("NUMERO");
				Telefone telefone = new Telefone();
				telefone.setId(idTelefone);
				telefone.setNumero(numero);
				lista.add(telefone);				
			}
		} catch (SQLException e) {
			System.err.println(">>> Erro ao listar telefone: " + e);
		}

		return lista;
	}
	
	@Override
	public Telefone buscarUnidadeSaude(int idUnidadeSaude) {
		
		String sql = "SELECT * FROM TELEFONE WHERE IDUNIDADESAUDE=?";
		Telefone telefone = null;
		
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, idUnidadeSaude);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				int idTelefone = rs.getInt("IDTELEFONE");
				String numero = rs.getString("NUMERO");
				telefone = new Telefone();
				telefone.setId(idTelefone);
				telefone.setNumero(numero);
			}
		} catch (SQLException e) {
			System.err.println(">>> Erro ao consultar telefone: " + e);
		}
		
		return telefone;
	}
	
	@Override
	public Telefone buscarPaciente(int idPaciente) {
		
		String sql = "SELECT * FROM TELEFONE WHERE IDPACIENTE=?";
		Telefone telefone = null;
		
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, idPaciente);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				int idTelefone = rs.getInt("IDTELEFONE");
				String numero = rs.getString("NUMERO");
				telefone = new Telefone();
				telefone.setId(idTelefone);
				telefone.setNumero(numero);
			}
		} catch (SQLException e) {
			System.err.println(">>> Erro ao consultar telefone: " + e);
		}
		
		return telefone;
	}

    @Override
    public Telefone buscarMedico(int idMedico) {
        String sql = "SELECT * FROM TELEFONE WHERE IDMEDICO=?;";
		Telefone telefone = null;
		
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, idMedico);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				int idTelefone = rs.getInt("IDTELEFONE");
				String numero = rs.getString("NUMERO");
				telefone = new Telefone();
				telefone.setId(idTelefone);
				telefone.setNumero(numero);
			}
		} catch (SQLException e) {
			System.err.println(">>> Erro ao consultar telefone: " + e);
		}
		
		return telefone;
    }

}
