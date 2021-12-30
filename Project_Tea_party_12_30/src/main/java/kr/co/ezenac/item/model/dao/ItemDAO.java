package kr.co.ezenac.item.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.ezenac.item.model.vo.Cart_itemVO;
import kr.co.ezenac.item.model.vo.CateListVO;
import kr.co.ezenac.item.model.vo.ImagesVO;
import kr.co.ezenac.item.model.vo.ItemVO;
import kr.co.ezenac.item.model.vo.PagingVO;
import kr.co.ezenac.item.model.vo.ReviewBoardVO;

@Repository("iDAO")
//implement와 연결할 아이디
public class ItemDAO {

	public int insertItem(SqlSessionTemplate sqlSession, ItemVO item) {

		return sqlSession.insert("itemMapper.insertItem", item);
	}

	public int deleteItem(SqlSessionTemplate sqlsession, ItemVO item) {
		return sqlsession.delete("itemMapper.deleteItem", item);
	}

	public List<ItemVO> listItem(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("itemMapper.selectList");
	}

	/*
	 * public List<CategoryVO> cateList(SqlSessionTemplate sqlSession,String
	 * cate_code) { System.out.println(cate_code+"카테고리"); return
	 * sqlSession.selectList("itemMapper.CateInfo",cate_code); }
	 */

	public List<CateListVO> cateList(SqlSessionTemplate sqlSession, String cate_code) {

		return sqlSession.selectList("itemMapper.CateInfo", cate_code);
	}

	public String getImg(SqlSessionTemplate sqlSession, int item_code) {
		String img_name = sqlSession.selectOne("itemMapper.img", item_code);
		return img_name;
	}

	// review이미지
	public String getReImg(SqlSessionTemplate sqlSession, int r_board_no) {
		String img_name = sqlSession.selectOne("itemMapper.reimg", r_board_no);

		return img_name;
	}

	public ItemVO infoItem(SqlSessionTemplate sqlSession, int item_code) {

		return sqlSession.selectOne("itemMapper.infoItem", item_code);
	}

	public int countReview(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("itemMapper.countRe");
	}

	public ItemVO infoItem(SqlSessionTemplate sqlSession, PagingVO pvo) {

		return sqlSession.selectOne("itemMapper.infoItem", pvo);
	}

	public List<ReviewBoardVO> rList(SqlSessionTemplate sqlSession, int item_code) {
		return sqlSession.selectList("itemMapper.selectRe", item_code);
	}

	public int cartNo(SqlSessionTemplate sqlSession, String mem_id) {
		return sqlSession.selectOne("itemMapper.selectCartNo", mem_id);
	}

	public int insertCart(SqlSessionTemplate sqlSession, Cart_itemVO cvo) {
		return sqlSession.insert("itemMapper.insertCart", cvo);
	}

	public int reviewImg(SqlSessionTemplate sqlSession, ImagesVO imageVO) {
		return sqlSession.insert("itemMapper.insertReviewImg", imageVO);
	}

	public int reviewInsert(SqlSessionTemplate sqlSession, ReviewBoardVO rvo) {
		return sqlSession.insert("itemMapper.reviewInsert", rvo);
	}

	public int selectSeq(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("itemMapper.selectSeq");
	}

	public List<CateListVO> cateNewList(SqlSessionTemplate sqlSession, String cate_code) {
		return sqlSession.selectList("itemMapper.CateNewInfo", cate_code);
	}

	public ReviewBoardVO selectReview(SqlSessionTemplate sqlSession, ReviewBoardVO rvo) {

		return sqlSession.selectOne("itemMapper.selectReview", rvo);
	}

	// 업데이트 리뷰
	public int updateReview(SqlSessionTemplate sqlSession, ReviewBoardVO rvo) {
		return sqlSession.update("itemMapper.updateReview", rvo);
	}
	//리뷰 삭제
	public int deleteReview(SqlSessionTemplate sqlSession, int r_board_no) {
		return sqlSession.delete("itemMapper.deleteReview", r_board_no);
	}
	//이미지 삭제
	public int deleteReviewImg(SqlSessionTemplate sqlSession, int r_board_no) {
		return sqlSession.delete("itemMapper.deleteReviewImg", r_board_no);
	}
}
