package com.ootd.project.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ootd.project.service.ForwardService;
import com.ootd.project.dao.BoardDao;
import com.ootd.project.vo.Board;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

// 게시 글 상세보기 요청을 처리하는 서비스 클래스
public class DeleteService implements CommandProcess {
	
	public ForwardService requestProcess(
			HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("m_id");
		String sNo = request.getParameter("no");
		String pageNum = request.getParameter("pageNum");
		String keyword = request.getParameter("keyword");
		
		if(sNo == null || sNo.equals("") || pageNum == null || pageNum.equals("")) {
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("	alert('정상적인 접근이 아닙니다.');");
			out.println("	history.back();");
			out.println("</script>");
			return null;
		}
		
		
		BoardDao dao = new BoardDao();
		int writer_access = dao.updateUserCheck(id, Integer.valueOf(sNo));
		
		if(writer_access==0) {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println(" alert('삭제할 수 있는 권한이 없습니다.');");
				out.println(" history.back();");
				out.println("</script>");
				return null;
		}
		
		int no = Integer.parseInt(sNo);
			
		dao.deleteBoard(no);
			
		boolean searchOption = ( keyword == null || keyword.equals("")) ? false : true; 	
		
		String url = "boardList.mvc?pageNum=" + pageNum;
		
		
			if(searchOption) {
			
			/* 리다이렉트 할 때 파라미터에 한글이 포함되어 있으면 한글로된 파라미터 값은
			 * 공백문자로 변경되어 리다이렉트 되기 때문에 java.net 패키지의 URLEncoder
			 * 클래스를 이용해 수동으로 인코딩을 해줘야 한다.
			 *
			 * 아래는 검색 요청일 경우만 type과 keyword 파라미터를 적용시킨다.
			 **/	
			keyword = URLEncoder.encode(keyword, "utf-8");
			
			url += "&keyword=" + keyword; 
		}

		/* Redirect 정보와 View 페이지 경로 정보를 저장하는 ForwardService 클래스의
		 * 인스턴스를 생성하고 Redirect 여부를 true로 설정하여 Redirect 액션을 지정
		 * 한 후 Redirect할 전체 경로를 setPath() 메서드를 사용해 지정한다.
		 * 
		 * 게시글 삭제가 완료된 후 Redirect 시키지 않으면 이 페이지를 새로고침 하거나
		 * 재요청 할 때 마다 이미 삭제된 게시 글을 계속하여 삭제하는 문제가 발생 한다.
		 * 전체 경로를 지정할 때는 setPath() 메서드를 사용한다.
		 * 
		 * 지금과 같이 리다이렉트를 해야할 경우 웹브라우저가 다시 요청할 주소만 응답하고
		 * 웹브라우저에서는 이 주소로 재요청하는 동작을 하기 때문에 웹 템플릿 페이지인
		 * index.jsp를 뷰 페이지로 지정하면 않된다. 왜냐하면 리다이렉트는 뷰페이지를 거쳐
		 * 클라이언트로 응답되는 것이 아니라 현재 클라이언트가 요청한 주소가 다른 곳으로
		 * 이동되었다고 알려주기 위해 웹브라우저가 이동할 주소만 응답하고 웹 브라우저는
		 * 서버로 부터 응답 받은 주소로 다시 요청하는 동작을 하기 때문에 뷰 페이지의
		 * 정보가 아닌 웹 브라우저가 이동할 주소를 지정해야 한다. 그러므로 컨트롤러가
		 * 처리하는 요청 명령에 해당하는 주소를 지정하면 된다.
		 * 포워딩은 현재 웹 애플리케이션 안에서 지정한 뷰 페이지를 찾기 때문에 웹 
		 * 애플리케이션을 벗어난 뷰 페이지 지정은 할 수 없으며 리다이렉트는 현재 웹
		 * 애플리케이션을 포함해 다른 웹 사이트도 지정할 수 있다.         
		 **/
		ForwardService forward = new ForwardService();
		forward.setRedirect(true);
		forward.setPath(url);
		return forward;
	}
}
