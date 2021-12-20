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
			<th>상품 번호</th>
			<th>상품 이름</th>
			<th>상품 가격</th>
			<th>상품 정보</th>
			<th>카테고리 번호</th>
		</tr>
		
		<c:forEach items="${list}" var="itemVO">
			<tr align="center">
				<td><a href="info.item/${itemVO.item_code}">${itemVO.item_code}</a></td>
				<td><a href="info.item/${itemVO.item_code}">${itemVO.item_name}</a></td>
				<td><a href="info.item/${itemVO.item_code}">${itemVO.item_price}</a></td>
				<td><a href="info.item/${itemVO.item_code}">${itemVO.item_information}</a></td>
				<td><a href="info.item/${itemVO.item_code}">${itemVO.cate_code}</a></td>
				<td><input hidden="${itemVO.item_code}"></td>
			</tr>
		</c:forEach>
	</table>
	<a href="test.item">홈으로</a>
</body>
</html>