<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		if (checkLogin == "success") {
	%>
	<form action="boardUpdate.ad" method="post" name="frm">
		글번호 ${board.board_no}<br>
		글제목<input type="text" name="board_sub" value="${board.board_sub}"><br>
		작성일자 <fmt:formatDate value="${board.board_date}"/><br>
		작성자${board.mem_id}<br>
		글 내용<br><textarea rows="5" cols="50" style="resize: none;" name="board_content">${board.board_content}</textarea><br>
		<input type="hidden" name="board_no" value="${board.board_no}">
		<input type="button" value="수정" onclick="checkSubmit()"><br>
		<input type="button" value="게시글 리스트로 이동" onclick="location.href='boardList.ad'">
	</form>
	<form action="boardDelete.ad" method="post" name="deletefrm">
		<input type="hidden" value="${board.board_no}" name="board_no">
		<input type="button" onclick="deleteSubmit()" value="삭제">
	</form>
	<%
		} else {
	%>
	<a href="/login">로그인 페이지로 이동 </a>
	<%
		}
	%>
	<script type="text/javascript">
	function checkSubmit() {
        var board_sub = document.getElementsByName('board_sub')[0].value;
        var board_content = document.getElementsByName('board_content')[0].value;
        if(!board_sub){
        	alert("제목을 입력하세요");
        	board_sub.focus();
        	return false;
        }
        if(!board_content){
        	alert("내용을 입력하세요");
        	board_content.focus();
        	return false;
        }
        frm.method = 'post';
        frm.submit();
      }
	function deleteSubmit() {
		 if (confirm("정말 삭제하시겠습니까??") == true){
		     document.deletefrm.submit();
		 }else{
		     return false;
		 }
      }
	</script>
</body>
</html>