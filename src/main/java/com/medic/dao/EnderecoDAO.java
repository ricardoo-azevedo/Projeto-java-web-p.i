package com.medic.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.medic.interfaces.EnderecoInterface;
import com.medic.model.Endereco;
import com.medic.service.ConnectionFactory;

public class EnderecoDAO implements EnderecoInterface{


    Connection connection;

    ConnectionFactory connectionFactory = new ConnectionFactory();



    public EnderecoDAO(){
        try {
            connection = connectionFactory.getConexao();
        } catch (Exception e) {
            System.out.println("[Erro ao retornar a conexão: "+e.getMessage()+"]");
        }
    }



    @Override
    public void inserirEndereco(Endereco endereco) {
        String sql = "INSERT INTO ENDERECO (logradouro, numero, complemento, bairro, cidade, uf, cep) VALUES (?, ?, ?, ?, ?, ?, ?)";

        if (connection == null) {
            System.out.println("[Erro] A conexão é null.");
            return; // Ou lance uma exceção
        }

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            /*quando é pra inserir, tem q retornar o dado do objeto*/
            ps.setString(1, endereco.getLogradouro());
            ps.setString(2, endereco.getNumero());
            ps.setString(3, endereco.getComplemento());
            ps.setString(4, endereco.getBairro());
            ps.setString(5, endereco.getCidade());
            ps.setString(6, endereco.getUf());
            ps.setString(7, endereco.getCep());
            ps.execute();
        }catch (Exception e) {
            System.out.println("[Erro ao inserir Endereço: "+e.getMessage()+"]");
        }
    }



    @Override
    public Endereco consultarEndereco(int idEndereco) {
        String sql ="SELECT * FROM ENDERECO WHERE idEndereco = ?";
        Endereco endereco = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1,idEndereco);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                /*quando é pra retornar, é pra colocar o nome da coluna, a partir de uma variavel do tipo q vai receber, sendo ela recebendo um objeto rs logo criado acima, junto com o get do tipo que vai retornar o dado da coluna q foi especificada entre aspas
                 */
                int id = rs.getInt("idEndereco");
                String logradouro = rs.getString("logradouro");
                String numero = rs.getString("numero");
                String complemento = rs.getString("complemento");
                String bairro = rs.getString("complemento");
                String cidade = rs.getString("cidade");
                String uf = rs.getString("uf");
                String cep = rs.getString("cep");
                endereco = new Endereco(id, logradouro, numero, complemento, bairro, cidade, uf, cep);
            }
        } catch (Exception e) {
            System.out.println("[Erro ao consultar Endereço: "+e.getMessage()+"]");
        }
        return endereco;
        
    }

    @Override
    public void editarEndereco(Endereco endereco) {
        String sql ="UPDATE ENDERECO SET LOGRADOURO = ?, NUMERO = ?, COMPLEMENTO = ?, BAIRRO = ?, CIDADE = ?, UF = ?, CEP = ? WHERE idEndereco = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, endereco.getLogradouro());
            ps.setString(2, endereco.getNumero());
            ps.setString(3, endereco.getComplemento());
            ps.setString(4, endereco.getBairro());
            ps.setString(5, endereco.getCidade());
            ps.setString(6, endereco.getUf());
            ps.setString(7, endereco.getCep());

            ps.setInt(8, endereco.getIdEndereco());

            ps.executeUpdate();


        } catch (Exception e) {
            System.out.println("[Erro ao editar Endereço: "+e.getMessage()+"]");
        }
    }

    @Override
    public void excluirEndereco(int idEndereco) {
        String sql = "DELETE FROM ENDERECO WHERE idEndereco = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, idEndereco);

            ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println("[Erro ao excluir endereco: "+e.getMessage()+"]");
        }
    }

    @Override
    public List<Endereco> listarEndereco() {
        List<Endereco> enderecos = new ArrayList<>();
        String sql = "SELECT * FROM ENDERECO;";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            

            while(rs.next()){
            	Endereco endereco = new Endereco();
            	
                endereco.setIdEndereco(rs.getInt("IdEndereco"));
                endereco.setLogradouro(rs.getString("logradouro"));
                endereco.setNumero(rs.getString("numero"));
                endereco.setComplemento(rs.getString("complemento"));
                endereco.setBairro(rs.getString("bairro"));
                endereco.setCidade(rs.getString("cidade"));
                endereco.setUf(rs.getString("uf"));
                endereco.setCep(rs.getString("cep"));

                enderecos.add(endereco);
            }
        } catch (Exception e) {
            System.out.println("[Erro ao listar Endereços: "+e.getMessage()+"]");
        }
        return enderecos;
    }

}
