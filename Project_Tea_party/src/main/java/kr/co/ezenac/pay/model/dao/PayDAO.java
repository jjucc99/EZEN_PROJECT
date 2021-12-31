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
import kr.co.ezenac.pay.model.vo.PayVO;
import kr.co.ezenac.pay.model.vo.SubOrderVO;

@Repository("pDAO")
//implement와 연결할 아이디
public class PayDAO {

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
	
	//ord_no 입력 후 Order_item 테이블에 데이터 저장, cart_item은 삭제, 재고 삭제
	for(Order_itemVO vo : ordItemList) {
		vo.setOrd_no(ord_no);
		int a=sqlSession.insert("payMapper.insertOrderItem", vo);
		int b=sqlSession.update("payMapper.deleteItemCount",vo);
		int c=sqlSession.update("payMapper.deleteCartItem", vo.getCart_item_no());
		
		if(a+b+c ==3) {
			Ok=1;
		}
	}
	return Ok;
}


public List<Order_listVO> selectOrder(SqlSessionTemplate sqlSession, String mem_id){
	//구매내역 가져오기
	List<Order_listVO> orderList=new ArrayList<Order_listVO>();
	orderList=sqlSession.selectList("payMapper.selectOrder", mem_id);
	
	for(Order_listVO ordvo : orderList) {
		//대표 상품, 종류 개수, 이미지를 위한 아이템코드 가져오기
		int ord_no=ordvo.getOrd_no();
		List<SubOrderVO> subList=sqlSession.selectList("payMapper.selectRep",ord_no);
		
		if (subList.size()!=0) {
		SubOrderVO subvo=subList.get(0);
		
		ordvo.setRep_name(subvo.getStr());
		ordvo.setOrd_count(subList.size()-1);
		ordvo.setImgPath(String.valueOf(subvo.getNum()));//아이템코드
		}
	}
	return orderList;
}

public void changeStatus(SqlSessionTemplate sqlSession, Order_listVO ovo) {
	sqlSession.update("payMapper.changeStatus", ovo);
}

public List<CartListVO> orderItemList(SqlSessionTemplate sqlSession, int ord_no) {
	return sqlSession.selectList("payMapper.orderItemList",ord_no);
}

public PayVO getOrdInfo(SqlSessionTemplate sqlSession, int ord_no) {
	return sqlSession.selectOne("payMapper.getOrdInfo", ord_no);
}

public int checkReview(SqlSessionTemplate sqlSession, SubOrderVO subvo) {
	return sqlSession.selectOne("payMapper.checkReview", subvo);
}
}
