package kr.co.ezenac.item.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.ezenac.item.model.vo.CateListVO;
import kr.co.ezenac.item.model.vo.ItemVO;
import kr.co.ezenac.item.model.vo.PagingVO;
import kr.co.ezenac.item.model.vo.ReviewBoardVO;

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
		return sqlSession.update("itemMapper.updateItem",item);
	}
	
	public List<ItemVO> listItem(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("itemMapper.selectList");
	}
	
	
	
	/*
	 * public List<CategoryVO> cateList(SqlSessionTemplate sqlSession,String
	 * cate_code) { System.out.println(cate_code+"카테고리"); return
	 * sqlSession.selectList("itemMapper.CateInfo",cate_code); }
	 */
	
	public List<CateListVO> cateList(SqlSessionTemplate sqlSession,String cate_code) {
		
		return sqlSession.selectList("itemMapper.CateInfo",cate_code);
	}
	
	public String getImg(SqlSessionTemplate sqlSession, int item_code) {
		String img_name = sqlSession.selectOne("itemMapper.img",item_code);
		return img_name;
	}
	
	//review이미지
	public String getReImg(SqlSessionTemplate sqlSession, int item_code) {
		String img_name = sqlSession.selectOne("itemMapper.reimg",item_code);
		return img_name;
	}
	
	public ItemVO infoItem(SqlSessionTemplate sqlSession, int item_code) {
		
		return sqlSession.selectOne("itemMapper.infoItem",item_code);
	}
	
	public int countItem(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("itemMapper.countItem");
	}

	public ItemVO infoItem(SqlSessionTemplate sqlSession, PagingVO pvo) {
		
		return sqlSession.selectOne("itemMapper.infoItem",pvo);
	}
	
	public List<ReviewBoardVO> rList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("itemMapper.selectRe");
	}
	
	public int cartNo(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("itemMapper.selectCartNo");
	}
}
