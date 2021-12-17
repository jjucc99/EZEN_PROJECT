<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	test.jsp임
	이건 아이템 하나 정보<br>
	<form action="item_info.ad" method="post">
		<input type="number" name="item_code">
		<input type="submit">
	</form>
	<br>
	아이템 리스트 뽑기
	<form action="item_list.ad" method="post">
		<input type="submit">
	</form>
</body>
</html>