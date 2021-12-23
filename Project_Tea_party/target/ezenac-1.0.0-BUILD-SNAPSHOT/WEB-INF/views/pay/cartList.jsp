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
	
	<h4>SHOPPING CART</h4>
	<h4>상품</h4>
	
<!-- 빈 장바구니 -->		
		<c:choose>
		<c:when test="${count==0}">
		 <h5>장바구니가 비어있습니다.</h5>
		</c:when>	

<%--장바구니 리스트--%>
		<c:otherwise>
		<div class="cart">
		<div class="head">
			<div class="checkbox"></div>
			<div class="img">이미지</div>
			<div class="iname">상품명</div>
			<div class="price">판매가</div>
			<div class="amount">수량</div>
			<div class="sum">합계</div>
			<div class="update">수정</div>
			<div class="delete">삭제</div>
		</div>
		<br>
		<div class="data">
		<c:forEach items="${cartList}" var="cl">
			<c:choose>
<%--재고 부족--%>				
					<c:when test="${cl.item_count < cl.cart_amount}">
					<form action="cartUpdate.pay" method="post">
					<div class="checkbox"><input type="checkbox" name="check" disabled></div>
					<div class="img">
						<a href="cate.item/oneItem.item/${cl.item_code}">
						<img src="<c:url value='/image/${cl.imgPath}'/>"></a>
					</div>
					<div class="iname"><a href="cate.item/oneItem.item/${cl.item_code}">${cl.item_name}</a></div>
					<div class="msg">현재 재고가 부족합니다.</div>
					<div class="delete">
						<input type="button" value="삭제" onclick="delCheck('${cl.cart_item_no}')">
					</div>				
					</form>
					</c:when>
<%--재고 있을 때 --%>
				<c:otherwise>		
				<form action="cartUpdate.pay" method="post">					
					<div class="checkbox"><input type="checkbox" name="check" value="${cl.cart_item_no}"></div>
					<div class="img"><a href="cate.item/oneItem.item/${cl.item_code}">
							<img src="<c:url value='/image/${cl.imgPath}'/>" alt="${cl.imgPath}">
					</a></div>
					<div class="iname"><a href="cate.item/oneItem.item/${cl.item_code}">${cl.item_name}</a></div>
					<div class="price"><fmt:formatNumber value="${cl.item_price}"/> 원</div>
					<div class="amount"><input type="number" name="cart_amount"
						value="${cl.cart_amount}"></div>
					<div class="sum">
						<fmt:formatNumber pattern="###,###,###" value="${cl.item_price * cl.cart_amount}"/> 원
					</div>
					<div class="update">
						<input type="hidden" name="cart_item_no" value="${cl.cart_item_no}">
						<input type="submit" value="수정">
					</div>
					<div class="delete">
						<input type="button" value="삭제" onclick="delCheck('${cl.cart_item_no}')">
					</div>
				</form>
				</c:otherwise>
				</c:choose>
			</c:forEach>
			</div>
		</div>
		</c:otherwise>		
	</c:choose>
	<br>
	<div class="box" id="totalPrice">
		합계금액: <fmt:formatNumber pattern="###,###,###" value="${total}"/> 원</div>
		<br>
	<input type="button" value="선택상품 결제" onclick="slctOrder()">
	<input type="button" value="전체상품 결제" onclick="allOrder()">
	<br>
	<a href="/">홈</a>

<!-- 주문으로 넘어가는 폼. 실제로 보이지 않음-->
<form name="gofrm" action="goOrder.pay">
	<input type="hidden" name="orderList">
</form>
	
	<%
		} else {
	%>
	<a href="/">로그인을 하세요! </a>
	<%
		}
	%>	

</body>
</html>