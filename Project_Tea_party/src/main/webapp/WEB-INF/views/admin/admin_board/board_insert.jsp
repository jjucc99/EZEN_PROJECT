<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String mem_id = (String) session.getAttribute("mem_id");
	%>
	<%
		String checkLogin = (String) session.getAttribute("checkLogin");
	%>
	session
	<%=checkLogin%><br>
	<%
		if (checkLogin == "success") {
	%>

	<form action="boardInsert.ad" method="post">
		글제목<input type="text" name="board_sub"><br> 작성자<%=mem_id%><br>
		글 내용<br>
		<textarea rows="5" cols="50" style="resize: none;" name="board_content"></textarea>
		<br>
		<input type="hidden" name="board_board" value="notice">
		<input type="hidden" name="mem_id" value="<%=mem_id%>">
		<input type="submit" value="공지 등록">
		<input type="button" value="게시글 리스트로 이동" onclick="location.href='boardList.ad'">
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