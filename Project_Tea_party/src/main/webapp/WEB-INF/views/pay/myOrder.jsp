<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/pay/pay.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="<c:url value='/resources/js/pay/order.js?var=2'/>"></script>
</head>
<body>

<h4>구매내역 리스트</h4>
<%
		String checkLogin = (String) session.getAttribute("checkLogin");
	%>
	session
	<%=checkLogin%>
	<%
		if (checkLogin == "success") {
	%>
<div class="head">
<div>주문 번호</div>
<div>이미지</div>
<div>주문 정보</div>
<div>결제 금액</div>
<div>배송상태</div>
<div>구매일자</div>
<div>주문상태</div>
</div>
<br>

<div class="data">
<c:forEach items="${orderList}" var="ol">
<div class="eachData">
	<div><a href="orderItem.pay?ord_no=${ol.ord_no}">${ol.ord_no}</a></div>
	<div><a href="orderItem.pay?ord_no=${ol.ord_no}">
		<img src="<c:url value='/image/${ol.imgPath}'/>"></a>
	</div>
	<div><a href="orderItem.pay?ord_no=${ol.ord_no}">
			${ol.rep_name}
			<c:if test="${ol.ord_count!=0}">외 ${ol.ord_count}개</c:if>
		</a>
	</div>
	<div><fmt:formatNumber value="${ol.ord_price}"/>원</div>
	<div>${ol.delivery_status}</div>
	<div><fmt:formatDate value="${ol.ord_date}"/></div>
	<div><c:choose>
		<c:when test="${ol.ord_status =='처리완료'}">
			<select>
				<option selected disabled>처리완료</option></select>
		</c:when>
		<c:when test="${ol.ord_status =='구매확정'}">
			<select>
				<option selected disabled>구매확정</option></select>
		</c:when>
		<c:otherwise>
			<select id="${ol.rep_name}" onchange="">
				<option value=''>--주문 처리중--</option>
				<option value='1'
					<c:if test="${ol.ord_status == '구매확정'}">selected</c:if>>구매확정</option>
				<option value='2'
					<c:if test="${ol.ord_status == '주문취소'}">selected</c:if>>주문취소</option>
				<option value='3'
					<c:if test="${ol.ord_status == '교환/반품'}">selected</c:if>>교환/반품</option>
			</select>
			<input type="button" onclick="change('${ol.ord_no}','${ol.rep_name}')" value="선택">
		</c:otherwise>
		</c:choose>
	</div>

</div><br>
</c:forEach>
</div><br>
<a href="/main">홈</a>
<%
		} else {
	%>
	<a href="/">로그인을 하세요! </a>
	<%
		}
	%>
</body>

</html>