
function getInfo(){
	var chk=$("input[name='check']");
	var ordInfo=$("div[id='ordInfo']");
	
	var name=document.getElementById("mem_name").value;
	var phone=document.getElementById("mem_phone").value;
	var addr1=document.getElementById("mem_addr1").value;
	var addr2=document.getElementById("mem_addr2").value;
	var addr3=document.getElementById("mem_addr3").value;
	
	if(chk[0].checked){
		//ordInfo.slideDown();
		
		document.getElementsByName("ord_receiver")[0].value=name;
		document.getElementsByName("ord_phone")[0].value=phone;
		document.getElementsByName("ord_addr1")[0].value=addr1;
		document.getElementsByName("ord_addr2")[0].value=addr2;
		document.getElementsByName("ord_addr3")[0].value=addr3;
    }
    else { //체크해제한 경우 -> 배송지 정보를 비워주기
    	
    	document.getElementsByName("ord_receiver")[0].value="";
		document.getElementsByName("ord_phone")[0].value="";
		document.getElementsByName("ord_addr1")[0].value="";
		document.getElementsByName("ord_addr2")[0].value="";
		document.getElementsByName("ord_addr3")[0].value="";
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