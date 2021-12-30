<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="reviewUpdate.item" method="post">
	리뷰번호 : ${review.r_board_no}<br>
	리뷰제목 : <input type="text" name="r_board_sub" value="${review.r_board_sub}"><br>
	이미지 : <img alt="없음" src="<c:url value='/image/${review.img_path}'/>"><br>
	리뷰내용 : <textarea rows="5" cols="50" style="resize: none;" name="r_board_content">${review.r_board_content}</textarea><br>
	<input type="hidden" value="${review.r_board_no}" name="r_board_no">
	<input type="hidden" value="${review.item_code}" name="item_code">
	<br>
	<input type="submit" value="수정">&nbsp;&nbsp;
</form>
</body>
</html>