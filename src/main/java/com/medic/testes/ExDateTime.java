package com.medic.testes;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.medic.auxiliar.Funcoes;

public class ExDateTime {
	
	public static void main(String[] args) {
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");

		Funcoes f = new Funcoes();
		System.out.println(f.dataHoraAtual());
		
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		System.out.println(ts);
		
		LocalDateTime ldt = LocalDateTime.now();
		System.out.println(ldt);

		System.out.println("Formatado: "+dtf.format(ldt));
		System.out.println("Formatado: "+dtf.format(ts.toLocalDateTime()));
		
	}

}
