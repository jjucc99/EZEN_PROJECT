package kr.co.ezenac.pay.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ezenac.pay.model.dao.PayDAO;

@Service("PayService")
public class PayServiceImp implements PayService{
 @Autowired
 private SqlSessionTemplate sqlSession;
 
 @Autowired
 private PayDAO pDAO;
}
