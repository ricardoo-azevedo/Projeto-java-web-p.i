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
	private EnderecoInterface iEendereco = new EnderecoDAO();
	
	public FamiliaDAO(){
		try {
			conn = cf.getConexao();
		} catch (ClassNotFoundException e) {
            System.err.println(" >>>>>>>>>> " + e.getMessage());

		}
	}
	
	@Override
	public int inserir(Familia familia) {
String sql = "INSERT INTO FAMILIA (IDENDERECO) VALUES (?)";
		
		int id = 0;
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, familia.getEndereco().getIdEndereco());
			ps.execute();
			ResultSet idAuto = ps.getGeneratedKeys();
			
            if (idAuto.next()) {
                id = idAuto.getInt(1); 
                // Atribui o valor da chave gerada à variável id
            }
		} catch (SQLException e) {
            System.err.println(" >>>>>>>>>> " + e.getMessage());
		}
		return id;
	}

	@Override
	public Familia consultar(int id) {
		String sql = "SELECT *  FROM FAMILIA WHERE idFamilia = (?)";
		Familia familia = null;
		
		try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
            	int idEndereco = rs.getInt("idEndereco");
            	
            	Endereco endereco = iEendereco.consultarEndereco(idEndereco);
            	
            	familia = new Familia(id, endereco);

			}
		} catch (SQLException e) {
            System.err.println(" >>>>>>>>>> " + e.getMessage());
		}
		return familia;
	}

	@Override
	public void editar(Familia familia) {
		String sql = "UPDATE FAMILIA set idEndereco = ? WHERE idFamilia = ?";
		 try {
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, familia.getEndereco().getIdEndereco());
			ps.setInt(2, familia.getId());
			
			ps.executeUpdate();
			
		} catch (SQLException e) {
           System.err.println(" >>>>>>>>>> " + e.getMessage());
		}
		
	}

	@Override
	public void excluir(int id) {
		String sql = "DELETE FROM FAMILIA WHERE idFamilia = ?";	
		try {
			PreparedStatement ps =conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
            System.err.println(" >>>>>>>>>> " + e.getMessage());
		}		
	}

	@Override
	public List<Familia> listar() {
		List<Familia> familias = new ArrayList<>();
		
		String sql = "SELECT * FROM FAMILIA";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
            	Familia familia = new Familia();
            	familia.setId(rs.getInt("idFamilia"));
            	int idEndereco = rs.getInt("IdEndereco");
            	Endereco endereco = iEendereco.consultarEndereco(idEndereco);
            	familia.setEndereco(endereco);
            	familias.add(familia);
				
			}
		} catch (SQLException e) {
            System.err.println(" >>>>>>>>>> " + e.getMessage());
		}
		return familias;
	}

}
