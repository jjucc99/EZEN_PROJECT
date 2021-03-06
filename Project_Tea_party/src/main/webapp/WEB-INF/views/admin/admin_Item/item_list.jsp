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
    <main>
      <div class="my_board_container">
        <div class="my_board_container_title">
          <span>ITEM LIST</span>
          <input type="button" onclick="location.href='addItemForm.ad'" value="상품 추가" />
        </div>
        <div class="my_board_container_context">
            <div class="admin_item_list_container_context">
              <div class="admin_item_list_container_context_cord">상품코드</div>
              <div class="admin_item_list_container_context_title">상품명</div>
              <div class="admin_item_list_container_context_text">재고</div>
              <div class="admin_item_list_container_context_day">가격</div>
              <div class="admin_item_list_container_context_category">
                카테고리
              </div>
              <div class="admin_item_list_container_context_btn">수정</div>
            </div>
          <!-- 늘어나기 -->
          <c:forEach items="${viewAll}" var="item">
            <div class="admin_item_list_container_context">
              <div class="admin_item_list_container_context_cord">${item.item_code}</div>
              <div class="admin_item_list_container_context_title">${item.item_name}</div>
              <div class="admin_item_list_container_context_text">${item.item_count}</div>
              <div class="admin_item_list_container_context_day">${item.item_price}</div>
              <div class="admin_item_list_container_context_category">
                ${item.cate_name}
              </div>
              <div class="admin_item_list_container_context_btn">
                <input type="button" value="UPDATE" onclick="location.href='itemInfo.ad?item_code=${item.item_code}'"/>
              </div>
            </div>
            </c:forEach>
          <!-- 여기까지 -->
          <div class="my_board_container_context_btn">
            <div class="my_board_container_context_btn_box">
            	<c:if test="${paging.nowPage != 1 }">
              <input type="button" value="◀" onclick="location.href='itemList.ad?nowPage=${paging.nowPage - 1}'" />
              </c:if>
              <div>
              ${paging.nowPage}
              </div>
              <c:if test="${paging.nowPage != paging.lastPage}">
              <input type="button" value="▶" onclick="location.href='itemList.ad?nowPage=${paging.nowPage+1}'"/>
              </c:if>
            </div>
          </div>
        </div>
      </div>
    </main>
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
</body>
</html>