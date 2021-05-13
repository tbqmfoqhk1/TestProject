package com.ootd.project.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WriteFormService implements CommandProcess {
public ForwardService requestProcess(
HttpServletRequest request, HttpServletResponse response) 
throws ServletException, IOException {
	
	
	ForwardService forward = new ForwardService();
	forward.setRedirect(false);
	forward.setPath("/WEB-INF/index.jsp?body=board/writeForm.jsp");
	return forward;
	}

}