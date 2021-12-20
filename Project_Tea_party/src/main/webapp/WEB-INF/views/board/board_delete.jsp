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
	번호<input type="number" name="board_no"><br>
		<input type="submit" value="삭제">

</form>
</body>
</html>