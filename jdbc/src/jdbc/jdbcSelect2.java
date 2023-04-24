package jdbc;

import java.util.*;
import java.sql.*;

public class jdbcSelect2 {

	public static void main(String[] args) {
		
		/*
		 사용자에게 Scanner를 이용하여 job_id를 입력받습니다.
		 입력받은 job_id에 해당하는 사람들의 first_name, salary를
		 콘솔창에 출력해주세요. (employees 테이블 사용.)
		 조회된 내용이 없다면 조회 결과가 없다고 출력해주세요.
		 */
		
		Scanner sc = new Scanner(System.in);
		System.out.print("검색할 ID를 입력하세요: ");
		String id = sc.next();
		System.out.println("---------------------------------");
		
		String sql = "SELECT first_name,salary FROM employees WHERE job_id=?";
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String uid = "hr";
		String upw = "hr";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, uid, upw);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			
			rs = pstmt.executeQuery();
			int count = 0;
			while(rs.next()) {
				String name = rs.getString("first_name");
				int salary = rs.getInt("salary");
				count++;
				System.out.printf("이름: %s\n급여: %s\n",name,salary);
				System.out.println("---------------------------------");
				//System.out.printf("이름: %s\n급여: %s\n",rs.getString("first_name"),rs.getInt("salary"));
			}
			if(count==0) {
				System.out.println("조회 결과가 없습니다");
			}else {
				System.out.println("조회한 데이터 행의 수 : "+count);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
				sc.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

}
