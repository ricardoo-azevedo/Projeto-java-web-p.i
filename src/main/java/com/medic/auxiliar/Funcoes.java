package com.medic.auxiliar;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

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

}