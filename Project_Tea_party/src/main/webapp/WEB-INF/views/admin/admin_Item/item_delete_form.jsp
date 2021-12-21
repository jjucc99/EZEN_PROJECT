<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="itemDelete.ad" method="post">
		삭제할 상품 이름 기입<input type="text" name="item_name"><br>
		<input type="submit">
	</form>
	<button onclick="location.href='itemList.ad'">상품 리스트로 이동</button>
</body>
</html>
