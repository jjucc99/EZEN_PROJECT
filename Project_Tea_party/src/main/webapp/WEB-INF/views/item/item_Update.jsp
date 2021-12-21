<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
table {
	border: 1px  solid black;
 	border-collapse : collapse;
}
</style>
<title>Insert title here</title>
</head>
<body>

<form action="update.item" method="post">
	<fieldset>
	<legend>상품 수정</legend>
	코드 : <input type="text" name="item_code"><a style="color:red" ><font size="1">코드는 수정이 불가능합니다.</font></a><br>
	이름 : <input type="text" name="item_name"><br>
	가격 : <input type="number" name="item_price"><br>
	상품 정보 : <input type="text" name="item_information"><br>
	카테고리 코드 : <input type="number" name="cate_code"><br>
	<input type="submit" value="수정하기">	
	</fieldset>
	<br>
	<a href="listForm.item">상품 리스트</a>
</form>

</body>
</html>