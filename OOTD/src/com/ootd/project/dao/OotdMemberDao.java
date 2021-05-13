package com.ootd.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.ootd.project.vo.OotdMember;

//회원 테이블에 접근하여 요청을 처리하는 DAO(Data Access Object) 클래스
public class OotdMemberDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 회원 로그인을 처리하는 메소드
	
	public int checkMember(String m_id, String m_pass) {
		
		String loginSql = "SELECT m_pass FROM ootd_member WHERE m_id=?";
		// -1 아이디 없음, 0 비밀번호 틀림, 1 로그인 성공
		int result = -1;
		String password = "";
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(loginSql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				password = rs.getString("m_pass");
			} else {
				return result;
			}
			/* 로그인 요청시 입력한 비밀번호와 회원 테이블에서 SELECT한 결과로
			 * 읽어온 비밀번호가 일치하면 1을 반환 하고 일치하지 않으면 0을 반환 한다.
			 **/
			if(password.equals(m_pass)) {
				result = 1;				
			} else {
				result = 0;
			}			
		} catch(Exception e) {				
			e.printStackTrace();			
		} finally {		
			DBManager.close(conn, pstmt, rs);
		}		
		return result;
	}
	
	// 회원 가입을 처리하는 메소드
	public void joinMember(OotdMember ootdmember) {
		
		String joinSql = 
					"INSERT INTO ootd_member VALUES(ootd_member_seq.NEXTVAL, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(joinSql);
			
			pstmt.setString(1, ootdmember.getM_id());
			pstmt.setString(2, ootdmember.getM_name());
			pstmt.setString(3, ootdmember.getM_pass());
			pstmt.setInt(4, ootdmember.getM_phone());
			pstmt.setInt(5, ootdmember.getM_age());
			pstmt.setString(6, ootdmember.getM_gender());
			pstmt.executeUpdate();
			
		} catch(Exception e) {			
			e.printStackTrace();
			
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	// 중복 회원을 체크하는 메소드
	public boolean overlapIdCheck(String m_id) {
		System.out.println("m_id : "+m_id);
		String overlapSql = "SELECT m_id FROM ootd_member Where m_id = ?";	
		boolean result = false;
		
		try{
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(overlapSql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
				result = true;
				System.out.println("result : "+result);
			}			
			System.out.println("overlapIdCheck(String m_id)");
			
		} catch(Exception e) {			
			e.printStackTrace();
			
		} finally{
			DBManager.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	public OotdMember getOotdMember(String m_id) {
		String selectOotdMember = "SELECT * FROM ootd_member WHERE m_id = ?";
		OotdMember ootdmember = null;		
		
		try {
			// DBManager을 이용해 DBCP로 부터 Connection을 대여한다.
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(selectOotdMember);
			
			// loginSql 쿼리의 플레이스홀더(?)에 대응하는 데이터를 설정한다.
			pstmt.setString(1, m_id);
			
			// DB에 쿼리를 전송하여 결과를 ResultSet으로 받는다.
			rs = pstmt.executeQuery();
			
			/* 회원 id는 Primary Key로 중복되지 않기 때문에 회원 테이블에서 SELECT한
			 * 결과가 단일 행으로 반환 되므로 if문을 사용해 rs.next()를 호출했다.
			 * id에 해당하는 회원이 없으면 null이 반환된다.
			 **/
			if(rs.next()) {				
				ootdmember = new OotdMember();
				ootdmember.setM_no(rs.getInt("m_no"));
				ootdmember.setM_id(rs.getString("m_id"));
				ootdmember.setM_name(rs.getString("m_name"));
				ootdmember.setM_pass(rs.getString("m_pass"));
				ootdmember.setM_phone(rs.getInt("m_phone"));
				ootdmember.setM_age(rs.getInt("m_age"));
				ootdmember.setM_gender(rs.getString("m_gender"));
			}
		} catch(Exception e) {				
			e.printStackTrace();
			
		} finally {			
			// DBManager를 이용해 DB 작업에 사용된 자원을 해제 한다.
			DBManager.close(conn, pstmt, rs);
		}		
		return ootdmember;
	}
	
	// 비밀번호 찾기에서 회원확인하는 메소드	
	public boolean PassSearchCheck(String id, String phone) {
		String PassSearchSql = "SELECT m_id FROM ootd_member Where m_id = ? AND m_phone = ?";	
		boolean result = false;
		
		try{
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(PassSearchSql);
			pstmt.setString(1, id);
			pstmt.setString(2, phone);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = true;
			}			
			
		} catch(Exception e) {			
			e.printStackTrace();
			
		} finally{
			DBManager.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	// 비밀번호 찾기에서 회원 비밀번호 변경하는 메소드	
	public void PassSearchCheckUpdate(String id, String pass) {
		
		String passChkUpdate = "UPDATE ootd_member set m_pass=? WHERE m_id=?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(passChkUpdate);
			pstmt.setString(1, pass);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			System.out.println("업데이트완료");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("오류?");
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	
	public void updateOotdMember(OotdMember ootdmember, String id) {
		
		String joinSql = "UPDATE ootd_member SET m_name=?, m_pass=?, m_phone=?,"
				+ " m_age=?, m_gender=? WHERE m_id = ?";
		
		try {
			// DBManager을 이용해 DBCP로 부터 Connection을 대여한다.
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(joinSql);
			
			// joinSql 쿼리의 플레이스홀더(?)에 대응하는 데이터를 설정한다.			
			pstmt.setString(1, ootdmember.getM_name());
			pstmt.setString(2, ootdmember.getM_pass());
			pstmt.setInt(3, ootdmember.getM_phone());
			pstmt.setInt(4, ootdmember.getM_age());
			pstmt.setString(5, ootdmember.getM_gender());
			pstmt.setString(6, id);
			// DB에 쿼리를 전송하여 회원 가입을 완료한다.
			pstmt.executeUpdate();
			
		} catch(Exception e) {			
			e.printStackTrace();
			
		} finally {
			
			// DBManager를 이용해 DB 작업에 사용된 자원을 해제 한다.
			DBManager.close(conn, pstmt);
		}
	}
	// 회원 탈퇴를 처리하는 메소드
public void deleteMember(String m_id) {
		
		String deleteSql = "DELETE FROM ootd_member WHERE m_id=?"; 
		
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(deleteSql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
					
		} catch(Exception e) {				
			e.printStackTrace();			
		} finally {		
			DBManager.close(conn, pstmt, rs);
		}		
		
	}
}
