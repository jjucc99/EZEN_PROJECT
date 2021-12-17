package kr.co.ezenac.pay.model.service;


import java.util.List;

import kr.co.ezenac.pay.model.vo.PayVO;

public interface PayService {
	
	int insertPay(PayVO pvo);
	
	public List<PayVO> payList();
	
	public void updatePay(PayVO pvo);
	
	public void deletePay(int pay_no);
	
	public PayVO selectOne(int pay_no);
}