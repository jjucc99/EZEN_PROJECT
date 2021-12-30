<%--
  Created by IntelliJ IDEA.
  User: jjucc
  Date: 2021-12-28
  Time: 오후 1:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
    <title>TEA_PARTY_MYPAGE</title>
</head>
<body>
<%
    Character checkAdmin = (Character) session.getAttribute("checkAdmin");
%>
<!-- $header -->
<header class="main_header">
    <div class="header_title_container">
        <div class="header_title_title">
            <div class="header_title"><a href="/main">TEA PARTY</a></div>
        </div>
        <div class="header_controller_container">
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
        </div>
    </div>
    </div>
</header>
<!-- $section -->
<section>
    <div class="mypage_container">
        <div class="mypage_title">
            <span class="mypage_title_title">MY_PAGE</span>
        </div>
        <div class="mypage_btns">
            <div class="mypage_btn">
                <div class="mypage_btn_text">
                    <a href=""><span>PROFILE</span></a>
                </div>
            </div>
            <div class="mypage_btn">
                <div class="mypage_btn_text">
                    <a href=""><span>MY_BOARD</span></a>
                </div>
            </div>
            <div class="mypage_btn">
                <div class="mypage_btn_text">
                    <a href="/orderList.pay"><span>MY_ORDER</span></a>
                </div>
            </div>
        </div>
    </div>
    <!-- $main -->
    <main>
        <div class="mypage_main">
        </div>
    </main>
</section>
</body>
</html>
