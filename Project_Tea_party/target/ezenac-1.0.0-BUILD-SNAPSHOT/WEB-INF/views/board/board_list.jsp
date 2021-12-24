<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<h2>게시글 목록</h2>
<table border="1" width="600px">
		<tr align="center">
			<th>글번호</th>
			<th>글제목</th>
			<th>글내용</th>
			<th>등록일</th> 
			<th>게시판 분류</th>
			<th>아이디</th>
		</tr>
	<c:forEach items="${list}" var="board"><br>
	<tr align="center">
	<td>${board.board_no}</td>
	<td>${board.board_sub}</td>
	<td>${board.board_content}</td>
	<td>${board.board_date}</td>
	<td>${board.board_board}</td>
	<td>${board.mem_id}</td>
	</tr>	
	</c:forEach>
	</table>
	<br>
	<input type="button" value="글쓰기" onclick="location.href='insert1.board'">
	
</body>
</html>