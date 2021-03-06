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
    <style type="text/css">

        .board_content {
            width: 100%;
            height: 200px;
            resize: none; /* 크기고정 */
        }
    </style>
    <title>QnA</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
</script>
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
                }
            %>

        </div>
    </div>
    </div>
</header>
<%
    String mem_id = (String) session.getAttribute("mem_id");
    if (checkLogin == "success") { %>

<section>
    <div class="qna_container">
        <div class="qna_container_title">QNA</div>
        <div class="qna_container_context">
            <div class="qna_container_context_title">
                <div class="qna_container_context_title_name">NO.${board.board_no}</div>
                <div class="qna_container_context_title_title">제목: <input type="text" name="board_sub"
                                                                          value="${board.board_sub}"></div>
                <div class="qna_container_context_title_day">작성일자: <fmt:formatDate value="${board.board_date}"/></div>
            </div>
            <div class="qna_container_context_context"><textarea id="board_content"
                                                                 name="board_content">${board.board_content}</textarea>
            </div>
            <div class="qna_container_context_btn">
                <c:if test="${mem_id==board.mem_id}">
                    <input type="button" value="UPDATE" onclick="checkSubmit()"/>
                    <input type="button" value="DELETE" onclick="deleteSubmit()"/>
                </c:if>
            </div>
        </div>

        <!-- 큐엔에이 수정용 폼 -->
        <form action="boardUpdate.board" method="post" name="frm">
            <input type="hidden" name="board_no" value="${board.board_no}" id="board_no">
            <input type="hidden" name="board_sub">
            <input type="hidden" name="board_content">
        </form>
        <!-- 큐엔에이 삭제용 폼 -->
        <form action="qnaDelete.board" method="post" name="deletefrm">
            <input type="hidden" value="${board.board_no}" name="board_no">
        </form>


        <c:forEach items="${reply}" var="reply">
            <div class="qna_container_context_review">
                <div class="qna_container_context_review_name">${reply.reply_sub}</div>
                <div class="qna_container_context_review_context">${reply.reply_content}</div>
                <div class="qna_container_context_review_day">${reply.reply_date}</div>
                <div class="qna_container_context_review_input">
                    <c:if test="${(mem_id eq reply.reply_sub)}">
                        <input type="button" value="DELETE" onclick="deleteReply(${reply.reply_no})"/>
                    </c:if>
                </div>
            </div>
        </c:forEach>
        <div class="qna_container_btn">
            <form name="comment-form" action="insertComment.board" method="post"
                  autocomplete="off">
                <input type="hidden" name="board_no" value="${board.board_no}">
                <textarea id="reply_content" name="reply_content" placeholder="댓글을 입력하세요"
                          style="resize: none;"></textarea>
                <input type="submit" value="댓글쓰기"/>
            </form>
        </div>
    </div>
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

    function deleteSubmit() {
        if (confirm("정말 삭제하시겠습니까??") == true) {
            document.deletefrm.submit();
        } else {
            return false;
        }
    }

    $(document).ready(function () {
        getCommentList();

    });

    /**
     * 댓글 불러오기(Ajax)
     */

    /* function getCommentList() {
        var board_no = $('#board_no').val();

        $.ajax({
            type : 'GET',
            url : "/commentList.board",
            data : {board_no : board_no},
            dataType: "json", // 전송타입 json으로 변경
            success : function(data) {

                if(data.length > 0){
                    var mem_id= $('#mem_id').val();
                    for(var i in data){
                        var $tr=$('<div class="qna_container_context_review">');
                        var $delBtn  = $('<div class="qna_container_context_review_input><button id="deleteReply" onclick="deleteReply(' + data[i].reply_no+ ')">삭제</button></div>');
                        var $rWriter = $('<div class="qna_container_context_review_name>').text(data[i].reply_sub);
                        var $rContent = $('<div class="qna_container_context_review_context">').text(data[i].reply_content);
                        var $rCreateDate = $('<div class="qna_container_context_review_day">').text(data[i].reply_date);
                        $tr.append($rWriter);
                        $tr.append($rContent);
                        $tr.append($rCreateDate);
                        if(mem_id===data[i].reply_sub){
                            $tr.append($delBtn);
                        }
                    }
                }else{
                    var $tr = $('<div>');
                    var $rContent = $('<div>').text('등록된 댓글이 없습니다');
                    $tr.append($rContent);
                    $tableBody.append($tr);
                }
            },
            error : function(result) {
            },
            complete : function() {

            }

        });
    } */

    function deleteReply(reply_no) {
        $.ajax({
            type: 'POST',
            url: "/deleteReply.board",
            data: {reply_no: reply_no},
            dataType: "json", // 전송타입 json으로 변경
            success: function (data) {
                if (data.resultCode == '1') {
                    alert('댓글 삭제에 ' + data.resultMSG);
                } else {
                    alert('댓글 삭제에 ' + data.resultMSG);
                }
            },
            error: function (result) {
                console.log('오류는 왜 존재하는 걸까');
            },
            complete: function () {
                getCommentList();
            }

        });
    }
</script>
</body>
</html>