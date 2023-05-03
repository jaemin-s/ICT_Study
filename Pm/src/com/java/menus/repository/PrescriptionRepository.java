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
			
			if(isExistsH(patientId)) {
			System.out.println("\n-------------------------------------------------------------------------------");
			System.out.println(" 처방전번호 |   주민등록번호   | 담당의사 |   처방일자  | 투약일수 | 약 이름 | 주요 성분 | 제조 회사");
			while(rs.next()) {
						System.out.print(
								"    "+rs.getInt("prescription_no")
								+"   | "+rs.getString("patient_id")
								+" | "+rs.getString("doctor_name")
								+" | "+rs.getString("prescription_date").substring(0, 10)
								+" | "+rs.getInt("days_medication")
								+" | "+rs.getString("drug_name")
								+" | "+rs.getString("ingredient")
								+" | "+rs.getString("company_name")+"\n"
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

	private boolean isExistsH(String patientId) {
		boolean flag = false;
		String sql = "SELECT * FROM prescriptions WHERE patient_id = ?";
		try(Connection conn = connection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, patientId);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return flag;
	}

	public void showDrugInfo(String id) {
		String sql = "SELECT drug_name, ingredient FROM "
				+"(SELECT TRUNC(prescription_date+days_medication-sysdate) AS remain,drug_number  "
				+ "FROM prescriptions WHERE patient_id = ?) a "
				 +"JOIN drugs d ON a.drug_number = d.drug_number WHERE remain > 0";
		
		try(Connection conn = connection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(isExistsD(id)) {
				System.out.println("---- 투약중인 약 ----");
				while(rs.next()) {
					System.out.print(rs.getString("drug_name")+" |\t "+rs.getString("ingredient"));
				}
				System.out.println("-------------------");
			} else {
				System.out.println("현재 투약중인 약이 없습니다.\n");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public boolean isExistsD(String id) {
		boolean flag = false;
		String sql = "SELECT drug_name, ingredient FROM "
				+"(SELECT TRUNC(prescription_date+days_medication-sysdate) AS remain,drug_number  "
				+ "FROM prescriptions WHERE patient_id = ?) a "
				 +"JOIN drugs d ON a.drug_number = d.drug_number WHERE remain > 0";
		try(Connection conn = connection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;	
	}
	
}
