package com.java.menus.repository;

import java.sql.*;

import com.java.common.DataBaseConnection;
import com.java.menus.domain.Prescription;

public class PrescriptionRepository {
	
	private DataBaseConnection connection = DataBaseConnection.getInstance();
	
	//처방전 등록
		public void addPrecription(Prescription pc) {
			String sql = "INSERT INTO prescriptions VALUES (prescriptions_seq.NEXTVAL,?,?,?,?,sysdate)";
			
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
	public void searchHistory(String patientId){
		String sql = "SELECT * FROM prescriptions p JOIN drugs d "
				+ "ON p.drug_number = d.drug_number WHERE patient_id = ?";
		
		try(Connection conn = connection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, patientId);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
			System.out.println("\n-------------------------------------------------------------------------------");
			System.out.println(" 처방전번호 |   주민등록번호   | 담당의사 |   처방일자  | 투약일수 | 약 이름 | 주요 성분 | 제조 회사");
			while(rs.next()) {
						System.out.print(
								"    "+rs.getInt("prescription_no")
								+"\t| "+rs.getString("patient_id")
								+"\t| "+rs.getString("doctor_name")
								+"\t| "+rs.getString("prescription_date").substring(0, 10)
								+"\t| "+rs.getInt("days_medication")
								+"\t| "+rs.getString("drug_name")
								+"\t| "+rs.getString("ingredient")
								+"\t| "+rs.getString("company_name")+"\n"
								);
			}
			System.out.println("-------------------------------------------------------------------------------");
			}else {
				System.out.println("\n처방이력이 없습니다");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//end 처방전 조회

		
	
}
