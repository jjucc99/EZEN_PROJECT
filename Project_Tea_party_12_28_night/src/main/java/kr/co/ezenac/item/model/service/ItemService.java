package kr.co.ezenac.item.model.service;

import java.util.List;

import kr.co.ezenac.item.model.vo.Cart_itemVO;
import kr.co.ezenac.item.model.vo.CateListVO;
import kr.co.ezenac.item.model.vo.ImagesVO;
import kr.co.ezenac.item.model.vo.ItemVO;
import kr.co.ezenac.item.model.vo.PagingVO;
import kr.co.ezenac.item.model.vo.ReviewBoardVO;


public interface ItemService {

	int insertItem(ItemVO item);
	
	int deleteItem(ItemVO item);
	
	int update(ItemVO item);
	
	List<ItemVO> itemList();
	
	//List<CategoryVO> cateList(String cate_code);
	
	List<CateListVO> cateList(String cate_code);

	String getImg(int item_code);
	
	//reviewimg
	String getReImg(int r_board_no);
	
	ItemVO infoItem(int item_code);
	
	int countReview();

	ItemVO infoItem(PagingVO pvo);
	
	List<ReviewBoardVO> rList(int item_code);
	
	int cartno(String mem_id);
	
	int insertCart(Cart_itemVO cvo);

	int reviewImg(ImagesVO imageVO);

	int reviewInsert(ReviewBoardVO rvo);

	int selectSeq();
	
	
}
