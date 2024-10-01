package com.medic.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.medic.interfaces.FamiliaInterface;
import com.medic.interfaces.PacienteInterface;
import com.medic.model.Familia;
import com.medic.model.Paciente;
import com.medic.service.ConnectionFactory;

public class PacienteDAO implements PacienteInterface{
	private Connection conn;
	private ConnectionFactory cf = new ConnectionFactory();
	private FamiliaInterface iFamilia = new FamiliaDAO();
	
	public PacienteDAO() {
		try {
			conn = cf.getConexao();
		} catch (ClassNotFoundException e) {
            System.err.println(" >>>>>>>>>> " + e.getMessage());

		}
	}

	@Override
	public int inserir(Paciente paciente) {
		String sql = "INSERT INTO PACIENTE (NOME, CPF, data_nascimento, idFamilia) VALUES (?,?,?,?)";
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
	            id = idAuto.getInt(1); // Obtem o id gerado automaticamente
	        }
	        
	    } catch (SQLException e) {
	        System.err.println(" >>>>>>>>>> " + e.getMessage());
	    }
	    return id;
	}

	@Override
	public Paciente consultar(int id) {
		String sql = "SELECT *FROM  PACIENTE WHERE idpaciente = ?";
		Paciente paciente = null;
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				int idPaciente = rs.getInt("idpaciente");
				String nome = rs.getString("nome");
				String cpf =  rs.getString("cpf");
				Date dataNascimento = rs.getDate("data_nascimento");
				int idFamilia = rs.getInt("idFamilia");
				Familia familia = iFamilia.consultar(idFamilia);
				paciente = new Paciente(idPaciente, nome, cpf, dataNascimento, familia);
				
				
			}
		} catch (SQLException e) {
	        System.err.println(" >>>>>>>>>> " + e.getMessage());
		}
		return paciente;
	}

	@Override
	public void editar(Paciente paciente) {
		String sql ="UPDATE PACIENTE SET NOME = ?, CPF = ?, data_nascimento = ?, idFamilia = ? WHERE idpaciente = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, paciente.getNome());
	        ps.setString(2, paciente.getCpf());
	        ps.setDate(3, paciente.getDataNascimento());
	        ps.setInt(4, paciente.getFamilia().getId());
	        ps.setInt(5, paciente.getId());
	        
            ps.executeUpdate();


        } catch (Exception e) {
            System.out.println("[Erro ao editar Endereço: "+e.getMessage()+"]");
        }		
	}

	@Override
	public void excluir(int id) {
		String sql = "DELETE FROM PACIENTE WHERE idpaciente = ?";
		try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println("[Erro ao excluir endereco: "+e.getMessage()+"]");
        }		
	}

	@Override
	public List<Paciente> listar() {
		List<Paciente> pacientes = new ArrayList<>();
        String sql = "SELECT * FROM PACIENTE;";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            

            while(rs.next()){
            	Paciente paciente = new Paciente();
            	
            	paciente.setNome(rs.getString("nome"));
            	paciente.setCpf(rs.getString("cpf"));
            	paciente.setDataNascimento(rs.getDate("data_nascimento")); 
            	int idFamilia = rs.getInt("idFamilia");
				Familia familia = iFamilia.consultar(idFamilia);
            	paciente.setFamilia(familia);
            	pacientes.add(paciente);
            }
        } catch (Exception e) {
            System.out.println("[Erro ao listar Endereços: "+e.getMessage()+"]");
        }
        return pacientes;
	}
	
}
