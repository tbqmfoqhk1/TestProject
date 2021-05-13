package com.ootd.project.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ootd.project.dao.OotdMemberDao;
import com.ootd.project.vo.OotdMember;

/* 회원정보 입력 확인 페이지에서 가입 완료를 요청하면 입력된 데이터를 받아
 * DB에 저장하여 회원가입 완료 요청을 처리하는 모델 클래스
 * 회원 가입이 완료되면 로그인 처리를 같이 한다.
 **/
public class JoinResultService implements CommandProcess {
	
	public ForwardService requestProcess(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {		
		
		/* Request 객체로 부터 세션 객체를 얻어 memberInfo.jsp에서 JSTL의
		 * <c:set> 태그를 사용해 세션 영역의 속성에 저장한 회원 정보를 읽어 온다.
		 **/
	
		/* 회원 가입을 처리하기 위해 MemberDAO 객체를 얻어
		 * 회원 테이블에 새로운 회원 정보를 추가 한다.
		 **/ 
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("m_name");
		String id = request.getParameter("m_id");
		String pass = request.getParameter("m_pass");
		int phone = Integer.parseInt(request.getParameter("m_phone"));
		int age = Integer.parseInt(request.getParameter("m_age"));
		String gender = request.getParameter("m_gender");
		
		OotdMember ootdmember = new OotdMember();
		ootdmember.setM_name(name);
		ootdmember.setM_id(id);
		ootdmember.setM_pass(pass);
		ootdmember.setM_phone(phone);
		ootdmember.setM_age(age);
		ootdmember.setM_gender(gender);
		
		OotdMemberDao dao = new OotdMemberDao();
		dao.joinMember(ootdmember);		
		
			
		ForwardService forward = new ForwardService();
		forward.setRedirect(false);
		forward.setPath("boardList.mvc");
		return forward;
	}
}
