<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="update.item" method="post">
코드<input type="number" name="item_code"><br>
이름<input type="text" name="item_name"><br>
가격<input type="number" name="item_price"><br>
정보<input type="text" name="item_information"><br>
카테고리<input type="number" name="cate_code"><br>
<input type="submit" value="업데이트">
</form>
</body>
</html>