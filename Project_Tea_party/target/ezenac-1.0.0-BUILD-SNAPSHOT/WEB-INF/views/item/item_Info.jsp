<%@page import="kr.co.ezenac.item.model.vo.CateListVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
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
		<td><img alt="" src="<c:url value='/image/${catelist.imgPath}'/>"></td>
		<td align="center">
			<table align="left">
				<tr>
					<td>상품명 : </td>
					<td>${catelist.item_name}</td>
				</tr>
				<tr>
					<td>가격 : </td>
					<td>${catelist.item_price} 원</td>
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
						<form action="insertCart.item" method="get">
							<input type="hidden" value="${catelist.item_code}" name="item_code">							
							<input type="number" value=1 name="cart_amount">
							<input type="submit" value="장바구니에 담기">
						</form><br>
						<a href="cart.pay" style="text-decoration:none">장바구니 목록 보기</a><br>
						<a href="javascript:history.back()">뒤로가기</a>&nbsp;&nbsp;
						<a href="/main">홈으로가기</a>
	<%
		} else {
	%>
	<a href="/">주문하실려면 로그인하셔야합니다. </a>
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
		<td>${catelist.item_information}</td>
	</tr>
</table>


    <h2 align="center">리뷰</h2>

<div id="outter">
	<div style="float: right;">
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
 	</div><!-- 옵션선택 끝 -->
	<table border="1">
		<tr>
			<td>이미지</td>
			<td>리뷰제목</td>
			<td>리뷰내용</td>
			<td>등록일</td>
			<td>아이디</td>
		</tr>
		<c:forEach items="${viewAll}" var="rlist">
			<tr>
				<td><img alt="없음" src="<c:url value='/image/${rlist.imgPath}'/>" style="width: 80px; height: 80px; object-fit: cover;"></td>
				<td>${rlist.r_board_sub}</td>
				<td>${rlist.r_board_content}</td>
				<td>${rlist.r_board_date}</td>
				<td>${rlist.mem_id}</td>
			</tr>
		</c:forEach>
	</table>	
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/cate.item/oneItem.item/{item_code}?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p}</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/cate.item/oneItem.item/{item_code}?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/cate.item/oneItem.item/{item_code}?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
</div>
</body>
</html>