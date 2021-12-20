package kr.co.ezenac.item.model.service;

import kr.co.ezenac.item.model.dao.ItemDAO;
import kr.co.ezenac.item.model.vo.ItemVO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service("ItemService")
public class ItemServiceImp implements ItemService {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private ItemDAO iDAO;

	@Override
	public int insertItem(ItemVO item) {

		return iDAO.insertItem(sqlSession, item);
	}

	@Override
	public int deleteItem(ItemVO item) {

		return iDAO.deleteItem(sqlSession, item);
	}

	@Override
	public int updateItem(ItemVO item) {
		System.out.println(item+"업데이트");
		return iDAO.updateItem(sqlSession, item);
	}

	@Override
	public List<ItemVO> itemList() {

		return iDAO.listItem(sqlSession);
	}

	@Override
	public ItemVO infoItem(String item_code) {
		System.out.println(item_code + "아이템");
		return iDAO.infoItem(sqlSession, item_code);
	}

}
