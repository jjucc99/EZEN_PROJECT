<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css">
    <title>TEA_PARTY_MYPAGE</title>
    <style type="text/css">
        img {
            width: 120px;
            height: 120px;
            object-fit: cover;
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
<% String checkLogin = (String) session.getAttribute("checkLogin");
    if (checkLogin == "success") { %>

<script type="text/javascript">
    var value =${checkI};

    if (value = 1) {
        alert("구매 감사드립니다.\n구매내역 페이지로 이동합니다.");
    }
</script>

<section>
    <div class="mypage_container">
        <div class="mypage_title">
            <span class="mypage_title_title">MY PAGE</span>
        </div>
        <div class="mypage_btns">
            <div class="mypage_btn">
                <div class="mypage_btn_text">
                    <a href="/profile/${mem_id}"><span>PROFILE</span></a>
                </div>
            </div>
            <div class="mypage_btn">
                <div class="mypage_btn_text">
                    <a href="/myBoardList.board"><span>MY BOARD</span></a>
                </div>
            </div>
            <div class="mypage_btn">
                <div class="mypage_btn_text">
                    <a href="/orderList.pay"><span>MY ORDER</span></a>
                </div>
            </div>
        </div>
    </div>
</section>

<main>
    <div class="order_container">
        <div class="order_container_title">ORDER</div>

        <!-- 늘이는 거 -->
        <c:forEach items="${orderList}" var="ol">
            <div class="order_container_items">
                <div class="order_container_items_item_code">
                    <a href="orderItem.pay?ord_no=${ol.ord_no}"><span>주문번호</span>
                        <span>${ol.ord_no}</span></a>
                </div>

                <div class="order_container_items_item_box">
                    <div class="order_container_img"><a href="orderItem.pay?ord_no=${ol.ord_no}"><img
                            src="<c:url value='/image/${ol.imgPath}'/>"></a></div>

                    <div class="order_container_text">
                        <div class="order_container_text_name"><a
                                href="orderItem.pay?ord_no=${ol.ord_no}">${ol.rep_name}</a></div>
                        <div class="order_container_text_count"><a href="orderItem.pay?ord_no=${ol.ord_no}"><c:if
                                test="${ol.ord_count!=0}">외 ${ol.ord_count} 개</c:if></a></div>
                        <div class="order_container_text_sum"><a
                                href="orderItem.pay?ord_no=${ol.ord_no}"><fmt:formatNumber
                                value="${ol.ord_price}"/>원</a></div>
                    </div>
                    <div class="order_container_context">
                        <div class="order_container_context_date"><fmt:formatDate value="${ol.ord_date}"/></div>
                        <div class="order_container_context_delivery_status">${ol.delivery_status}</div>
                        <div class="order_container_context_btn">
                            <c:choose>
                                <c:when test="${ol.ord_status =='처리완료'}">
                                    <select>
                                        <option selected>처리완료</option>
                                    </select>
                                </c:when>
                                <c:when test="${ol.ord_status =='구매확정'}">
                                    <select>
                                        <option selected>구매확정</option>
                                    </select>
                                </c:when>
                                <c:otherwise>
                                    <select id="${ol.rep_name}">
                                        <option value=''>주문 처리중</option>
                                        <option value='1'>구매확정</option>
                                        <option value='2'
                                                <c:if test="${ol.ord_status == '주문취소'}">selected</c:if>>주문취소
                                        </option>
                                        <option value='3'
                                                <c:if test="${ol.ord_status == '교환/반품'}">selected</c:if>>교환/반품
                                        </option>
                                    </select>
                                    <input type="button" onclick="change('${ol.ord_no}','${ol.rep_name}')" value="선택">
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        <!-- 늘이는 거 끝 -->
    </div>
</main>
<%
} else {
%>
<script type="text/javascript">
    alert("로그인 하셔야 합니다!");
    location.href = "/login";
</script>
<%
    }
%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="<c:url value='/resources/js/pay/order.js'/>"></script>
</body>
</html>