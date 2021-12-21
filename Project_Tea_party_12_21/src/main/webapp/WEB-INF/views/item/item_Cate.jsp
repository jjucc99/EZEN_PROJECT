<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
img {
	width: 80px;
	height: 80px;
	object-fit: cover;
}
</style>
<title>Insert title here</title>
</head>
<body>
<table>
		<tr align="center">			
			<th>이미지</th>
			<th>상품 이름</th>
			<th>상품 정보</th>
			<th>상품 가격</th>
			<th>상품 코드</th>		
		</tr>
		
		<c:forEach items="${catelist}" var="CateListVO">
			<tr align="center">
				<td><img alt="" src="<c:url value='/image/${CateListVO.imgPath}'/>"></td>
				<td>${CateListVO.item_name}</td>
				<td>${CateListVO.item_information}</td>
				<td>${CateListVO.item_price}</td>
				<td>${CateListVO.item_code}</td>
			</tr>
		</c:forEach>
	</table>
	<a href="test.item">홈으로</a> <input type="button" value="뒤로가기" onClick="history.go(-1)"> 
</body>
</html>