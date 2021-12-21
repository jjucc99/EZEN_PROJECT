package kr.co.ezenac.item.model.service;

import java.util.List;

import kr.co.ezenac.item.model.vo.CategoryVO;
import kr.co.ezenac.item.model.vo.ItemVO;

public interface ItemService {
	
	int insertItem(ItemVO item);
	
	int deleteItem(ItemVO item);
	
	int updateItem(ItemVO item);
	
	List<ItemVO> itemList();
	
	ItemVO infoItem(String item_code);
	
	//카테고리 리스트
	List<CategoryVO> cateList(String cate_code);

}
