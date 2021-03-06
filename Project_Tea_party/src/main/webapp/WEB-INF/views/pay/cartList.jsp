<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>my shopping</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<style type="text/css">
img {
	width: 90px;
	height: 90px;
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
	
<script type="text/javascript">
var value=${checkI};

if(value=2){
	alert("불편을 끼쳐드려 죄송합니다.\n결제에 실패하여 장바구니로 돌아갑니다.");
}
</script>	

    <section>
      <div class="my_shopping_container">

        <div class="my_shopping_items">
          <div class="my_shopping_title">MY_SHOPPING</div>
<%--재고 부족--%>

			<c:forEach items="${cartList}" var="cl">
			<c:choose>
			<c:when test="${cl.item_count < cl.cart_amount}">
          <div class="myshopping_item">
            <div class="myshopping_item_context">
              <div class="myshopping_item_context_img">
              	<a href="oneItem.item?item_code=${cl.item_code}">
				<img src="<c:url value='/image/${cl.imgPath}'/>">
				</a></div>
              <div class="myshopping_item_context_text">
                <div class="myshopping_item_context_text_title">
                	<a href="oneItem.item?item_code=${cl.item_code}">${cl.item_name}</a></div>
                <div class="myshopping_item_context_text_price">SOLD OUT</div>
              </div>
            </div>
            <div class="myshopping_item_detail">
              <div class="myshopping_item_detail_amount">
                <input type="button" value="-" disabled />
                <div class="myshopping_item_detail_amount_count"></div>
                <input type="button" value="+" disabled/>
              </div>
              <div class="myshopping_item_detail_price">SOLD OUT</div>
              <div class="myshopping_item_detail_btn">
                <div class="myshopping_item_detail_btn_check">
                  <input type="button" value="X" onclick="delCheck('${cl.cart_item_no}')"/>
                </div>
                <div class="myshopping_item_detail_btn_delete">
                  <input type="checkbox" name="check" disabled/>
                </div>
              </div>
            </div>
          </div>
         	 </c:when>
 <%--재고 있을 때 --%>
 			<c:otherwise>         
          <div class="myshopping_item">
            <div class="myshopping_item_context">
              <div class="myshopping_item_context_img"><a href="oneItem.item?item_code=${cl.item_code}">
				<img src="<c:url value='/image/${cl.imgPath}'/>">
				</a></div>
              <div class="myshopping_item_context_text">
                <div class="myshopping_item_context_text_title"><a href="oneItem.item?item_code=${cl.item_code}">${cl.item_name}</a></div>
                <div class="myshopping_item_context_text_price"><fmt:formatNumber value="${cl.item_price}"/> 원</div>
              </div>
            </div>
            <div class="myshopping_item_detail">
              <div class="myshopping_item_detail_amount">
                <input type="button" value="-" onclick="decrement(${cl.cart_item_no},${cl.cart_amount})"/>
                <div class="myshopping_item_detail_amount_count">${cl.cart_amount}</div>
                <input type="button" value="+" onclick="increment(${cl.cart_item_no},${cl.cart_amount},${cl.item_count})"/>
              </div>
              <div class="myshopping_item_detail_price"><input type="hidden" name="sum" value="${cl.sum}">
						<fmt:formatNumber value="${cl.sum}"/> 원</div>
              <div class="myshopping_item_detail_btn">
                <div class="myshopping_item_detail_btn_check">
                  <input type="button" value="X" onclick="delCheck('${cl.cart_item_no}')"/>
                </div>
                <div class="myshopping_item_detail_btn_delete">
                  <input type="checkbox" name="check" value="${cl.cart_item_no}" checked onclick="calc()"/>
                </div>
              </div>
            </div>
          </div>
          	</c:otherwise>
			</c:choose>
			</c:forEach>
        </div>
        
        
        <div class="my_shopping_receipt">
          <div class="my_shopping_receipt_title">PRICE</div>
          <div class="my_shopping_receipt_context">
            <div class="my_shopping_receipt_context_price">
              <div class="my_shopping_receipt_context_total">TOTAL</div>
              <div class="my_shopping_receipt_context_total_price">
              <span id="total"><fmt:formatNumber value="${total}"></fmt:formatNumber></span> 원</div>
            </div>
            <div class="my_shopping_receipt_btn">
              <input type="button" value="선택상품 구매" onclick="slctOrder()"/>
              <input type="button" value="전체상품 구매" onclick="allOrder()"/>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- 주문으로 넘어가는 폼. 실제로 보이지 않음-->
<form name="gofrm" action="goOrder.pay">
	<input type="hidden" name="orderList">
</form>
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
<script type="text/javascript" src="<c:url value='/resources/js/pay/cart.js'/>"></script>	
</body>
</html>