package com.medic.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.medic.interfaces.EspecialidadeInterface;
import com.medic.model.Especialidade;
import com.medic.service.ConnectionFactory;

public class EspecialidadeDAO implements EspecialidadeInterface {
    private ConnectionFactory connectionFactory;

    public EspecialidadeDAO() {
        connectionFactory = new ConnectionFactory();
    }
    /* Especialidade
     * Inserir [OK]
     * consultar [ok]
     * excluir[0k]
     * editar[ok]
     * listar[ok]
     */

    @Override
    public int inserir(Especialidade especialidade) {
		int sorted = 0;
		Connection conn = null;
		PreparedStatement ps = null;

		try {

			conn = connectionFactory.getConexao();
			String sql = "INSERT INTO especialidade(nome) VALUES (?)";
			ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, especialidade.getNome());
			ps.executeUpdate();

			ResultSet random = ps.getGeneratedKeys();
			
			//serve pra fechar resultset
			
			if(!random.isClosed()) {
				
				if (random.next()) {
					sorted = random.getInt(1);
					System.out.println("inseriu");
				
				} else {
				System.out.println("Result set fechado?!");
			}
				
			}
				

			System.out.println("inseriu!!");

		} catch (Exception error) {
			System.out.println("erro ao inserir" + error.getMessage());
		}
		return sorted;

	}

    @Override
    public List<Especialidade> listar() {
        List<Especialidade> especialidades = new ArrayList<>();
    
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
        	
            conn = connectionFactory.getConexao();
            String sql = "SELECT * FROM especialidade;";
             ps = conn.prepareStatement(sql);
  
            ResultSet rs = ps.executeQuery();

          
            while(rs.next()){

             
                Especialidade especialidade = new Especialidade();

              
                especialidade.setIdEspecialidade(rs.getInt("idEspecialidade"));
                especialidade.setNome(rs.getString("nome"));

                especialidades.add(especialidade);

            }
        } catch (Exception e) {
            System.out.println("[Erro ao listar especialidade: "+e.getMessage()+"]");
        }
        return especialidades;
    }



    @Override
    public void excluir(Especialidade especialidade) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = connectionFactory.getConexao();
            String sql = "DELETE FROM especialidade WHERE idEspecialidade = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, especialidade.getIdEspecialidade());
            int meuId = ps.executeUpdate();

            if (meuId > 0) {
                System.out.println("Especialidade excluída!!");
            } else {
                System.out.println("Nenhuma especialidade encontrada.");
            }
        } catch (Exception error) {
            System.out.println("Erro ao excluir: " + error.getMessage());
        } 
    }

    @Override
    public void editar(Especialidade especialidade) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = connectionFactory.getConexao();
            String sql = "UPDATE especialidade SET nome = ? WHERE idEspecialidade = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, especialidade.getNome());
            ps.setInt(2, especialidade.getIdEspecialidade());
            ps.executeUpdate();

            System.out.println("Editado com sucesso!");
        } catch (Exception erro) {
            throw new RuntimeException("Erro ao editar: " + erro.getMessage());
        } 
    }

    @Override
    public Especialidade consultar(int IdEspecialidade) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
    Especialidade especialidade = null;

        try {
            conn = connectionFactory.getConexao();
            String sql = "SELECT * FROM especialidade WHERE idEspecialidade = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, IdEspecialidade);
           rs = ps.executeQuery();   		   

            if (rs.next()) {
                int id = rs.getInt("idEspecialidade");
                String nome = rs.getString("nome");

                especialidade = new Especialidade(id, nome);
            } else {
                especialidade = null;
            }
        } catch (Exception erro) {
            throw new RuntimeException("Erro ao consultar: " + erro.getMessage());
        } 

        return especialidade; 
    }
}
