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
		String mem_id = (String) session.getAttribute("mem_id");
	%>
	<%
		String checkLogin = (String) session.getAttribute("checkLogin");
	%>
	session
	<%=checkLogin%><br>
	<%
		if (checkLogin == "success") {
	%>

	<form action="boardInsert.ad" method="post" name="frm">
		글제목<input type="text" name="board_sub"><br> 작성자<%=mem_id%><br>
		글 내용<br>
		<textarea rows="5" cols="50" style="resize: none;" name="board_content"></textarea>
		<br>
		<input type="hidden" name="board_board" value="notice">
		<input type="hidden" name="mem_id" value="<%=mem_id%>">
		<input type="button" value="작성" onclick="checkSubmit()"><br>
		<input type="button" value="게시글 리스트로 이동" onclick="location.href='boardList.ad'">
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
	
	</script>
</body>
</html>