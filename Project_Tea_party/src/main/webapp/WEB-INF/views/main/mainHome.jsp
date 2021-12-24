<%@ page import="oracle.sql.CHAR" %><%--
  Created by IntelliJ IDEA.
  User: jjucc
  Date: 2021-12-17
  Time: 오전 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String checkLogin = (String) session.getAttribute("checkLogin");
    Character checkAdmin = (Character) session.getAttribute("checkAdmin");
    Character checkMember = (Character) session.getAttribute("checkMember");
%>
<div>checkLogin= <%=checkLogin%> </div>
<div>checkAdmin= <%=checkAdmin%></div>
<div>checkMember= <%=checkMember%> </div>

<%
    if (checkLogin == "success" && checkMember == 'N') {

%>
<a href="/logout">로그아웃</a>
<%
    if (checkAdmin != 'N') {
%>
<a href="admin.ad">ADMIN</a>
<%
    }
%>
<a href="/checkMember">회원 정보 수정</a>
<a href="cart.pay">PAY</a>
<a href="test.item">ITEM</a>
<a href="members.me">MEMBER</a>
<a href="board.board">BOARD</a>
<%
} else {
%>
<a href="/join">회원가입</a>
<form action="/login" method="post">
    <label for="id">ID</label>
    <input type="text" name="id" id="id" value="${rememberedId}" required>

    <label for="pw">PASSWORD</label>
    <input type="password" name="pw" id="pw" required>
    <label for="checkbox">아이디 저장</label>
    <c:choose>
        <c:when test="${not empty cookie.CHECKED}">
            <input type="checkbox" name="rememberId" id="checkbox" value=true checked>
        </c:when>
        <c:otherwise>
            <input type="checkbox" name="rememberId" id="checkbox" value=true>
        </c:otherwise>
    </c:choose>
    <input type="submit" value="login">
</form>

<%
    }
%>
</body>
</html>
