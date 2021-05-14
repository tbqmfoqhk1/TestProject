<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<article class="article">
	<!--메인 이미지 슬라이드  -->
	<section class="main">
		<div class="slide">
		    <ul>
		      <li></li>
		      <li></li>
		      <li></li>
		      <li></li>
		    </ul>
	  </div>
	</section>
	<!-- 메인 정보 알림  -->
		<div id="project">
			<a name="content"></a>

	<!--  column1 -->
	<div class="project-column column1">
		<!-- 진단 테스트 -->
		<div class="project-section section0101" id="js-section0101" >
			<h2 class="title-big">진단을 한번<br><span class="samll">테스트 해보세요!</span></h2>

			<div class="inner hover">
				<a href="projectSelf_Test" onclick="">
					<h3 class="title">자가 진단 테스트</h3>
					<p class="text">내 몸 쉽게 알아보자!</p>
				</a>
			</div>
		</div>

		<!-- 로고 -->
		<div class="project-section section0102 hover" id="js-section0102">
			<img src="resources/images/main.JPG" style="width : 290px; padding-left : 45px; padding-top : 55px;">
		</div>
	</div>
	<!-- //column1 -->

	<!--  column2 -->
	<div class="project-column column2">
		<!-- 증상백과/질환백과 -->
		<div class="project-section section0201">
			<h2 class="title-big">건강정보가<br><span class="samll">궁금하신가요?</span></h2>
			<div class="inner hover">
				<a href="projectDisease?keyword=1" onclick="projectDisease">
				<h2 class="title">증상백과</h2>
					<p class="text">모든 증상을 한 눈에 알아보자!</p>
				</a>
			</div>
		</div>
		
		<!-- 건강정보 -->
		<div class="project-section section0202">
			<div class="inner hover">
				<a href="projectHealth_Info" onclick="projectHealth_Info">
				<h2 class="title">건강정보</h2>
					<p class="text">더 많은 건강정보를 보러가자!</p>
				</a>
			</div>			
		</div>
	</div>
	<!-- //column2 -->

	<!--  column3 -->
	<div class="project-column column3">
		<!-- 병원 찾기-->
		<div class="project-section section0301">
			<h2 class="title-big">병원찾기를<br><span class="samll">도와드릴까요?</span></h2>
				<div class="inner hover">
					<a href="projectMap?keyword=당뇨병&rate=NaN" onclick="">
					<h2 class="title">증상별로</h2>
						<p class="text">병원을 찾아보자!</p>
					</a>
				</div>
		</div>

		<!-- 의료기기 찾기 -->
		<div class="project-section section0302">
				<div class="inner hover">
					<a href="projectMap02?keyword=진단용방사선발생장치" onclick="">
					<h2 class="title">의료 기기별로</h2>
						<p class="text"> 병원을 찾아보자!</p>
					</a>
				</div>
	</div>
	<!-- //column3 -->
	</div>
</div>
</article>
