package com.ootd.project.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ootd.project.dao.BoardDao;
import com.ootd.project.vo.Board;

// 게시 글 리스트 보기 요청을 처리하는 서비스 클래스
public class BoardListService  implements CommandProcess {
	
	// 한 페이지에 보여 줄 게시 글의 수를 상수로 선언하고 있다.
	private static final int PAGE_SIZE = 6;
	
	/* 한 페이지에 보여 질 페이지 그룹의 수를 상수로 선언하고 있다.
	 * [이전] 1 2 3 4 5 6 7 8 9 10 [다음]	
	 **/
	private static final int PAGE_GROUP = 10;
	
	public ForwardService requestProcess(
			HttpServletRequest request, HttpServletResponse response)
					throws ServletException {
		
		// 요청 파라미터로 넘어 온 페이지 번호를 읽어온다.
		String pageNum = request.getParameter("pageNum");
		String keyword = request.getParameter("keyword");	
		
		boolean hash=false;
		if(keyword!=null) {
			hash = keyword.contains(".");
			if(hash) {
				var tem = keyword.length();
				keyword = keyword.substring(0,tem-1);
			}
		}
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		// 요청 파라미터의 pageNum을 int 형으로 변환하여 현재 페이지로 설정하고 있다.
		int currentPage = Integer.parseInt(pageNum);
		
		
		int startRow = currentPage * PAGE_SIZE - (PAGE_SIZE - 1);
		
		int endRow = startRow + PAGE_SIZE - 1;
				
		int listCount = 0;
		ArrayList<Board> boardList = null;
		
		// BoardDao 객체를 생성하고 전체 게시 글의 수를 얻어온다.
		BoardDao dao = new BoardDao();
		boolean searchOption = ( keyword == null || keyword.equals("")) ? false : true; 
		
		
		
		// 검색 요청이 아니면
		if(! searchOption) {
			// 전체 게시 글 수를 구한다.
			listCount = dao.getBoardCount();
			
		} else { // 검색 요청이 아니면
			if(!hash) {
				listCount = dao.getBoardCount(keyword, 0);
			}else {
				listCount = dao.getBoardCount(keyword, 1);
			}
		}
		System.out.println("listCount : " + listCount);
		
		if(! searchOption) {
			boardList = dao.boardList(startRow, endRow);
			
		} else { // 검색 요청이면
			if(!hash) {
				boardList = dao.searchList(keyword, startRow, endRow, 0);
				dao.addLivekey(keyword);
				System.out.println("실시간검색어입력완료");
			}else {
				boardList = dao.searchList(keyword, startRow, endRow, 1);
			}
		}
		
		int pageCount = listCount / PAGE_SIZE 
							+ (listCount % PAGE_SIZE == 0 ? 0 : 1);
		
		 int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1
			- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
		
		
		int endPage = startPage + PAGE_GROUP - 1;
		

		if(endPage > pageCount) {
			endPage = pageCount;
		}	
		
	
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageGroup", PAGE_GROUP);
		request.setAttribute("listCount", listCount);
		request.setAttribute("boardList", boardList);
		request.setAttribute("searchOption", searchOption);
		
		// 검색 요청이면 type과 keyword를 request 영역에 저장한다.
		if(searchOption) {
			request.setAttribute("word", keyword);
			try {
						
				keyword = URLEncoder.encode(keyword, "utf-8");
			} catch (UnsupportedEncodingException e) {				
				e.printStackTrace();
			}		
			request.setAttribute("keyword", keyword);
		}
		

		ForwardService forward = new ForwardService();	
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/index.jsp?body=board/boardList.jsp");
		return forward;
	}
}
