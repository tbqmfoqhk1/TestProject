package com.ootd.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.sql.DataSource;

import com.ootd.project.vo.Board;
import com.ootd.project.vo.Bookmark;
import com.ootd.project.vo.Reply;
import com.ootd.project.dao.DBManager;

//DB 작업을 전담하는 DAO(Data Access Object) 클래스
public class BoardDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private static DataSource ds;
	
	
	public Board getBoard(int list_no) {
		
		Board board = null;
		String sqlBoard = "SELECT * FROM ootdlist WHERE list_no=?" ;
		
		try {
			conn = DBManager.getConnection();
			
			
			pstmt = conn.prepareStatement(sqlBoard);
			
			pstmt.setInt(1, list_no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new Board();
				board.setList_no(rs.getInt("list_no"));
				board.setM_id(rs.getString("m_id"));
				board.setM_age(rs.getInt("m_age"));
				board.setList_reg_date(rs.getTimestamp("list_reg_date"));							
				board.setList_weather(rs.getString("list_weather"));
				board.setList_temp(rs.getString("list_temp"));
				board.setList_img(rs.getString("list_img"));
				board.setList_content(rs.getString("list_content"));
				board.setList_hash(rs.getString("list_hash"));
				board.setList_thanks(rs.getInt("list_thanks"));
		}	
	}	catch(SQLException e) {
		System.out.println("BoardDao - getBoard-SQLException");
		e.printStackTrace();
	} catch(Exception e) {
		System.out.println("BoardDao - getBoard()-Exception");
		e.printStackTrace();
	} finally {
		
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			
		} catch(SQLException e) { 
			e.printStackTrace();
		}
	}
		
		return board;
	}
	
	
	public int getBoardCount() {
		
		String sqlCount = "SELECT COUNT(*) FROM ootdlist";
		int count = 0;
		
		try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sqlCount);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					count = rs.getInt(1);
				}
		} catch(Exception e) {
			e.printStackTrace();
			
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				} catch(SQLException se) {}
			}
			return count;
		}
	

	public int getBoardCount(String keyword,  int num) {
		System.out.println( " - " + keyword);	
		String sqlCount ="";
		if(num==0) {
			sqlCount = "SELECT COUNT(*) FROM ootdlist "
					+ "WHERE list_content LIKE '%' || ? || '%'";
		}else {
			sqlCount = "SELECT COUNT(*) FROM ootdlist "
					+ "WHERE list_hash LIKE '%' || ? || '%'";
		}
		int count = 0;
		
		try{			
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sqlCount);
			pstmt.setString(1,  keyword);			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}			
		} catch(Exception e) {			
			e.printStackTrace();
		} finally {			
			DBManager.close(conn, pstmt, rs);
		}
		return count;
	}
	

	public ArrayList<Board> boardList(int startRow, int endRow) {
		String sqlBoardList = "SELECT * FROM (SELECT ROWNUM num,"
				+ " list_no, m_id, m_age, list_reg_date, list_weather, list_temp , list_img, list_content,"
				+ " list_hash, list_thanks FROM"
				+ " (SELECT * FROM ootdlist ORDER BY list_no DESC)) "
				+ " WHERE num >= ? AND num <= ?";
		
		ArrayList<Board> boardList = null;
		
		try{			
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sqlBoardList);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				boardList = new ArrayList<Board>();
				
				do {					
					Board board = new Board();
					board.setList_no(rs.getInt("list_no"));
					board.setM_id(rs.getString("m_id"));
					board.setM_age(rs.getInt("m_age"));
					board.setList_reg_date(rs.getTimestamp("list_reg_date"));							
					board.setList_weather(rs.getString("list_weather"));
					board.setList_temp(rs.getString("list_temp"));
					board.setList_img(rs.getString("list_img"));
					board.setList_content(rs.getString("list_content"));
					board.setList_hash(rs.getString("list_hash"));
					board.setList_thanks(rs.getInt("list_thanks"));
					boardList.add(board);

				} while(rs.next());
			}
		} catch(Exception e) {			
			e.printStackTrace();
			
		} finally {			
			DBManager.close(conn, pstmt, rs);
		}

		System.out.println(boardList);
		return boardList;
	}
	
	public ArrayList<Board> searchList(
		 String keyword, int startRow, int endRow, int num) {
		String sqlSearchList = "";
		if(num==0) {
			 sqlSearchList = "SELECT * FROM (SELECT ROWNUM num,"
						+ " list_no, m_id, m_age, list_reg_date, list_weather, list_temp , list_img, list_content,"
						+ " list_hash, list_thanks FROM"
						+ " (SELECT * FROM ootdlist WHERE list_content LIKE ?"
						+ " ORDER BY list_no DESC)) WHERE num >= ? AND num <= ?";
		}else {
			 sqlSearchList = "SELECT * FROM (SELECT ROWNUM num,"
						+ " list_no, m_id, m_age, list_reg_date, list_weather, list_temp , list_img, list_content,"
						+ " list_hash, list_thanks FROM"
						+ " (SELECT * FROM ootdlist WHERE list_hash LIKE ?"
						+ " ORDER BY list_no DESC)) WHERE num >= ? AND num <= ?";
		}
		ArrayList<Board> boardList = null;
		
		try{			
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sqlSearchList);			
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
			
				boardList = new ArrayList<Board>();
			
				do {					
					Board board = new Board();
					board.setList_no(rs.getInt("list_no"));
					board.setM_id(rs.getString("m_id"));
					board.setM_age(rs.getInt("m_age"));
					board.setList_reg_date(rs.getTimestamp("list_reg_date"));							
					board.setList_weather(rs.getString("list_weather"));
					board.setList_temp(rs.getString("list_temp"));
					board.setList_img(rs.getString("list_img"));
					board.setList_content(rs.getString("list_content"));
					board.setList_hash(rs.getString("list_hash"));
					board.setList_thanks(rs.getInt("list_thanks"));
					
					boardList.add(board);
					
				} while(rs.next());
			}
		} catch(Exception e) {			
			e.printStackTrace();
			
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return boardList;
	}


	public void updateBoard(Board board) {
		
		String sqlFileUpdate = "UPDATE ootdlist set list_weather=?, list_temp=?, list_reg_date=?,"				
				+ " list_content=?, list_hash=? ,list_img=? WHERE list_no=?";
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sqlFileUpdate);
			pstmt.setString(1, board.getList_weather());
			pstmt.setString(2, board.getList_temp());
			pstmt.setTimestamp(3, board.getList_reg_date());
			pstmt.setString(4, board.getList_content());
			pstmt.setString(5, board.getList_hash());
			pstmt.setString(6, board.getList_img());
			pstmt.setInt(7, board.getList_no());
			pstmt.executeUpdate();
			
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt);
			}
		}

	
	public void insertBoard(Board board) {
		
		String sqlInsert = "INSERT INTO ootdlist(list_no, m_id, m_age, list_reg_date, list_weather, "
				+ "list_temp, list_img, list_content, list_hash, list_thanks) "
				+ " VALUES(ootd_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
		
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sqlInsert);
			
			pstmt.setString(1, board.getM_id());
			pstmt.setInt(2, board.getM_age());
			pstmt.setTimestamp(3, board.getList_reg_date());
			pstmt.setString(4, board.getList_weather());
			pstmt.setString(5, board.getList_temp());
			pstmt.setString(6, board.getList_img());
			pstmt.setString(7, board.getList_content());
			pstmt.setString(8, board.getList_hash());
			pstmt.setInt(9, board.getList_thanks());
			
			pstmt.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace(); 
		}finally {
			DBManager.close(conn, pstmt, rs);
		}		
	}


	public void deleteBoard(int no) {
	
	String sqlDelete = "DELETE FROM ootdlist WHERE list_no=?"; 
	try {			
		conn = DBManager.getConnection();
		pstmt = conn.prepareStatement(sqlDelete);
		pstmt.setInt(1, no);
		pstmt.executeUpdate();
		
	} catch(Exception e) {
		e.printStackTrace();			
	} finally {			
		DBManager.close(conn, pstmt, rs);
	}
}	

	
	public ArrayList<Reply> getReplyList(int list_no) {
		
		String replyListSql = "SELECT * FROM reply WHERE list_no = ?"
		+ " ORDER BY no DESC";
		
		Reply reply = null;
		ArrayList<Reply> replyList = null;
		
		
			try {
		// DBManager을 이용해 DBCP로 부터 Connection을 대여한다.
				conn = DBManager.getConnection();
		// Comment 테이블에 저장된 댓글 번호중 제일 큰 댓글 번호를 읽어온다.- 266 -
				pstmt = conn.prepareStatement(replyListSql);
				pstmt.setInt(1, list_no);
				rs = pstmt.executeQuery();
				replyList = new ArrayList<Reply>();
		
				
				while(rs.next()) {
					reply = new Reply();
					reply.setNo(rs.getInt("no"));
					reply.setList_no(rs.getInt("list_no"));
					reply.setReply(rs.getString("reply"));
					reply.setWriter(rs.getString("writer"));
					reply.setReg_date(rs.getTimestamp("reg_date"));
					replyList.add(reply);
		
				}
				
				} catch(Exception e) {
					
				System.out.println("BoardDao - replyList(no)");
				e.printStackTrace();
				
				} finally {
					
				
				}
					
				return replyList;
				
				}
		
		// DB에 좋아요 여부가 등록되어 있는지 체크
		public int dBfavCheck(String m_id, int no) {
		
			String dBfavCheckSql = "SELECT count(*) FROM favariteList WHERE ootd_no = ? AND m_id = ? AND(state=0 OR state=1)";	
			
			// 0 DB에 없음, 1 DB에 있음
			int result = 0;
			
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(dBfavCheckSql);
				pstmt.setInt(1, no);
				pstmt.setString(2, m_id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = rs.getInt(1);
				} else {
					return result;
				}
						
			} catch(Exception e) {				
				e.printStackTrace();			
			} finally {		
				DBManager.close(conn, pstmt, rs);
			}		
			return result;
		}
		
		public int dBbookmarkCheck(String m_id, int no) {
			
			String dBbookmarkCheckSql = "SELECT count(*) FROM bookmark WHERE ootd_no = ? AND m_id = ? AND(state=0 OR state=1)";	
			
			// 0 DB에 없음, 1 DB에 있음
			int result = 0;
			
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(dBbookmarkCheckSql);
				pstmt.setInt(1, no);
				pstmt.setString(2, m_id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = rs.getInt(1);
				} else {
					return result;
				}
						
			} catch(Exception e) {				
				e.printStackTrace();			
			} finally {		
				DBManager.close(conn, pstmt, rs);
			}		
			return result;
		}
		
		public HashMap<String, Integer> getList_thanks(int list_no, String id, int type) {
			
			HashMap<String, Integer> map = null;
			String ThankSql = null;
			if(type == 0) {
				ThankSql ="UPDATE favariteList set state=1 WHERE ootd_no = ? AND m_id = ?";
			}else if(type==1){
				ThankSql ="UPDATE favariteList set state=0 WHERE ootd_no = ? AND m_id = ?";			
			}else if(type==2) {
				ThankSql ="INSERT INTO favariteList VALUES (favariteList_seq.NEXTVAL, ?, ?, 1)";
			}
			String selectResultSql = "SELECT  count(*) FROM favariteList WHERE ootd_no=? AND state=1";
		
			try {
				
				conn = DBManager.getConnection();
				DBManager.setAutoCommit(conn, false);
				pstmt = conn.prepareStatement(ThankSql);
				
				pstmt.setInt(1, list_no);
				pstmt.setString(2, id);
				pstmt.executeUpdate();
				
				
				pstmt = conn.prepareStatement(selectResultSql);
				pstmt.setInt(1, list_no);
				rs = pstmt.executeQuery();
				
				// 질의해온 추천 수와 땡큐를 HashMap에 저장한다.
				if(rs.next()) {
					map = new HashMap<String, Integer>();
					map.put("recommend", rs.getInt(1));
				}
				
				// 모든 DB 작업이 완료되면 commit하고 트랜잭션을 종료한다.
				DBManager.commit(conn);
			} catch(Exception e) {			
				// DB 작업이 실패하면 rollback 하고 트랜잭션을 종료한다. 
				DBManager.rollback(conn);
				System.out.println("BoardDao - getList_thanks(no, isThank)");
				e.printStackTrace();
				
			} finally {
				// DBManager를 이용해 DB 작업에 사용된 자원을 해제 한다.
				DBManager.close(conn, pstmt, rs);
			}		
			return map;
		
		}
		
		
		public void addReply(Reply reply) {
			
			String replyInsertSql = "INSERT INTO reply"
					+ " VALUES(reply_seq.NEXTVAL, ?, ?, ?, SYSDATE)";
			
			try {			
				// DBManager을 이용해 DBCP로 부터 Connection을 대여한다.
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(replyInsertSql);
				
				// insertSql 쿼리의 플레이스홀더(?)에 대응하는 데이터를 설정한다.			
				pstmt.setInt(1, reply.getList_no());
				pstmt.setString(2, reply.getReply());
				pstmt.setString(3, reply.getWriter());			
				
				// DB에 쿼리를 전송하여 댓글 추가 작업을 완료한다.
				pstmt.executeUpdate();
			} catch(Exception e) {
				System.out.println("BoardDao - addReply(reply)");
				e.printStackTrace();	
			} finally {			
				// DBManager를 이용해 DB 작업에 사용된 자원을 해제 한다.
				DBManager.close(conn, pstmt, rs);
			}
		}	
	
	
		public void updateReply(Reply reply) {
			String replyUpdateSql = "UPDATE reply SET reply=?,"
					+ " reg_date=SYSDATE WHERE no=?";
			
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(replyUpdateSql);
				
				
				pstmt.setString(1, reply.getReply());
				pstmt.setInt(2, reply.getNo());
				
				
				pstmt.executeUpdate();
			} catch(Exception e) {
				System.out.println("BoardDao - updateReply(reply)");
			e.printStackTrace();
			} finally {
					DBManager.close(conn, pstmt, rs);
			}
		}
	
		public void deleteReply(Reply reply) {
			
			String replyDeleteSql = "DELETE FROM reply WHERE no = ?";
			
			try {			
				// DBManager을 이용해 DBCP로 부터 Connection을 대여한다.
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(replyDeleteSql);
				
				// insertSql 쿼리의 플레이스홀더(?)에 대응하는 데이터를 설정한다.
				pstmt.setInt(1, reply.getNo());					
				
				// DB에 쿼리를 전송하여 댓글 추가 작업을 완료한다.
				pstmt.executeUpdate();
			} catch(Exception e) {
				System.out.println("BoardDao - deleteReply(reply)");
				e.printStackTrace();			
			} finally {			
				// DBManager를 이용해 DB 작업에 사용된 자원을 해제 한다.
				DBManager.close(conn, pstmt);
			}
		}	
		
		public int updateUserCheck(String m_id, int no) {
			
			String updateUserCheckSql = "SELECT m_id FROM ootdlist WHERE list_no = ?";	
			
			// 0 수정권한 없음, 1 수정권한있음
			int result = 0;
			String writer_id = "";
			
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(updateUserCheckSql);
				pstmt.setInt(1, no);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					writer_id = rs.getString("m_id");
				} else {
					return result;
				}
				/* 로그인 요청시 입력한 비밀번호와 회원 테이블에서 SELECT한 결과로
				 * 읽어온 비밀번호가 일치하면 1을 반환 하고 일치하지 않으면 0을 반환 한다.
				 **/
				if(writer_id.equals(m_id)) {
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
		public int deleteReplyCheck(String m_id, int no) {
			
			String updateUserCheckSql = "SELECT writer FROM reply WHERE list_no = ?";	
			
			// 0 수정권한 없음, 1 수정권한있음
			int result = 0;
			String writer_id = "";
			
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(updateUserCheckSql);
				pstmt.setInt(1, no);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					writer_id = rs.getString("m_id");
				} else {
					return result;
				}
				/* 로그인 요청시 입력한 비밀번호와 회원 테이블에서 SELECT한 결과로
				 * 읽어온 비밀번호가 일치하면 1을 반환 하고 일치하지 않으면 0을 반환 한다.
				 **/
				if(writer_id.equals(m_id)) {
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
		public void addLivekey(String keyword) {
			String sqlLivekeyword="INSERT INTO popular(id, word) VALUES (popular_seq.NEXTVAL, ?)";
			
			try {			
				// DBManager을 이용해 DBCP로 부터 Connection을 대여한다.
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sqlLivekeyword);
				
				// insertSql 쿼리의 플레이스홀더(?)에 대응하는 데이터를 설정한다.			
				
				pstmt.setString(1, keyword);		
				
				// DB에 쿼리를 전송하여 댓글 추가 작업을 완료한다.
				pstmt.executeUpdate();
			} catch(Exception e) {
				System.out.println("BoardDao - addReply(reply)");
				e.printStackTrace();	
			} finally {			
				// DBManager를 이용해 DB 작업에 사용된 자원을 해제 한다.
				DBManager.close(conn, pstmt, rs);
			}
		}	
		
		
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// 회원이 이 글에 좋아요를 눌렀는지 확인하는 메소드
		public int boardFavorchk(String m_id, int no) {
			
			String boardFavorchkSql = "SELECT state FROM favariteList WHERE ootd_no = ? AND m_id = ?";	
			
			// 0 좋아요X, 1: 좋아요0 
			int result = 0;
			
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(boardFavorchkSql);
				pstmt.setInt(1, no);
				pstmt.setString(2, m_id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = rs.getInt(1);
				} 
			} catch(Exception e) {				
				e.printStackTrace();			
			} finally {		
				DBManager.close(conn, pstmt, rs);
			}		
			return result;
		}
	
		// 이 글에 좋아요가 몇개인지 계산하는 
		public int getFavor(int no) {
			
			String getFavorSql = "SELECT count(*) FROM favariteList WHERE ootd_no = ? AND state = 1";	
			
			// 0 좋아요X, 1: 좋아요0 
			int result = 0;
			
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(getFavorSql);
				pstmt.setInt(1, no);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = rs.getInt(1);
				} 
			} catch(Exception e) {				
				e.printStackTrace();			
			} finally {		
				DBManager.close(conn, pstmt, rs);
			}		
			return result;
		}
		//////////////////////북마크///////////////////////// 
		
