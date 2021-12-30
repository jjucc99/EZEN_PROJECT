<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String checkLogin = (String) session.getAttribute("checkLogin");
		%>
	session
	<%=checkLogin%><br>
	<%
		if (checkLogin == "success"){

	    %>
	<a href="memberList.ad">회원 관리</a>
	<br>
	<a href="itemList.ad">상품 관리</a>
	<br>
	<a href="orderList.ad">주문내역 관리</a>
	<br>
	<a href="boardList.ad">게시판 관리</a>
	<br>
	<%
            }else{
        %>
	<a href="/">로그인 페이지로 이동 </a>
	<%
            }
        %>
        
    <a href="/main">홈</a>
</body>
</html>