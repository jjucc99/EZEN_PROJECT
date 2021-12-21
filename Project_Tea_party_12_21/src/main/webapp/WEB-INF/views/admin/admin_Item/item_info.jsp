<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="itemUpdate.ad" method="post">
		<img src="<spring:url value='/image/${item.img_path}'/>" alt="없음"><br>
		상품코드 ${item.item_code}<br>
		상품명<input type="text" name="item_name" value="${item.item_name}"><br>
		상품가격<input type="text" name="item_price" value="${item.item_price}"><br>
		상품정보<input type="text" name="item_information" value="${item.item_information}"><br>
		카테고리 ${item.cate_name}<br>
		카테고리 번호<input type="text" name="cate_code" value="${item.cate_code}"><br>
		수량<input type="text" name="item_count" value="${item.item_count}"><br>
		<input type="hidden" name="item_code" value="${item.item_code}">
		<input type="submit" value="수정">
		<input type="button" value="상품 리스트로 이동" onclick="location.href='itemList.ad'">
	</form>
	<button onclick="location.href='itemDelete.ad?item_code=${item.item_code}'">DELETE</button>
카테고리 번호
1=홍차
2=허브차
3=커피
4=과일청
5=티웨어
</body>
</html>