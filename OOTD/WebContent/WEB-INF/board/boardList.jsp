<%--메인 & 검색 페이지--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<article style="width : 70%;">
<!-- 검색 창 -->
<script>
$(document).ready(function() {
	
$("#form1").show(function(e) {

        var choice = $("input[type=checkbox]:checked").val();

        /* 폼 양식에 입력된 데이터를 다음과 같은 파라미터 문자열(쿼리스트링)로 읽어온다.
         * "searchOption=1&id=midas
         **/
        var param = $(this).serialize();
        var result;

        // $.ajax() 메소드를 이용해 POST 방식으로 요청하고 JSON 데이터 받기
        $.ajax({
            url: "ajax/ajaxObjectGson.jsp",
            type: "POST",
            data: param,
            dataType: "json",
            success: function(data) {

                $("#result").empty();

                $("<table id='memberTable'></table>").appendTo("#result");

                console.log("datalength: " + $(data).length);
                for(var i = 0; i < $(data).length; i++) {

                    $("<tr><td><span class='keywords'>" + $(data).get(i).word + "</span></td></tr>")
                    .appendTo("#memberTable");
                }
            },
            error: function(xhr, statusText, error) {
                alert("error : " + statusText + ", " + xhr.status);
            }
        });

        // 기본 이벤트 제거
        return false;
    });

    $(document).on("click", ".keywords", function() {
        var keyword = $(this).text();
        console.log(keyword);
        $("#keyword").val(keyword);
        $("#searchForm").submit();

    });

});
</script>
	<div class="searchBoard">
		<div class="searchMain"></div>
		<div class="searchSection">
			<section class="searchMainV2">
				<div class="searchHead">
					<img src="images/Delete.JPG" class="Delete"/>
				</div>
				<div class="headroom-wrapper" style="height: 20px;"></div>
				<div class="searchOption">
					<form id="searchForm">
						<div class="searchBar" >
							<input placeholder="검색어를 입력 해주세요" type="text" class="search" id="keyword" name="keyword"/>
							<button class="searchGo">
								<img src="images/glass.png" id="glass" class="glass"/>
							</button>
						</div>
					</form>	
					<div class="styleSearch">
						<div class="styleSheet">스타일 검색</div>
							<div class="styleLink">
								<!-- 해시태그 리스트로 리스트 변경하기 -->
								<input id="btn_hash_1" class="tag" type="button" value="클래식.">
								<input id="btn_hash_2" class="tag" type="button" value="미니멀리즘.">
								<input id="btn_hash_3" class="tag" type="button" value="컨템포러리.">
								<input id="btn_hash_4" class="tag" type="button" value="아메리칸캐주얼.">
								<input id="btn_hash_5" class="tag" type="button" value="아메카지.">
								<input id="btn_hash_6" class="tag" type="button" value="스트릿.">
								<input id="btn_hash_7" class="tag" type="button" value="캐주얼.">
								<input id="btn_hash_8" class="tag" type="button" value="모던.">
								<input id="btn_hash_9" class="tag" type="button" value="미니멀.">
								<input id="btn_hash_10" class="tag" type="button" value="레트로.">
								<input id="btn_hash_11" class="tag" type="button" value="매니쉬.">
							</div>	
							
					<div class="searchPopular">인기 검색어</div>
						<form name="form1" id="form1">
							<div class="searchRank">
								<div class="searchOne"><input type="checkbox" name="searchOne" value="2" checked />
									</div>
								</div>
							</form>
						<div id="result"></div>
					</div>
				</div>
		</section>
		</div>
	  	<div class="list-header">
			<div class="list-search">
				<img class="search_img" src="images/c1.JPG" width="50" 
					height="50" />
			</div>
		</div>
		<div class="list-content" >
			<c:if test="${ not searchOption and not empty boardList }">
				<div class="list-cont_wrap">
			 		<div class="list-product_wrap">	
			 			<div class="list-product" style="position: relative; height: 2120px;">
			 				<c:forEach var="o" items="${boardList}" varStatus="status">	
								<div class="list-box">
	 								<a href="boardDetail.mvc?no=${ o.list_no }&pageNum=${ currentPage }" >
	 									<img src="upload/${o.list_img }" class="list-ad"  />
	 								</a>
	 							</div>
							</c:forEach>
			 			</div>
			 		</div>
			 	</div>
			 	<div class="listPage">
		 			<c:if test="${ startPage > pageGroup}">
						<a href="boardList.mvc?pageNum=${startPage - pageGroup}">[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}" >
						<c:if test="${ i == currentPage }">
							[ ${i} ]
						</c:if>
						<c:if test="${ i != currentPage }">
							<a href="boardList.mvc?pageNum=${i}"> [ ${i} ] </a>
						</c:if>
					</c:forEach>
					<c:if test="${endPage < pageCount}">
						<a href="boardList.mvc?pageNum=${startPage + pageGroup}">[다음]</a>
					</c:if>
				</div>						
	 		</c:if>
	 		<c:if test="${ not searchOption and empty boardList }">
				<div class="list-cont_wrap">
			 		<div class="list-product_wrap">	
			 			<div class="list-product" style="position: relative; height: 2120px;">
			 				게시글이 없습니다
			 			</div>
			 		</div>
			 	</div>
			 	</c:if>
	 		<c:if test="${ searchOption and not empty boardList }">
				<div class="list-cont_wrap">
			 		<div class="list-product_wrap">	
			 			"${word}"에 관한 글
			 			<div class="list-product" style="position: relative; height: 2120px;">
			 				<c:forEach var="o" items="${boardList}" varStatus="status">	
								<div class="list-box">
	 								<a href="boardDetail.mvc?no=${ o.list_no }&pageNum=${ currentPage }&keyword=${word}" >
	 									<img src="upload/${o.list_img }" class="list-ad"  />
	 								</a>
	 							</div>
							</c:forEach>
			 			</div>
			 		</div>
			 	</div>
			 	<div class="listPage">
		 			<c:if test="${ startPage > pageGroup}">
						<a href="boardList.mvc?pageNum=${startPage - pageGroup}">[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}" >
						<c:if test="${ i == currentPage }">
							[ ${i} ]
						</c:if>
						<c:if test="${ i != currentPage }">
							<a href="boardList.mvc?pageNum=${i}"> [ ${i} ] </a>
						</c:if>
					</c:forEach>
					<c:if test="${endPage < pageCount}">
						<a href="boardList.mvc?pageNum=${startPage + pageGroup}">[다음]</a>
					</c:if>
				</div>
				</c:if>
	 		<c:if test="${ searchOption and empty boardList }">
				<div class="list-cont_wrap">
			 		<div class="list-product_wrap">	
			 			<div class="list-product" style="position: relative; height: 2120px;">
			 				"${word}"에 관한 게시글이 없습니다
			 			</div>
			 		</div>
			 	</div>
			 	</c:if>
		</div>
	</div>
</article>



