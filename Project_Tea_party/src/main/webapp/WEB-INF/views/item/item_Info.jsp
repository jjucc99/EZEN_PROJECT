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
	width: 400px;
	height: 400px;
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
              	<c:when test="${catelist.cate_code==1}">??????</c:when>
              	<c:when test="${catelist.cate_code==2}">?????????</c:when>
              	<c:when test="${catelist.cate_code==3}">?????????</c:when>
              	<c:when test="${catelist.cate_code==4}">??????</c:when>
              	<c:when test="${catelist.cate_code==5}">?????????</c:when>
              </c:choose>&nbsp;&nbsp;&nbsp;&nbsp;/</span></a>
              <span>${catelist.item_name}</span>
            </div>
            <!-- <div class="goods_container_context_title_btn">
              <a href="">
                <div>???<span>HOME</span></div>
              </a>
              <a href="">
                <div><span>NEXT</span>???</div>
              </a>
            </div> -->
          </div>
          <div class="goods_container_context_text">
            <div class="goods_container_context_text_img"><img class="item" src="<c:url value='/image/${catelist.imgPath}'/>"></div>
            <div class="goods_container_context_text_detail">
              <div class="goods_container_context_text_detail_text">
                <div class="goods_container_context_text_detail_text_title">
                  ${catelist.item_name}
                </div>
                <div class="goods_container_context_text_detail_text_price">
                  <fmt:formatNumber value="${catelist.item_price}"/> ???
                </div>
                <div class="goods_container_context_text_detail_text_btn">
                <c:choose>
                <c:when test="${catelist.item_count}==0">SOLD OUT</c:when>
                <c:when test="${empty mem_id}">?????????????????? ?????? ???????????? ????????????</c:when>
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
            </div>
 
          <!--  -->
        </div>
        
        <div class="goods_review_container">
          
          <div class="goods_review_container_context">
          <div class="goods_review_container_context_title">REVIEW</div>
            <!--  ?????? ?????? -->
            <c:forEach items="${viewAll}" var="rlist">
            <%-- <a style="cursor:pointer" onclick="reviewToggle(${rlist.r_board_no});"> --%>
              <div class="goods_review_container_context_header">
                <div class="goods_review_container_context_header_title">
                  ??????: ${rlist.r_board_sub}
                </div>
                <div class="goods_review_container_context_header_id">
                 ?????????: ${rlist.mem_id}
                </div>
                <div class="goods_review_container_context_header_people">
                ????????????: <fmt:formatDate value="${rlist.r_board_date}"/>
                </div>
              </div>
            <!-- </a> -->
            <!-- ?????? ????????????????????? ????????? ?????? 22.01.01 ?????? ?????? ?????? -->
            <div class="goods_review_container_context_text" id="${rlist.r_board_no}">
              <div class="goods_review_container_context_text_img"><img alt="????????? ??????" class="review" src="<c:url value='/image/${rlist.imgPath}'/>"></div>
              <div class="goods_review_container_context_text_context">
                ${rlist.r_board_content}</div>
             
              <%String mem_id = (String) session.getAttribute("mem_id");%>
				<c:set var="str"><%=mem_id %></c:set>
				<c:if test="${str==rlist.mem_id}">
              <div class="goods_review_container_context_text_btn">
                	<form action="reviewUpdateForm.item" method="get">
						<input type="submit" value="??????/??????">
						<input type="hidden" value="${rlist.r_board_no}" name="r_board_no">
					</form>
              </div>
              </c:if>
            </div>
            </c:forEach>
          </div>
          <!-- ????????? ??? -->
        </div>
      </div>
      <br>
             <div class="my_board_container_context_btn">
            <div class="my_board_container_context_btn_box">
            	<c:if test="${paging.nowPage != 1 }">
              <input type="button" value="???" onclick="location.href='/oneItem.item?nowPage=${paging.nowPage - 1}'" />
              </c:if>
              <div>
              ${paging.nowPage}
              </div>
              <c:if test="${paging.nowPage != paging.lastPage}">
              <input type="button" value="???" onclick="location.href='/oneItem.item?nowPage=${paging.nowPage+1}'"/>
              </c:if>
            </div>
          </div>
	<br>
    </section>
    
    
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="<c:url value='/resources/js/item/info.js'/>"></script>
<script type="text/javascript">
function insertCart(){
	alert("??????????????? ???????????????.");
}

function deleteReview() {
	 if (confirm("?????? ?????????????????????????")){
		 console.log("??????");
	     document.getElementById('reviewDelete').submit();
	 }else{
		 console.log("??????");
	     return false;
	 }
 }

//22.01.01 ?????? ?????? ??????
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