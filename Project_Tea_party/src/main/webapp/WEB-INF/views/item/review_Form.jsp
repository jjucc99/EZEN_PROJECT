<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>REVIEW</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<style type="text/css">
img {
	width: 200px;
	height: 200px;
	object-fit: cover;
}
</style>
<body>
<header class="main_header">
    <div class="header_title_conteiner">
        <div class="header_title_title">
            <div class="header_title"><a href="/main">TEA PARTY</a></div>
        </div>
        <div class="header_controller_conteiner">
            <div class="header_controller">
                <a href="/mypage">MY PAGE</a>
            </div>
            <div class="header_controller">
                <a href="/cart.pay">MY SHOPPING</a>
            </div>
            <div class="header_controller">
                <a href="/logout">LOGOUT</a>
            </div>
        </div>
    </div>
</header>
   <%  String checkLogin = (String) session.getAttribute("checkLogin");
	if (checkLogin == "success") { %>
	
	<section>
      <div class="review_container">
        <div class="review_container_title">REVIEW</div>
        <div class="review_container_box">
        <form action="reviewInsert.item" method="post" enctype="multipart/form-data" name="frm">
          <div class="review_container_header">
            <div class="review_container_header_num">New!</div>
            <div class="review_container_header_name">${item_name}</div>
            <div class="review_container_header_title">제목: <input type="text" name="r_board_sub" placeholder="제목을 입력해주세요"><br></div>
          </div>
          <div class="review_container_context">
            <div class="review_container_context_img"><img src="resources/img/NO_IMAGE.png" alt="이미지 없음" id="original">
            <input type="file" name="image" id="img" onchange="fileChange(this)"/></div>
            <div class="review_container_context_text"><textarea name="r_board_content" placeholder="리뷰를 작성해주세요.상품의 내용과 관련 없는 내용은 삭제될 수 있습니다."></textarea></div>
          </div>
          <div class="review_container_btn">
            <input type="button" value="리뷰작성" onclick="checkSubmit()">
          </div>
          <input type="hidden" value="${item_code}" name="item_code">
      </form>
        </div>
      </div>
    </section>
	
	<%
		} else {
%>
	<script type="text/javascript">
	alert("로그인 하셔야 합니다!");
	location.href="/login";
	</script>
	<%
		}
	%>
	
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
  
function fileChange(change) {
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