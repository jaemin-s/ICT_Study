package com.java.menus.repository;

import java.sql.*;

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
	public void searchDrug(String keyword){
		String sql = "SELECT * FROM drugs WHERE drug_name LIKE "+keyword+"";
		try(Connection conn = connection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			if(rs.next()) {
				System.out.println("---------------------------------------------");
				System.out.println("제품 번호 |    제품 이름    |제품 가격|    제품 성분    | 제조 회사");
				while(rs.next()) {
					System.out.print(
							"    "+rs.getInt("drug_number")
							+"\t| "+rs.getString("drug_name")
							+"\t| "+rs.getInt("drug_price")
							+"\t| "+rs.getString("ingredient")
							+"\t| "+rs.getString("company_name")+"\n"
							);
				}
			}else {
				System.out.println("\n조회결과가 없습니다.");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
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
