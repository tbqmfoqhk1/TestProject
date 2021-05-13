package com.ootd.project.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



// 비밀번호 찾기 요청을 처리하는 서비스
public class WeatherPageService implements CommandProcess {
	
	public ForwardService requestProcess(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
		
		String[] array_weather = request.getParameterValues("array_weather");	
		String[] array_minTemp = request.getParameterValues("array_minTemp");	
		String[] array_date = request.getParameterValues("array_date");			
		
		System.out.println("array_weather"+array_weather);
		System.out.println("array_minTemp"+array_minTemp);
		System.out.println("array_date"+array_date);
		request.setAttribute("array_weather", array_weather);
		request.setAttribute("array_minTemp", array_minTemp);
		request.setAttribute("array_date", array_date);
		
		ForwardService forward = new ForwardService();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/index.jsp?body=board/weather.jsp");
		return forward;
	}
}
