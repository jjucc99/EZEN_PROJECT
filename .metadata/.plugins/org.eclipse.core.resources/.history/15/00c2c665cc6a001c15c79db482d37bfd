<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="reviewUpdate.item" method="post" enctype="multipart/form-data">
	<div>이미지 미리보기</div>
	<img alt="없음" src="<c:url value='/image/${review.img_path}'/>" id="original" style="width: 200px; height: 200px; object-fit: cover;"><br>
	<div id="image_container"></div><br>
	<input type="file" name="image" id="img" onchange="fileChange(this)"/><br>
	리뷰번호 : ${review.r_board_no}<br>
	리뷰제목 : <input type="text" name="r_board_sub" value="${review.r_board_sub}"><br>
	리뷰내용 : <textarea rows="5" cols="50" style="resize: none;" name="r_board_content">${review.r_board_content}</textarea><br>
	<input type="hidden" value="${review.r_board_no}" name="r_board_no">
	<input type="hidden" value="${review.item_code}" name="item_code">
	<input type="hidden" name="imgFlag" id="imgFlag" value="Y">
	<br>
	<input type="submit" value="수정">&nbsp;&nbsp;
</form>
<script type="text/javascript">
function fileChange(change) {
	document.getElementById('imgFlag').value = 'N';
	var reader = new FileReader();
	reader.onload = function(event) {
		var img = document.getElementById('original');
		img.setAttribute("src", event.target.result);
		document.querySelector("div#image_container").appendChild(img);
	};

	reader.readAsDataURL(event.target.files[0]);
}
</script>
</body>
</html>