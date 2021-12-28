
function slctChange(ord_no){
	var selectOpt=document.getElementById("status");
	var status=selectOpt.options[selectOpt.selectedIndex].text;//텍스트
	
	if(status.equals("구매확정")){
		alert("구매확정 감사합니다!");
	}else if(status.equals("주문취소")){
		alert("주문취소가 신청되었습니다.");
	}else if(status.equals("교환/반품")){
		alert("교환/반품이 신청되었습니다.");
	}
			$.ajax({
				url : "changeStatus.pay",
				type : 'get',
				data : JSON.stringify({
					ord_no : ord_no,
					ord_status : status
				}),
				contentType : 'application/json', // 전송타입 json으로 변경
				success : function(data) { // data= return 값 받음
				}
			}).done(function(data) {
				location.replace(data);
			})
}