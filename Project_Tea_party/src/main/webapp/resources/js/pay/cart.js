function decrement(cart_item_no, cart_amount){
	var amount=cart_amount-1;
	
	if(amount<=0){
		alert("주문 수량은 1 이상이어야만 합니다.")
		return false;
	}else{
		change(cart_item_no, amount);
	}
}

function increment(cart_item_no, cart_amount,item_count){
	var amount=cart_amount+1;
	
	if(amount>item_count){
		alert("현재 재고를 초과하였습니다.")
		return false;
	}else{
		change(cart_item_no, amount)
	}
}


function change(cart_item_no, cart_amount){

	$.ajax({
		url : "cartUpdate.pay", //보낼 컨트롤러 주소
		type : 'POST', 		//보내는 타입
		data : JSON.stringify({  //데이터를 json 문자열 처리.
			cart_item_no : cart_item_no,  //Map으로 받을 때 (키 이름 : 값)
			cart_amount : cart_amount
		}),
		contentType : 'application/json', // 전송타입 json으로 변경
		success : function(data) { // data= return 값 받음
		}
	}).done(function(data) {//done: ajax 성공 시 실행되는 함수
		location.replace(data);//replace: 새로고침, reload:재부팅
	})
}


function delCheck(cart_item_no) {
	var chk = confirm("해당 상품을 삭제하십니까?");

	if (chk) {
		$.ajax({
			url : "cartDelete.pay",
			type : 'POST',
			data : JSON.stringify({
				key : cart_item_no
			}),
			contentType : 'application/json', 
			success : function(data) {
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
		if(!list[i].disabled){
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

function calc(){
	var total=0;
	var listchk =$("input[name='check']");
	var listsum=$("input[name='sum']");
	
	for(var i=0;i<listchk.length;i++){
		if(listchk[i].checked){
			total+=parseInt(listsum[i].value);
		}
	}
	
	total=AddComma(total);
	document.getElementById("total").innerHTML=total;
}

//숫자 3자리 콤마찍기 출처: https://doolyit.tistory.com/127
function AddComma(num)
{
var regexp = /\B(?=(\d{3})+(?!\d))/g;
return num.toString().replace(regexp, ',');
}