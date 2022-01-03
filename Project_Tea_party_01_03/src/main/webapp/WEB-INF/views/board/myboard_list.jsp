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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
                    <a href="/myBoardList.board"><span>MY_BOARD</span></a>
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
          <span>QnA</span>
          <button onclick="location.href='qnaInsertForm.board'">QnA 작성</button>
          <button onclick="location.href='myReview.item'">Review</button>
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
          <c:forEach items="${viewAll}" var="qna">
          <a href="qnaInfo.board?board_no=${qna.board_no}&mem_id=${qna.mem_id}">
            <div class="my_board_container_context_box">
              <div class="my_board_container_context_num">${qna.board_no}</div>
              <div class="my_board_container_context_title">${qna.board_sub} &nbsp;<c:if test="${qna.replyCount!=0}">(${qna.replyCount})</c:if></div>
              <div class="my_board_container_context_writter">${qna.mem_id}</div>
              <div class="my_board_container_context_day"><fmt:formatDate value="${qna.board_date}"/></div>
            </div>
          </a>
          </c:forEach>
          <div class="my_board_container_context_btn">
            <div class="my_board_container_context_btn_box">
            	<c:if test="${paging.nowPage != 1 }">
              <input type="button" value="◀" onclick="location.href='/myBoardList.board?nowPage=${paging.nowPage - 1}'" />
              </c:if>
              <div>
              ${paging.nowPage}
              </div>
              <c:if test="${paging.nowPage != paging.lastPage}">
              <input type="button" value="▶" onclick="location.href='/myBoardList.board?nowPage=${paging.nowPage+1}'"/>
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