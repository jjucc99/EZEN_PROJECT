<%@page import="kr.co.ezenac.board.model.vo.BoardVO"%>
<%@page import="kr.co.ezenac.board.model.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 조회</title>
</head>
<body>
<h2>게시글 정보</h2>
<form action="select.board" method="post">
글번호 : ${board.board_no}<br>
		제목<input type="text" name="board_sub" value="${board.board_sub}"><br>
		내용<input type="text" name="board_content" value="${board.board_cotent}"><br>
		분류<input type="text" name="board_board" value="${board.board_board}"><br>
		아이디<input type="text" name="mem_id" value="${board.mem_id}"><br>
		번호<input type="number" name="board_no" value="${board.board_no}">
		<input type="hidden" name="board_no" value="${board.board_no}">
		<input type="submit" value="수정">
</form>
<a href="page.board">게시글 리스트로 이동</a>
</body>
</html>