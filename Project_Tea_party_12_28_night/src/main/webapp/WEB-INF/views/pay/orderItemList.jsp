<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/pay/pay.css">
<title>Insert title here</title>
</head>
<body>
	<%
		String checkLogin = (String) session.getAttribute("checkLogin");
	%>
	session
	<%=checkLogin%>
	<%
		if (checkLogin == "success") {
	%>
	<h4>MY ORDER</h4>
	<h4>주문 상세</h4>
	<h5>주문 번호: NO. ${ord_no}</h5>
	
	<div class="head">
		<div>상세주문번호</div>
		<div>이미지</div>
		<div>이름</div>
		<div>수량</div>
		<div>판매가</div>
		<div>합계</div>
		<div>리뷰쓰기</div>
	</div><br>
	
	<div class="data">
	<c:forEach items="${ordItemList}" var="ol">
	<div class="eachData">
		<a href="oneItem.item?item_code=${ol.item_code}">
		<span>${ol.cart_item_no}</span>
		<span>
			<img src="<c:url value='/image/${ol.imgPath}'/>">
		</span>
		<span>${ol.item_name}</span>
		</a>
		<div>${ol.cart_amount}</div>
		<div><fmt:formatNumber value="${ol.item_price}"/>원</div>
		<div><fmt:formatNumber value="${ol.sum}"/>원</div>
		<c:if test="${ordInfo.ord_status=='구매확정'}">
		<div><input type="button" onclick="review(${ol.item_code})" value="리뷰작성"></div>
		</c:if>
	</div><br>
	</c:forEach>
	</div><br>
	
	<div class="total"><fmt:formatNumber value="${ordInfo.ord_price}"/>원</div><br>
	
	<div class="info">
	<h5>결제·배송 정보</h5>
	<b>수취인 정보</b><br>
		수취인: <input type="text" readonly value="${ordInfo.ord_receiver}"><br>
		전화번호: <input type="text" readonly value="${ordInfo.ord_phone}"><br>
		주소<br>
		<input type="text" readonly value="${ordInfo.ord_addr1}" size="10px"><br>
		<input type="text" readonly value="${ordInfo.ord_addr2}" size="25px"><br>
		<input type="text" readonly value="${ordInfo.ord_addr3}" size="25px"><br>
		<br>
	<b>결제 수단</b><br>
	<input type="text" readonly	value="${ordInfo.pay_method}">
	</div>
<!-- 리뷰작성으로 넘어가는 폼. 실제로 보이지 않음-->
<form name="gofrm" action="review.item">
	<input type="hidden" name="item_code">
</form>
<a href="/">홈</a>
<%
		} else {
	%>
	<a href="/">로그인을 하세요! </a>
	<%
		}
	%>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function review(item_code){
		gofrm.item_code.value = item_code;
		
		$.ajax({
			url : "checkReview.pay",
			type : 'post',
			data : JSON.stringify({
				item_code : item_code
			}),
			contentType : 'application/json', // 전송타입 json으로 변경
			success : function(data) { // data= return 값 받음
			}
		}).done(function(data) {
			if(data.equals("yes")){
				var chk = confirm("리뷰를 작성한 적 있는 상품입니다.\n 다시 리뷰를 작성하십니까?");
				if(!chk){
					return false;
				}else{
					gofrm.method = 'post';
					gofrm.submit();
				}
			}else{
				gofrm.method = 'post';
				gofrm.submit();
			}
		})
	}
	</script>
</body>
</html>