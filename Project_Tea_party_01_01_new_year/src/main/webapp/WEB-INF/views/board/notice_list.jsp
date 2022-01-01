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
<title>공지 목록</title>
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
		<!-- $section -->
	<section>
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
 <main>
      <div class="my_board_container">
        <div class="my_board_container_title">
          <span>NOTICE</span>
          <!-- <select name="" id="">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
          </select> -->
        </div>
        <div class="my_board_container_context">
       	 <div class="my_board_container_context_box">
              <div class="my_board_container_context_num">NO.</div>
              <div class="my_board_container_context_title">제목</div>
              <div class="my_board_container_context_writter">작성자</div>
              <div class="my_board_container_context_day">작성일자</div>
            </div>
          <!-- 늘어나기 -->
          <c:forEach items="${viewAll}" var="board">
          <a href="noticeInfo.board?board_no=${board.board_no}">
            <div class="my_board_container_context_box">
              <div class="my_board_container_context_num">${board.board_no}</div>
              <div class="my_board_container_context_title">${board.board_sub}</div>
              <div class="my_board_container_context_writter">관리자</div>
              <div class="my_board_container_context_day"><fmt:formatDate value="${board.board_date}"/></div>
            </div>
          </a>
          </c:forEach>
          <div class="my_board_container_context_btn">
            <div class="my_board_container_context_btn_box">
            	<c:if test="${paging.nowPage != 1 }">
              <input type="button" value="◀" onclick="location.href='/noticeList.board?nowPage=${paging.nowPage - 1}'" />
              </c:if>
              <div>
              ${paging.nowPage}
              </div>
              <c:if test="${paging.nowPage != paging.lastPage}">
              <input type="button" value="▶" onclick="location.href='/noticeList.board?nowPage=${paging.nowPage+1}'"/>
              </c:if>
            </div>
          </div>
        </div>
      </div>
    </main>
    </section>
</body>
</html>