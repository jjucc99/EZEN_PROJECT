<%@page import="kr.co.ezenac.item.model.vo.ReviewBoardVO"%>
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
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="<c:url value='/resources/js/item/info.js'/>"></script>
</head>
<body>

<h2>상품정보</h2>
<table>
	<tr>
		<td><img alt="없음" src="<c:url value='/image/${catelist.imgPath}'/>"></td>
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
				<input type="submit" value="장바구니에 담기" onclick="insertCart()">
			</form><br>
				<a href="cart.pay" style="text-decoration:none">장바구니 목록 보기</a><br> <!-- 합칠때 지우기 -->
				<a href="javascript:history.back()">뒤로가기</a>&nbsp;&nbsp; <!-- 합칠때 지우기 -->
				<a href="/main">홈으로가기</a> <!-- 합칠때 지우기 -->
	<%
		} else {
	%>
	<a href="/login">주문하실려면 로그인하셔야합니다. </a>
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
	<!-- 옵션선택 끝 -->
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
				<%String mem_id = (String) session.getAttribute("mem_id");%>
				<c:set var="str"><%=mem_id %></c:set>
				<c:if test="${str==rlist.mem_id}">
				<td>
					<form action="reviewUpdateForm.item" method="get">
						<input type="submit" value="수정">
						<input type="hidden" value="${rlist.r_board_no}" name="r_board_no">
					</form>
				</td>
				<td>
					<form action="reviewDelete.item" method="get" name="reviewDelete" id="reviewDelete">
						<input type="button" value="삭제" onclick="deleteReview()">
						<input type="hidden" value="${rlist.r_board_no}" name="r_board_no">
						<input type="hidden" value="${rlist.item_code}" name="item_code">
					</form>
				</td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/oneItem.item?item_code=${catelist.item_code}&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage}">
					<b>${p}</b>
				</c:when>
				<c:when test="${p != paging.nowPage}">
					<a href="/oneItem.item?item_code=${catelist.item_code}&nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/oneItem.item?item_code=${catelist.item_code}&nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
</div>

<script type="text/javascript">
function insertCart(){
	alert("장바구니에 담았습니다.");
}

function deleteReview() {
	 if (confirm("정말 삭제하시겠습니까?")){
		 console.log("삭제");
	     document.getElementById('reviewDelete').submit();
	 }else{
		 console.log("취소");
	     return false;
	 }
 }
</script>
</body>
</html>