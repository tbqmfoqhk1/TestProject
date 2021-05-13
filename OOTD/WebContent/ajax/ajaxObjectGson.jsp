<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ page import="java.sql.*, java.util.*, com.ootd.project.dao.*, com.ootd.project.vo.*" %>
<%@ page import="com.google.gson.*, java.text.*, java.util.Date" %>
<%
String searchOne = request.getParameter("searchOne");
	
	Gson gson = new Gson();
	
	SearchDao dao = new SearchDao("oracle");
	
	String responseData = null;
	
	if(searchOne.equals("2")) { 
		
		ArrayList<Member> popularList = dao.getPopularList();
		responseData = gson.toJson(popularList);
	}
	System.out.println(responseData);
	
	out.println(responseData);
%>