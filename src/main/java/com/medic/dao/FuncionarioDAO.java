package com.medic.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.medic.interfaces.FuncionarioInterface;
import com.medic.model.Funcionario;
import com.medic.service.ConnectionFactory;

public class FuncionarioDAO implements FuncionarioInterface {

    private Connection connection;
    ConnectionFactory connectionFactory = new ConnectionFactory();

    public FuncionarioDAO() {
        try {
            connection = connectionFactory.getConexao();
        } catch (Exception e) {
            System.out.println("[Erro ao retornar: " + e.getMessage() + "]");
        }
    }

    @Override
    public int inserirFuncionario(Funcionario funcionario) {
        String sql = "Insert into funcionario (nome, senha) values (?, ?)";
        int id = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, funcionario.getNome());
            ps.setString(2, funcionario.getSenha());
            ps.execute();
            ResultSet idAuto = ps.getGeneratedKeys();
            if (idAuto.next()) {
                id = idAuto.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("[Erro ao inserir Funcionario: " + e.getMessage() + "]");
        }
        return id;
    }

    @Override
    public Funcionario consultaFuncionario(int idFuncionario) {
        String sql = "Select * from Funcionario where idFuncionario = ?";
        Funcionario funcionario = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, idFuncionario);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("idFuncionario");
                String nome = rs.getString("Nome");
                String senha = rs.getString("senha");
                funcionario = new Funcionario(id, nome, senha);
            }
        } catch (Exception e) {
            System.out.println("[Erro ao consultar Funcionario: " + e.getMessage() + "]");
        }
        return funcionario;
    }

    @Override
    public void editarFuncionario(Funcionario funcionario) {
        String sql = "Update Funcionario set nome = ?, senha = ? where idFuncionario = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, funcionario.getNome());
            ps.setString(2, funcionario.getSenha());
            ps.setInt(3, funcionario.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("[Erro ao editar Funcionario: " + e.getMessage() + "]");
        }
    }

    @Override
    public void excluirFuncionario(int idFuncionario) {
        String sql = "DELETE from funcionario where idFuncionario = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, idFuncionario);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("[Erro ao Excluir Funcionario: " + e.getMessage() + "]");
        }
    }

    @Override
    public List<Funcionario> listarFuncionario() {
        List<Funcionario> funcionarios = new ArrayList<>();
        String sql = "Select * from Funcionario";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Funcionario funcionario = new Funcionario();
                funcionario.setId(rs.getInt("idFuncionario"));
                funcionario.setNome(rs.getString("Nome"));
                funcionario.setSenha(rs.getString("senha"));
                funcionarios.add(funcionario);
            }
        } catch (Exception e) {
            System.out.println("[Erro ao Listar Funcioanrio: " + e.getMessage() + "]");
        }
        return funcionarios;
    }

    @Override
    public Funcionario autenticacaoFuncionario(int idFuncionario, String senha) {
        String sql = "Select * from Funcionario where idFuncionario = ? and senha = ?";
        Funcionario funcionario = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, idFuncionario);
            ps.setString(2, senha);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("idFuncionario");
                String nome = rs.getString("nome");
                String senhaf = rs.getString("senha");
                funcionario = new Funcionario(id, nome, senhaf);
            }
        } catch (Exception e) {
            System.out.println("[Erro ao autenticar Funcionario: " + e.getMessage() + "]");
        }
        return funcionario;
    }

}