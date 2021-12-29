<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String checkLogin = (String) session.getAttribute("checkLogin");
	%>
	session
	<%=checkLogin%><br>
	<%
		if (checkLogin == "success") {
	%>
	<form action="boardUpdate.ad" method="post">
		글번호 ${board.board_no}<br>
		글제목<input type="text" name="board_sub" value="${board.board_sub}"><br>
		작성 일자 ${board.board_date}<br>
		작성자${board.mem_id}<br>
		글 내용<br><textarea rows="5" cols="50" style="resize: none;" name="board_content">${board.board_content}</textarea><br>
		<input type="hidden" name="board_no" value="${board.board_no}">
		<input type="submit" value="수정">
		<input type="button" value="게시글 리스트로 이동" onclick="location.href='boardList.ad'">
	</form>
	<form action="boardDelete.ad" method="post">
		<input type="hidden" value="${board.board_no}" name="board_no">
		<input type="submit" value="글 삭제">
	</form>
	<%
		} else {
	%>
	<a href="/">로그인 페이지로 이동 </a>
	<%
		}
	%>
</body>
</html>