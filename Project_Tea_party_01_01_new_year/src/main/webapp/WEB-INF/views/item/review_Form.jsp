<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REVIEW</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<style type="text/css">
img {
	width: 200px;
	height: 200px;
	object-fit: cover;
}

textarea{
	width:70%; 
	height:200px; 
    resize:none;/* 크기고정 */
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
            <div class="review_container_header_name">아이템 명: ${item_name}</div>
            <div class="review_container_header_title">제목: <input type="text" name="r_board_sub"><br></div>
            <div class="review_container_header_day">작성일자: <fmt:formatDate value="${now}" pattern="yyyy-MM-dd hh:mm:ss"/></div>
          </div>
          <div class="review_container_context">
            <div class="review_container_context_img"><img src="resources/IMG/NO_IMAGE.png" alt="없음" id="original">
            <br><input type="file" name="image" id="img" onchange="fileChange(this)"/></div>
            <div class="review_container_context_text"><textarea name="r_board_content"></textarea></div>
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