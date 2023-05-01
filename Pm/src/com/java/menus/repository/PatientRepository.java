package com.java.menus.repository;

import java.sql.*;

import com.java.common.DataBaseConnection;
import com.java.menus.domain.Patient;

public class PatientRepository {
	
	private DataBaseConnection connection = DataBaseConnection.getInstance();
	
	public void addPaient(Patient patient) {
		String sql = "INSERT INTO patients VALUES (?,?,?,?)";
		
		try(Connection conn = connection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, patient.getPatientId());
			pstmt.setString(2, patient.getPatientName());
			pstmt.setString(3, patient.getPatientAddress());
			pstmt.setString(4, patient.getPatientPhone());
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
