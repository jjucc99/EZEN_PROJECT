<%--
  Created by IntelliJ IDEA.
  User: jjucc
  Date: 2021-12-21
  Time: 오후 2:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/> ">
</head>
<body>
<form action="/join" method="post">
    <label for="mem_id">아이디</label>
    <input type="text" name="mem_id" id="mem_id">
    <input type="button" value="아이디 중복체크" id="check_id"><br/>
    <span class="id_input_re_1">사용 가능한 아이디입니다.</span>
    <span class="id_input_re_2">아이디가 이미 존재합니다.</span>

    <label for="mem_pwd">비밀번호</label>
    <input type="password" name="mem_pwd" id="mem_pwd"><br/>

    <label for="check_pwd">비밀번호 확인</label>
    <input type="password" name="check_pwd" id="check_pwd"><br/>

    <label for="mem_name">이름</label>
    <input type="text" name="mem_name" id="mem_name"><br/>

    <label for="address">주소</label>
    <input type="text" name="mem_addr1" id="address">
    <input type="text" name="mem_addr2">
    <input type="text" name="mem_addr3"><br/>

    <label for="mem_phone">휴대번호</label>
    <input type="text" name="mem_phone" id="mem_phone"><br/>

    <label for="mem_email">메일</label>
    <input type="email" name="mem_email" id="mem_email"><br/>

    <input type="submit" value="전송">
</form>
    <script src="<c:url value="/resources/js/checkId.js"/> "/></script>
</body>
</html>
