package kr.co.ezenac.pay.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.ezenac.members.model.vo.MemberVO;
import kr.co.ezenac.pay.model.vo.CartListVO;
import kr.co.ezenac.pay.model.vo.CartUpdateVO;
import kr.co.ezenac.pay.model.vo.PayVO;

@Repository("pDAO")
//implement와 연결할 아이디
public class PayDAO {

	/*
	 * public int insertPay(SqlSessionTemplate sqlSession, PayVO pvo) { return
	 * sqlSession.insert("payMapper.insertPay",pvo); }
	 * 
	 * public List<PayVO> payList(SqlSessionTemplate sqlSession) { List<PayVO>
	 * list=sqlSession.selectList("payMapper.selectPay");
	 * 
	 * for(PayVO pvo: list) { String str=pvo.getPay_date(); String
	 * result=str.substring(0, str.lastIndexOf(" ")); pvo.setPay_date(result); }
	 * return list; }
	 * 
	 * public void updatePay(SqlSessionTemplate sqlSession, PayVO pvo) {
	 * sqlSession.update("payMapper.updatePay",pvo); }
	 * 
	 * public void deletePay(SqlSessionTemplate sqlSession, int pay_no) {
	 * sqlSession.update("payMapper.deletePay", pay_no); }
	 * 
	 * public PayVO selectOne(SqlSessionTemplate sqlSession, int pay_no) { PayVO
	 * pvo=sqlSession.selectOne("payMapper.selectOne", pay_no);
	 * 
	 * String str=pvo.getPay_date(); String result=str.substring(0,
	 * str.lastIndexOf(" ")); pvo.setPay_date(result);
	 * 
	 * return pvo; }
	 */

//////////////
public List<CartListVO> cartList(SqlSessionTemplate sqlSession, String mem_id){
	List<CartListVO> list=sqlSession.selectList("payMapper.cartList", mem_id);
	
	return list;
}

public String getImg(SqlSessionTemplate sqlSession, int item_code) {
	String imgName=sqlSession.selectOne("payMapper.img",item_code);
	return imgName;
}

public void cartUpdate(SqlSessionTemplate sqlSession, CartUpdateVO cuvo) {
	sqlSession.update("payMapper.cartUpdate",cuvo);
}

public void cartDelete(SqlSessionTemplate sqlSession, int cart_item_no) {
	sqlSession.update("payMapper.cartDelete",cart_item_no);
}

public List<CartListVO> orderList(SqlSessionTemplate sqlSession, List<Integer> valueArr){
	
	List<CartListVO> list=new ArrayList<CartListVO>();
	
	for(int i : valueArr) {
		list.add(sqlSession.selectOne("payMapper.selectCart",i));
	}
	
	return list;
}

public MemberVO getMember(SqlSessionTemplate sqlSession, String mem_id) {
	MemberVO mvo=sqlSession.selectOne("payMapper.getMember",mem_id);
	return mvo;
}

public int insertOrderList(SqlSessionTemplate sqlSession, PayVO pvo) {
	sqlSession.insert("payMapper.insertOrderList", pvo);
	String mem_id=pvo.getMem_id();
	return sqlSession.selectOne("payMapper.getOrdNo",mem_id);
}
}
