package kr.co.ezenac.admin.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ezenac.admin.model.dao.AdminDAO;
import kr.co.ezenac.admin.model.vo.ImagesVO;
import kr.co.ezenac.admin.model.vo.ItemVO;
import kr.co.ezenac.admin.model.vo.Item_mgmVO;

@Service("AdminService")
public class AdminServiceImp implements AdminService {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private AdminDAO aDAO;

	@Override
	public int insertItem(ItemVO item) {

		return aDAO.insertItem(sqlSession, item);
	}

	@Override
	public ItemVO selectOneItem(int item_code) {
		return aDAO.selectOneItem(sqlSession, item_code);
	}

	@Override
	public List<ItemVO> ItemList() {
		return aDAO.ItemList(sqlSession);
	}

	@Override
	public int deleteItem(String item_name) {

		return aDAO.deleteItem(sqlSession, item_name);
	}

	@Override
	public void updateItem(ItemVO ivo) {
		aDAO.updateItem(sqlSession, ivo);
	}

	@Override
	public int insertImage(ImagesVO imageVO) {
		return aDAO.insertImage(sqlSession, imageVO);
	}

	@Override
	public int insertItem_mgm(Item_mgmVO imvo) {
		return aDAO.insertItem_mgm(sqlSession, imvo);
	}
	
	
}
