package kr.co.ezenac.item.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.ezenac.item.model.vo.ItemVO;

@Repository("iDAO")
//implement와 연결할 아이디
public class ItemDAO {

	public int insertItem(SqlSessionTemplate sqlSession, ItemVO item) {
		return sqlSession.insert("itemMapper.insertItem",item);
	}
	
	public int deleteItem(SqlSessionTemplate sqlsession, ItemVO item) {
		return sqlsession.delete("itemMapper.deleteItem",item);
	}
	
	public int updateItem(SqlSessionTemplate sqlSession, ItemVO item) {
		System.out.println(item+"update");
		return sqlSession.update("itemMapper.updateItem", item);
	}
	
	public List<ItemVO> listItem(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("itemMapper.selectList");
	}
	
	public ItemVO infoItem(SqlSessionTemplate sqlSession, String item_code) {
		System.out.println(item_code+"아이템");
		return sqlSession.selectOne("itemMapper.infoItem",item_code);
	}

}
