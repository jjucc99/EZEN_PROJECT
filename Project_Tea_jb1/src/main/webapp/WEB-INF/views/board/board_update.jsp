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
<form action="update.board"  method="post"  action="${path}update.board?no=${board_no}">
<div class="update">
<label for="board_no">번호</label> <form:input type="text" value="${board.board_no}" id="board_no" placeholder="번호를 입력해주세요"/>
</div>
<div class="update">
<label for="board_sub">제목</label> <form:input type="text" value="${board.board_sub}" id="board_sub" placeholder="제목을 입력해주세요"/>
</div>

 <input type="text" value="${board.mem_id}" id="mem_id" placeholder="아이디를 입력해주세요"/>
</div>
<div class="update">
<label for="board_content">내용</label>
<form:textarea row="5" id="board_content" placeholder="내용을 입력해 주세요"/>
</div>
<div>
<input type="submit" value="수정"/>
<input type="reset" value="취소"/>
<input type="button" value="목록" onclick="location.href='list.board'">
</div>
</form>
</body>
</html>