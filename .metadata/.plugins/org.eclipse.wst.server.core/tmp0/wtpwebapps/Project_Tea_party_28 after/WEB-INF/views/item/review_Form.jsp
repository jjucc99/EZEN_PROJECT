<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2></h2>

<form action="reviewInsert.item" method="post" enctype="multipart/form-data">

	리뷰제목 : <input type="text" value="" name="r_board_sub"><br>
	리뷰내용 : <textarea rows="5" cols="50" style="resize: none;" name="r_board_content"></textarea><br>
	이미지 첨부 : <input type="file" name="image"/><br><br><br>
	<input type="hidden" value="${item_code}" name="item_code">
	${item_code}
	<input type="submit" value="리뷰작성">
</form>
</body>
</html>