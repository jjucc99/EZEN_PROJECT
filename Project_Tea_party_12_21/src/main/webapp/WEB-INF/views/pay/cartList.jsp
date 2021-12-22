<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="<c:url value='/resources/js/pay/cart.js'/>"></script>
<style type="text/css">
img {
	width: 80px;
	height: 80px;
	object-fit: cover;
}

a {
	text-decoration-line: none;
}

input[type='number'] {
	width: 40px;
}
</style>
</head>
<body>

	<%
		String checkLogin = (String) session.getAttribute("checkLogin");
	%>
	session
	<%=checkLogin%>
	<%
		if (checkLogin == "success") {
	%>
	
	<h4>SHOPPING CART</h4>
	<h4>배송상품</h4>
	<table>
		<tr align="center">
			<th></th>
			<th>이미지</th>
			<th>상품명</th>
			<th>판매가</th>
			<th>수량</th>
			<th>합계</th>
			<th>수량수정</th>
			<th>삭제</th>
		</tr>
		<c:choose>
		<c:when test="${count==0}">
		 <th colspan="8">장바구니가 비어있습니다.</th>
		</c:when>
		<c:otherwise>
		<c:forEach items="${cartList}" var="cartListVO">
			<form action="cartUpdate.pay" method="post" name="eachFrm">
				<tr align="center">
					<td><input type="checkbox" name="check"
						value="${cartListVO.cart_item_no}"></td>
					<td><a href="info.item?item_code=${cartListVO.item_code}">
							<img src="<c:url value='/image/${cartListVO.imgPath}'/>">
					</a></td>
					<td><a href="info.item?item_code=${cartListVO.item_code}">${cartListVO.item_name}</a></td>
					<td>${cartListVO.item_price}</td>
					<td><input type="number" name="cart_amount"
						value="${cartListVO.cart_amount}"></td>
					<td>
						<fmt:formatNumber pattern="###,###,###" value="${cartListVO.item_price * cartListVO.cart_amount}"/> 원
					</td>
					<td>
						<input type="hidden" name="cart_item_no" value="${cartListVO.cart_item_no}">
						<input type="submit" value="수정">
					</td>
					<td>
						<input type="button" value="삭제" onclick="delCheck('${cartListVO.cart_item_no}')">
					</td>
				</tr>
			</form>
		</c:forEach>
		</c:otherwise>
		</c:choose>
	</table>
	<br>
	<h3 align="left">총 합:</h3>
	<input type="button" value="선택상품 결제" onclick="slctOrder()">
	<input type="button" value="전체상품 결제" onclick="allOrder()">
	<br>
	<a href="/">홈</a>
	
	<%
		} else {
	%>
	<a href="/">로그인을 하세요! </a>
	<%
		}
	%>	

</body>
</html>