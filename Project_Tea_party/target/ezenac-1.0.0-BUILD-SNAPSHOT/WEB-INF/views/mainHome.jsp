<%--
  Created by IntelliJ IDEA.
  User: jjucc
  Date: 2021-12-17
  Time: 오전 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String checkLogin = (String) session.getAttribute("checkLogin");
%>
session  <%=checkLogin%>
<%
    if(checkLogin == "success" ){

%>
    <a href="/logout">로그아웃</a>
    <a href="admin.ad">ADMIN</a>
    <a href="hello.pay">PAY</a>
    <a href="test.item">ITEM</a>
    <a href="members.me">MEMBER</a>
<%
}else{
%>
    <form action="/login" method="post">
        <label for="id">ID</label>
        <input type="text" name="id" id="id">
        <label for="password">PASSWORD</label>
        <input type="password" name="password" id="password">
        <input type="submit" value="login">
    </form>
<%
    }
%>
</body>
</html>
