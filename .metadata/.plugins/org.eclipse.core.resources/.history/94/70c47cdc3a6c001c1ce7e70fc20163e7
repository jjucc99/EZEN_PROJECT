<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<title>QnA</title>
</head>
<style>
a {
	text-decoration: none; /* 링크의 밑줄 제거 */
	color: inherit; /* 링크의 색상 제거 */
}
</style>

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
	<%  
	if (checkLogin == "success") { %>	
	
	<section>
    <div class="mypage_container">
        <div class="mypage_title">
            <span class="mypage_title_title">MY PAGE</span>
        </div>
        <div class="mypage_btns">
            <div class="mypage_btn">
                <div class="mypage_btn_text">
                    <a href="/profile/${mem_id}"><span>PROFILE</span></a>
                </div>
            </div>
            <div class="mypage_btn">
                <div class="mypage_btn_text">
                    <a href=""><span>MY_BOARD</span></a>
                </div>
            </div>
            <div class="mypage_btn">
                <div class="mypage_btn_text">
                    <a href="/orderList.pay"><span>MY_ORDER</span></a>
                </div>
            </div>
        </div>
    </div>
    <!-- $main -->
</section>
	 <section>
    <main>
      <div class="my_board_container">
        <div class="my_board_container_title">
          <span>REVIEW_LIST</span>
          <button onclick="location.href='myBoardList.board'">QnA</button>
        </div>
        <div class="my_board_container_context">
        
        <div class="review_list_container_context">
              <div class="review_list_container_context_num">NO.</div>
              <div class="review_list_container_context_title">상품</div>
              <div class="review_list_container_context_text">제목</div>
              <div class="review_list_container_context_day">작성일자</div>
            </div>
            <c:forEach items="${viewAll}" var="rlist">
          <!-- 늘어나기 -->
          <a href="reviewUpdateForm.item?r_board_no=${rlist.r_board_no}">
            <div class="review_list_container_context">
              <div class="review_list_container_context_num">${rlist.r_board_no}</div>
              <div class="review_list_container_context_title">${rlist.item_name}</div>
              <div class="review_list_container_context_text">${rlist.r_board_sub}</div>
              <div class="review_list_container_context_day"><fmt:formatDate value="${rlist.r_board_date}" /></div>
            </div>
          </a>
          <!-- 여기까지 -->
          </c:forEach>
          <div class="my_board_container_context_btn">
            <div class="my_board_container_context_btn_box">
              <c:if test="${paging.nowPage != 1 }">
              <input type="button" value="◀" onclick="location.href='/myReview.item?nowPage=${paging.nowPage - 1}'" />
              </c:if>
              <div>
              ${paging.nowPage}
              </div>
              <c:if test="${paging.nowPage != paging.lastPage}">
              <input type="button" value="▶" onclick="location.href='/myReview.item?nowPage=${paging.nowPage+1}'"/>
              </c:if>
            </div>
          </div>
        </div>
      </div>
    </main>
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
</body>
</html>