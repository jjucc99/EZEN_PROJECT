<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="itemUpdate.ad" method="post">
		${item.item_code}<br>
		<input type="text" name="item_name" value="${item.item_name}"><br>
		<input type="text" name="item_price" value="${item.item_price}"><br>
		<input type="text" name="item_information" value="${item.item_information}"><br>
		<input type="text" name="cate_code" value="${item.cate_code}"><br>
		<input type="hidden" name="item_code" value="${item.item_code}">
		<input type="submit" value="수정">
		<input type="button" value="상품 리스트로 이동" onclick="location.href='itemList.ad'">
	</form>
</body>
</html>