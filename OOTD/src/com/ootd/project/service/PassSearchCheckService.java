package com.ootd.project.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ootd.project.dao.OotdMemberDao;


// 비밀번호 변경을 위한 DB체크 및 변경 모델 클래스
public class PassSearchCheckService implements CommandProcess {
	
	public ForwardService requestProcess(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
		
		
		String m_id = request.getParameter("pass_name");
		String m_phone = request.getParameter("pass_phone");
		
		OotdMemberDao dao = new OotdMemberDao();		
		boolean overlap = dao.PassSearchCheck(m_id, m_phone);
		
		if(!overlap) {		
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();	
			out.println("<script>");
			out.println("	alert('아이디와 전화번호가 일치하지 않습니다.');");
			out.println("	window.history.back();");
			out.println("</script>");
			return null;
		} 
		
		HttpSession session = request.getSession();
		session.setAttribute("id", m_id);
		session.setAttribute("phone", m_phone);
		
		ForwardService forward = new ForwardService();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/board/passCheckUpdate.jsp");		
		return forward;
	}
}
