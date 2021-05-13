<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="js/reply.js"></script>
<section class="detail-hero">
	<form name="checkForm" id="checkForm" >
		<input type="hidden" name="no" id="no" value="${ board.list_no }"/>
		<input type="hidden" name="pageNum" value="${ pageNum }" />
		<input type="hidden" name="islogin" id="detailLoginchk" value="${sessionScope.isLogin}" />	
		<!-- 
			검색 요청일 경우 다시 keyword에 해당하는 검색 리스트로
			돌려보내기 위해서 아래의 파라미터가 필요하다.
		 -->
		<c:if test="${ searchOption }">
			<input type="hidden" name="keyword" value="${ word }" />
		</c:if>
	</form>
	<div class="detail-all">
		<div class="detail-container">
			<div class="detail-row">	
				<div class ="detail-box">
					<div class="detail-col-lg-8 offset-lg-2" ></div>
					<div class="detail-cardbox-lg bg-white">
						<div class="detailcardbox-headting">
							<div class="detail-media m-0">
								<div class="detail-d-flex mr-3">
									<a href="">
										<img class="idimage" src="images/idimage.png" alt="User">
									</a>
								</div>
								<div class="detail-header">
									<div class="detail-media-body">
										<p class="detail-m-0"> ${ board.m_id } <br>
										<small><span><i class="icon ion-md-pin"></i> today's weather : ${ board.list_weather } </span></small><br>
										<small><span><i class="icon ion-md-temp"></i> temp : ${ board.list_temp }</span></small><br/>
										<small><span><i class="icon ion-md-time"></i> date : ${ board.list_reg_date }</span></small>
										</p>
									</div>
									<div class="detail-button">
										<c:if test="${sessionScope.isLogin}">
											<i id="detailUpdate" class="fas fa-pencil-alt" style= "font-size: 18px;"></i>&nbsp;
											<i id="detailDelete" class="far fa-trash-alt"  style="font-size: 18px;"></i>&nbsp;
										</c:if>		 	   
										<i class="glyphicon glyphicon-log-in" style="font-size:18px;"
											onclick="javascript:window.location.href= 'boardList.mvc?no=${ no }&pageNum=${ pageNum }'"/></i>
									</div>
								</div>
							</div><!--/ media -->
						</div><!--/ cardbox-heading -->		
    					<div class="detailcontainer">
    						<div class="carousel-inner">
      							<div class="item active">
       								<img src="upload/${board.list_img }" alt="Los Angeles" style="max-width: 100%; height: 1000px;">
     							</div>
    						</div>
						</div>
						<div class="detail-header2">
							<div class="detail-like">
								<c:if test="${favchk==0}">
									<i id="thank" class="far fa-heart" style="font-size: 25px;">
									<span class="recommend">(${ favnum })</span>
								</i>
								</c:if>
								<c:if test="${favchk==1}">
									<i id="thank" class="fas fa-heart" style="font-size: 25px;">
									<span class="recommend">(${ favnum })</span>
								</i>
								</c:if>		
							</div>
							<div class="detail-bookmark">
	                            <c:if test="${ bbmk==0 }">
	                                <i id="bookmark" class="far fa-bookmark" style="font-size: 25px;">
	                                </i>
                                </c:if>
                                <c:if test="${ bbmk==1 }">                          
	                                <i id="bookmark" class="bi bi-bookmark-check-fill"  style="font-size: 25px;">	                                
	                                </i>
                                </c:if>
                            </div>
						</div>
						<div class="detail-cardbox-base">
							<div class="detail-contents"><br/>
								착용 제품 :  ${ board.list_content } 
							</div>
							<div class="detail-hash">
								${ board.list_hash }
							</div>	
					<!--  reply 시작 -->
							<div class="replyHeader">
								<div class="reply">
									<span id="replyWrite">
										댓글쓰기
									</span>
								</div>
								<div id="replyTitle">
									<span>
										이 글에 대한 댓글 리스트
									</span>
								</div>
							</div><br/><br/>	
							<c:if test="${ empty replyList }" >
								<div id= "replyList">
									<div class="notReply">
										게시된 댓글이 없습니다
									</div>
								</div>
							</c:if>
							<c:if test="${ not empty replyList }" >
								<div id= "replyList">
									<div id="replyTable">
										<c:forEach var="reply" items="${ replyList }" >
											<div class ="reply_${ reply.no }">
												<div>									
													<div class="replyUser">						
														<span class="member">${ reply.writer }</span>	
													</div>
													<div class="replyModify">
														<span class="reply_date">
															<fmt:formatDate value="${ reply.reg_date}" 
																pattern="yyyy-MM-dd HH:mm:ss" />
														</span>
														<a href="#" class="modifyReply" data-no="${ reply.no }">
															<img src="images/reply_btn_modify.gif" alt="댓글 수정하기"/></a>
														<a href="#" class=deleteReply data-no="${ reply.no }">
															<img src="images/reply_btn_delete.gif" alt="댓글 삭제하기"/></a>
														<a href="javascript:reportReply('${ reply.no }')">
															<img src="images/reply_btn_notify.gif" alt="신고하기"/></a>
													</div>	
													<div class="replyContent" id="div_${ reply.no }">
														<pre><span>${ reply.reply }</span></pre>
													</div>
												</div>
											</div>	
										</c:forEach>
									</div>
								</div>
							</c:if>	
							<div class="replyForm">		
								<form name="replyWriteForm" id="replyWriteForm">				
									<input type="hidden" name="list_no" value="${ board.list_no }"/>
									<input type="hidden" name="replyWriter"  value="midas"/>			
								<div class="replyWriteTable">
								<div>
									<div id="replyWriteTitle" >
										<span>악의적인 댓글은 예고 없이 삭제될 수 있으며 글쓰기 제한과 아이디 삭제 처리됩니다.</span>
									</div>
								</div>
								<div>
									<div class="replyWriteContent">
										<textarea name="replyContent" id="replyContent" rows="4"></textarea>
									</div>
									<div class="replyWriteImage">						
										<input type="image" src="images/reply_btn_write.gif" 
											id="replyWriteButton" alt="댓글 입력" />
									</div>
								</div>
							</div>	
						</form>						
						</div>		
					</div>  
				</div>
			</div><!--/ cardbox -->
			<!--/ col-lg-6 -->	
			<div class="detail-col-lg-1">
			</div><!--/ col-lg-1 -->
		</div><!--/ row -->
		</div>
	</div><!--/ container -->				  
</section>