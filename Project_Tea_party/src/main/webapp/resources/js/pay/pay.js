
function getInfo(){
	var chk=$("input[name='check']");
	
	var name=document.frm.mem_name.value;
	var phone=document.frm.mem_phone.value;
	var addr1=document.frm.mem_addr1.value;
	var addr2=document.frm.mem_addr2.value;
	var addr3=document.frm.mem_addr3.value;
	
	if(chk[0].checked){
		document.frm.ord_receiver.value=name;
		document.frm.ord_phone.value=phone;
		document.frm.ord_addr1.value=addr1;
		document.frm.ord_addr2.value=addr2;
		document.frm.ord_addr3.value=addr3;
    }
    else { //체크해제한 경우 -> 배송지 정보를 비워주기
    	
    	document.frm.ord_receiver.value="";
		document.frm.ord_phone.value="";
		document.frm.ord_addr1.value="";
		document.frm.ord_addr2.value="";
		document.frm.ord_addr3.value="";
    }
}

function finalOrder(){
	
	var payList = [];
	var list= $("input[name='cart_item_no']");
	
	for (var i = 0; i < list.length; i++) {
			payList.push(list[i].value);
	}
	
	frm.payList.value = payList;
	frm.method = 'post';
	frm.submit();
}

function OrderCheck(){
	var receiver=document.frm.ord_receiver.value.length;
	var phone=document.frm.ord_phone.value.length;
	var addr1=document.frm.ord_addr1.value.length;
	var addr2=document.frm.ord_addr2.value.length;
	var addr3=document.frm.ord_addr3.value.length;
	
	if(receiver==0||phone==0||addr1==0||addr2==0||addr3==0){
		alert("수취인 정보는 모두 기입하셔야 합니다.");
		document.frm.ord_receiver.focus();
		return false;
	}
	
	finalOrder();
}
