package com.medic.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

import com.medic.interfaces.FamiliaInterface;
import com.medic.interfaces.PacienteInterface;
import com.medic.model.Familia;
import com.medic.model.Paciente;
import com.medic.service.ConnectionFactory;

public class PacienteDAO implements PacienteInterface {

	private Connection conn;
	private ConnectionFactory cf = new ConnectionFactory();
	private FamiliaInterface iFamilia = new FamiliaDAO();
	
	public PacienteDAO() {
		try {
			conn = cf.getConexao();
		} catch (ClassNotFoundException e) {
            System.err.println(" >>> " + e.getMessage());

		}
	}

	@Override
	public int inserir(Paciente paciente) {
		
	    String sql = "INSERT INTO PACIENTE (NOME, CPF, DATA_NASCIMENTO, IDFAMILIA) VALUES (?,?,?,?);";
	    int id = 0;
	    
	    try {
	    	
	        PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	        ps.setString(1, paciente.getNome());
	        ps.setString(2, paciente.getCpf());
	        ps.setDate(3, paciente.getDataNascimento());
	        ps.setInt(4, paciente.getFamilia().getId());	        
	        ps.execute();
	        
	        ResultSet idAuto = ps.getGeneratedKeys();
	        if (idAuto.next()) {	
	            id = idAuto.getInt(1);
	        }
	        
	    } catch (SQLException e) {
	    	System.err.println(" >>> Erro ao inserir paciente: " + e.getMessage());
	    }
	    return id;
	}


	@Override
	public Paciente consultar(int idPaciente) {
		
		String sql = "SELECT * FROM PACIENTE WHERE IDPACIENTE = ?;";
		Paciente paciente = null;
		
		try {
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, idPaciente);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {				
				idPaciente = rs.getInt("IDPACIENTE");
				String nome = rs.getString("NOME");
				String cpf =  rs.getString("CPF");
				Date dataNascimento = rs.getDate("DATA_NASCIMENTO");
				int idFamilia = rs.getInt("IDFAMILIA");
				Familia familia = iFamilia.consultar(idFamilia);
				paciente = new Paciente(idPaciente, nome, cpf, dataNascimento, familia);
			}
		} catch (SQLException e) {
	        System.err.println(" >>> Erro ao consultar paciente: " + e.getMessage());
		}
		return paciente;
	}

	@Override
	public void editar(Paciente paciente) {
		
        String sql ="UPDATE PACIENTE SET NOME = ?, CPF = ?, DATA_NASCIMENTO = ?, IDFAMILIA = ? WHERE IDPACIENTE = ?;";
        
        try {
        	
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, paciente.getNome());
	        ps.setString(2, paciente.getCpf());
	        ps.setDate(3, paciente.getDataNascimento());
	        ps.setInt(4, paciente.getFamilia().getId());
	        ps.setInt(5, paciente.getId());	        
            ps.executeUpdate();            

        } catch (Exception e) {
            System.out.println("Erro ao editar paciente: "+e.getMessage());
        }
    }

	@Override
	public void excluir(int idPaciente) {
		
		String sql = "DELETE FROM PACIENTE WHERE IDPACIENTE = ?;";
		
		try {
			
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, idPaciente);
            ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println("Erro ao excluir paciente: "+e.getMessage());
        }
	}

	@Override
	public List<Paciente> listar() {
		
		List<Paciente> lista = new ArrayList<>();
        String sql = "SELECT * FROM PACIENTE ORDER BY NOME ASC;";

        try {
        	
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();            

            while(rs.next()){
            	Paciente paciente = new Paciente();   
            	paciente.setId(rs.getInt("idpaciente"));
            	paciente.setNome(rs.getString("nome"));
            	paciente.setCpf(rs.getString("cpf"));
            	paciente.setDataNascimento(rs.getDate("data_nascimento")); 
            	int idFamilia = rs.getInt("idFamilia");
            	Familia familia = iFamilia.consultar(idFamilia);
            	paciente.setFamilia(familia);
            	lista.add(paciente);
            }
            
        } catch (Exception e) {
            System.out.println("Erro ao listar paciente: "+e.getMessage());
        }
        return lista;
	}
	
	@Override
	public List<Paciente> listarPacientesFamilia(int idFamilia) {
		
		List<Paciente> lista = new ArrayList<>();
		String sql = "SELECT * FROM PACIENTE WHERE IDFAMILIA = ? ORDER BY NOME ASC;";
		
		try {
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, idFamilia);
			ResultSet rs = ps.executeQuery();        
						
			while(rs.next()){
				Paciente paciente = new Paciente();   
				paciente.setId(rs.getInt("idpaciente"));
				paciente.setNome(rs.getString("nome"));
				paciente.setCpf(rs.getString("cpf"));
				paciente.setDataNascimento(rs.getDate("data_nascimento")); 
				idFamilia = rs.getInt("idFamilia");
				Familia familia = iFamilia.consultar(idFamilia);
				paciente.setFamilia(familia);
				lista.add(paciente);
			}
			
		} catch (Exception e) {
			System.out.println("Erro ao listar pacientes familia: "+e.getMessage());
		}
		return lista;
	}
	
}
