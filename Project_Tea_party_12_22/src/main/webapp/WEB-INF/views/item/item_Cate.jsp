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
div tr{
	float: left;
}
a {
	text-decoration:none;
}
</style>
<title>Insert title here</title>
</head>
<body>

<div>
<table>	
		<c:forEach items="${catelist}" var="CateListVO">
			<tr align="center">
				<th><a href="oneItem.item/${CateListVO.item_code}" style="color:black"><figure>	
				<img alt="" src="<c:url value='/image/${CateListVO.imgPath}'/>">
				<figcaption>${CateListVO.item_name}<br><h6>${CateListVO.item_price}</h6></figcaption>
				</figure></a></th>
			</tr>
		</c:forEach>
	</table>
</div>
<input type="button" value="뒤로가기" onClick="history.go(-1)"> 

</body>
</html>