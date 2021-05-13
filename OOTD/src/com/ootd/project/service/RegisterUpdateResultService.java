package com.ootd.project.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ootd.project.dao.OotdMemberDao;
import com.ootd.project.vo.OotdMember;

// 회원정보 수정 완료 요청을 처리하는 모델 클래스
public class RegisterUpdateResultService implements CommandProcess {
	
	public ForwardService requestProcess(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {		
		
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("m_id");
		String name = request.getParameter("updateMembername");
		String pass = request.getParameter("updateMemberPass");
		int phone = Integer.parseInt(request.getParameter("updateMemberPhone"));
		int age = Integer.parseInt(request.getParameter("updateMemberAge"));
		String gender = request.getParameter("updateMemberGender");
		
		OotdMember ootdmember = new OotdMember();
		ootdmember.setM_name(name);
		ootdmember.setM_id(id);
		ootdmember.setM_pass(pass);
		ootdmember.setM_phone(phone);
		ootdmember.setM_age(age);
		ootdmember.setM_gender(gender);
		
		OotdMemberDao dao = new OotdMemberDao();
		dao.updateOotdMember(ootdmember, id);
		
		session.setAttribute("m_name", ootdmember.getM_name());
		session.setAttribute("m_pass", ootdmember.getM_pass());
		session.setAttribute("m_phone", ootdmember.getM_phone());
		session.setAttribute("m_age", ootdmember.getM_age());
		session.setAttribute("m_gender", ootdmember.getM_gender());
		
		ForwardService forward = new ForwardService();
		forward.setRedirect(true);
		forward.setPath("boardList.mvc");
		return forward;
	}
}
