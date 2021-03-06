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
import kr.co.ezenac.pay.model.vo.PayVO;
import kr.co.ezenac.pay.model.vo.SubOrderVO;

@Service("PayService")
public class PayServiceImp implements PayService{
 @Autowired
 private SqlSessionTemplate sqlSession;
 
 @Autowired
 private PayDAO pDAO;
 
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
 public List<Order_listVO> selectOrder(String mem_id){
	 return pDAO.selectOrder(sqlSession, mem_id);
 }
 
 @Override
 public void changeStatus(Order_listVO ovo) {
	 pDAO.changeStatus(sqlSession, ovo);
 }
 
 @Override
 public List<CartListVO> orderItemList(int ord_no){
	 return pDAO.orderItemList(sqlSession, ord_no);
 }
 
 @Override
 public PayVO getOrdInfo(int ord_no) {
	 return pDAO.getOrdInfo(sqlSession, ord_no);
 }
 
 @Override
 public int checkReview(SubOrderVO subvo) {
	 return pDAO.checkReview(sqlSession, subvo);
 }
}
