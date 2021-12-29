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

<!-- <br>
<a href="addForm.item">상품 추가</a>
<br>
<a href="deleteForm.item">상품 삭제</a>
<br>
<a href="updateForm.item">상품 수정</a>
<br>
<a href="list.item">상품 목록</a>
<br>
<br> -->
<h3>카테고리</h3>
<a href="cate.item?cate_code=1">홍차</a>
<br>
<a href="cate.item?cate_code=2">허브차</a>
<br>
<a href="cate.item?cate_code=3">전통차</a>
<br>
<a href="cate.item?cate_code=4">커피</a>
<br>
<a href="cate.item?cate_code=5">티웨어</a>
<br>
<form action="review.item" method="post">
	<input type="number" name="item_code">
	<input type="submit" value="전송">	
</form>
</body>
</html>