package kr.co.ezenac.pay.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.ezenac.pay.model.vo.PayVO;

@Repository("pDAO")
//implement와 연결할 아이디
public class PayDAO {

public int insertPay(SqlSessionTemplate sqlSession, PayVO pvo) {
	return sqlSession.insert("payMapper.insertPay",pvo);
}

public List<PayVO> payList(SqlSessionTemplate sqlSession) {
	List<PayVO> list=sqlSession.selectList("payMapper.selectPay");
	
	for(PayVO pvo: list) {
		String str=pvo.getPay_date();
		String result=str.substring(0, str.lastIndexOf(" "));
		pvo.setPay_date(result);
	}
	return list;
}

public void updatePay(SqlSessionTemplate sqlSession, PayVO pvo) {
	sqlSession.update("payMapper.updatePay",pvo);
}

public void deletePay(SqlSessionTemplate sqlSession, int pay_no) {
	sqlSession.update("payMapper.deletePay", pay_no);
}

public PayVO selectOne(SqlSessionTemplate sqlSession, int pay_no) {
	PayVO pvo=sqlSession.selectOne("payMapper.selectOne", pay_no);
	String str=pvo.getPay_date();
	String result=str.substring(0, str.lastIndexOf(" "));
	pvo.setPay_date(result);
	return pvo;
}
}