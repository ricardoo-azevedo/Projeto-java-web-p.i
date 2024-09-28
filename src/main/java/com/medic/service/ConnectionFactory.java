package com.medic.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

	/*Essas constantes são as configurações de conexão com o bd*/
	
												   /*Coloquem 3306 no de vcs*/
	private static final String URL = "jdbc:mysql://localhost:3307/bdmedic";
	private static final String USER = "root";
	private static final String PASSWORD = "";
	
	/*cria-se um atributo do tipo conexão, que vai precisar ser importado o tipo Connection*/
	private Connection conexao;
	
	/*depois cria um metodo para estabelecer uma nova conexão com o bd */
	/* metodo do tipo de retorno Connection*/
	private Connection novaConexao() throws ClassNotFoundException{

		/*inicia um novo objeto local do tipo Connection com o valor padrão null */
		Connection con = null;

		try {
			/*Vai carregar a classe do driver do mysql jdbc, que vai permitir a conexão com o bd, se o driver não for encontrado, vai lançar uma expection */			
			Class.forName("com.mysql.cj.jdbc.Driver");

			/*faz a variavel receber uma execução de metodo que tenta estabeleçer uma conexão com o bd a partir das informações das constantes declaradas um pouco mais acima*/
			con = DriverManager.getConnection(URL, USER, PASSWORD);

		}catch(SQLException e) {

			/*caso a conexão nao de certo, vvai lançar uma exception */
			System.err.println(">>>>>CF>>>>>> " + e);
		}

		/*e esse metodo vai retornar o objeto do tipo Connection */
		return con;
	}
	

	/*metodo usado para retornar a conexão com o bd */
	public Connection getConexao() throws ClassNotFoundException {
		
		/*se for nullo, chama o metodo de criar uma conexão */
		if(conexao == null) {
			conexao = novaConexao();

			/*caso n]ao seja nulo. tecnicamente ele finalizaria a conexão, mas pelo visto não é uma boa ideia  */
		}else {
			//finalizarConexao();			
		}

		/*retorna o atributo */
		return conexao;
	}
	
	/*metodo de finalizar a conexão, caso não consiga, lança uma exception */
	public void finalizarConexao(){
		try {
			conexao.close();
		}catch(SQLException e) {
			System.err.println(">>>>>CF>>>>>> " + e);
		}
		conexao = null;
	}

}
