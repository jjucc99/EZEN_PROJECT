<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<style type="text/css">
img {
	width: 90px;
	height: 90px;
	object-fit: cover;
}
</style>
<title>TEA_PART_PAY</title>
</head>

<body>

<header class="main_header">
    <div class="header_title_conteiner">
        <div class="header_title_title">
            <div class="header_title"><a href="/main">TEA PARTY</a></div>
        </div>
        <div class="header_controller_conteiner">
            <div class="header_controller">
                <a href="/mypage">MY PAGE</a>
            </div>
            <div class="header_controller">
                <a href="/cart.pay">MY SHOPPING</a>
            </div>
            <div class="header_controller">
                <a href="/logout">LOGOUT</a>
            </div>
        </div>
    </div>
</header>
	<%  String checkLogin = (String) session.getAttribute("checkLogin");
	if (checkLogin == "success") { %>
	
	<section>
	<form name="frm" action="pay.pay" method="post">
	<input type="hidden" name="ord_price" value="${total}">
	<input type="hidden" name="payList">
	<!-- 주문자 정보. 안 보이는 부분 -->
		<div id="memInfo" style="display:none">
		주문자: &nbsp;<input type="text" id="mem_name" value="${mem_name}" readonly><br>
		전화번호: &nbsp;<input type="text" id="mem_phone" value="${mem_phone}" readonly><br>
		주소<br>
		<input type="text" id="mem_addr1" value="${mem_addr1}" readonly size="10px"><br>
		<input type="text" id="mem_addr2" value="${mem_addr2}" readonly size="25px"><br>
		<input type="text" id="mem_addr3" value="${mem_addr3}" readonly size="25px"><br>
		</div>
		
		<div class="pay_container">
			<div class="text_container">
				<div class="text_container_title">ORDER</div>
				<div class="text_container_delivery">
					<div class="text_container_delivery_title">DELIVERY</div>
					<div class="text_container_delivery_delivery_context">
						<label for="delivery_check">기존 정보로 배송</label>
						<input type="checkbox" id="delivery_check" name="check" onclick="getInfo()" checked />
						<div class="text_container_delivery_header">
							<label for="ord_receiver">수취인</label> <input type="text"
								id="ord_receiver" name="ord_receiver" value="${mem_name}"/> <label for="ord_phone">
								전화번호</label> <input type="text" id="ord_phone" name="ord_phone"value="${mem_phone}" />
						</div>			
						<div class="address">
							<label for="ord_addr1">주소</label>
							<div class="address_search">
								<input type="text" id="ord_addr1" placeholder="우편번호" name="ord_addr1" value="${mem_addr1}" /> <input type="button"
									onclick="sample6_execDaumPostcode()" value="우편번호 찾기" />
							</div>
							<div class="address_search_second">
								<input type="text" id="ord_addr2" placeholder="주소" name="ord_addr2" value="${mem_addr2}" />
								<input type="text" id="ord_addr3" placeholder="상세주소" name="ord_addr3" value="${mem_addr3}" />
								<input type="hidden" id="sample6_extraAddress" placeholder="참고항목"/>
							</div>
						</div>
					</div>
				</div>
				<div class="text_container_paymemt">
					<div class="text_container_paymemt_title">PATMEMT</div>
					<div class="text_container_paymemt_title_radio">
						<div class="text_container_paymemt_title_radio_deposit">
							<label for="deposit">계좌 이체</label> <input type="radio" name="pay_no"
								id="deposit" value="1" checked/>
						</div>
						<div class="text_container_paymemt_title_radio_credit_card">
							<label for="credit_card">신용 카드</label> <input type="radio"
								name="pay_no" id="credit_card" value="2"/>
						</div>
					</div>
				</div>
				<div class="text_container_btn">
					<input type="button" value="ORDER" onclick="OrderCheck()"/>
				</div>
			</div>
			<div class="bill_container">
				<div class="bill_title">
					<div class="bill_title_text">PAPER</div>
					<div class="bill_title_btn">
						<input type="button" value="CANCLE" onclick="history.back(-1);"/>
					</div>
				</div>
			
				<div class="bill_context">
				<c:forEach items="${orderList}" var="ol">
				
					<div class="bill_context_item">
						<div class="bill_item">
							<div class="bill_item_img"><img src="<c:url value='/image/${ol.imgPath}'/>" alt="${ol.imgPath}"></div>
							<div class="bill_item_text">
								<div class="bill_item_text_title">${ol.item_name}</div>
								<div class="bill_item_text_detail"><fmt:formatNumber value="${ol.item_price}"/> 원</div>
							</div>
						</div>
						<div class="bill_price">
							<div class="bill_price_price_count">${ol.cart_amount} 개</div>
							<div class="bill_price_price"><fmt:formatNumber value="${ol.item_price * ol.cart_amount}"/> 원</div>
							<input type="hidden" name="cart_item_no" value="${ol.cart_item_no}">
						</div>
					</div>
					
				</c:forEach>	
					
				</div>
				<div class="bill_sum_price">
					<div class="bill_sum_price_text">TOTAL</div>
					<div class="bill_sum_price_money"><fmt:formatNumber value="${total}"/> 원</div>
				</div>
			</div>
		</div>
		</form>
	</section>
<%
		} else {
%>
	<script type="text/javascript">
	alert("로그인 하셔야 합니다!");
	location.href="/login";
	</script>
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