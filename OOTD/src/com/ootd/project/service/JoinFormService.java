package com.ootd.project.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 회원가입 폼 요청을 처리하는 모델 클래스
public class JoinFormService implements CommandProcess {
	
	public ForwardService requestProcess(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
				
		/* 특별한 처리 없이 단순히 회원 가입 폼을 보여주는 처리만 한다.
		 *
		 * Redirect 정보와 View 페이지 경로 정보를 저장하는 ForwardService 클래스의
		 * 인스턴스를 생성하고 Redirect 여부를 false로 설정하여 Forward 액션을 지정
		 * 한 후 View 페이지로 게시 글 리스트를 출력하는 JSP 페이지의 경로를 지정한다.		 
		 * 
		 * 모든 처리 결과는 웹 템플릿인 index.jsp를 통해 출력되도록 구성해야 한다.
		 * 포워딩을 해야 할 경우 아래와 같이 웹 템플릿인 index.jsp로 뷰 페이지를
		 * 지정하고 body라는 파라미터에 웹 템플릿에 동적으로 포함시킬 페이지를
		 * 지정하면 된다. 포워딩 할 경우 웹 템플릿 페이지인 index.jsp 페이지에서
		 * body라는 파라미터 값을 읽어서 동적으로 포함되는 컨텐츠 페이지를 include
		 * 하므로 index.jsp를 기준으로 상대 참조 방식으로 컨텐츠 페이지를 지정하면 된다.
		 **/
		ForwardService forward = new ForwardService();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/index.jsp?body=board/register.jsp");		
		return forward;
	}
}
