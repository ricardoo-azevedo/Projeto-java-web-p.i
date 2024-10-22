package com.medic.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
//mudem o password de vcs 
	
	private static final String URL = "jdbc:mysql://localhost:3306/bdmedic";
	private static final String USER = "root"; 
	private static final String PASSWORD = "";

	
	private Connection conexao;
	
	private Connection novaConexao() throws ClassNotFoundException{
		Connection con = null;
		try {			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(URL, USER, PASSWORD);
		}catch(SQLException e) {
			System.err.println(">>>>>CF>>>>>> " + e);
		}
		return con;
	}
	
	public Connection getConexao() throws ClassNotFoundException {
		if(conexao == null) {
			conexao = novaConexao();
		}else {
			//finalizarConexao();			
		}
		return conexao;
	}
	
	public void finalizarConexao(){
		try {
			conexao.close();
		}catch(SQLException e) {
			System.err.println(">>>>>CF>>>>>> " + e);
		}
		conexao = null;
	}

}
