package com.medic.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.medic.interfaces.UnidadeSaudeInterface;
import com.medic.model.Endereco;
import com.medic.model.UnidadeSaude;
import com.medic.service.ConnectionFactory;

public class UnidadeSaudeDAO implements UnidadeSaudeInterface {

	Connection connection;

	ConnectionFactory connectionFactory = new ConnectionFactory();

	public UnidadeSaudeDAO() {
		try {
			connection = connectionFactory.getConexao();
		} catch (ClassNotFoundException e) {
			System.out.println("[Erro ao retornar conexão: " + e.getMessage() + "]");
		}
	}

	@Override
	public int inserir(UnidadeSaude unidadeSaude) {
		String sql = "INSERT INTO UNIDADESAUDE (NOME, IDENDERECO) VALUES (?, ?)";

		int id = 0;

		try {
			PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, unidadeSaude.getNome());
			ps.setInt(2, unidadeSaude.getEndereco().getId());
			ps.execute();

			ResultSet idAuto = ps.getGeneratedKeys();
			if (idAuto.next()) {
				id = idAuto.getInt(1);
			}

		} catch (Exception e) {
			System.out.println("[Erro ao inserir UnidadeSaude: " + e.getMessage() + "]");
		}
		return id;
	}

	@Override
	public UnidadeSaude consultar(int idUnidadeSaude) {
		String sql = "SELECT *  FROM UNIDADESAUDE WHERE idUnidadeSaude = ?";
		UnidadeSaude unidadeSaude = null;

		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, idUnidadeSaude);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				String nome = rs.getString("NOME");
				int idEndereco = rs.getInt("IDENDERECO");

				/*
				 * instancia um objeto do tipo enderecoDAO, em seguida chama o metodo consultar
				 * endereco a partir das informações q idEndereco acima conseguiu nas colunas
				 */
				Endereco endereco = new EnderecoDAO().consultar(idEndereco);

				unidadeSaude = new UnidadeSaude(idUnidadeSaude, nome, endereco);
			}
		} catch (Exception e) {
			System.out.println("[Erro ao consultar UnidadeSAUDE: " + e.getMessage() + "]");
		}
		return unidadeSaude;
	}

	@Override
	public void editar(UnidadeSaude unidadeSaude) {
		String sql = "UPDATE UNIDADESAUDE SET NOME = ?, IDENDERECO = ? WHERE IdUnidadeSaude = ?";

		try {
			PreparedStatement ps = connection.prepareStatement(sql);

			ps.setString(1, unidadeSaude.getNome());
			ps.setInt(2, unidadeSaude.getEndereco().getId());

			ps.setInt(3, unidadeSaude.getId());

			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println("[Erro ao editar UnidadeSaude: " + e.getMessage() + "]");
		}
	}

	@Override
	public void excluir(int idUnidadeSaude) {
		String sql = "DELETE FROM UNIDADESAUDE WHERE IdUnidadeSaude = ?";

		try {

			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, idUnidadeSaude);
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println("[Erro ao excluir UnidadeSaude: " + e.getMessage() + "]");
		}
	}

	@Override
	public List<UnidadeSaude> listar() {
		List<UnidadeSaude> unidadeSaudes = new ArrayList<>();

		String sql = "SELECT * FROM UNIDADESAUDE";

		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				UnidadeSaude unidadeSaude = new UnidadeSaude();

				unidadeSaude.setId(rs.getInt("IdUnidadeSaude"));
				unidadeSaude.setNome(rs.getString("nome"));

				/* cria uma variavel pra recever do campo o IdEndereco */
				int idEndereco = rs.getInt("IdEndereco");

				/*
				 * instancia um objeto do tipo enderecoDAO, em seguida chama o metodo consultar
				 * endereco a partir das informações q idEndereco acima conseguiu nas colunas
				 */
				Endereco endereco = new EnderecoDAO().consultar(idEndereco);

				/* Define o objeto endereco na unidade saude */
				unidadeSaude.setEndereco(endereco);

				unidadeSaudes.add(unidadeSaude);
			}

		} catch (Exception e) {
			System.out.println("[Erro ao listar UnidadeSaude: " + e.getMessage() + "]");
		}
		return unidadeSaudes;
	}

}
