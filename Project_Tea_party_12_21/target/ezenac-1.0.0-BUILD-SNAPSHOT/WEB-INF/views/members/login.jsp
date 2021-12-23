<%--
  Created by IntelliJ IDEA.
  User: jjucc
  Date: 2021-12-20
  Time: 오후 12:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>LOGIN</title>
</head>
<body>
<a href="/">홈</a>
<form action="login.me" method="post">
    <label for="id">ID</label>
    <input type="text" name="id" id="id">
    <label for="password">PASSWORD</label>
    <input type="password" name="password" id="password">
    <input type="submit" value="login">
</form>
</body>
</html>
