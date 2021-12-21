<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="addItem.ad" method="post" enctype="multipart/form-data">

코드<input type="number" name="item_code"><br>
이름<input type="text" name="item_name"><br>
가격<input type="number" name="item_price"><br>
정보<input type="text" name="item_information"><br>
카테고리<input type="number" name="cate_code"><br>
이미지<input type="file" name="image"/><br>
<input type="submit" value="전송" ><br>
</form>
<button onclick="location.href='itemList.ad'">상품 리스트로 이동</button>
카테고리 번호
1=홍차
2=허브차
3=커피
4=과일청
5=티웨어
</body>
</html>
