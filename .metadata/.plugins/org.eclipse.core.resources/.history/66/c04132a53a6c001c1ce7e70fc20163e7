<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<%
		String checkLogin = (String) session.getAttribute("checkLogin");
		String mem_id= (String) session.getAttribute("mem_id");
	%>
	session
	<%=checkLogin%><br>
	<%
		if (checkLogin == "success") {
	%>
	<form action="boardUpdate.board" method="post" name="frm">
		글번호 ${board.board_no}<br>
		글제목<input type="text" name="board_sub" value="${board.board_sub}"><br>
		작성 일자 <fmt:formatDate value="${board.board_date}"/><br>
		작성자 ${board.mem_id}<br>
		글 내용<br>
		<textarea rows="5" cols="50" style="resize: none;" name="board_content">${board.board_content}</textarea>
		<br> <input type="hidden" name="board_no" value="${board.board_no}" id="board_no">
		<input type="button" value="수정" onclick="checkSubmit()"><br>
		<input type="button" value="QnA 리스트" onclick="location.href='qnaList.board'">
		<input type="hidden" value="${mem_id}" id="mem_id" name="mem">
	</form>
	<form action="qnaDelete.board" method="post" name="deletefrm">
		<input type="hidden" value="${board.board_no}" name="board_no">
		<input type="button" onclick="deleteSubmit()" value="삭제">
	</form>
	<br>
	<h3>댓글</h3>
	<!-- Comments Form -->
	<form name="comment-form" action="insertComment.board" method="post"
		autocomplete="off">
		<input type="hidden" name="board_no" value="${board.board_no}">
		<textarea style="width: 1100px" rows="3" cols="30" name="reply_content" placeholder="댓글을 입력하세요" style="resize: none;"></textarea>
		<button type="submit">Submit</button>
	</form>
	
	<table class="replyTable" id="rtb">
		<tbody></tbody>
	</table>
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
	
	$(document).ready(function(){
		   getCommentList();
		  
		});
		 
		/**
		 * 댓글 불러오기(Ajax)
		 */

		function getCommentList() {
			var board_no = $('#board_no').val();
			 
			$.ajax({
				type : 'GET',
				url : "/commentList.board",
				data : {board_no : board_no},
				dataType: "json", // 전송타입 json으로 변경
				success : function(data) {
					var $tableBody = $('#rtb tbody');
					$tableBody.html('');
					if(data.length > 0){
						var mem_id= $('#mem_id').val();
						for(var i in data){
							var $tr = $('<tr class="rtb_tr">');
							var $delBtn  = $('<button id="deleteReply" onclick="deleteReply(' + data[i].reply_no+ ')">삭제</button>');
							var $rWriter = $('<td>').text(data[i].reply_sub);
							var $rContent = $('<td>').text(data[i].reply_content);
							var $rCreateDate = $('<td width=150>').text(data[i].reply_date);
							$tr.append($rWriter);
							$tr.append($rContent);
							$tr.append($rCreateDate);
							if(mem_id==data[i].reply_sub){
								$tr.append($delBtn);
							}
							$tableBody.append($tr);
						}
					}else{
						var $tr = $('<tr>');
						var $rContent = $('<td colspan=3>').text('등록된 댓글이 없습니다');
						$tr.append($rContent);
						$tableBody.append($tr);
					}
				},
				error : function(result) {
				},
				complete : function() {

				}

			});
		}
		
		function deleteReply(reply_no) {
			$.ajax({
				type : 'POST',
				url : "/deleteReply.board",
				data : {reply_no : reply_no},
				dataType: "json", // 전송타입 json으로 변경
				success : function(data) {
					if(data.resultCode=='1'){
						alert('댓글 삭제에 '+data.resultMSG);
					}else {
						alert('댓글 삭제에 '+data.resultMSG);
					}
				},
				error : function(result) {
					console.log('오류는 왜 존재하는 걸까');
				},
				complete : function() {
					getCommentList();
				}

			});
	      }
	</script>
</body>
</html>