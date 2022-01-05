<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html  lang="en">
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
    <main>
      <div class="my_board_container">
        <div class="my_board_container_title">
          <span>ORDER LIST</span>
        </div>
        <div class="my_board_container_context">
          <a href="">
            <div class="admin_order_list_container_context">
              <div class="admin_order_list_container_context_cord">주문번호</div>
              <div class="admin_order_list_container_context_data">주문정보</div>
              <div class="admin_order_list_container_context_id">주문자</div>
              <div class="admin_order_list_container_context_day">주문일자</div>
              <div class="admin_order_list_container_context_delivery_status">
                배송상태
              </div>
              <div class="admin_order_list_container_context_order">주문상태</div>
              <div class="admin_order_list_container_context_btn">상태변경</div>
            </div>
          </a>
          <!-- 늘어나기 -->
          <c:forEach items="${viewAll}" var="order">
            <div class="admin_order_list_container_context">
              <div class="admin_order_list_container_context_cord">${order.ord_no}</div>
              <div class="admin_order_list_container_context_data"><a href="orderDetail.ad?ord_no=${order.ord_no}">${order.item_name}
				<c:if test="${order.order_item_count!=0}">
				외 ${order.order_item_count}개</c:if>
				</a></div>
              <div class="admin_order_list_container_context_id">${order.mem_id}</div>
              <div class="admin_order_list_container_context_day"><fmt:formatDate value="${order.ord_date}"/></div>
              <div class="admin_order_list_container_context_delivery_status">
                ${order.delivery_status}
              </div>
              <div class="admin_order_list_container_context_order">${order.ord_status}</div>
              <div class="admin_order_list_container_context_btn">
                <div class="admin_order_list_container_context_btn_update">
                  <form action="deliveryStatus.ad" method="post">
					<input type="hidden" name="ord_no" value="${order.ord_no}">
					<input type="submit"  value="배송완료 ">
					</form>
                </div>
                <div class="admin_order_list_container_context_btn_cancle">
                  <form action="orderStatus.ad" method="post">
					<input type="hidden" name="ord_no" value="${order.ord_no}">
					<input type="submit"  value="처리완료">
					</form>
                </div>
              </div>
            </div>
          </c:forEach>
          <!-- 여기까지 -->
          <div class="my_board_container_context_btn">
            <div class="my_board_container_context_btn_box">
            	<c:if test="${paging.nowPage != 1 }">
              <input type="button" value="◀" onclick="location.href='/orderList.ad?nowPage=${paging.nowPage - 1}'" />
              </c:if>
              <div>
              ${paging.nowPage}
              </div>
              <c:if test="${paging.nowPage != paging.lastPage}">
              <input type="button" value="▶" onclick="location.href='/orderList.ad?nowPage=${paging.nowPage+1}'"/>
              </c:if>
            </div>
          </div>
        </div>
      </div>
    </main>
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