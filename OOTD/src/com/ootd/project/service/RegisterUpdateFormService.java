package com.ootd.project.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ootd.project.dao.OotdMemberDao;
import com.ootd.project.vo.OotdMember;

// 회원정보 수정 폼 요청을 처리하는 모델 클래스
public class RegisterUpdateFormService implements CommandProcess {
	
	public ForwardService requestProcess(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
		
		/* Request 객체로 부터 세션 객체를 얻어 회원 로그인 또는
		 * 회원 가입시 세션 영역의 속성에 저장된 회원의 id를 읽어온다.
		 **/
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("m_id");
		
		
		/* 회원 정보를 테이블로 부터 읽어오기 위해 MemberDAO 객체를 얻어
		 * 회원 테이블에서 id에 해당하는 회원 정보를 읽어온다.
		 **/ 
		OotdMemberDao dao = new OotdMemberDao();
		OotdMember ootdmember = dao.getOotdMember(id);
		
		// Request 영역의 속성에 테이블로 부터 읽어온 회원 정보를 저장 한다.
		session.setAttribute("ootdmember", ootdmember);
		
		/* Redirect 정보와 View 페이지 경로 정보를 저장하는 ForwardService 클래스의
		 * 인스턴스를 생성하고 Redirect 여부를 false로 설정하여 Forward 액션을 지정
		 * 한 후 View 페이지로 게시 글 리스트를 출력하는 JSP 페이지의 경로를 지정한다.
		 * 
		 * 포워딩을 해야 할 경우 아래와 같이 웹 템플릿인 index.jsp로 뷰 페이지를
		 * 지정하고 body라는 파라미터에 웹 템플릿에 동적으로 포함시킬 페이지를
		 * 지정하면 된다. 포워딩 할 경우 웹 템플릿 페이지인 index.jsp 페이지에서
		 * body라는 파라미터 값을 읽어서 동적으로 포함되는 컨텐츠 페이지를 include
		 * 하므로 index.jsp를 기준으로 상대 참조 방식으로 컨텐츠 페이지를 지정하면 된다.
		 **/
		ForwardService forward = new ForwardService();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/index.jsp?body=board/registerUpdate.jsp");		
		return forward;
	}
}
