<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/pay/pay.css">
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
<a href="/">홈</a>
	<h4>ORDER</h4>
	<h4>상품</h4>

		<div class="cart">
		<div class="head">
			<div class="img">이미지</div>
			<div class="iname">상품명</div>
			<div class="price">판매가</div>
			<div class="amount">수량</div>
			<div class="sum">합계</div>
		</div>
		<br>
		<div class="data">
		<c:forEach items="${orderList}" var="ol">
					<div class="img"><a href="cate.item/oneItem.item/${ol.item_code}">
							<img src="<c:url value='/image/${ol.imgPath}'/>" alt="${ol.imgPath}">
					</a></div>
					<div class="iname"><a href="cate.item/oneItem.item/${ol.item_code}">${ol.item_name}</a></div>
					<div class="price"><fmt:formatNumber value="${ol.item_price}"/> 원</div>
					<div class="amount"><input type="number" name="cart_amount"
						value="${ol.cart_amount}"></div>
					<div class="sum">
						<fmt:formatNumber pattern="###,###,###" value="${ol.item_price * ol.cart_amount}"/> 원
					</div><br>
			</c:forEach>
			</div>
		</div>
<br>
	<div class="box" id="totalPrice">
		합계금액: <fmt:formatNumber pattern="###,###,###" value="${total}"/> 원</div>
	<br>
	<br>
	
	<form action="pay.pay" method="post">
	<div class="orderInfo">
	<h4>배송 정보</h4>
		<ul>
			<li><input type="checkbox" name="check" checked>&nbsp;<b>기본 정보로 배송</b></li>
			<li>수취인<input type="text" name="ord_receiver"></li>
			<li>전화번호<input type="tel" name="ord_phone" placeholder="전화번호를 입력해주세요"></li>
			<li>주소<input type="text" name="ord_addr1"></li>
			<li>&nbsp;&nbsp;<input type="text" name="ord_addr2"></li>
			<li>&nbsp;&nbsp;<input type="text" name="ord_addr3"></li>
		</ul>
	</div>
	<br>
	<div class="payment">
	<h4>결제 수단</h4>
		<input type="radio" name="pay" value="cash">계좌이체
		<input type="radio" name="pay" value="card">카드
	</div>
	</form>
	<h4>결제 정보</h4>
	<%
		} else {
	%>
	<a href="/">로그인을 하세요! </a>
	<%
		}
	%>
</body>
</html>