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
		url : "cartUpdate.pay",
		type : 'POST',
		data : JSON.stringify({
			cart_item_no : cart_item_no,
			cart_amount : cart_amount
		}),
		contentType : 'application/json', // 전송타입 json으로 변경
		success : function(data) { // data= return 값 받음
		}
	}).done(function(data) {
		location.replace(data);
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
		if(!list[i].disabled){
			orderList.push(list[i].value);
		}
	}

	gofrm.orderList.value = orderList;
	gofrm.method = 'post';
	gofrm.submit();
	return true;
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


/*
 * $.ajax({ url : "goOorder.pay", //전송 url type : 'POST', //POST방식 traditional
 * :true, //배열 전송에 필요한 옵션 data:{ valueArr: valueArr //보낼 data 변수 이름, 값 } })
 */