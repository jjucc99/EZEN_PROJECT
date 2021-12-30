
function change(ord_no,rep_name){
	var selectOpt=document.getElementById(rep_name);
	var status=selectOpt.options[selectOpt.selectedIndex].text;
	var opt=selectOpt.options[selectOpt.selectedIndex].value;
	//var status=$("#rep_name option:selected").text();
	//var opt=$("#rep_name option:selected").val();
	
	if(opt==='1'){
		alert("구매확정 감사합니다!");
	}else if(opt==='2'){
		alert("주문취소가 신청되었습니다.");
	}else if(opt==='3'){
		alert("교환/반품이 신청되었습니다.");
	}
			$.ajax({
				url : "changeStatus.pay",
				type : 'post',
				data : JSON.stringify({
					ord_no : ord_no,
					ord_status : status
				}),
				contentType : 'application/json', // 전송타입 json으로 변경
				success : function(data) { // data= return 값 받음
				}
			}).done(function(data) {
				location.reload(data);
			})
}