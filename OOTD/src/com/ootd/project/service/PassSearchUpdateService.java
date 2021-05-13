package com.ootd.project.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ootd.project.dao.OotdMemberDao;


// 비밀번호 변경을 위한 DB체크 및 변경 모델 클래스
public class PassSearchUpdateService implements CommandProcess {
	
	public ForwardService requestProcess(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("id");
		String pass = request.getParameter("passUpdate_pass1");
		
		System.out.println("passUpdate m_id:"+m_id+"/pass:"+pass);
		
		OotdMemberDao dao = new OotdMemberDao();		
		dao.PassSearchCheckUpdate(m_id, pass);
		
		
		ForwardService forward = new ForwardService();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/board/passCheckUpdateComplete.jsp");		
		return forward;
	}
}
