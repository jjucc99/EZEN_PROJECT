<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/pay/pay.css">
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
<a href="/">홈</a>
	<h4>ORDER</h4>
	<h4>상품</h4>

		<div class="cart">
		<div class="head">
			<div class="img">이미지</div>
			<div class="iname">상품명</div>
			<div class="price">판매가</div>
			<div class="amount">수량</div>
			<div class="sum">합계</div>
		</div>
		<br>
		<div class="data">
		<c:forEach items="${orderList}" var="ol">
					<div class="img">
							<img src="<c:url value='/image/${ol.imgPath}'/>" alt="${ol.imgPath}">
					</div>
					<div class="iname">${ol.item_name}</div>
					<div class="price"><fmt:formatNumber value="${ol.item_price}"/> 원</div>
					<div class="amount">${ol.cart_amount}</div>
					<div class="sum">
						<fmt:formatNumber pattern="###,###,###" value="${ol.item_price * ol.cart_amount}"/> 원
					</div><br>
					<input type="hidden" name="cart_item_no" value="${ol.cart_item_no}">
			</c:forEach>
			</div>
		</div>
<br>
	<div class="box" id="totalPrice">
		합계금액: <fmt:formatNumber value="${total}"/> 원</div>
	<br>
	<br>
	
	<form name="frm" action="pay.pay" method="post">
	<input type="hidden" name="ord_price" value="${total}">
	<input type="hidden" name="payList">
	<h4>배송 정보</h4>	
		<input type="checkbox" name="check" onclick="getInfo()" checked>&nbsp;<b>기본정보로 배송</b><br>

<!-- 주문자 정보. 안 보이는 부분 -->
		<div id="memInfo" style="display:none">
		주문자: &nbsp;<input type="text" id="mem_name" value="${mem_name}" readonly><br>
		전화번호: &nbsp;<input type="text" id="mem_phone" value="${mem_phone}" readonly><br>
		주소<br>
		<input type="text" id="mem_addr1" value="${mem_addr1}" readonly size="10px"><br>
		<input type="text" id="mem_addr2" value="${mem_addr2}" readonly size="25px"><br>
		<input type="text" id="mem_addr3" value="${mem_addr3}" readonly size="25px"><br>
		</div>
		
		<div id="ordInfo">
		<b>수취인 정보</b><br>
		수취인: <input type="text"id="ord_receiver" name="ord_receiver" value="${mem_name}"><br>
		전화번호: <input type="text" id="ord_phone" name="ord_phone" value="${mem_phone}"><br>
		주소 <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="ord_addr1" placeholder="우편번호" name="ord_addr1" value="${mem_addr1}" size="10px"><br>
		<input type="text" id="ord_addr2" placeholder="주소" name="ord_addr2" value="${mem_addr2}" size="25px"><br>
		<input type="text" id="ord_addr3" placeholder="상세주소" name="ord_addr3" value="${mem_addr3}" size="25px"><br>
		<input
                                type="text"
                                id="sample6_extraAddress"
                                placeholder="참고항목"
                                hidden
                        />
		</div>
		<br>

		<div class="payment">
		<h4>결제 수단</h4>
		<input type="radio" name="pay_no" value="1" checked>계좌이체
		<input type="radio" name="pay_no" value="2">카드
		</div>
		
		<hr>
		<input type="button" value="주문하기" onclick="OrderCheck()"> &nbsp; <input type="button" value="주문취소" onclick="history.back(-1);">
	</form>
	<%
		} else {
	%>
	<a href="/">로그인을 하세요! </a>
	<%
		}
	%>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="<c:url value='/resources/js/pay/pay.js'/>"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("ord_addr3").value = extraAddr;

                } else {
                    document.getElementById("ord_addr3").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('ord_addr1').value = data.zonecode;
                document.getElementById("ord_addr2").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_extraAddress").focus();
            }
        }).open();
    }
</script>
</body>
</html>