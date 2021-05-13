package com.ootd.project.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ootd.project.dao.OotdMemberDao;


// 비밀번호 찾기 요청을 처리하는 서비스
public class PassCheckService implements CommandProcess {
	
	public ForwardService requestProcess(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
		
		ForwardService forward = new ForwardService();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/board/passCheck.jsp");
		return forward;
	}
}
