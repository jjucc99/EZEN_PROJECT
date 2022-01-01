<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지 목록</title>
</head>
<style>
h2 {
	text-align: center;
}

table {
	width: 100%;
}

#outter {
	display: block;
	width: 60%;
	margin: auto;
}

a {
	text-decoration: none;
}
</style>
<script>
	function selChange() {
		location.href = "noticeList.board?nowPage=${paging.nowPage}";//!!!!
	}
</script>
<body>
	<h2>공지 목록</h2>
		<!-- 옵션선택 끝 -->
		<table border="1">
			<tr>
				<td>글번호</td>
				<td>제목</td>
				<td>작성일자</td>
				<td>작성자</td>
				<td>조회</td>
			</tr>
			<c:forEach items="${viewAll}" var="board">
				<tr>
					<td>${board.board_no}</td>
					<td>${board.board_sub}</td>
					<td><fmt:formatDate value="${board.board_date}"/></td>
					<td>${board.mem_id}</td>
					<td><button onclick="location.href='noticeInfo.board?board_no=${board.board_no}'">조회</button></td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<button onclick="location.href='/main'">홈으로</button>
		<!-- !!!!!! -->
		<div style="display: block; text-align: center;">
			<c:if test="${paging.startPage != 1 }">
				<a
					href="/noticeList.board?nowPage=${paging.startPage - 1}">&lt;</a>
				<!-- !!!!!! -->
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
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