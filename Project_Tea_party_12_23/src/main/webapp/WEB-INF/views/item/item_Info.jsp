<%@page import="kr.co.ezenac.item.model.vo.CateListVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
img {
	width: 300px;
	height: 300px;
	object-fit: cover;
}
table {
	margin: auto;
	width : 600px;
	height: 200px;
}

</style>
<title>Insert title here</title>
</head>
<body>

<h2>상품정보</h2>
<table>
	<tr>
		<td><img alt="" src="<c:url value='/image/${item.imgPath}'/>"></td>
		<td align="center">
			<table align="left">
				<tr>
					<td>상품명 : </td>
					<td>${item.item_name}</td>
				</tr>
				<tr>
					<td>가격 : </td>
					<td>${item.item_price} 원</td>
				</tr>
				<tr>
					<td>수량</td>
				</tr>
				<tr>
					<td>
					<%
		String checkLogin = (String) session.getAttribute("checkLogin");
	%>
	session
	<%=checkLogin%>
	<%
		if (checkLogin == "success") {
	%>
						<form action="cart.pay">
							<input type="hidden" value="${item.item_code}">
							
							<select>
								<c:forEach begin="1" end="10" var="i">
									<option value="${i}">${i}</option>
								</c:forEach>
							</select>&nbsp;&nbsp;개 <input type="submit" value="장바구니에 담기">
						</form><br>
						<a href="" style="text-decoration:none">장바구니 목록 보기</a>
						<%
		} else {
	%>
	<a href="/">로그인하셔야합니다. </a>
	<%
		}
	%>	
					</td>
				</tr>
			</table>
			
		</td>
	</tr>
</table>
<table style="">
	<tr>
		<td>상품 설명</td>
	</tr>

</table>
<table style="border:1px solid #444444">
	<tr>
		<td>${item.item_information}</td>
	</tr>
</table>

</body>
</html>