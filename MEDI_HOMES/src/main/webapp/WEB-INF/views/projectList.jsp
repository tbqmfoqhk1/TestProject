<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<article class="article">
	<c:if test="${ not empty pList }">
	<c:forEach var="p" items="${ pList }" varStatus="status">
		${p.no}${p.area}${p.name}${p.disease}
		${p.grade}${p.lat}${p.log} 
	</c:forEach>
	</c:if>
	
	<c:if test="${ empty pList }">
		게시 글 존재 노노 
	</c:if>
</article>
