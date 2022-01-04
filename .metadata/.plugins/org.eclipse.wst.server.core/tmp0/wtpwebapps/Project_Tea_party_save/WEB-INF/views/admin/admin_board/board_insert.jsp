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
	String mem_id = (String) session.getAttribute("mem_id");
	if (checkLogin == "success") { %>
<section>
      <div class="qna_container">
        <div class="qna_container_title">NOTICE WRITE</div>
        <div class="qna_container_context">
          <div class="qna_container_context_title">
            <div class="qna_container_context_title_name">NEW!</div>
            <div class="qna_container_context_title_title">제목: <input type="text" name="board_sub" placeholder="제목을 입력하세요"></div>
            <div class="qna_container_context_title_day">작성자: 관리자</div>
          </div>
          <div class="qna_container_context_context"><textarea name="board_content"></textarea></div>
          <div class="qna_container_context_btn">
            <input type="button" value="작성" onclick="checkSubmit()"/>
          </div>
        </div>
      </div>
            <form action="boardInsert.ad" method="post" name="frm">
            <input type="hidden" name="board_sub">
      		<input type="hidden" name="board_content">
            <input type="hidden" name="board_board" value="notice">
			<input type="hidden" name="mem_id" value="<%=mem_id%>">
			</form>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
	function checkSubmit() {
        var sub = document.getElementsByName('board_sub')[0].value;
        var content = document.getElementsByName('board_content')[0].value;
        if(!sub){
        	alert("제목을 입력하세요");
        	sub.focus();
        	return false;
        }
        if(!content){
        	alert("내용을 입력하세요");
        	content.focus();
        	return false;
        }
        frm.board_sub.value=sub;
        frm.board_content.value=content;
        frm.method = 'post';
        frm.submit();
      }
	
	</script>
</body>
</html>