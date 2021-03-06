<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>ADMIN BOARD</title>
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
          <span>NOTICE LIST</span>
          <input type="button" onclick="location.href='addBoardForm.ad'" value="공지작성"/>
        </div>
        <div class="my_board_container_context">
            <div class="my_board_container_context_box">
              <div class="my_board_container_context_num">글번호</div>
              <div class="my_board_container_context_title">제목</div>
              <div class="my_board_container_context_day">작성일자</div>
            </div>
          <!-- 늘어나기 -->
          <c:forEach items="${viewAll}" var="board">
          <a href="boardInfo.ad?board_no=${board.board_no}">
          <div class="my_board_container_context_box">
            <div class="my_board_container_context_num">${board.board_no}</div>
            <div class="my_board_container_context_title">${board.board_sub}</div>
            <div class="my_board_container_context_day"><fmt:formatDate value="${board.board_date}"/></div>
          </div>
          </a>
          </c:forEach>
          <!-- 여기까지 -->
          
          <div class="my_board_container_context_btn">
            <div class="my_board_container_context_btn_box">
            	<c:if test="${paging.nowPage != 1 }">
              <input type="button" value="◀" onclick="location.href='boardList.ad?nowPage=${paging.nowPage - 1}'" />
              </c:if>
              <div>
              ${paging.nowPage}
              </div>
              <c:if test="${paging.nowPage != paging.lastPage}">
              <input type="button" value="▶" onclick="location.href='boardList.ad?nowPage=${paging.nowPage+1}'"/>
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