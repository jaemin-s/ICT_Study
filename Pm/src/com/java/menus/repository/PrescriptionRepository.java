package com.java.menus.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.java.common.DataBaseConnection;
import com.java.menus.domain.Prescription;

public class PrescriptionRepository {
	
	private DataBaseConnection connection = DataBaseConnection.getInstance();
	
	//처방전 등록
		public void addPrecription(Prescription pc) {
			String sql = "INSERT INTO prescriptions (patient_id, doctor_name, grug_number, days_medication) "
					+ "VALUES (?,?,?,?)";
			
			try(Connection conn = connection.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql)) {
				pstmt.setString(1, pc.getPatientId());
				pstmt.setString(2, pc.getDoctorName());
				pstmt.setInt(3, pc.getDrugNumber());
				pstmt.setInt(4, pc.getDaysMedication());
				
				if(pstmt.executeUpdate() == 1) {
					System.out.println("정상 등록되었습니다.");
				} else {
					System.out.println("등록 실패했습니다.");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}//end 처방전 등록
		
	//처방전 조회
	public List<Prescription> searchHistory(String patientId){
		List<Prescription> pList = new ArrayList<>();
		String sql = "SELECT * FROM Precriptions WHERE patient_id = ?";
		
		try(Connection conn = connection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, patientId);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Prescription pre = new Prescription(
						rs.getInt("prescription_no"),
						rs.getString("patiend_id"),
						rs.getString("doctor_name"),
						rs.getString("prescription_date"),
						rs.getInt("drug_number"),
						rs.getInt("days_medication")
						);
				pList.add(pre);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pList;
	}//end 처방전 조회
		
	
}
