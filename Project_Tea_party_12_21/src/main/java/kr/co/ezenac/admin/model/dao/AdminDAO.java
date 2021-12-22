package kr.co.ezenac.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.ezenac.admin.model.vo.ImagesVO;
import kr.co.ezenac.admin.model.vo.ItemVO;

@Repository("aDAO")
public class AdminDAO {

	public int insertItem(SqlSessionTemplate sqlSession,ItemVO item) {
		
		return sqlSession.insert("adminMapper.insertItem", item);
	}

	public ItemVO selectOneItem(SqlSessionTemplate sqlSession, int item_code) {
		
		return sqlSession.selectOne("adminMapper.selectOneItem", item_code);
	}

	public List<ItemVO> ItemList(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectList("adminMapper.selectItemList");
	}

	public int deleteItem(SqlSessionTemplate sqlSession, int item_code) {
		
		return sqlSession.delete("adminMapper.deleteItem", item_code);
	}

	public void updateItem(SqlSessionTemplate sqlSession, ItemVO ivo) {
		sqlSession.update("adminMapper.updateItem", ivo);
	}

	public int insertImage(SqlSessionTemplate sqlSession, ImagesVO imageVO) {
		return sqlSession.insert("adminMapper.insertImage", imageVO);
	}

	public String getImg(SqlSessionTemplate sqlSession, int item_code) {
		String imgName=sqlSession.selectOne("adminMapper.selectOneItemImage",item_code);
		return imgName;
	}


	
	
}
