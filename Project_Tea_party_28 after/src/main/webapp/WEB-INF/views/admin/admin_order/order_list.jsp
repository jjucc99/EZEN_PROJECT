<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
a:visited {
	color: blue;
}
</style>
<title>주문 목록</title>
</head>
<style>
	h2 {
		text-align: center;
	}
	table {
		width: 100%;
	}
	#outter {
		display: block;
		width: 60%;
		margin: auto;
	}
	a {
		text-decoration: none;
	}
</style>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="orderList.ad?nowPage=${paging.nowPage}&cntPerPage="+sel;//!!!!
	}
</script>
<body>
<h2>주문 목록</h2>

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
	</div> <!-- 옵션선택 끝 -->
	<table border="1">
		<tr>
			<td>주문번호</td>
			<td>주문정보</td>
			<td>주문자</td>
			<td>주문일시</td>
			<td>배송상태</td>
			<td>주문상태</td>
			<td>상태 변경</td>
		</tr>
		<c:forEach items="${viewAll}" var="order">
			<tr>
				<td>${order.ord_no}</td>
				<td><a href="orderDetail.ad?ord_no=${order.ord_no}">${order.item_name}<c:choose>
				<c:when test="${order.order_item_count!=0}">
				외 ${order.order_item_count}개</c:when>
				<c:otherwise></c:otherwise>
				</c:choose></a>
				</td>
				<td>${order.mem_id}</td>
				<td>${order.ord_date}</td>
				<td>${order.delivery_status}</td>
				<td>${order.ord_status}</td>
				<td>
					<form action="deliveryStatus.ad" method="post">
					<input type="hidden" name="ord_no" value="${order.ord_no}">
					<input type="submit"  value="배송완료 ">
					</form>
					<form action="orderStatus.ad" method="post">
					<input type="hidden" name="ord_no" value="${order.ord_no}">
					<input type="submit"  value="처리완료">
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
	<button onclick="location.href='admin.ad'">관리자 홈으로</button>
	
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/orderList.ad?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p}</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/orderList.ad?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/orderList.ad?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
</div>
</body>
</html>