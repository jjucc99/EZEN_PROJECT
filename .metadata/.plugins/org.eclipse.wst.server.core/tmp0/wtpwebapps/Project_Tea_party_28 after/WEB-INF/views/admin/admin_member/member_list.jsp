<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 목록</title>
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
		var sel = document.getElementById('cntPerPage').value;
		location.href="memberList.ad?nowPage=${paging.nowPage}&cntPerPage="+sel;//!!!!
	}
</script>
<body>
<h2>회원 목록</h2>

<div id="outter">
	<div style="float: right;">
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
	</div> <!-- 옵션선택 끝 -->
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>회원등급</td>
			<td>메일수신 여부</td>
			<td>회원 탈퇴</td>
		</tr>
		<c:forEach items="${viewAll}" var="member">
			<tr>
				<td>${member.mem_id}</td>
				<td>${member.mem_name}</td>
				<td>${member.mem_admin}</td>
				<td>${member.mem_check}</td>
				<td>
					<form action="memberDelete.ad" method="post">
					<input type="hidden" name="mem_id" value="${member.mem_id}">
					<input type="hidden" name="mem_delete" value="${member.mem_delete}">
					<input type="submit"  value="회원 탈퇴 ">
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
	<button onclick="location.href='outMemberList.ad'">탈퇴 회원관리</button>
	<button onclick="location.href='admin.ad'">관리자 홈으로</button>
	
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/memberList.ad?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p}</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/memberList.ad?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/memberList.ad?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
</div>
</body>
</html>