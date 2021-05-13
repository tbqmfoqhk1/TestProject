package com.ootd.project.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ootd.project.dao.BoardDao;
import com.ootd.project.dao.OotdMemberDao;
import com.ootd.project.vo.OotdMember;

// 회원탈퇴 폼 요청을 처리하는 모델 클래스
public class DeleteFormService implements CommandProcess {
	
	public ForwardService requestProcess(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
		
		
		ForwardService forward = new ForwardService();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/index.jsp?body=board/delete.jsp");		
		return forward;
	}
}
