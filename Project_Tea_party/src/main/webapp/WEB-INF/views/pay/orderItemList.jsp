<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<title>TEA_PARTY_MYPAGE</title>
<style type="text/css">
img {
	width: 120px;
	height: 120px;
	object-fit: cover;
}

a {
	text-decoration: none; /* 링크의 밑줄 제거 */
	color: inherit; /* 링크의 색상 제거 */
}
</style>

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
      <div class="order_list_container">
        <div class="order_list_box">
          <div class="order_list_context_title">
            <div class="order_list_context_title_title">ORDER ITEM</div>
            <div class="order_list_context_title_detial">
              <div class="order_list_context_title_detial_order_num">
                <span>주문번호:&nbsp;</span><span>${ord_no}</span>
              <!-- </div>
              <div class="order_list_context_title_detial_status"> -->
                <span><c:choose>
	<c:when test="${ordInfo.ord_status=='구매확정'}">구매가 확정된 주문입니다.</c:when>
	<c:when test="${ordInfo.ord_status=='처리완료'}">취소/교환/반품 처리가 완료된 주문입니다.</c:when>
	<c:when test="${ordInfo.ord_status=='주문취소'||ordInfo.ord_status=='교환/반품'}">취소/교환/반품 신청된 주문입니다.</c:when>
	<c:otherwise></c:otherwise>
	</c:choose></span>
              </div>
            </div>
          </div>
          
          <div class="order_list_context_items">
            <c:forEach items="${ordItemList}" var="ol">
            <div class="order_list_context_item">
              <div class="order_list_context_item_num">
               <span>주문상세 번호:&nbsp;</span><span>${ol.cart_item_no}</span>
              </div>
              <div class="order_list_context_item_context">
                <div class="order_list_context_item_context_img">
                <a href="oneItem.item?item_code=${ol.item_code}"><img src="<c:url value='/image/${ol.imgPath}'/>"></a>
                </div>
                <div class="order_list_context_item_context_detail">
                
               <a href="oneItem.item?item_code=${ol.item_code}">
                  <div class="order_list_context_item_context_detail-box">
                    <div class="order_list_context_item_context_detail_name">
                    ${ol.item_name}
                    </div>
                    <div class="order_list_context_item_context_detail_price">
                      <div
                        class="order_list_context_item_context_detail_price_price">
                        <span>가격: </span><span><fmt:formatNumber value="${ol.item_price}"/> 원</span>
                      </div>
                      <div
                        class="order_list_context_item_context_detail_price_count">
                        <span>수량: </span><span>${ol.cart_amount} 개</span>
                      </div>
                    </div>
                  </div>
                  </a>
                  <div class="order_list_context_item_context_detail_sum">
                    <div class="order_list_context_item_context_detail_sum_price">
                      <span>총 가격: </span><span><fmt:formatNumber value="${ol.sum}"/>원</span>
                    </div>
                    <c:if test="${ordInfo.ord_status=='구매확정'}">
                    <input type="button" onclick="goReview(${ol.item_code})" value="리뷰작성">
                    
					<!-- 리뷰작성으로 넘어가는 폼. 실제로 보이지 않음-->
					<form class="gofrm" id="gofrm" name="gofrm" action="review.item" method="post">
						<input type="hidden" name="item_code" id="item_code"/>
					</form>
					</c:if>
				 </div>
                </div>
              </div>
            </div>
            </c:forEach>
            <!-- 부분 끝 -->
          </div>
        </div>
        
        <div class="order_list_delivery_box">
          <div class="order_list_delivery_box_title">ORDER</div>
          <div class="order_list_delivery_box_delivery">
            <div class="order_list_delivery_box_delivery_title">DELIVERY</div>
            <div class="order_list_delivery_box_delivery_name">${ordInfo.ord_receiver}</div>
            <div class="order_list_delivery_box_delivery_phone">
              ${ordInfo.ord_phone}
            </div>
          </div>
          <div class="order_list_delivery_box_address">
            <div class="order_list_delivery_box_address_title">ADDRESS</div>
            <div class="order_list_delivery_box_address_address1">${ordInfo.ord_addr1}</div>
            <div class="order_list_delivery_box_address_address2">${ordInfo.ord_addr2}</div>
            <div class="order_list_delivery_box_address_address3">${ordInfo.ord_addr3}</div>
          </div>
          <div class="order_list_delivery_box_payment">
            <div class="order_list_delivery_box_payment_title">PAYMENT</div>
            <div class="order_list_delivery_box_payment_title_context">
              <div class="order_list_delivery_box_payment_context">${ordInfo.pay_method}</div>
              <div class="order_list_delivery_box_payment_sum">
                <span>총 결제 금액</span><span><fmt:formatNumber value="${ordInfo.ord_price}"/>원</span>
              </div>
            </div>
          </div>
        </div>
      </div>
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
<script type="text/javascript">
/* if(typeof jQuery=='undefined'){
	alert("없음");
}else{
	alert("있음");
} */
	function goReview(item_code){

		var frm=document.getElementById("item_code")
		frm.value = item_code;

		$.ajax({
			url : "checkReview.pay",
			type : 'post',
			data : JSON.stringify({
				code : item_code
			}),
			contentType : 'application/json', // 전송타입 json으로 변경
			success : function(data) { // data= return 값 받음
			}
		}).done(function(data) {
			if(data==="yes"){
				var chk = confirm("리뷰를 작성한 적 있는 상품입니다.\n 다시 리뷰를 작성하십니까?");
				if(!chk){
					return false;
				}else{
					document.gofrm.method = 'post';
					document.gofrm.submit();
				}
			}else{
				document.gofrm.method = 'post';
				/* document.gofrm.submit(); */
				$("#gofrm").submit(); 
			}
		})
	}
	</script>
</body>
</html>