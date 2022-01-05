function insertCart(){
	alert("장바구니에 담았습니다.");
}

function deleteReview(){
	if(confirm("정말 삭제하시겠습니까?")==true){
		 document.reviewDelete.submit();
	}else{
		return false;
	}
}