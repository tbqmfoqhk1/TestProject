package com.ootd.project.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ootd.project.vo.Member;

// DB 작업을 전담하는 DAO(Data Access Object) 클래스
public class SearchDao {
	
	private String url;
	private String user;
	private String pass;	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public SearchDao(String dbName) {
		if(dbName.equals("oracle")) {
			this.url = DBConnectionInfo.ORACLE_URL;
			this.user = DBConnectionInfo.ORACLE_USER;
			this.pass = DBConnectionInfo.ORACLE_PASS;
			
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				
			} catch(ClassNotFoundException e) {
				System.out.println(e.getClass().getSimpleName());
				e.printStackTrace();
			}
			
		} else if(dbName.equals("mysql")) {
			this.url = DBConnectionInfo.MYSQL_URL;
			this.user = DBConnectionInfo.MYSQL_USER;
			this.pass = DBConnectionInfo.MYSQL_PASS;
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				
			} catch(ClassNotFoundException e) {
				System.out.println(e.getClass().getSimpleName());
				e.printStackTrace();
			}
		}
	}
	
	// DB에서 id에 해당하는 회원 정보를 읽어오는 메서드
	public ArrayList<Member> getPopularList() {
		ArrayList<Member> popularList = null;
		String query = "SELECT * FROM (SELECT word, COUNT(word) AS count FROM popular GROUP BY word ORDER BY count DESC) WHERE ROWNUM < 11";		
		try {			
			popularList = new ArrayList<Member>();
			conn = DriverManager.getConnection(url, user, pass);
			pstmt = conn.prepareStatement(query);			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Member m = new Member();
				m.setWord(rs.getString("word"));
				
				popularList.add(m);
			}
			return popularList;
		
		} catch(SQLException e) {
			System.out.println(e.getClass().getSimpleName());
			e.printStackTrace();
		} finally {
			
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();				
				if(conn != null) conn.close();
			} catch(SQLException e) {}
		}		
		return popularList;
	}
}
