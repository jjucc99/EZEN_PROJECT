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
<form action="update.item" method="get">
	코드 : ${infoItem.item_code}<br>
	<input type="hidden" name="item_code" value="${infoItem.item_code}">
	이름 : <input type="text" name="item_name" value="${infoItem.item_name}"><br>
	가격 : <input type="number" name="item_price" value="${infoItem.item_price}"><br>
	정보 : <input type="text" name="item_information" value="${infoItem.item_information}"><br>
	카테고리 : <input type="number" name="cate_code" value="${infoItem.cate_code}"><br>
	<input type="submit" value="업데이트">
</form>


<%-- <form action="realupdate.item" method="post">
	코드 : ${infoItem.item_code}<br>
	이름<input type="text" name="item_name" value="${infoItem.item_name}"><br>
	가격<input type="number" name="item_price" value="${infoItem.item_price}"><br>
	정보<input type="text" name="item_information" value="${infoItem.item_information}"><br>
	카테고리<input type="number" name="cate_code" value="${infoItem.cate_code}"><br>
	<input type="hidden" name="item_code" value="${infoItem.item_code}">
	<input type="submit" value="업데이트">
</form> --%>
</body>
</html>