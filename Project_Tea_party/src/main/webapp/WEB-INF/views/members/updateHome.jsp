<%@ page import="kr.co.ezenac.members.model.vo.MemberVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<form action="/update.me" method="post">
    mem_id : <input type="text" name="mem_id" value="${member.mem_id}"><br/>
    mem_name : <input type="text" name="mem_name" value="${member.mem_name}"><br/>
    mem_addr1 : <input type="text" name="mem_addr1" value="${member.mem_addr1}"><br/>
    mem_addr2 : <input type="text" name="mem_addr2" value="${member.mem_addr2}"><br/>
    mem_addr3 : <input type="text" name="mem_addr3" value="${member.mem_addr3}"><br/>
    mem_phone : <input type="text" name="mem_phone" value="${member.mem_phone}"><br/>
    mem_email : <input type="email" name="mem_email" value="${member.mem_email}"><br/>
    <input type="submit" value="전송">
</form>
</body>
</html>


