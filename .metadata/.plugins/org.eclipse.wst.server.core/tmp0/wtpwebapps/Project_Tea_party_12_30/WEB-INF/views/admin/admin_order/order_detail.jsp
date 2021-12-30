<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String checkLogin = (String) session.getAttribute("checkLogin");
		%>
	session
	<%=checkLogin%><br>
	<%
		if (checkLogin == "success"){

	    %>
	<table border="1">
		<tr>
			<td>주문번호</td>
			<td>주문자</td>
			<td>수취인</td>
			<td>주소</td>
			<td>전화번호</td>
		</tr>
		<tr>
			<td>${orderList.ord_no}</td>
			<td>${orderList.mem_id}</td>
			<td>${orderList.ord_receiver}</td>
			<td>${orderList.ord_addr1}-${orderList.ord_addr2}-${orderList.ord_addr3}</td>
			<td>${orderList.ord_phone}</td>
		</tr>
	</table>
	<br>
	<br> 상품이름 가격 수량 합계

	<table border="1">
		<tr>
			<td>상품이름</td>
			<td>가격</td>
			<td>수량</td>
			<td>합계</td>
		</tr>
		<c:forEach items="${orderDetail}" var="orderDetail">
		<tr>
			<td>${orderDetail.item_name}</td>
			<td>${orderDetail.item_price}</td>
			<td>${orderDetail.order_item_count}</td>
			<td>${orderDetail.item_price * orderDetail.order_item_count}</td>
		</tr>
		</c:forEach>
	</table>
	합계 <fmt:formatNumber type="number" maxFractionDigits="3" value="${total}" /> 원
	<br>
	<button onclick="location.href='orderList.ad'">주문 목록</button>
	<%
		} else {
	%>
	<a href="/">로그인 페이지로 이동 </a>
	<%
		}
	%>
</body>
</html>