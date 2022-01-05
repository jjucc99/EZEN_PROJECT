<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>ADMIN MEMBER</title>
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
          <span>OUT MEMBER LIST</span>
          <input type="button" onclick="location.href='memberList.ad'" value="일반회원 관리" />
        </div>
        <div class="my_board_container_context">
            <div class="member_list_container_context">
              <div class="member_list_container_context_num">아이디</div>
              <div class="member_list_container_context_title">이름</div>
              <div class="member_list_container_context_text">회원등급</div>
              <div class="member_list_container_context_day">메일수신</div>
              <div class="member_list_container_context_back">회원복구</div>
            </div>
          <!-- 늘어나기 -->
          <c:forEach items="${viewAll}" var="member">
            <div class="member_list_container_context">
              <div class="member_list_container_context_num">${member.mem_id}</div>
              <div class="member_list_container_context_title">${member.mem_name}</div>
              <div class="member_list_container_context_text">${member.mem_admin}</div>
              <div class="member_list_container_context_day">${member.mem_check}</div>
              <div class="member_list_container_context_back">
              <form action="memberDelete.ad" method="post" id="restorefrm" name="restorefrm">
					<input type="hidden" name="mem_id" value="${member.mem_id}">
					<input type="hidden" name="mem_delete" value="${member.mem_delete}">
					</form>
                <input type="button" onclick="restoreSubmit()" value="회원 복구">
              </div>
            </div>
            </c:forEach>
          <!-- 여기까지 -->
          <div class="my_board_container_context_btn">
            <div class="my_board_container_context_btn_box">
            	<c:if test="${paging.nowPage != 1 }">
              <input type="button" value="◀" onclick="location.href='/outMemberList.ad?nowPage=${paging.nowPage - 1}'" />
              </c:if>
              <div>
              ${paging.nowPage}
              </div>
              <c:if test="${paging.nowPage != paging.lastPage}">
              <input type="button" value="▶" onclick="location.href='/outMemberList.ad?nowPage=${paging.nowPage+1}'"/>
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
	<script type="text/javascript">
	function restoreSubmit() {
		 if (confirm("정말 복구 처리하시겠습니까?")){
		     document.getElementById('restorefrm').submit();
		 }else{
			 console.log("ㄴㄴ");
		     return false;
		 }
     }
	</script>
</body>
</html>