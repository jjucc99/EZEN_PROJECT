<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>Home</title>
</head>
<body>
<h1>
    Hello world!
</h1>

<P>

        <%
		String checkLogin = (String) session.getAttribute("checkLogin");
		%>
        session   <%=checkLogin%>
        <%
		if (checkLogin == "success"){

	    %>
            <a href="/insert.me">INSERT.ME</a>
            <a href="/select.me">SELECT.ME</a>
            <a href="/update.me">UPDATE.ME</a>
            <a href="/delete.me">DELETE.ME</a>
            <a href="/login.me">LOGIN.ME</a>
        <%
            }else{
        %>
            <a href="/">로그인을 하세요! </a>
        <%
            }
        %>

</body>
</html>
