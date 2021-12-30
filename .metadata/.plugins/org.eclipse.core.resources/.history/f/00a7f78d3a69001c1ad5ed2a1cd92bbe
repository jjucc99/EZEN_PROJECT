package kr.co.ezenac.pay.model.service;


import java.util.List;

import kr.co.ezenac.members.model.vo.MemberVO;
import kr.co.ezenac.pay.model.vo.CartListVO;
import kr.co.ezenac.pay.model.vo.CartUpdateVO;
import kr.co.ezenac.pay.model.vo.Order_listVO;
import kr.co.ezenac.pay.model.vo.PagingVO;
import kr.co.ezenac.pay.model.vo.PayVO;
import kr.co.ezenac.pay.model.vo.SubOrderVO;

public interface PayService {
	
	public List<CartListVO> cartList(String mem_id);
	
	public String getImg(int item_code);
	
	public void cartUpdate(CartUpdateVO cuvo);
	
	public void cartDelete(int cart_item_no);
	
	public List<CartListVO> orderList(List<Integer> valueArr);
	
	public MemberVO getMember(String mem_id);
	
	public int insertOrderList(PayVO pvo);
	
	public int insertOrderItem(List<Integer> payList,int ord_no);
	
	public int countOrder(String mem_id);
	
	public List<Order_listVO> selectOrder(PagingVO pgvo);
	
	public void changeStatus(Order_listVO ovo);
	
	public List<CartListVO> orderItemList(int ord_no);

	public PayVO getOrdInfo(int ord_no);
	
	public int checkReview(SubOrderVO subvo);
}
