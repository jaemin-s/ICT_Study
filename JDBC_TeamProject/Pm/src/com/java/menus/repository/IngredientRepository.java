package com.java.menus.repository;

import java.sql.*;
import java.util.*;

import com.java.common.DataBaseConnection;
import com.java.menus.domain.*;

public class IngredientRepository {
	
	private DataBaseConnection connection = DataBaseConnection.getInstance();
	//등록
	public void addIngredient(Ingredient ing) {
		String sql = "INSERT INTO ingredients VALUES (?,?)";
		
		try (Connection conn = connection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setInt(1, ing.getDrugNumber());
			pstmt.setString(2, ing.getIngredient());
			if(pstmt.executeUpdate() == 1) {
				System.out.println("등록 성공했습니다");
			} else {
				System.out.println("등록 실패했습니다");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//end addIngre
	
	//수정
	public void updateIngredient(int dNum,String befIngre,String aftIngre) {
		String sql = "UPDATE ingredients SET ingredient=? WHERE drug_number = ? AND ingredient = ?";
		try(Connection conn = connection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, aftIngre);
			pstmt.setInt(2, dNum);
			pstmt.setString(3, befIngre);
			if(pstmt.executeUpdate() == 1) {
				System.out.println("수정되었습니다");
			} else {
				System.out.println("수정에 실패했습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//end updateIngre
		
	//삭제
	public void deleteIngredient(int dNum, String ingre) {
		String sql = "DELETE FROM ingredients WHERE drug_number = ? AND ingredient = ?";
		try(Connection conn = connection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, dNum);
			pstmt.setString(2, ingre);
			if(pstmt.executeUpdate() == 1) {
				System.out.println("삭제되었습니다");
			} else {
				System.out.println("삭제에 실패했습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//조회
	public List<Ingredient> searchIngredient(int dNum) {
		List<Ingredient> iList = new ArrayList<>();
		String sql = "SELECT * FROM ingredient WHERE "+dNum+";";
		try(Connection conn = connection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();) {

			while(rs.next()) {
				Ingredient i = new Ingredient(
						rs.getInt("drug_number"),
						rs.getString("ingredient")
						);
				iList.add(i);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return iList;
	}//end 조회
}
