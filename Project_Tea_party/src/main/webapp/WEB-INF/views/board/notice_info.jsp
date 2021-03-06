<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>NOTICE</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css">
    <head>
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
<section>
    <div class="review_container">
        <div class="review_container_title">NOTICE</div>
        <div class="review_container_box">
            <div class="review_container_header">
                <div class="review_container_header_num">NO.${board.board_no}</div>
                <div class="review_container_header_name">?????????: ?????????</div>
                <div class="review_container_header_title">??????: ${board.board_sub}</div>
                <div class="review_container_header_day"><fmt:formatDate value="${board.board_date}"/></div>
            </div>
            <div class="review_container_context">
                <!-- <div class="review_container_context_img"></div> -->
                <div class="review_container_context_text"><textarea readonly="readonly"
                                                                     style="resize: none;">${board.board_content}</textarea>
                </div>
            </div>
            <div class="review_container_btn">
                <input type="button" value="?????? ???????????? ??????" onclick="location.href='noticeList.board'"/>
            </div>
        </div>
    </div>
</section>
</body>
</html>