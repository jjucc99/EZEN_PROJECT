<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
    <title>TEA_PARTY_JOIN</title>
</head>
</head>
<body>

<header class="main_header">
    <div class="header_title_conteiner">
        <div class="header_title_title">
            <div class="header_title"><a href="/main">TEA PARTY</a></div>
        </div>
        <div class="header_controller_conteiner">
             <div class="header_controller">
                <a href="/join">JOIN</a>
            </div>
            <div class="header_controller">
                <a href="/login">LOGIN</a>
            </div>
        </div>
    </div>
</header>
<section>
    <form action="/join" method="post" onsubmit="return handleCheckSubmit();">
        <div class="join_container">
            <div class="join_container_title">
                <span>JOIN</span>
            </div>
            <div class="join_container_context">
                <div class="join_container_item">
                    <label for="mem_id">아이디</label>
                    <input type="text" name="mem_id" id="mem_id" required/>
                    <span class="responseResult"></span>
                </div>
                <div class="join_container_item">
                    <label for="mem_pwd">비밀번호</label>
                    <input
                            type="password"
                            name="mem_pwd"
                            id="mem_pwd"
                            required
                    /><br/>
                </div>
                <div class="join_container_item">
                    <label for="check_pwd">비밀번호 확인</label>
                    <input type="password" name="check_pwd" id="check_pwd" required/>
                    <span id="idPwCheck"></span><br/>
                </div>
                <div class="join_container_item">
                    <label for="mem_name">이름</label>
                    <input type="text" name="mem_name" id="mem_name" required/><br/>
                </div>
                <div class="address">
                    <label for="sample6_postcode">주소</label>
                    <div class="address_search">
                        <input
                                type="text"
                                id="sample6_postcode"
                                placeholder="우편번호"
                                name="mem_addr1"
                        />
                        <input
                                type="button"
                                onclick="sample6_execDaumPostcode()"
                                value="우편번호 찾기"
                        />
                    </div>
                    <div class="address_search_second">
                        <input
                                type="text"
                                id="sample6_address"
                                placeholder="주소"
                                name="mem_addr2"
                        />
                        <input type="text"
                               id="sample6_detailAddress"
                               placeholder="상세주소"
                               name="mem_addr3"
                        >
                        <input
                                type="text"
                                id="sample6_extraAddress"
                                placeholder="참고항목"
                                hidden
                        />
                    </div>
                </div>
                <div class="join_container_item">
                    <label for="mem_phone">휴대번호</label>
                    <input type="text" name="mem_phone" id="mem_phone" required/>
                </div>
                <div class="join_container_item">
                    <label for="mem_email">메일</label>
                    <input type="email" name="mem_email" id="mem_email" required/>
                </div>
                <div class="check">
                    <div class="check_first">
                        <label for="YES">메일 수신 동의</label>
                        <input
                                type="radio"
                                id="YES"
                                name="mem_check"
                                value="Y"
                                checked
                        />
                    </div>
                    <div>
                        <label for="NO">메일 수신 거부</label>
                        <input type="radio" id="NO" name="mem_check" value="N"/>
                    </div>
                </div>
            </div>
            <div class="join_container_btn">
                <div><input type="submit" value="JOIN"/></div>
                <div><input type="submit" value="CANCLE"/></div>
            </div>
        </div>
    </form>
</section>
</body>
<script type="text/javascript" src="<c:url value="/resources/js/member/join.js"/>"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;

                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</html>