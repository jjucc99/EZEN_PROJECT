
function delCheck(cart_item_no) {
	var chk = confirm("해당 상품을 삭제하십니까?");

	if (chk) {
		$.ajax({
			url : "cartDelete.pay",
			type : 'POST',
			data : JSON.stringify({
				key : cart_item_no
			}),
			contentType : 'application/json', // 전송타입 json으로 변경
			success : function(data) { // data= return 값 받음
			}
		}).done(function(data) {
			location.replace(data);
		})
	}
}

function slctOrder() {
	var orderList = [];
	var list = $("input[name='check']"); // check박스 모두 지정

	for (var i = 0; i < list.length; i++) { // check되어 있으면 배열에 값(cart_item_no)저장
		if (list[i].checked) {
			orderList.push(list[i].value);
		}
	}

	if (orderList.length == 0) {
		alert("선택된 상품이 없습니다."); // check된 게 없으면 이동 불가
	} else {
		gofrm.orderList.value = orderList;
		gofrm.method = 'post';
		gofrm.submit();
		return true;
	}
}

function allOrder() {
	var orderList = [];
	var list = $("input[name='check']");

	for (var i = 0; i < list.length; i++) {
		orderList.push(list[i].value);
	}

	gofrm.orderList.value = orderList;
	gofrm.method = 'post';
	gofrm.submit();
	return true;
}

/*
 * $.ajax({ url : "goOorder.pay", //전송 url type : 'POST', //POST방식 traditional
 * :true, //배열 전송에 필요한 옵션 data:{ valueArr: valueArr //보낼 data 변수 이름, 값 } })
 */