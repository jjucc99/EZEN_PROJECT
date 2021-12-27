package kr.co.ezenac.pay.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ezenac.members.model.vo.MemberVO;
import kr.co.ezenac.pay.model.dao.PayDAO;
import kr.co.ezenac.pay.model.vo.CartListVO;
import kr.co.ezenac.pay.model.vo.CartUpdateVO;
import kr.co.ezenac.pay.model.vo.Order_listVO;
import kr.co.ezenac.pay.model.vo.PagingVO;
import kr.co.ezenac.pay.model.vo.PayVO;

@Service("PayService")
public class PayServiceImp implements PayService{
 @Autowired
 private SqlSessionTemplate sqlSession;
 
 @Autowired
 private PayDAO pDAO;
 
 /*@Override
 public int insertPay(PayVO pvo){
	return pDAO.insertPay(sqlSession,pvo);
 }
 
 @Override
 public List<PayVO> payList() {
	 return pDAO.payList(sqlSession);
 }
 
 @Override
 public void updatePay(PayVO pvo) {
	 pDAO.updatePay(sqlSession,pvo);
 }
 
 @Override
 public void deletePay(int pay_no) {
	 pDAO.deletePay(sqlSession, pay_no);
 }
 
 @Override
 public PayVO selectOne(int pay_no) {
	 return pDAO.selectOne(sqlSession, pay_no);
 }*/
 
 ///////////////
 
 @Override
 public List<CartListVO> cartList(String mem_id){
	 return pDAO.cartList(sqlSession, mem_id);
 }
 
 @Override
 public String getImg(int item_code) {
	 return pDAO.getImg(sqlSession, item_code);
 }
 
 @Override
 public void cartUpdate(CartUpdateVO cuvo) {
	 pDAO.cartUpdate(sqlSession, cuvo);
 }
 
 @Override
 public void cartDelete(int cart_item_no) {
	 pDAO.cartDelete(sqlSession, cart_item_no);
 }
 
 @Override
 public List<CartListVO> orderList(List<Integer> valueArr){
	 return pDAO.orderList(sqlSession, valueArr);
 }
 
 @Override
 public MemberVO getMember(String mem_id) {
	 return pDAO.getMember(sqlSession, mem_id);
 }
 
 @Override
 public int insertOrderList(PayVO pvo) {
	 return pDAO.insertOrderList(sqlSession, pvo);
 }
 
 @Override
 public int insertOrderItem(List<Integer> payList,int ord_no) {
	 return pDAO.insertOrderItem(sqlSession, payList, ord_no);
 }
 
 @Override
 public int countOrder(String mem_id) {
	 return pDAO.countOrder(sqlSession, mem_id);
 }
 
 @Override
 public List<Order_listVO> selectOrder(PagingVO pgvo){
	 return pDAO.selectOrder(sqlSession, pgvo);
 }
}
