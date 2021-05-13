<%--
	비밀번호 찾기 페이지에서 비밀번호 변경
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/ootdmember.js"></script>
<title>비밀번호 체크</title>
</head>
<body>
	<div id="passSearchDiv">
		<h3>비밀번호 찾기 - 비밀번호 변경</h3>	
		<br/>
		<form action="passSearchUpdate.mvc" name="passSearchUpdateForm" 
			method="post" id="passSearchUpdateForm">
			<div class="passSearchUpdateInputText">
				<div>
					<span class="passSearchFormUpdateSpan_name">ID : ${ sessionScope.id }</span><br/><br/>
					<span class="passSeacrchUpdateSpan_phone">Phone : ${ sessionScope.phone }</span>
				</div>
				<div>
					<span class="passSeacrchUpdateSpan_pass1">비밀번호 : </span>
					<input type="password" name="passUpdate_pass1" id="passUpdate_pass1" size="15"/><br/><br/>
					<span class="passSeacrchUpdateSpan_pass2">비밀번호 확인 : </span>
					<input type="password" name="passUpdate_pass2" id="passUpdate_pass2" size="15"/>
				</div><br/>
				<input type="submit" value="비밀번호 변경" />
				<input id="passUpdate_cancel" type="button" value=" 취소" onClick='self.close()'>
			</div>
		</form>
	</div>
</body>
</html>