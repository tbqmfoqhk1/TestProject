<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<article class="article">
	<div id="content" tabindex="0" class="defaultCont">
		<div class="subContHeader">
			<h3 class="subTitle">
				식사요법 <span style="font-size: 14px;"></span>
			</h3>
		</div>
		
		<div class="healthinfoWrap" style="margin-bottom: -9px;">
			<div class="topVisualWrap" style="height: 258px;">
				<!-- 추천 이미지  -->
				<ul class="topListWrap">
					<li><span> <img width="154" height="136"
							src="resources/images/health_info/health_21.jpg"
							alt="후천성면역결핍증식단">
						</span>
						<dl>
							<dt class="txtellipsis" style="width: 165px;">
								<p>후천성면역결핍증식단</p>
							</dt>
						</dl>
					</li>
					<li>
						<span> <img width="154" height="136"
								src="resources/images/health_info/health_34.jpg" 
								alt="후두암식단">
						</span>
						<dl>
							<dt class="txtellipsis" style="width: 88px; margin: 0 auto;">
								<p>후두암식단</p>
							</dt>
						</dl>
					</li>
					<li>
						<span> 
							<img width="154" height="136" 
								src="resources/images/health_info/health_65.jpg" 
								alt="패혈증식단">
						</span>
						<dl>
							<dt class="txtellipsis" style="width: 88px; margin: 0 auto;">
								<p>패혈증식단</p>
							</dt>
						</dl>
					</li>
					<li>
						<span>
							<img width="154" height="136" 
								src="resources/images/health_info/health_80.jpg" 
								alt="저퓨린식단">
						</span>
						<dl>
							<dt class="txtellipsis" style="width: 88px;margin: 0 auto;">
								<p >저퓨린식단</p>
							</dt>
						</dl>
					</li>
				</ul>
			</div>
			<!-- 사진 리스트 출력 -->
			<div class="listTypeSec2 photoType">
				<div class="listCont">
					<ul>
						<!-- forEach문 출력  -->
					<c:if test="${ not empty projectHealthInfoList }">
						<c:forEach var="h" items="${ projectHealthInfoList   }" varStatus="status"> 
						<li>	
							<strong class="photo2"> 
								<img width="192"	src="resources/images/health_info/${h.img}"
									 alt="${h.titles}">
							</strong>
							<dl>
								<dt>
									<p class="txtellipsis" style="color : steelblue;">${h.titles }</p>
								</dt>
								<dd>
									${h.contents }
								</dd>
							</dl>
						</li>
						</c:forEach>
					</c:if>
					</ul>
				</div>
			</div>
		</div>
		
		<div class="pageNum">
		<c:if test="${ startPage > pageGroup }">
			<a href="projectHealth_Info?pageNum=${ startPage - pageGroup }">
				←</a>
		</c:if>
		<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
			<c:if test="${ i == currentPage }">
				${ i }
			</c:if>
			<c:if test="${ i != currentPage }">
				<a href="projectHealth_Info?pageNum=${ i }">  ${ i } </a>
			</c:if>
		</c:forEach>
		<c:if test="${ endPage < pageCount }">
			<a href="projectHealth_Info?pageNum=${ startPage + pageGroup }">
			→</a>
		</c:if>
		</div>
		<div class="IwannaBack">
			<a href="javascript:history.back(-1)">뒤로가기</a>
		</div>
		
	</div>
</article>
