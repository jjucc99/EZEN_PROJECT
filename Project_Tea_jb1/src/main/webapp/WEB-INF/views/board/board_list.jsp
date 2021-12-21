<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
</head>
<body>
<h2>게시글 목록</h2>
<table border="1" width="600px">
		<tr>
			<th>글번호<br></th>
			<th>글제목<br></th>
			<th>글내용<br></th>
			<th>등록일<br></th> 
			<th>게시판 분류<br></th>
			<th>아이디<br></th>
		</tr>
	<c:forEach items="${list}" var="board"><br>
	<tr>
	<td><a href="select.board?board_no=${board.board_no}">${board.board_no}</a>
	<input type="hidden" name="board_no" value="${board.board_no}"></td>
	<td><input type="text" name="board_sub" value="${board.board_sub}"></td>
	<td><input type="text" name="board_content" value="${board.board_content}"></td>
	<td><input type="text" name="board_date" value="${board.board_date}"></td>
	 
	<td><a href="update.board?board_no=${board.board_no}">게시글 수정</a>
	<td><a href="delete.board?board_no=${board.board_no}">게시글 삭제</a></td>  
	</tr>
	</c:forEach>
	</table>
	<input type="button" value="글쓰기" onclick="location.href='insert.board'">
	
</body>
</html>