public int boardBookmark(String m_id, int no) {
			
			String boardbookmark = "SELECT state FROM bookmark WHERE ootd_no = ? AND m_id = ?";	
			
			// 0 좋아요X, 1: 좋아요0 
			int result = 0;
			
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(boardbookmark);
				pstmt.setInt(1, no);
				pstmt.setString(2, m_id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = rs.getInt(1);
				} 
			} catch(Exception e) {				
				e.printStackTrace();			
			} finally {		
				DBManager.close(conn, pstmt, rs);
			}		
			return result;
		}
		
public ArrayList<Bookmark> getBookmark(String mId) {
	
	Bookmark bookmark = null;
	String sqlBookmark = "SELECT o.list_no, o.list_img, b.* FROM bookmark b, ootdlist o "
			+ " WHERE O.list_no = b.ootd_no "
			+ "    AND b.m_id=? AND state=1" ;
	ArrayList<Bookmark> bookmarkList = null;
	
	try {
		conn = DBManager.getConnection();
		
		
		pstmt = conn.prepareStatement(sqlBookmark);
		
		pstmt.setString(1, mId);
		
		rs = pstmt.executeQuery();
		if(rs.next()) {
			
			bookmarkList = new ArrayList<Bookmark>();
			
			do {					
				bookmark = new Bookmark();
				bookmark.setNo(rs.getInt("no"));
				bookmark.setOotdNo(rs.getInt("ootd_no"));
				bookmark.setmId(rs.getString("m_id"));
				bookmark.setState(rs.getInt("state"));
				bookmark.setListNo(rs.getInt("list_no"));
				bookmark.setListImg(rs.getString("list_img"));
				bookmarkList.add(bookmark);

			} while(rs.next());		
		}
}	catch(SQLException e) {
	System.out.println("BoardDao - getBookmark-SQLException");
	e.printStackTrace();
} catch(Exception e) {
	System.out.println("BoardDao - getBookmark()-Exception");
	e.printStackTrace();
} finally {
	DBManager.close(conn, pstmt, rs);
}
	return bookmarkList;
}

		
	
		public HashMap<String, Integer> getState(int list_no, String id, int type) {
			
			HashMap<String, Integer> map = null;
			String StateSql = null;
			if(type == 0) {
				StateSql ="UPDATE bookmark set state= 1 WHERE ootd_no=? AND m_id=?";
			}else if(type==1){
				StateSql ="UPDATE bookmark set state= 0 WHERE ootd_no=? AND m_id=?";		
			}else if(type==2) {
				StateSql ="INSERT INTO bookmark VALUES (bookmark_seq.NEXTVAL, ?, ?, 1)";
			}
			String StateResultSql = "SELECT  count(*) FROM bookmark WHERE ootd_no=? AND state=1";
			try {
				conn = DBManager.getConnection();
				DBManager.setAutoCommit(conn, false);
				pstmt = conn.prepareStatement(StateSql);
				pstmt.setInt(1, list_no);
				pstmt.setString(2, id);
				pstmt.executeUpdate();
				
				pstmt = conn.prepareStatement(StateResultSql);
				pstmt.setInt(1, list_no);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					map = new HashMap<String, Integer>();
					map.put("state", rs.getInt(1));
				}
				
				// 모든 DB 작업이 완료되면 commit하고 트랜잭션을 종료한다.
				DBManager.commit(conn);
			} catch(Exception e) {			
				// DB 작업이 실패하면 rollback 하고 트랜잭션을 종료한다. 
				DBManager.rollback(conn);
				System.out.println("BoardDao - getState(no, isThank)");
				e.printStackTrace();
				
			} finally {
				// DBManager를 이용해 DB 작업에 사용된 자원을 해제 한다.
				DBManager.close(conn, pstmt, rs);
			}		
			return map;
		
		}
		// 북마크 글 리스트 가져오기
		public ArrayList<Board> bookmarkboardList(int startRow, int endRow, int no) {
			String sqlBoardList = "SELECT * FROM (SELECT ROWNUM num,"
					+ " list_no, m_id, m_age, list_reg_date, list_weather, list_temp , list_img, list_content,"
					+ " list_hash, list_thanks FROM"
					+ " (SELECT * FROM ootdlist ORDER BY list_no DESC)) "
					+ " WHERE num >= ? AND num <= ?";
			
			ArrayList<Board> boardList = null;
			
			try{			
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sqlBoardList);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
					boardList = new ArrayList<Board>();
					
					do {					
						Board board = new Board();
						board.setList_no(rs.getInt("list_no"));
						board.setM_id(rs.getString("m_id"));
						board.setM_age(rs.getInt("m_age"));
						board.setList_reg_date(rs.getTimestamp("list_reg_date"));							
						board.setList_weather(rs.getString("list_weather"));
						board.setList_temp(rs.getString("list_temp"));
						board.setList_img(rs.getString("list_img"));
						board.setList_content(rs.getString("list_content"));
						board.setList_hash(rs.getString("list_hash"));
						board.setList_thanks(rs.getInt("list_thanks"));
						boardList.add(board);

					} while(rs.next());
				}
			} catch(Exception e) {			
				e.printStackTrace();
				
			} finally {			
				DBManager.close(conn, pstmt, rs);
			}

			System.out.println(boardList);
			return boardList;
		}
		
}
	






