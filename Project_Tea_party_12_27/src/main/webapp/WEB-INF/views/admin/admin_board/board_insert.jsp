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
	String mem_id=(String)session.getAttribute("mem_id");
%>
<form action="boardInsert.ad" method="post">
		글번호 <input type="text" name="board_no"><br>
		글제목<input type="text" name="board_sub"><br>
		작성자<%=mem_id%><br>
		글 내용<br><textarea rows="5" cols="50" style="resize: none;" name="board_content"></textarea><br>
		<input type="hidden" name="board_board" value="notice">
		<input type="hidden" name="mem_id" value="<%=mem_id%>">
		<input type="submit" value="공지 등록">
		<input type="button" value="게시글 리스트로 이동" onclick="location.href='boardList.ad'">
	</form>
</body>
</html>