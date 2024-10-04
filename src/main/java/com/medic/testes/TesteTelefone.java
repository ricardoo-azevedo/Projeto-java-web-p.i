package com.medic.testes;

import com.medic.dao.TelefoneDAO;
import com.medic.interfaces.TelefoneInterface;
import com.medic.model.Telefone;

public class TesteTelefone {
	
	public static void main(String[] args) {
		
		TelefoneInterface iTelefone = new TelefoneDAO();
		Telefone telefone = iTelefone.buscarPaciente(4);
		System.out.println(telefone);
		
	}

}
