<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록보기-select</title>
</head>
<body>
	<table>
			<tr align="center">
				<th >번호</th>
				<th >결제 방법</th>
				<th >날짜</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
	
			<c:forEach items="${list}" var="payVO">
			<form action="/update.pay" method="post">
				<tr align="center">
					<td>
					<a href="/selectOne.pay?pay_no=${payVO.pay_no}">${payVO.pay_no}</a>
					<input type="hidden" name="pay_no" value="${payVO.pay_no}">
					</td> 
					<td><input type="text" name="pay_method" value="${payVO.pay_method}"></td>
					<td>
					${payVO.pay_date}
					<input type="hidden" name="pay_date" value="${payVO.pay_date}">
					</td>
					<td><input type="submit" value="수정"></td>
					<td><a href="/delete.pay?pay_no=${payVO.pay_no}">삭제</a></td>
				</tr>
			</form>	
			</c:forEach>
	</table>

</body>
</html>