package kr.co.ezenac.pay.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.ezenac.members.model.vo.MemberVO;
import kr.co.ezenac.pay.model.vo.CartListVO;
import kr.co.ezenac.pay.model.vo.CartUpdateVO;
import kr.co.ezenac.pay.model.vo.Order_itemVO;
import kr.co.ezenac.pay.model.vo.Order_listVO;
import kr.co.ezenac.pay.model.vo.PagingVO;
import kr.co.ezenac.pay.model.vo.PayVO;
import kr.co.ezenac.pay.model.vo.SubOrderVO;

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

public int insertOrderItem(SqlSessionTemplate sqlSession, List<Integer> payList,int ord_no) {
	
	List<Order_itemVO> ordItemList=new ArrayList<Order_itemVO>();
	
	//cart_item에서 payList의 cart_item_no을 이용해 상품코드와 수량 가져오기
	for(int i : payList) {
		ordItemList.add(sqlSession.selectOne("payMapper.getCartItem",i));
	}
	
	int Ok=0;
	
	//ord_no 입력 후 Order_item 테이블에 데이터 저장, cart_item은 삭제
	for(Order_itemVO vo : ordItemList) {
		vo.setOrd_no(ord_no);
		int a=sqlSession.insert("payMapper.insertOrderItem", vo);
		int b=sqlSession.update("payMapper.deleteCartItem", vo.getCart_item_no());
		
		if(a+b ==2) {
			Ok=1;
		}
	}
	return Ok;
}

public int countOrder(SqlSessionTemplate sqlSession, String mem_id) {
	return sqlSession.selectOne("payMapper.countOrder",mem_id);
}

public List<Order_listVO> selectOrder(SqlSessionTemplate sqlSession, PagingVO pgvo){
	//구매내역 가져오기
	List<Order_listVO> orderList=new ArrayList<Order_listVO>();
	sqlSession.selectList("payMapper.selectOrder", pgvo);
	
	//대표 상품, 종류 개수, 이미지를 위한 아이템코드 가져오기
	for(Order_listVO ordvo : orderList) {
		int ord_no=ordvo.getOrd_no();
		List<SubOrderVO> subList=sqlSession.selectList("payMapper.selectRep",ord_no);
		
		SubOrderVO subvo=subList.get(0);
		
		ordvo.setRep_name(subvo.getItem_name());
		ordvo.setOrd_count(subList.size());
		ordvo.setImgPath(String.valueOf(subvo.getItem_code()));
	}
	return orderList;
}
}
