package com.medic.testes;

import java.sql.Date;

import com.medic.auxiliar.Funcoes;

public class ExData {
	
	public static void main(String[] args) {
		
		Funcoes f = new Funcoes();
		String data = "30/09/2024";
		Date date = f.converterDateSQL(data);
		System.out.println(date);
		
	}

}