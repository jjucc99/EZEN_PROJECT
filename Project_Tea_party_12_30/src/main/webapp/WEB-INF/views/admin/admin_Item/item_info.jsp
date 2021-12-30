<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		if (checkLogin == "success") {
	%>
	<form action="itemUpdate.ad" method="post" enctype="multipart/form-data">
		<img src="<spring:url value='/image/${item.img_path}'/>" alt="없음" id="original">
		<div id="image_container"></div><br>
		<input type="file" name="image" id="img" onchange="fileChange(this)"/><br>
		상품코드 ${item.item_code}<br>
		상품명<input type="text" name="item_name" value="${item.item_name}"><br>
		상품가격<input type="text" name="item_price" value="${item.item_price}"><br>
		상품정보<input type="text" name="item_information" value="${item.item_information}"><br>
		카테고리 ${item.cate_name}<br>
		<select name="cate_code">
			<option value="1"<c:if test="${item.cate_code == 1}">selected</c:if>>홍차</option>
			<option value="2"<c:if test="${item.cate_code == 2}">selected</c:if>>허브차</option>
			<option value="3"<c:if test="${item.cate_code == 3}">selected</c:if>>전통차</option>
			<option value="4"<c:if test="${item.cate_code == 4}">selected</c:if>>커피</option>
			<option value="5"<c:if test="${item.cate_code == 5}">selected</c:if>>티웨어</option>
			<option disabled="disabled" value="6"<c:if test="${item.cate_code == 6}">selected</c:if>>삭제</option>
		</select>
		<br>
		수량<input type="text" name="item_count" value="${item.item_count}"><br>
		<input type="hidden" name="item_code" value="${item.item_code}">
		<input type="hidden" name="imgFlag" id="imgFlag" value="Y">
		<input type="submit" value="수정">
		<input type="button" value="상품 리스트로 이동" onclick="location.href='itemList.ad'">
	</form>
	<br>
	<form action="itemDelete.ad" method="post" name="deletefrm">
		<input type="hidden" name="item_code" value="${item.item_code}">
		<input type="button" onclick="deleteSubmit()" value="삭제">
	</form>
<br>
	<%
		} else {
	%>
	<a href="/">로그인 페이지로 이동 </a>
	<%
		}
	%>
	<script type="text/javascript">
		function deleteSubmit() {
			if (confirm("정말 삭제하시겠습니까??") == true) {
				document.deletefrm.submit();
			} else {
				return false;
			}
		}
		function fileChange(change) {
			document.getElementById('imgFlag').value = 'N';
			var reader = new FileReader();
			reader.onload = function(event) {
				var img = document.getElementById('original');
				img.setAttribute("src", event.target.result);
				document.querySelector("div#image_container").appendChild(img);
			};

			reader.readAsDataURL(event.target.files[0]);
		}
	</script>
</body>
</html>