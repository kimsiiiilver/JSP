package Common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBConnect {
	public Connection con; // 데이터베이스 접속(연결) 객체
	public Statement stmt; // 정적 쿼리문 사용
	public PreparedStatement psmt; // 동적 쿼리문 사용
	public ResultSet rs; // 쿼리 실행 결과 저장

	public JDBConnect() { // 기본 생성자
		try {
			Class.forName("com.mysql.jdbc.Driver"); // 오라클 드라이버 이름
			// com.mysql.jdbc.Driver mysql 드라이버 이름

			String url = "jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=utf8&useSSL=false"; // 데이터베이스 접속 주소
			String id = "manager"; // 사용자 계정 아이디
			String pwd = "1234"; // 계정 비밀번호
			con = DriverManager.getConnection(url, id, pwd); // 상단 정보로 데이터베이스에 연결

			System.out.println("데이터 베이스 연결 성공 춬하");

		} catch (Exception e) {
			System.out.println("데이터 베이스 연결 오류입니다.");
			e.printStackTrace();   // 오류 출력
		}

	}
	
	public JDBConnect(String driver, String url, String id, String pwd) {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pwd);  // 데이터베이스 접속
			System.out.println("2번째 데이터베이스 연결 성공");
			
		} catch(Exception e) {
			System.out.println("2번째 데이터베이스 연결 오류입니다.");
			e.printStackTrace();
		}
	}
	
	
	
	

	public void close() {            // 순서 중요(만든 순서 거꾸로 닫음)
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(psmt != null) psmt.close();
			if(con != null) con.close();
			System.out.println("자원 해제");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
