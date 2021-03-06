<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css">
    <title>TEA_PARTY_MYPAGE</title>
</head>
<body>
<header class="main_header">
    <div class="header_title_conteiner">
        <div class="header_title_title">
            <div class="header_title"><a href="/main">TEA PARTY</a></div>
        </div>
        <div class="header_controller_conteiner">
            <div class="header_controller">
                <a href="/mypage">MY PAGE</a>
            </div>
            <div class="header_controller">
                <a href="/cart.pay">MY SHOPPING</a>
            </div>
            <div class="header_controller">
                <a href="/logout">LOGOUT</a>
            </div>
        </div>
    </div>
</header>
<% String checkLogin = (String) session.getAttribute("checkLogin");
    String mem_id = (String) session.getAttribute("mem_id");
    if (checkLogin == "success") { %>

<section>
    <div class="qna_container">
        <div class="qna_container_title">QNA</div>

        <div class="qna_container_context">
            <div class="qna_container_context_title">
                <div class="qna_container_context_title_name">작성자: <%=mem_id%>
                </div>
                <div class="qna_container_context_title_title">제목: <input type="text" name="board_sub"></div>
                <!-- <div class="qna_container_context_title_day">날짜</div> -->
            </div>
            <div class="qna_container_context_context"><textarea name="board_content" placeholder="글을 입력하세요"></textarea></div>
            <div class="qna_container_context_btn">
                <button onclick="checkSubmit()">작성</button>
                <button onclick="location.href='boardList.ad'">취소</button>
            </div>
        </div>

    </div>
    <form action="qnaInsert.board" method="post" name="frm">
        <input type="hidden" name="board_sub">
        <input type="hidden" name="board_content">
        <input type="hidden" name="board_board" value="qna">
        <input type="hidden" name="mem_id" value="<%=mem_id%>">
    </form>
</section>


<%
} else {
%>
<script type="text/javascript">
    alert("로그인 하셔야 합니다!");
    location.href = "/login";
</script>
<%
    }
%>
<script type="text/javascript">
    function checkSubmit() {
        var sub = document.getElementsByName('board_sub')[0].value;
        var content = document.getElementsByName('board_content')[0].value;
        if (!sub) {
            alert("제목을 입력하세요");
            sub.focus();
            return false;
        }
        if (!content) {
            alert("내용을 입력하세요");
            content.focus();
            return false;
        }
        frm.board_sub.value = sub;
        frm.board_content.value = content;
        frm.method = 'post';
        frm.submit();
    }

</script>
</body>
</html>