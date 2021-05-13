<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>2조 프로젝트</title>
<!-- js 참조 -->
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>

<script type="text/javascript" src="js/nav.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<script type="text/javascript" src="js/detail.js"></script>
<script type="text/javascript" src="js/writeForm.js"></script>
<script type="text/javascript" src="js/update.js"></script>
<script type="text/javascript" src="js/delete.js"></script>
<script type="text/javascript" src="js/register.js"></script>
<script type="text/javascript" src="js/boardList.js"></script>
<script type="text/javascript" src="js/ootdmember.js"></script>
<script type="text/javascript" src="js/state.js"></script>
<!-- 부트스트랩 참조 -->

<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>  


<!-- css 참조 -->
<link type="text/css" href="css/board.css" rel="stylesheet">
<link type="text/css" href="css/nav.css" rel="stylesheet">
<link type="text/css" href="css/boardDetail.css" rel="stylesheet">
<link type="text/css" href="css/updateForm.css" rel="stylesheet">
<link type="text/css" href="css/writeForm.css" rel="stylesheet">
<link type="text/css" href="css/footer.css" rel="stylesheet">
<link type="text/css" href="css/bookmark.css" rel="stylesheet">

<!------ font, icon 참조---------->
<link href="https://fonts.googleapis.com/css?family=Rokkitt" rel="stylesheet"> 
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">

</head>
<body>
	<div id="wrap" >				
		<%@ include file="pages/header.jsp" %>
		<div class="clear"></div>
		<%@ include file="pages/nav.jsp" %>
		<c:if test="${ not empty param.body }">
			<jsp:include page="${ param.body }" />
		</c:if>
		<div class="clear"></div>		
	</div>
</body>
</html>