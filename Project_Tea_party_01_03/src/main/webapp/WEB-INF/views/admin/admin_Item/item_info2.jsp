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
	<form action="itemUpdate.ad" method="post" enctype="multipart/form-data" name="frm">
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
		<input type="button" value="수정" onclick="checkSubmit()"><br>
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
	<a href="/login">로그인 페이지로 이동 </a>
	<%
		}
	%>
	<script type="text/javascript">
	 function checkSubmit() {
	        var item_name = document.getElementsByName('item_name')[0].value;
	        var item_price = document.getElementsByName('item_price')[0].value;
	        var item_information = document.getElementsByName('item_information')[0].value;
	        var item_count = document.getElementsByName('item_count')[0].value;
	        var image = document.getElementsByName('image')[0].value;
	        if(!item_name){
	        	alert("상품명을 입력하세요");
	        	item_name.focus();
	        	return false;
	        }
	        if(item_price<=0){
	        	alert("가격을 입력하세요!");
	        	item_price.focus();
	        	return false;
	        }
	        if(item_count<0){
	        	alert("수량이 0보다 작을수 없습니다!");
	        	item_count.focus();
	        	return false;
	        }
	        if(!item_information){
	        	alert("정보를 입력하세요");
	        	item_information.focus();
	        	return false;
	        }
	        frm.method = 'post';
	        frm.submit();
	      }
	
	
	
	
	
	
	
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