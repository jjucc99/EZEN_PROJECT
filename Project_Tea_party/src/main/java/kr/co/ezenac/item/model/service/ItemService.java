package kr.co.ezenac.item.model.service;

import java.util.List;

import kr.co.ezenac.item.model.vo.ItemVO;

public interface ItemService {
	
	int insertItem(ItemVO item);
	
	int deleteItem(ItemVO item);
	
	int update(ItemVO item);
	
	List<ItemVO> itemList();
	
	ItemVO infoItem(String item_code);


}
