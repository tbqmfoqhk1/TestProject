package com.ootd.project.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ootd.project.dao.BoardDao;
import com.ootd.project.vo.Board;
import com.ootd.project.vo.Bookmark;


// 마이페이지 폼 요청을 처리하는 모델 클래스
public class BookmarkService implements CommandProcess {
	
	public ForwardService requestProcess(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		
		String mId = (String) request.getSession().getAttribute("m_id");
		String pageNum = request.getParameter("pageNum");	
		
		ArrayList<Bookmark> bookMarkList = null;
		BoardDao dao = new BoardDao();
		bookMarkList= dao.getBookmark(mId);
		
		
		
		request.setAttribute("bookMarkList", bookMarkList);
		request.setAttribute("pageNum", pageNum);
		
		
		
		ForwardService forward = new ForwardService();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/index.jsp?body=board/bookmark.jsp");		
		return forward;
	}
}
