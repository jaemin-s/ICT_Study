package com.java.menus.repository;

import java.sql.*;
import java.util.*;

import com.java.common.DataBaseConnection;
import com.java.menus.domain.*;

public class DrugRepository {
	
	private DataBaseConnection connection = DataBaseConnection.getInstance();
	
	//약 등록
	public void addDrug(Drug d) {
		String sql = "INSERT INTO drugs (drug_name, drug_price, company_name) "
				+ "VALUES (?,?,?)";
		
		try(Connection conn = connection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, d.getDrugName());
			pstmt.setInt(2, d.getDrugPrice());
			pstmt.setString(3, d.getCompanyName());
			
			if(pstmt.executeUpdate() == 1) {
				System.out.println("정상 등록되었습니다.");
			} else {
				System.out.println("등록 실패했습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//end 약 등록
		
	//약 조회
	public List<Drug> searchDrug(String keyword){
		List<Drug> dList = new ArrayList<>();
		String sql = "SELECT * FROM Precriptions WHERE patient_id = "+keyword;
		
		try(Connection conn = connection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			
			while(rs.next()) {
				Drug d = new Drug(
						rs.getInt("drug_number"),
						rs.getInt("drug_name"),
						rs.getString("drug_price"),
						rs.getString("company_name")
						);
				dList.add(d);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dList;
	}//end 처방전 조회
	
	//수정
	public void updateDrug(String dName, int dPrice, String comName, int dNum) {
		String sql = "UPDATE drugs SET (drug_name = ?, drug_price = ?, company_name = ?) WHERE drug_number = ?";
		
		try(Connection conn = connection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, dName);
			pstmt.setInt(2, dPrice);
			pstmt.setString(3, comName);
			pstmt.setInt(4, dNum);
			
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
