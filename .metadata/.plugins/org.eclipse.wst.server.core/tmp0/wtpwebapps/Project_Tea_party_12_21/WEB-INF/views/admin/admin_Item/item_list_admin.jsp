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
		<tr>
			<td>상품코드</td>
			<td>상품명</td>
			<td>재고</td>
			<td>가격</td>
			<td>카테고리</td>
			<td>수정</td>
		</tr>
		<c:forEach items="${list}" var="item">
			<tr>
				<td>${item.item_code}</td>
				<td>${item.item_name}</td>
				<td>${item.item_count}</td>
				<td>${item.item_price}</td>
				<td>${item.cate_name}</td>
				<td><button onclick="location.href='itemInfo.ad?item_code=${item.item_code}'">UPDATE</button></td>
			</tr>
		</c:forEach>
	</table>
	<a href="addItemForm.ad">아이템 추가</a><br>
	<button onclick="location.href='admin.ad'">관리자 홈으로</button>
</body>
</html>