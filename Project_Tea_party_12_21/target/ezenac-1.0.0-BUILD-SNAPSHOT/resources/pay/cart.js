function delCheck(cart_item_no){
	var chk=confirm("해당 상품을 삭제하십니까?");
	
	if(chk){
		df.cart_item_no.value=cart_item_no;
		df.method='post';
		df.submit();
	}
	return true;
}

/*function slctOrder(){
	var valueArr=new Array();
	var list= $("input[name='check']");
	
	for(var i=0; i<list.length; i++){
		var cart_item_no=
	}
	
	
	for(var i=0; i<list.length; i++){
		if(list[i].checked){
			valueArr.push(list[i].value);
		}
	}
	
	if(valueArr.length==0){
		alert("선택된 상품이 없습니다.");
	}else{
		
	}
}*/