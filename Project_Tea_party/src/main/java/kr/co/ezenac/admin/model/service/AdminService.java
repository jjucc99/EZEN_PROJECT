package kr.co.ezenac.admin.model.service;

import java.util.List;

import kr.co.ezenac.admin.model.vo.ItemVO;

public interface AdminService {

	int insertItem(ItemVO item);
	ItemVO selectOneItem(int item_code);
	List<ItemVO> ItemList();
	int deleteItem(String item_name);
	void updateItem(ItemVO ivo);
	
	
}
