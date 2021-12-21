<%@page import="kr.co.ezenac.board.model.vo.BoardVO"%>
<%@page import="kr.co.ezenac.board.model.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제 리스트</title>
</head>
<body>
<form action="delete.board" method="post">
		<input type="text" name="board_no">
		<input type="submit">

<input type="text" name="board_no" value="${board.board_no}">
<input type="submit" value="삭제">
<input type="button" value="목록" onclick="location.href=list.board'">

</form>
</body>
</html>