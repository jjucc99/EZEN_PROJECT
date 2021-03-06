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
<title>ADMIN ORDER</title>
<style type="text/css">

	a 	{
    	text-decoration: none; /* 링크의 밑줄 제거 /
   		color: inherit; / 링크의 색상 제거 */
	}
</style>
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" />
</head>
<body>

	<%
    String checkLogin = (String) session.getAttribute("checkLogin");
    Character checkAdmin = (Character) session.getAttribute("checkAdmin");
    Character checkMember = (Character) session.getAttribute("checkMember");
%>
	<!-- $header -->
	<header class="main_header">
		<div class="header_title_conteiner">
			<div class="header_title_title">
				<div class="header_title">
					<a href="/main">TEA PARTY</a>
				</div>
			</div>
			<div class="header_controller_conteiner">
				<%
                if (checkLogin == "success" && checkMember == 'N') {
            %>
				<div class="header_controller">
					<a href="/mypage">MY PAGE</a>
				</div>
				<div class="header_controller">
					<a href="/cart.pay">MY SHOPPING</a>
				</div>
				<div class="header_controller">
					<a href="/logout">LOGOUT</a>
				</div>
				<%
                if (checkAdmin != 'N') {
            %>
				<div class="header_controller">
					<a href="/admin.ad">ADMIN</a>
				</div>
				<%
                }
            %>
				<%
            } else {
            %>
				<div class="header_controller">
					<a href="/join">JOIN</a>
				</div>
				<div class="header_controller">
					<a href="/login">LOGIN</a>
				</div>
				<%
                }
            %>

			</div>
		</div>
		</div>
	</header>
		<!-- $section -->
	<%  
	if (checkLogin == "success") { %>
	
    <section>
      <div class="order_list_container">
        <div class="order_list_box">
          <div class="order_list_context_title">
            <div class="order_list_context_title_title">ORDER DETAIL</div>
            <div class="order_list_context_title_detial">
              <div class="order_list_context_title_detial_order_num">
                <span>주문번호</span><span>${orderList.ord_no}</span>
              </div>
              <div class="order_list_context_title_detial_status">
                <span><c:choose>
	<c:when test="${orderList.ord_status=='구매확정'||orderList.delivery_status}">구매가 확정되었거나. 배송 완료된 주문입니다.</c:when>
	<c:when test="${orderList.ord_status=='처리완료'}">취소/교환/반품 처리가 완료된 주문입니다.</c:when>
	<c:when test="${orderList.ord_status=='주문취소'||ordInfo.ord_status=='교환/반품'}">취소/교환/반품 신청된 주문입니다.</c:when>
	<c:otherwise></c:otherwise>
	</c:choose></span>
              </div>
            </div>
          </div>
          <div class="order_list_context_items">
            <!-- 복사 하는 부분 -->
            <c:forEach items="${orderDetail}" var="orderDetail">
            <div class="order_list_context_item">
            <div class="order_list_context_item_num">
                <span>상품번호</span>
                <span>${orderDetail.item_code}</span>
              </div>
              <div class="order_list_context_item_context">
              <div class="order_list_context_item_context_img">
              <input type="button" value="상품 정보" onclick="location.href='itemInfo.ad?item_code=${orderDetail.item_code}'"/>
              </div>
                <div class="order_list_context_item_context_detail">
                  <div class="order_list_context_item_context_detail-box">
                    <div class="order_list_context_item_context_detail_name">
                     ${orderDetail.item_name}
                    </div>
                    <div class="order_list_context_item_context_detail_price">
                      <div class="order_list_context_item_context_detail_price_price">
                        <span><fmt:formatNumber value="${orderDetail.item_price}"/> 원</span>
                      </div>
                      <div class="order_list_context_item_context_detail_price_count">
                        <span>수량: </span><span>${orderDetail.order_item_count}개</span>
                      </div>
                    </div>
                  </div>
                  <div class="order_list_context_item_context_detail_sum">
                    <div
                      class="order_list_context_item_context_detail_sum_price"
                    >
                      <span>총 가격: </span><span><fmt:formatNumber value="${orderDetail.item_price * orderDetail.order_item_count}"/> 원</span>
                    </div>
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
            <div class="order_list_delivery_box_delivery_name">${orderList.ord_receiver}</div>
            <div class="order_list_delivery_box_delivery_phone">
              ${orderList.ord_phone}
            </div>
          </div>
          <div class="order_list_delivery_box_address">
            <div class="order_list_delivery_box_address_title">ADDRESS</div>
            <div class="order_list_delivery_box_address_address1">${orderList.ord_addr1}</div>
            <div class="order_list_delivery_box_address_address2">${orderList.ord_addr2}</div>
            <div class="order_list_delivery_box_address_address3">${orderList.ord_addr3}</div>
          </div>
          <div class="order_list_delivery_box_payment">
            <div class="order_list_delivery_box_payment_title">PAYMENT</div>
            <div class="order_list_delivery_box_payment_title_context">
              <div class="order_list_delivery_box_payment_sum">
                <span>총 결제 금액</span><span><fmt:formatNumber value="${total}"/>원</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

<%
		}else {
%>
	<script type="text/javascript">
	alert("로그인 하셔야 합니다!");
	location.href="/login";
	</script>
	<%
		}
	%>
</body>
</html>