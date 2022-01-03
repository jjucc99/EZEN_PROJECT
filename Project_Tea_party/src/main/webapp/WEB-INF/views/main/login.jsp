<%--
  Created by IntelliJ IDEA.
  User: jjucc
  Date: 2021-12-28
  Time: 오전 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>TEA PARTY_LOGIN</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>
<main>
    <div class="login_container">
        <form action="/login" method="post">
            <div class="login_title">
                <a href="/">TEA PARTY</a>
            </div>
            <div class="login_context">
                <div class="login_box">
                    <label for="id">ID</label>
                    <input type="text" name="id" id="id" value="${rememberedId}" required>
                </div>
                <div class="login_box">
                    <label for="pw">PASSWORD</label>
                    <input type="password" name="pw" id="pw" required>
                </div>
                <div class="login_check">
                    <c:choose>
                        <c:when test="${not empty cookie.CHECKED}">
                            <input type="checkbox" name="rememberId" id="checkbox" value=true checked>
                        </c:when>
                        <c:otherwise>
                            <input type="checkbox" name="rememberId" id="checkbox" value=true>
                        </c:otherwise>
                    </c:choose>
                    <label for="checkbox">아이디 저장</label>
                </div>
            </div>
            <div class="login_subbit">
                <input type="submit" value="LOG IN" />
            </div>
        </form>
    </div>
    <a href="/join">
        <div class="login_join">
            <span>JOIN</span>
        </div>
    </a>
</main>
</body>
</html>
