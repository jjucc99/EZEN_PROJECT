<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA</title>
</head>
<body>
<h3>QnA</h3>
글번호 (시퀀스), 제목 (qna댓글 수), 작성자, 작성일<br>
<c:forEach items="${qnaList}" var="qna">

<span>${qna.board_no}</span>
<span>${qna.board_sub}</span><span><c:if test="${qna.replyCount!=0}">(${qna.replyCount})</c:if></span>
<span><fmt:formatDate value="${qna.board_date}"/></span>
<span>${qna.mem_id}</span>
<br>
</c:forEach>
<input type="button" value="작성">

<!-- !!!!!! -->
		<div style="display: block; text-align: center;">
			<c:if test="${paging.startPage != 1 }">
				<a
					href="/noticeList.board?nowPage=${paging.startPage - 1}">&lt;</a>
				<!-- !!!!!! -->
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage}"
				var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<b>${p}</b>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<a
							href="/noticeList.board?nowPage=${p}">${p}</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a
					href="/noticeList.board?nowPage=${paging.endPage+1}">&gt;</a>
			</c:if>
		</div>
</body>
</html>