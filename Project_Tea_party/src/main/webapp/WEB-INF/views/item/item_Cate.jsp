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
<table>
		<tr align="center">			
			<th>상품 이름</th>
			<th>상품 정보</th>
			<th>상품 가격</th>			
		</tr>
		
		<c:forEach items="${list}" var="ItemVO">
			<tr align="center">
				<td>${catelist.item_name}</td>
				<td>${catelist.item_information}</td>
				<td>${catelist.item_price}</td>
			</tr>
		</c:forEach>
	</table>
	<a href="test.item">홈으로</a> <input type="button" value="뒤로가기" onClick="history.go(-1)"> 
</body>
</html>