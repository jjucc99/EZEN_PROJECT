<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<style>
	h2 {
		text-align: center;
	}
	table {
		width: 100%;
	}
	#outter {
		display: block;
		width: 60%;
		margin: auto;
	}
	a {
		text-decoration: none;
	}
	
	div tr{
	float: left;
	}
	
	img {
	width: 80px;
	height: 80px;
	object-fit: cover;
	}
</style>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="cate.item/{categoryId}?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
<body>

<h2>카테고리 리스트</h2>
<div id="outter">

	 <!-- 옵션선택 끝 -->
	<table>
		<c:forEach items="${catelist}" var="CateListVO">
			<tr>
				<th><a href="oneItem.item?item_code=${CateListVO.item_code}" style="color:black"><figure>	
				<img alt="" src="<c:url value='/image/${CateListVO.imgPath}'/>">
				<figcaption>${CateListVO.item_name}<br><h6>${CateListVO.item_price}</h6></figcaption>
				</figure></a></th>
			</tr>
		</c:forEach>
	</table>
	
	<div style="display: block; text-align: center;">		

	</div>
</div>
</body>
</html>