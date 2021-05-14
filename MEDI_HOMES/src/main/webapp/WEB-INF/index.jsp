<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>2차프로젝트</title>

<style>
.silde ul,li{list-style:none; margin-left : 0px;}
.slide{width: 1100px; height:420px;overflow:hidden;}
.slide ul{width:calc(100% * 8);display:flex;animation:slide 20s infinite;} /* slide를 8초동안 진행하며 무한반복 함 */
.slide li{width:calc(100% / 8);height:500px;}
.slide li:nth-child(1){background-image: url(resources/images/001.jpg);width: 1100px; height:420px;}
.slide li:nth-child(2){background-image: url(resources/images/002.jpg);width: 1100px; height:420px;}
.slide li:nth-child(3){background-image: url(resources/images/003.jpg);width: 1100px; height:420px;}
@keyframes slide {
  0% {margin-left:0;} /* 0 ~ 10  : 정지 */
  10% {margin-left:0;} /* 10 ~ 25 : 변이 */
  25% {margin-left:-0%;} /* 25 ~ 35 : 정지 */
  35% {margin-left:-100%;} /* 35 ~ 50 : 변이 */
  50% {margin-left:-100%;}
  60% {margin-left:-100%;}
  75% {margin-left:-200%;}
  85% {margin-left:-200%;}
  100% {margin-left:0;}
}

</style>
<link rel="stylesheet" type="text/css" href="resources/css/main.css" />
<link rel="stylesheet" type="text/css" href="resources/css/map.css" />
<link rel="stylesheet" type="text/css" href="resources/css/healthInfo.css" />
<link rel="stylesheet" type="text/css" href="resources/css/disease.css" />
<link rel="stylesheet" type="text/css" href="resources/css/selfTest.css" />

<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/selfTest.js"></script> 


</head>
<body>
	<div class="page">
		<%@ include file="template/header.jsp" %>
		<jsp:include page="${ param.body }" />
		<%@ include file="template/footer.jsp" %>
	</div>
</body>
</html>
