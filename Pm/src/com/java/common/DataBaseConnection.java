package com.java.common;

import java.sql.*;

public class DataBaseConnection {

	private DataBaseConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	private static DataBaseConnection connection 
					= new DataBaseConnection();
	
	public static DataBaseConnection getInstance() {
		return connection;
	}
	
	public Connection getConnection() throws SQLException {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String uid = "hr";
		String upw = "hr";
		
		return DriverManager.getConnection(url, uid, upw);
	}
}
