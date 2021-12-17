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
			<td>코드</td>
			<td>이름</td>
			<td>가격</td>
			<td>정보</td>
			<td>카테고리</td>
		</tr>
		<c:forEach items="${list}" var="item">
			<tr>
				<td><a href="itemInfo.ad?item_code=${item.item_code}">${item.item_code}</a></td>
				<td><a href="itemInfo.ad?item_code=${item.item_code}">${item.item_name}</td>
				<td><a href="itemInfo.ad?item_code=${item.item_code}">${item.item_price}</td>
				<td><a href="itemInfo.ad?item_code=${item.item_code}">${item.item_information}</td>
				<td><a href="itemInfo.ad?item_code=${item.item_code}">${item.cate_code}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>