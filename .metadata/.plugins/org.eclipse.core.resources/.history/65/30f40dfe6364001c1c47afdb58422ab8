package kr.co.ezenac.pay.model.service;


import java.util.List;

import kr.co.ezenac.pay.model.vo.CartListVO;
import kr.co.ezenac.pay.model.vo.CartUpdateVO;
import kr.co.ezenac.pay.model.vo.PayVO;

public interface PayService {
	
	/*
	 * int insertPay(PayVO pvo);
	 * 
	 * public List<PayVO> payList();
	 * 
	 * public void updatePay(PayVO pvo);
	 * 
	 * public void deletePay(int pay_no);
	 * 
	 * public PayVO selectOne(int pay_no);
	 */
	//////////////
	public List<CartListVO> cartList(String mem_id);
	
	public String getImg(int item_code);
	
	public void cartUpdate(CartUpdateVO cuvo);
	
	public void cartDelete(int cart_item_no);
	
	public List<CartListVO> orderList(List<Integer> valueArr);
}
