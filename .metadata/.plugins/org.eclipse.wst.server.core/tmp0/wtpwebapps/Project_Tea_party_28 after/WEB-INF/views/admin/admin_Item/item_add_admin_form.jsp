<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
<!-- 카테고리<input type="number" name="cate_code"><br> -->
이미지<input type="file" name="image"/><br>
<input type="button" value="상품추가" onclick="checkSubmit()"><br>
</form>
<button onclick="location.href='itemList.ad'">상품 리스트로 이동</button>
카테고리 번호
1=홍차
2=허브차
3=커피
4=과일청
5=티웨어
</body>

<script>
      function checkSubmit() {
        var item_name = document.getElementsByName('item_name')[0].value;
        var item_price = document.getElementsByName('item_name')[0].value;
        var item_information = document.getElementsByName('item_information')[0].value;
        var image = document.getElementsByName('image')[0].value;
        if(!item_name){
        	alert("이름을 입력하세요");
        	item_name.focus();
        	return false;
        }
        if(item_price==0){
        	alert("가격을 입력하세요");
        	item_name.focus();
        	return false;
        }
        if(!item_information){
        	alert("정보를 입력하세요");
        	item_name.focus();
        	return false;
        }
        if(!image){
        	alert("사진 파일을 저장해주세요");
        	item_name.focus();
        	return false;
        }
        frm.method = 'post';
        frm.submit();
      }
</script>
</html>