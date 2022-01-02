package kr.co.ezenac.item.model.service;

import kr.co.ezenac.item.model.dao.ItemDAO;
import kr.co.ezenac.item.model.vo.Cart_itemVO;
import kr.co.ezenac.item.model.vo.CateListVO;
import kr.co.ezenac.item.model.vo.ImagesVO;
import kr.co.ezenac.item.model.vo.ItemVO;
import kr.co.ezenac.item.model.vo.PagingVO;
import kr.co.ezenac.item.model.vo.ReviewBoardVO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;


@Service("ItemService")
public class ItemServiceImp implements ItemService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ItemDAO iDAO;

	@Override
	public int insertItem(ItemVO item) {

		return iDAO.insertItem(sqlSession,item);
	}

	@Override
	public int deleteItem(ItemVO item) {
		
		return iDAO.deleteItem(sqlSession, item);
	}

	
	
	@Override
	public List<ItemVO> itemList() {
		
		return iDAO.listItem(sqlSession);
	}


	
	/*
	 * @Override public List<CategoryVO> cateList(String cate_code) {
	 * System.out.println(cate_code+"카테고리"); return
	 * iDAO.cateList(sqlSession,cate_code); }
	 */
	@Override
	public List<CateListVO> cateList(String cate_code) {
	
		return iDAO.cateList(sqlSession,cate_code);
	}
	//itemimg
	@Override
	public String getImg(int item_code) {

		return iDAO.getImg(sqlSession, item_code);
	}
	//reviewimg
	@Override
	public String getReImg(int r_board_no) {
		
		return iDAO.getReImg(sqlSession, r_board_no);
	}

	@Override
	public ItemVO infoItem(int item_code) {
		return iDAO.infoItem(sqlSession,item_code);
	}
	
	@Override
	public int countReview() {
		return iDAO.countReview(sqlSession);
	}

	@Override
	public ItemVO infoItem(PagingVO pvo) {
		return iDAO.infoItem(sqlSession,pvo);
	}

	@Override
	public List<ReviewBoardVO> rList(int item_code) {
		
		return iDAO.rList(sqlSession, item_code);
	}

	@Override
	public int cartno(String mem_id) {
		
		return iDAO.cartNo(sqlSession,mem_id);
	}

	@Override
	public int insertCart(Cart_itemVO cvo) {
		return iDAO.insertCart(sqlSession, cvo);
	}

	@Override
	public int reviewImg(ImagesVO imageVO) {
		return iDAO.reviewImg(sqlSession, imageVO);
	}

	@Override
	public int reviewInsert(ReviewBoardVO rvo) {
		return iDAO.reviewInsert(sqlSession, rvo);
	}

	@Override
	public int selectSeq() {
		return iDAO.selectSeq(sqlSession);
	}

	@Override
	public List<CateListVO> cateNewList(int cate_code) {
		
		return iDAO.cateNewList(sqlSession,cate_code);
	}

	@Override
	public ReviewBoardVO selectReview(ReviewBoardVO rvo) {
		return iDAO.selectReview(sqlSession,rvo);
	}

	@Override
	public int deleteReview(int r_board_no) {
		return iDAO.deleteReview(sqlSession,r_board_no);
	}
	@Override
	public int updateReview(ReviewBoardVO rvo) {
		
		return iDAO.updateReview(sqlSession, rvo);
	}

	@Override
	public int deleteReviewImg(int r_board_no) {
		return iDAO.deleteReviewImg(sqlSession,r_board_no);
	}

	@Override
	public String getReImgName(int r_board_no) {
		return iDAO.getReImgName(sqlSession,r_board_no);
	}
	
	

}
