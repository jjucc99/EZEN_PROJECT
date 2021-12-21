<%@page import="kr.co.ezenac.pay.model.vo.CartListVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
img {
	width: 80px;
	height: 80px;
	object-fit: cover;
}

a {
	text-decoration-line: none;
}
</style>
</head>
<body>
	<h4>SHOPPING CART</h4>
	<h4>배송상품</h4>
	<form action="payment.pay" method="post">
		<table>
			<tr align="center">
				<th></th>
				<th>이미지</th>
				<th>상품명</th>
				<th>판매가</th>
				<th>수량</th>
				<th>합계</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>

			<c:forEach items="${cartList}" var="cartListVO">
				<tr align="center">
					<td><input type="checkbox" name="check" value="Y"></td>
					<td><a href="info.item?item_code=${cartListVO.item_code}"><img src="<spring:url value='/image/${cartListVO.imgPath}'/>"></a></td>
					<td><a href="info.item?item_code=${cartListVO.item_code}">${cartListVO.item_name}</a></td>
					<td>${cartListVO.item_price}</td>
					<td>${cartListVO.cart_amount}</td>
					<td>${cartListVO.sum}</td>
					<td><input type="submit" value="수정"></td>
					<td><input type="button" value="삭제" onclick="location.href='/deleteCart'?cart_no=${cartListVO.cart_no},cart_item_no=${cart_item_no}"></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>