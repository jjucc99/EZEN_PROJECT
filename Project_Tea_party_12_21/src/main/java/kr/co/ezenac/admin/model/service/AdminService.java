package kr.co.ezenac.admin.model.service;

import java.util.List;

import org.springframework.ui.Model;

import kr.co.ezenac.admin.model.vo.ImagesVO;
import kr.co.ezenac.admin.model.vo.ItemVO;
import kr.co.ezenac.admin.model.vo.MemberVO;
import kr.co.ezenac.admin.model.vo.PagingVO;

public interface AdminService {
	// 상품 관련
	int insertItem(ItemVO item);
	ItemVO selectOneItem(int item_code);
	List<ItemVO> ItemList();
	int deleteItem(int item_code);
	void updateItem(ItemVO ivo);
	// 이미지 관련
	int insertImage(ImagesVO imageVO);
	String getImg(int item_code);
	// 회원 관련
	List<MemberVO> memberList();
	List<MemberVO> outMemberList();
	void updateMember(MemberVO mvo);
	//--------------------------------
	// 게시물 총 갯수
	public int countItem();
	
	// 페이징 처리 상품 조회
	public List<ItemVO> selectItem(PagingVO vo);
	
}
