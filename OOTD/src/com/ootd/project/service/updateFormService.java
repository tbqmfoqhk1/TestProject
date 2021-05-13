package com.ootd.project.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ootd.project.dao.BoardDao;
import com.ootd.project.vo.Board;

// 게시 글 상세보기 요청을 처리하는 서비스 클래스
public class updateFormService implements CommandProcess {
	
	public ForwardService requestProcess(
			HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
		
		//요청 파라미터로 넘어 온 게시 글 번호와 페이지 번호를 읽어온다.
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("m_id");
		String no = request.getParameter("no");	
		String pageNum = request.getParameter("pageNum");	
		String keyword = request.getParameter("keyword");	
		
		if(no == null || no.equals("") 
				|| pageNum == null || pageNum.equals("")) {
				/* 스트림에 직접 쓰기위해 응답 객체로 부터 스트림을 구한다. * 응답 객체의 스트림을 구하기 전해 ContentType이 설정되야 한다. * 그렇지 않으면 한글과 같은 데이터는 깨져서 출력된다. **/
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println(" alert('정상적인 접근이 아닙니다.');");
				out.println(" history.back();");
				out.println("</script>");
				return null;
		}
		BoardDao dao = new BoardDao();
		int writer_access = dao.updateUserCheck(id, Integer.valueOf(no));
		
		if(writer_access==0) {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println(" alert('수정할 수 있는 권한이 없습니다.');");
				out.println(" history.back();");
				out.println("</script>");
				return null;
		}
				
		boolean searchOption = (
				keyword == null || keyword.equals("")) ? false : true; 		
		
		Board board = dao.getBoard(Integer.valueOf(no));
		
		request.setAttribute("board", board);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("searchOption", searchOption);
		
		// 검색 요청이면 type과 keyword를 request 영역에 저장한다.
		if(searchOption) {
			request.setAttribute("word", keyword);
			try {
				/* IE에서 링크로 요청 시 파라미터에 한글이 포함되면 IE는
				 * URLEncoding을 하지 않고 서버로 전송하는데 톰캣 7.06x
				 * 버전에서 정상적으로 동작하던 것이 7.07x 버전에서는 Invalid
				 * character found in the request target 이라는 에러가
				 * 발생한다. 이 문제는 아래와 같이 java.net 패키지의 URLEncoder
				 * 클래스를 이용해 수동으로 URLEncoding을 해주면 해결할 수 있다.
				 * 크롬 브라우저는 링크로 요청 시 파라미터에 한글이 포함되어 있으면 브라우저 
				 * 주소창에는 한글 그대로 표시되지만 UTF-8로 URLEncoding을 해준다.
				 **/				
				keyword = URLEncoder.encode(keyword, "utf-8");
			} catch (UnsupportedEncodingException e) {				
				e.printStackTrace();
			}	
			request.setAttribute("keyword", keyword);
		}
		
		ForwardService forward = new ForwardService();	
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/index.jsp?body=board/updateForm.jsp");
		return forward;
	}
}
