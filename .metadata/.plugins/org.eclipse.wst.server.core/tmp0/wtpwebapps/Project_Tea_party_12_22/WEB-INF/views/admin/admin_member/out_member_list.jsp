<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>회원등급</td>
			<td>메일수신 여부</td>
			<td>회원 탈퇴</td>
		</tr>
		<c:forEach items="${list}" var="member">
			<tr>
				<td>${member.mem_id}</td>
				<td>${member.mem_name}</td>
				<td>${member.mem_admin}</td>
				<td>${member.mem_check}</td>
				<td>
					<form action="memberDelete.ad" method="post">
					<input type="hidden" name="mem_id" value="${member.mem_id}">
					<input type="hidden" name="mem_delete" value="${member.mem_delete}">
					<input type="submit"  value="회원 복구 ">
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<button onclick="location.href='memberList.ad'">일반 회원관리</button>
	<button onclick="location.href='admin.ad'">관리자 홈으로</button>
</body>
</html>