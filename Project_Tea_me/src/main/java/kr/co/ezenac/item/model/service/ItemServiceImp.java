package kr.co.ezenac.item.model.service;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ezenac.item.model.vo.ItemDAO;

@Service("ItemService")
public class ItemServiceImp implements ItemService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ItemDAO iDAO;
}
