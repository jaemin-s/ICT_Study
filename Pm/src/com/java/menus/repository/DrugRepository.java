package com.java.menus.repository;

import java.sql.*;
import java.util.*;

import com.java.common.DataBaseConnection;
import com.java.menus.domain.*;

public class DrugRepository {
	
	private DataBaseConnection connection = DataBaseConnection.getInstance();
	
	//약 등록
	public void insertDrug(Drug d) {
		String sql = "INSERT INTO drugs VALUES (drugs_seq.NEXTVAL,?,?,?,?)";
		
		try(Connection conn = connection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, d.getDrugName());
			pstmt.setInt(2, d.getDrugPrice());
			pstmt.setString(3, d.getIngredient());
			pstmt.setString(4, d.getCompanyName());
			
			if(pstmt.executeUpdate() == 1) {
				System.out.println("정상 등록되었습니다.");
			} else {
				System.out.println("등록 실패했습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//end 약 등록
		
	//약 이름으로 찾기
	public List<Drug> searchDrug(String keyword){
		List<Drug> dList = new ArrayList<>();
		String sql = "SELECT * FROM drugs WHERE drug_name LIKE "+keyword+"";
		try(Connection conn = connection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			while(rs.next()) {
				Drug d = new Drug(
						rs.getInt("drug_number"),
						rs.getInt("drug_price"),
						rs.getString("company_name"),
						rs.getString("drug_name"),
						rs.getString("ingredient")
						
						);
				dList.add(d);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dList;
	}//end 처방전 조회
	
	//약 번호로 찾기
	public String searchDrugName(int dNum) {
		String dName = "";
		String sql = "SELECT * FROM drugs WHERE patient_id = "+dNum+";";
		try(Connection conn = connection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			
			if(rs.next()) {
				dName = rs.getString("drug_name");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dName;
	}
	
	//수정
	public void updateDrug(int dNum, String col) {
		String sql = "UPDATE drugs SET "+col+" WHERE drug_number = ?";
		try(Connection conn = connection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
				pstmt.setInt(1, dNum);
			
			if(pstmt.executeUpdate() == 1) {
				System.out.println("정상 수정되었습니다.");
			} else {
				System.out.println("수정 실패했습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//end 수정
	
}//end class
