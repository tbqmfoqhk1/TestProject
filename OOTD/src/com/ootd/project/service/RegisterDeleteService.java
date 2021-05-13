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

// 회원 탈퇴 요청을 처리하는 모델 클래스
public class RegisterDeleteService implements CommandProcess {

	@Override
	public ForwardService requestProcess(
			HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String id= (String)session.getAttribute("m_id"); 
        String pass = request.getParameter("m_pass");
	
		OotdMemberDao dao = new OotdMemberDao();
		int deleteMember = dao.checkMember(id, pass);
		
			// 회원탈퇴 성공
		if(deleteMember == 1) {	
			dao.deleteMember(id);
			session.invalidate();
			
		}
			// 비밀번호가 틀리면
		else {		
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("	alert('비밀번호를 제대로 적어주세요.');");
			out.println("	window.history.back();");
			out.println("</script>");
			return null;
		
		
		}
		
		ForwardService forward = new ForwardService();	
		forward.setRedirect(false);
		forward.setPath("/boardList.mvc");
		return forward;
	}
}
