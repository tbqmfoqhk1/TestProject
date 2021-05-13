<%--
	비밀번호 찾기 페이지
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<title>비밀번호 체크</title>
</head>
<body>
	<div id="passSearchDiv">
		<h3>비밀번호찾기</h3>	
		<form action="passSearchCheck.mvc" name="passSearchForm" 
			method="post" id="passSearchForm">
			<div class="passSearchInputText">
				<div><br/>
					<span class="passSearchFormSpan_name">ID : </span>
					<input type="text" name="pass_name" id="pass_name" size="15"/>
				</div>
				<br/>
				<div>
					<span class="passSeacrchSpan_phone">전화번호 : </span>
					<input type="text" name="pass_phone" id="pass_name" size="15"/>
				</div>
				<br/>
				<input type="submit" value="비밀번호 찾기" />
				<input type="reset" value=" 취소" onClick='self.close()'>
			</div>
		</form>
	</div>
</body>
</html>