<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>게시글 수정</h2>
<form action="update.board"  method="post">
<fieldset>
<legend>게시글 수정</legend>
번호 : <input type="number" name="board_no"><a style="color:red" ><font size="1">번호는 수정이 불가능합니다.</font></a><br>
제목 : <input type="text" name="board_sub"><br>
내용 : <input type="text" name="board_content"><br>
작성일 : <input type="date" name="board_date"><br>
게시글 분류 : <input type="text" name="board_board"><br> 
아이디 : <input type="text" name="mem_id"><br>
<input type="submit" value="수정"/>
<input type="reset" value="취소"/>
</fieldset>
<br>
<a href="list.board">게시글 리스트</a>
</form>
</body>
</html>