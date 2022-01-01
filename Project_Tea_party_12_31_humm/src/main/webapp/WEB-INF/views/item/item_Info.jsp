<%@page import="kr.co.ezenac.item.model.vo.ReviewBoardVO"%>
<%@page import="kr.co.ezenac.item.model.vo.CateListVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>TEA PARTY_goods</title>
   <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" />
</head> 
<style type="text/css">
img.item {
	width: 200px;
	height: 200px;
	object-fit: cover;
}
img.review {
	width: 120px;
	height: 120px;
	object-fit: cover;
}
</style>    
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
	</header>
	
<section>
      <div class="goods_container">
        <div class="goods_container_context_box">
          <div class="goods_container_context_title">
            <div class="goods_container_context_title_direction">
              <a href="/main"><span>Main&nbsp;&nbsp;&nbsp;&nbsp;/</span></a>
              <a href="cate.item?cate_code=${catelist.cate_code}"><span><c:choose>
              	<c:when test="${catelist.cate_code==1}">홍차</c:when>
              	<c:when test="${catelist.cate_code==2}">허브차</c:when>
              	<c:when test="${catelist.cate_code==3}">전통차</c:when>
              	<c:when test="${catelist.cate_code==4}">커피</c:when>
              	<c:when test="${catelist.cate_code==5}">티웨어</c:when>
              </c:choose>&nbsp;&nbsp;&nbsp;&nbsp;/</span></a>
              <span>${catelist.item_name}</span>
            </div>
          </div>
          <div class="goods_container_context_text">
            <div class="goods_container_context_text_img"><img class="item" src="<c:url value='/image/${catelist.imgPath}'/>"></div>
            <div class="goods_container_context_text_detail">
              <div class="goods_container_context_text_detail_text">
                <div class="goods_container_context_text_detail_text_title">
                  ${catelist.item_name}
                </div>
                <div class="goods_container_context_text_detail_text_price">
                  <fmt:formatNumber value="${catelist.item_price}"/> 원</div>
                </div>
                <div class="goods_container_context_text_detail_text_btn">
                <c:choose>
                <c:when test="${catelist.item_count}==0">SOLD OUT</c:when>
                <c:when test="${empty mem_id}">주문하시려면 먼저 로그인을 해주세요</c:when>
                  <c:otherwise><form action="insertCart.item" method="get">
					<input type="hidden" value="${catelist.item_code}" name="item_code">							
					<input type="number" value=1 name="cart_amount">
					<input type="submit" value="ADD TO CART" onclick="insertCart()"/>
				</form></c:otherwise>
           </c:choose>
                </div>
              </div>
              <div class="goods_container_context_text_detail_descripion">
                ${catelist.item_information}
              </div>
            </div>
 
          <!--  -->
        </div>
        
        <div class="goods_review_container">
          <c:forEach items="${viewAll}" var="rlist">
          <div class="goods_review_container_context">
            <!--  여기 헤더 -->
              <div class="goods_review_container_context_header">
                <div class="goods_review_container_context_header_title">
                  제목: ${rlist.r_board_sub}
                </div>
                <div class="goods_review_container_context_header_id">
                 작성자: ${rlist.mem_id}
                </div>
                <div class="goods_review_container_context_header_people">
                 작성일: <fmt:formatDate value="${rlist.r_board_date}"/>
                </div>
              </div>
            <!-- 여긴 자바스크립트로 없애는 부분 -->
            <div class="goods_review_container_context_text">
            <div class="goods_review_container_context_title">REVIEW</div>
              <div class="goods_review_container_context_text_img"><img class="review" src="<c:url value='/image/${rlist.imgPath}'/>" alt="none"></div>
              <div class="goods_review_container_context_text_context">
                ${rlist.r_board_content}</div>
             
              <%String mem_id = (String) session.getAttribute("mem_id");%>
				<c:set var="str"><%=mem_id %></c:set>
				<c:if test="${str==rlist.mem_id}">
              <div class="goods_review_container_context_text_btn">
                	<form action="reviewUpdateForm.item" method="get">
						<input type="submit" value="수정">
						<input type="hidden" value="${rlist.r_board_no}" name="r_board_no">
					</form>
                	<form action="reviewDelete.item" method="get" name="reviewDelete" id="reviewDelete">
						<input type="button" value="삭제" onclick="deleteReview()">
						<input type="hidden" value="${rlist.r_board_no}" name="r_board_no">
						<input type="hidden" value="${rlist.item_code}" name="item_code">
					</form>
              </div>
              </c:if>
            </div>
          </div>
          </c:forEach>
          <!-- 여기가 끝 -->
        </div>
        <div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/oneItem.item?item_code=${catelist.item_code}&nowPage=${paging.startPage - 1 }">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage}">
					<b>${p}</b>
				</c:when>
				<c:when test="${p != paging.nowPage}">
					<a href="/oneItem.item?item_code=${catelist.item_code}&nowPage=${p}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/oneItem.item?item_code=${catelist.item_code}&nowPage=${paging.endPage+1}">&gt;</a>
		</c:if>
	</div>
      </div>
    </section>
    
    
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="<c:url value='/resources/js/item/info.js'/>"></script>
<script type="text/javascript">
function insertCart(){
	alert("장바구니에 담았습니다.");
}

function deleteReview() {
	 if (confirm("정말 삭제하시겠습니까?")){
		 console.log("삭제");
	     document.getElementById('reviewDelete').submit();
	 }else{
		 console.log("취소");
	     return false;
	 }
 }

//토글 기능 삭제 22.01.01
/* function reviewToggle(r_board_no){
	var no=document.getElementById(r_board_no)
	
	if(no.style.display=='none'){
		no.style.display = 'flex';
	}else{
		no.style.display = 'none';
	}
} */
</script>
</body>
</html>