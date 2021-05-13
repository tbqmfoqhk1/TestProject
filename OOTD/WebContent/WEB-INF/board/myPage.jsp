<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
	<input type="hidden" name="no" value="${ board.list_no }"/>	
	<input type="hidden" name="pageNum"  value="${pageNum }"/>
	<input type="hidden" name="keyword"  value="${ keyword }"/>
		<section class="writebox" style="text-align : center;
														font-family: ui-monospace;" >
			<div class="wirtebox1">
                  <div class="writer1">
                  	<span  name="id" class="id" >${ sessionScope.m_id } 님,<br/>
							안녕하세요!</span><br/><br/><br/>
                  </div><br/><br/>
                    
               <div class="write2" >           
                	 <a href="registerUpdateForm.mvc">계정 설정</a> <br/><br/>
                	       
                     <!-- <a href="bookmark.mvc">관심 목록</a> <br/><br/> -->
                     
                     <a href="logout.mvc">로그 아웃</a><br/><br/>
                     
                     <a href="deleteForm.mvc">탈퇴하기</a><br/><br/><br/>
               </div> <br/><br/>
               
           
         </div>
		<%@ include file="../pages/footer.jsp" %>

			
		</section>
</article>
