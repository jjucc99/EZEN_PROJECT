<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
    <title>TEA_PARTY_MYPAGE</title>
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
<%  
	if (checkLogin == "success") { %>
<!-- $section -->
<section>
    <div class="mypage_container">
        <div class="mypage_title">
            <span class="mypage_title_title">ADMIN PAGE</span>
        </div>
        <div class="mypage_btns">
            <div class="mypage_btn">
                <div class="mypage_btn_text">
                    <a href="memberList.ad"><span>?????? ??????</span></a>
                </div>
            </div>
            <div class="mypage_btn">
                <div class="mypage_btn_text">
                    <a href="itemList.ad"><span>?????? ??????</span></a>
                </div>
            </div>
            <div class="mypage_btn">
                <div class="mypage_btn_text">
                    <a href="orderList.ad"><span>?????? ??????</span></a>
                </div>
            </div>
            <div class="mypage_btn">
                <div class="mypage_btn_text">
                    <a href="boardList.ad"><span>?????? ??????</span></a>
                </div>
            </div>
        </div>
    </div>
    <!-- $main -->
    <main>
        <div class="mypage_main">
        </div>
    </main>
</section>
<%
		} else {
%>
	<script type="text/javascript">
	alert("????????? ????????? ?????????!");
	location.href="/login";
	</script>
	<%
		}
	%>
</body>
</html>