<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>리뷰작성</h2>
<form action="reviewInsert.item" method="post" enctype="multipart/form-data" name="frm">
	리뷰제목 : <input type="text" name="r_board_sub"><br>
	리뷰내용 : <textarea rows="5" cols="50" style="resize: none;" name="r_board_content"></textarea><br>
	이미지 첨부 : <input type="file" name="image"/><br><br><br>
	<input type="hidden" value="${item_code}" name="item_code">
	<input type="button" value="리뷰작성" onclick="checkSubmit()">
</form>
<script type="text/javascript">
function checkSubmit() {
   var r_board_sub = document.getElementsByName('r_board_sub')[0].value;
   var r_board_content = document.getElementsByName('r_board_content')[0].value;
   if(!r_board_sub){
    	alert("제목을 입력하세요.");
    	r_board_sub.focus();
   		return false;
   }
   if(!r_board_content){
    	alert("내용을 입력하세요");
    	r_board_content.focus();
   		return false;
   }
   frm.method = 'post';
   frm.submit();
  }
</script>
</body>
</html>