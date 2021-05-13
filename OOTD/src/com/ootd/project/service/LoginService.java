package com.ootd.project.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ootd.project.dao.OotdMemberDao;
import com.ootd.project.vo.OotdMember;

// 회원 로그인 요청을 처리하는 모델 클래스
public class LoginService implements CommandProcess {

	@Override
	public ForwardService requestProcess(
			HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
		
		String m_id = request.getParameter("m_id");
		String m_pass = request.getParameter("m_pass");
		
		OotdMemberDao dao = new OotdMemberDao();
		int checkLogin = dao.checkMember(m_id, m_pass);
		
		OotdMember ootdmember = null;
		
		// 존재하지 않는 아이디면
		if(checkLogin == -1) {		
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();	
			out.println("<script>");
			out.println("	alert('" + m_id + "는 가입되지 않은 아이디 입니다.');");
			out.println("	window.history.back();");
			out.println("</script>");
			return null;
		
		// 비밀번호가 틀리면
		} else if(checkLogin == 0) {		
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("	alert('비밀번호가 맞지 않습니다.');");
			out.println("	window.history.back();");
			out.println("</script>");
			return null;
		
		// 로그인 성공이면
		} else if(checkLogin == 1) {	
			HttpSession session = request.getSession();
			ootdmember = dao.getOotdMember(m_id);
			
			session.setAttribute("isLogin", true);
			
			session.setAttribute("m_no", ootdmember.getM_no());
			session.setAttribute("m_id", ootdmember.getM_id());
			session.setAttribute("m_name", ootdmember.getM_name());
			session.setAttribute("m_pass", ootdmember.getM_pass());
			session.setAttribute("m_phone", ootdmember.getM_phone());
			session.setAttribute("m_age", ootdmember.getM_age());
			session.setAttribute("m_gender", ootdmember.getM_gender());
			
		}
		
		ForwardService forward = new ForwardService();	
		forward.setRedirect(true);
		forward.setPath("index.mvc");
		return forward;
	}
}
