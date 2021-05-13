package com.ootd.project.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// 회원 로그아웃 요청을 처리하는 모델 클래스
public class LogoutService implements CommandProcess {

	@Override
	public ForwardService requestProcess(
			HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
		
		HttpSession session = request.getSession();	
		session.invalidate();
		
		ForwardService forward = new ForwardService();	
		forward.setRedirect(false);
		forward.setPath("/boardList.mvc");
		return forward;
	}
}
