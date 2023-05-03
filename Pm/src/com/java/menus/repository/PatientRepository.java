package com.java.menus.repository;

import java.sql.*;
import java.util.*;


import com.java.common.DataBaseConnection;
import com.java.menus.domain.Patient;

public class PatientRepository {
	
	private DataBaseConnection connection = DataBaseConnection.getInstance();
	
	//환자 등록
	public void addPatient(Patient patient) {
		
		String sql = "INSERT INTO patients VALUES (?,?,?,?)";
		
		try(Connection conn = connection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, patient.getPatientId());
			pstmt.setString(2, patient.getPatientName());
			pstmt.setString(3, patient.getPatientAddress());
			pstmt.setString(4, patient.getPatientPhone());
			
			
			if(pstmt.executeUpdate() == 1) {
				System.out.println("정상 등록되었습니다.");
			} else {
				System.out.println("등록 실패했습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//end 환자 등록
	
	
	//환자 중복찾기
	public boolean searchDuplicate(String patientId){
		String sql = "SELECT patient_id FROM patients WHERE patient_id = ?";
		boolean flag = false;
		try(Connection conn = connection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, patientId);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return flag;
	}
	
	
	public List<Patient> searchHistory(String patientId){
		List<Patient> pList = new ArrayList<>();
		String sql = "SELECT * FROM patients WHERE patient_id = ?";
		
		try(Connection conn = connection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, patientId);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Patient p = new Patient(
						rs.getString("patient_id"),
						rs.getString("patient_name"),
						rs.getString("patient_address"),
						rs.getString("patient_phone")
						);
				pList.add(p);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pList;
	}//end searchHistory
	
	
}//end class
