package com.ootd.project.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ootd.project.dao.OotdMemberDao;


// 회원 가입시 아이디 중복검사 요청을 처리하는 모델 클래스
public class OverlapIdCheckService implements CommandProcess {
	
	public ForwardService requestProcess(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
		
		String m_id = request.getParameter("id");
		
		/* 회원 아이디 중복 확인을 처리하기 위해 MemberDAO 객체를 얻어
		 * 회원 테이블에서 입력한 id의 회원이 존재하는지 조회 한다. 
		 * overlapIdCheck()는 중복된 id면 true, 중복된 id가 아니면 false가 반환 됨
		 **/ 
		OotdMemberDao dao = new OotdMemberDao();		
		boolean overlap = dao.overlapIdCheck(m_id);
		
		// Request 영역의 속성에 입력된 id와 회원 아이디 중복 여부를 저장 한다. 
		request.setAttribute("m_id", m_id);
		request.setAttribute("overlap", overlap);	
		/* Redirect 정보와 View 페이지 경로 정보를 저장하는 ForwardService 클래스의
		 * 인스턴스를 생성하고 Redirect 여부를 false로 설정하여 Forward 액션을 지정
		 * 한 후 View 페이지로 회원 아이디 체크에 해당하는 JSP 페이지의 경로를 지정한다.
		 * 
		
		 * 이 페이지는 새 창으로 동작시키기 때문에 웹 템플릿에 출력되지 않아야 한다.
		 * 그러므로 아래와 같이 웹 템플릿을 적용하지 않고 직접 포워딩 할 수 있도록 설정했다.
		 **/
		ForwardService forward = new ForwardService();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/board/overlapIdCheck.jsp");
		return forward;
	}
}
