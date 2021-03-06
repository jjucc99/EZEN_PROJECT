<%--
  Created by IntelliJ IDEA.
  User: jjucc
  Date: 2021-12-28
  Time: 오전 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>TEA PARTY</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>
<body>
<header class="title_header">
    <div class="header_container">
        <h1>TEA PARTY</h1>
        <div>
            <a class="header_in_door" href="/main">OPEN THE DOOR</a>
        </div>
    </div>
</header>
<div class="img_container in_bed">
    <div class="img_detail">
        <a href="cate.item?cate_code=1">
            <span>TEA</span>
        </a>
    </div>
</div>
<div class="header_space">
    <div class="header_space_text">
        <div>If you are cold, tea will warm you</div>
        <div>if you are too heated, it will cool you</div>
        <div>If you are depressed, it will cheer you</div>
        <div>If you are excited, it will calm you.</div>
        <div>-William Ewart Gladstone-</div>
    </div>
</div>
</div>
<div class="img_container in_cafe">
    <div class="img_detail">
        <a href="cate.item?cate_code=4">
            <span>COFFEE</span>
        </a>
    </div>
</div>
</body>
</html>

