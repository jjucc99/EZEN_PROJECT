<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		글번호 ${board.board_no}<br>
		글제목${board.board_sub}<br>
		작성 일자 <fmt:formatDate value="${board.board_date}"/><br>
		작성자${board.mem_id}<br>
		글 내용
		<br>
		<textarea rows="10" cols="100" readonly="readonly" style="resize: none;">${board.board_content}</textarea>
		<br>
		<button onclick="location.href='noticeList.board'">공지 리스트로 이동</button>
</body>
</html>