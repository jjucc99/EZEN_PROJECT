<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<body>
<h2>게시글 작성</h2>
<form action="insert.board" method="post">
<div>
글번호
<input type="number" name="board_no" id="no" size="80" placeholder="글번호를 입력해주세요">
</div>
<div>
제목
<input name="board_sub" id="sub" size="80" placeholder="제목을 입력해주세요">
</div>
<div>
내용
<textarea name="board_content" id="content" rows="4" cols="80" placeholder="내용을 입력해주세요"></textarea>
</div>
<div>
등록일
<input type="date" name="board_date" id="date" size="80" placeholder="등록일을 입력해주세요">
</div>
<div>
게시판 분류
<input name="board_board" id="board" size="80" placeholder="분류 입력해주세요">
</div>
<div>
아이디(작성자)
<input name="mem_id" id="mem_id" placeholder="아이디를 입력해주세요">
</div>
<div style="width:650px; text-align: center;">
<input type="submit" value="확인">
<button type="reset">취소</button>
</div>
<input type="button" value="목록" onclick="location.href='list.board'">
</form>

</body>
</html>