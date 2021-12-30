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
	<form action="boardUpdate.ad" method="post">
		글번호 ${board.board_no}<br>
		글제목<input type="text" name="item_price" value="${board.board_sub}"><br>
		작성 일자 ${board.board_date}<br>
		작성자<input type="text" name="item_count" value="${board.mem_id}"><br>
		글 내용<input type="text" name="item_information" value="${board.board_content}"><br>
		<input type="hidden" name="board_no" value="${board.board_no}">
		<input type="submit" value="수정">
		<input type="button" value="게시글 리스트로 이동" onclick="location.href='boardList.ad'">
	</form>
	<button onclick="location.href='itemDelete.ad?item_code=${item.item_code}'">DELETE</button>
</body>
</html>