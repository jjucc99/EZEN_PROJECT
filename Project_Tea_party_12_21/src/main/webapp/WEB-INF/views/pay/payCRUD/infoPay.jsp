<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr align="center">
			<th>번호</th>
			<th>결제 방법</th>
			<th>날짜</th>
		</tr>
		<tr align="center">
			<td>${selectOne.pay_no}</td>
			<td>${selectOne.pay_method}</td>
			<td>${selectOne.pay_date}</td>
		</tr>
	</table>
	<a href="/list.pay">리스트로 가기</a>	
</body>
</html>