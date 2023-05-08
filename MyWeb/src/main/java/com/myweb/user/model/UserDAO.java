package com.myweb.user.model;

import java.sql.*;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

//DAO(Data Access Object)
//웹 프로그램에서 데이터베이스 CRUD작업이 요구될 때마다
//데이터베이스 접속 및 sql문 실행을 전담하는 비즈니스 로직으로 이루어진 객체
//무분별한 객체 생성을 막기 위해 싱글톤 디자인 패턴으로 구축합니다.
public class UserDAO {

	private DataSource ds;

	public UserDAO() {
		try {
			InitialContext ct = new InitialContext();
			ds = (DataSource)ct.lookup("java:comp/env/jdbc/myOracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static UserDAO dao = new UserDAO();

	public static UserDAO getInstance() {
		if(dao == null ) {
			dao = new UserDAO();
		}
		return dao;
	}

	/////////////////////////////////////////////

	//회원 중복 여부 확인
	public boolean confirmId(String id) {
		String sql = "SELECT * FROM my_user WHERE user_id=?";
		boolean result = false; 
		try(Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			result = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		}


		return result;
	}

	public void insertUser(UserVO vo) {
		String sql = "INSERT INTO my_user VALUES(?,?,?,?,?)";
		try(Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, vo.getUserId());
			pstmt.setString(2, vo.getUserPw());
			pstmt.setString(3, vo.getUserName());
			pstmt.setString(4, vo.getUserEmail());
			pstmt.setString(5, vo.getUserAddress());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int userCheck(String id, String pw) {
		int result = -1;
		if(confirmId(id)) {// id 있음
			String sql = "SELECT * FROM my_user WHERE user_id = ?";
			try(Connection conn = ds.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql)){
				pstmt.setString(1, id);
				ResultSet rs = pstmt.executeQuery();
				if(rs.next()) {
					if(rs.getString("user_pw").equals(pw)) {
						result = 1;
					} else {
						result = 0;
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return result;
	}


	public UserVO getUserInfo(String id) {
		UserVO u = new UserVO();
		String sql = "SELECT * FROM my_user WHERE user_id = ?";
		try(Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				u.setUserId(rs.getString("user_id"));
				u.setUserPw(rs.getString("user_pw"));
				u.setUserName(rs.getString("user_name"));
				u.setUserEmail(rs.getString("user_email"));
				u.setUserAddress(rs.getString("user_address"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return u;
	}

	public void changePassword(String userId, String newPw) {
		String sql = "UPDATE my_user SET user_pw = ? WHERE user_id = ?";
		try(Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, newPw);
			pstmt.setString(2, userId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void updateUser(UserVO vo) {
		String sql = "UPDATE my_user SET user_name = ?, user_email = ?, user_address = ? "
				+ "WHERE user_id = ?";
		try(Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, vo.getUserName());
			pstmt.setString(2, vo.getUserEmail());
			pstmt.setString(3, vo.getUserAddress());
			pstmt.setString(4, vo.getUserId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void deleteUser(String id) {
		String sql = "DELETE FROM my_user WHERE user_id = ?";
		try(Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}



}
