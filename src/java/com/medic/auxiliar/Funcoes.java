package com.medic.auxiliar;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Funcoes {
	
	public Date converterDateSQL(String dataString) {
		SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
		java.util.Date dataUtil;
		
		try {
			dataUtil = formato.parse(dataString);
			return new java.sql.Date(dataUtil.getTime());
		}catch (ParseException e) {
			System.out.println(e);
			return null;
		}
	}
	
	/* devido atualização do bootstrap */
	public Date converterDateStringSQL(String dataString) {
		SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date dataUtil;
		
		try {
			dataUtil = formato.parse(dataString);
			return new java.sql.Date(dataUtil.getTime());
		}catch (ParseException e) {
			System.out.println(e);
			return null;
		}
	}
	
	public String dataHoraAtual() {
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		
		return dtf.format(now);
		
	}

}
