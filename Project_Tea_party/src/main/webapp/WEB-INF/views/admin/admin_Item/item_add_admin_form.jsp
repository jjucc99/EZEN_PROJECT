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
		String checkLogin = (String) session.getAttribute("checkLogin");
	%>
	session
	<%=checkLogin%><br>
	<%
		if (checkLogin == "success") {
	%>
<form action="addItem.ad" method="post" enctype="multipart/form-data" name="frm">
이름<input type="text" name="item_name"><br>
가격<input type="number" name="item_price"><br>
정보<input type="text" name="item_information"><br>
<select name="cate_code">
	<option value="1">홍차</option>
	<option value="2">허브차</option>
	<option value="3">전통차</option>
	<option value="4">커피</option>
	<option value="5">티웨어</option>
</select>
<br>
<img src="resources/IMG/NO_IMAGE.png" alt="없음" id="original"><br>
이미지<input type="file" name="image" id="img" onchange="fileChange(this)"/><br>
<input type="button" value="상품추가" onclick="checkSubmit()"><br>
</form>
<button onclick="location.href='itemList.ad'">상품 리스트로 이동</button>
	<%
		} else {
	%>
	<a href="/login">로그인 페이지로 이동 </a>
	<%
		}
	%>
</body>

<script>
      function checkSubmit() {
        var item_name = document.getElementsByName('item_name')[0].value;
        var item_price = document.getElementsByName('item_price')[0].value;
        var item_information = document.getElementsByName('item_information')[0].value;
        var image = document.getElementsByName('image')[0].value;
        if(!item_name){
        	alert("이름을 입력하세요");
        	item_name.focus();
        	return false;
        }
        if(item_price<=0){
        	alert("가격을 입력하세요");
        	item_price.focus();
        	return false;
        }
        if(!item_information){
        	alert("정보를 입력하세요");
        	item_information.focus();
        	return false;
        }
        if(!image){
        	alert("사진 파일을 저장해주세요");
        	image.focus();
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
</html>