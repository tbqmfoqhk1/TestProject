<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<aside>	
	<div class="navbar navbar-inverse navbar-twitch" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">
					<span class="small-nav"> <span class="logo"> 2조 </span> </span>
					<span class="full-nav"> "OOTD" </span>
				</a>
			</div>
			<div class="">
				<ul class="nav navbar-nav">
					<li class="active">
						<a href="index.mvc">
							<span class="small-nav" data-toggle="tooltip" data-placement="right" title="Main"> 
								<span class="glyphicon glyphicon-home"></span> 
							</span>
							<span class="full-nav"> Main </span>
						</a>
					</li>
					<li id="nav_weather">
						<form id="nav_weatherForm">
							<input type="hidden" name="array_weather" id="array_weather"/>
							<input type="hidden" name="array_maxTemp" id="array_maxTemp"/>	
							<input type="hidden" name="array_minTemp" id="array_minTemp"/>
							<input type="hidden" name="array_date" id="array_date"/>
							<a href="#">
								<span class="small-nav" data-toggle="tooltip" data-placement="right" title="Weekly Weather"> 
									<i class="fas fa-cloud-sun"></i> 
								</span>
								<span class="full-nav"> Weekly Weather </span>
							</a>
						</form>
					</li>
					<c:choose>
						<c:when test="${ sessionScope.isLogin }" >
						<li>
							<a href="writeForm.mvc"> 
								<span class="small-nav" data-toggle="tooltip" data-placement="right" title="Write Board">
					 				<i class="far fa-edit" /></i>
			 					</span>
			 					<span class="full-nav"> Write Board </span>
			 				</a>
		 				</li>	
						</c:when>
					</c:choose>
					<c:choose>
					<c:when test="${ sessionScope.isLogin }" >
					<li>
						<a href="bookmark.mvc">
							<span class="small-nav" data-toggle="tooltip" data-placement="right" title="Bookmark"
								style="padding: 11px 9px 9px 10px;"> 
								<i class="far fa-bookmark"  style="padding-left : 5px;"></i>
							</span>
							<span class="full-nav"> Bookmark </span>
						</a>
					</li>
					<li>
						<a href="myPage.mvc">
							<span class="small-nav" data-toggle="tooltip" data-placement="right" title="My Page"> 
								<i class="fas fa-user"  style="padding-left : 2px;"></i>
							</span>
							<span class="full-nav"> My Page </span>
						</a>
					</li>
					</c:when>
					</c:choose>	
					<c:choose>
					<c:when test="${ not sessionScope.isLogin }">
					<li>
						<a href="loginForm.mvc">
							<span class="small-nav" data-toggle="tooltip" data-placement="right" title="Login"> 
								<i class="fas fa-lock-open"></i>
							</span>
							<span class="full-nav"> Login </span>
						</a>
					</li>
					</c:when>
					<c:when test="${ sessionScope.isLogin }" >
						<li>					
							<a href="logout.mvc" id="formLogout">
								<span class="small-nav" data-toggle="tooltip" data-placement="right" title="Logout"> 
									<i class="fas fa-lock"></i>
								</span>
								<span class="full-nav"> Logout</span>
							</a>
						</li>
					</c:when>
					</c:choose>	
				</ul>
			</div><!--/.nav-collapse -->
		</div>
	</div>
	<button type="button" class="btn btn-default btn-xs navbar-twitch-toggle">
		<span class="glyphicon glyphicon-chevron-right nav-open"></span>		
		<span class="glyphicon glyphicon-chevron-left nav-close"></span>
	</button>
</aside>