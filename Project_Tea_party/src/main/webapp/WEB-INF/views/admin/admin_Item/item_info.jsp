<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>ADMIN ITEM</title>
<style type="text/css">

	a 	{
    	text-decoration: none; /* 링크의 밑줄 제거 /
   		color: inherit; / 링크의 색상 제거 */
	}
	
	img {
	width: 200px;
	height: 150px;
	object-fit: cover;
}

</style>
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" />
</head>
<body>

	<%
    String checkLogin = (String) session.getAttribute("checkLogin");
    Character checkAdmin = (Character) session.getAttribute("checkAdmin");
    Character checkMember = (Character) session.getAttribute("checkMember");
%>
	<!-- $header -->
	<header class="main_header">
		<div class="header_title_conteiner">
			<div class="header_title_title">
				<div class="header_title">
					<a href="/main">TEA PARTY</a>
				</div>
			</div>
			<div class="header_controller_conteiner">
				<%
                if (checkLogin == "success" && checkMember == 'N') {
            %>
				<div class="header_controller">
					<a href="/mypage">MY PAGE</a>
				</div>
				<div class="header_controller">
					<a href="/cart.pay">MY SHOPPING</a>
				</div>
				<div class="header_controller">
					<a href="/logout">LOGOUT</a>
				</div>
				<%
                if (checkAdmin != 'N') {
            %>
				<div class="header_controller">
					<a href="/admin.ad">ADMIN</a>
				</div>
				<%
                }
            %>
				<%
            } else {
            %>
				<div class="header_controller">
					<a href="/join">JOIN</a>
				</div>
				<div class="header_controller">
					<a href="/login">LOGIN</a>
				</div>
				<%
                }
            %>

			</div>
		</div>
		</div>
	</header>
		<!-- $section -->
	<%  
	if (checkLogin == "success") { %>
	   
	<section>
      <div class="item_info_container container">
        <div class="item_info_container_title">
          <span>ITEM INFO</span>
        </div>
        
        <div class="item_info_container_description">
          <div class="item_info_container_description_img">
          <img src="<c:url value='/image/${item.img_path}'/>" alt="없음" id="original">
          <form action="itemUpdate.ad" method="post" enctype="multipart/form-data" name="frm">
		<input type="file" name="image" id="img" onchange="fileChange(this)"/>
		<input type="hidden" name="item_code" value="${item.item_code}">
		<input type="hidden" name="imgFlag" id="imgFlag" value="Y">
		<input type="hidden" name="item_information">
          <input type="hidden" name="cate_code">
          <input type="hidden" name="item_name">
          <input type="hidden" name="item_price">
          <input type="hidden" name="item_count">
		</form>
          </div>
          <div class="item_info_container_description_text">
          상품정보: <textarea name="item_information" placeholder="상품 정보를 입력하세요.">${item.item_information}</textarea></div>
        </div>
        <div class="item_info_container_header">
          <div class="item_info_container_header_cord">
            NO. ${item.item_code}
          </div>
          <div class="item_info_container_header_category">
           카테고리: <select name="cate_code" id="selectBox">
			<option value="1"<c:if test="${item.cate_code == 1}">selected</c:if>>홍차</option>
			<option value="2"<c:if test="${item.cate_code == 2}">selected</c:if>>허브차</option>
			<option value="3"<c:if test="${item.cate_code == 3}">selected</c:if>>전통차</option>
			<option value="4"<c:if test="${item.cate_code == 4}">selected</c:if>>커피</option>
			<option value="5"<c:if test="${item.cate_code == 5}">selected</c:if>>티웨어</option>
			<option disabled="disabled" value="6"<c:if test="${item.cate_code == 6}">selected</c:if>>삭제</option>
		</select>
          </div>
          <div class="item_info_container_header_name">
            상품명: <input type="text" name="item_name"  value="${item.item_name}" placeholder="상품명">
          </div>
        <!-- </div>
        <div class="item_info_container_body"> -->
          <div class="item_info_container_body_price">
            가격:<input type="number" name="item_price" value="${item.item_price}" placeholder="가격">
          </div>
          <div class="item_info_container_body_count">
            수량:<input type="number" name="item_count" value="${item.item_count}">
          </div>
        </div>

        <div class="item_info_container_btn">
          <div class="item_info_container_btn_update">
            <input type="button" value="수정" onclick="checkSubmit()"">
          </div>
          <div class="item_info_container_btn_delete">
           <input type="button" onclick="deleteSubmit()" value="삭제">
           <form action="itemDelete.ad" method="post" name="deletefrm">
			<input type="hidden" name="item_code" value="${item.item_code}">
			</form>
          </div>
          <div class="item_info_container_btn_cancle">
            <input type="button" value="상품 리스트" onclick="location.href='itemList.ad'"/>
          </div>
        </div>
      </div>
  
    </section>
<%
		}else {
%>
	<script type="text/javascript">
	alert("로그인 하셔야 합니다!");
	location.href="/login";
	</script>
	<%
		}
	%>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function checkSubmit() {
    var name = document.getElementsByName('item_name')[1].value;
    var price = document.getElementsByName('item_price')[1].value;
    var information = document.getElementsByName('item_information')[1].value;
    var count = document.getElementsByName('item_count')[1].value;
    var image = document.getElementsByName('image')[0].value;
    
    var target = document.getElementById("selectBox");
    var cate=target.options[target.selectedIndex].value;
    
    if(!name){
    	alert("상품명을 입력하세요");
    	name.focus();
    	return false;
    }
    if(price<=0){
    	alert("가격을 입력하세요!");
    	price.focus();
    	return false;
    }
    if(count<0){
    	alert("수량이 0보다 작을수 없습니다!");
    	count.focus();
    	return false;
    }
    if(!information){
    	alert("정보를 입력하세요");
    	information.focus();
    	return false;
    }
    
    frm.item_information.value=information;
    frm.cate_code.value=cate;
    frm.item_name.value=name;
    frm.item_price.value=price;
    frm.item_count.value=count;
    frm.method = 'post';
    frm.submit();
  }

function deleteSubmit() {
	if (confirm("정말 삭제하시겠습니까??") == true) {
		document.deletefrm.submit();
	} else {
		return false;
	}
}
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