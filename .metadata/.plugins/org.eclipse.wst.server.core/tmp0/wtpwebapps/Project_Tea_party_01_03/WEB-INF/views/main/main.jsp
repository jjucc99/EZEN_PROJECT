<%--
  Created by IntelliJ IDEA.
  User: jjucc
  Date: 2021-12-28
  Time: 오전 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>TEA PARTY</title>
<style type="text/css">
	img {
  		width: 200px;
  		height: 250px;
    	object-fit: cover;
	}

	a 	{
    	text-decoration: none; /* 링크의 밑줄 제거 /
   		color: inherit; / 링크의 색상 제거 */
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
	<!-- $aside -->
	<aside>
		<div class="collection_container">
			<div class="collection_context">
				<div class="collection_block">
					<div class="collection_title">
						<a href="/cate.item?cate_code=1">홍차</a>
					</div>
				</div>
				<div class="collection_block">
					<div class="collection_title">
						<a href="/cate.item?cate_code=2">허브차</a>
					</div>
				</div>
				<div class="collection_block">
					<div class="collection_title">
						<a href="/cate.item?cate_code=3">전통차</a>
					</div>
				</div>
				<div class="collection_block">
					<div class="collection_title">
						<a href="/cate.item?cate_code=4">커피</a>
					</div>
				</div>
				<div class="collection_block">
					<div class="collection_title">
						<a href="/cate.item?cate_code=5">티웨어</a>
					</div>
				</div>
				<div class="collection_block">
					<div class="collection_title">
						<a href="/noticeList.board">Notice</a>
					</div>
				</div>
				<div class="collection_block">
					<div class="collection_title">
						<a href="/qnaList.board">QnA</a>
					</div>
				</div>
			</div>
		</div>
	</aside>
	<!-- $section -->
	<section>
		<div class="item_container">
			<div class="item_container_title">
				<div class="item_container_title_title">NEW</div>
			</div>
			<div class="item_container_img_box">
				<div class="item_container_img"></div>
			</div>
			<div class="item_container_items">
				<!-- 아이템의 숫자에 따라 자동으로 늘어나는 슬롯 -->
				<c:forEach items="${cateNewList}" var="CateNewList">
				<a href="oneItem.item?item_code=${CateNewList.item_code}">
					<div class="item_container_item">
						<div class="item_item_img"><img alt="없음" src="<c:url value='/image/${CateNewList.imgPath}'/>"></div>
						<div class="item_item_context">
							<div class="item_item_title">${CateNewList.item_name}</div>
							<div class="item_item_price">${CateNewList.item_price}</div>
						</div>
					</div>
				</a>
				</c:forEach>
				<!-- end -->
			</div>
		</div>
	</section>
</body>

</html>
