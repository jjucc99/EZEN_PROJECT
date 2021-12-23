package kr.co.ezenac.admin.model.service;

import java.util.List;

import org.springframework.ui.Model;

import kr.co.ezenac.admin.model.vo.ImagesVO;
import kr.co.ezenac.admin.model.vo.ItemVO;
import kr.co.ezenac.admin.model.vo.MemberVO;
import kr.co.ezenac.admin.model.vo.Order_listVO;
import kr.co.ezenac.admin.model.vo.PagingVO;

public interface AdminService {
	// 상품 관련
	
	// 게시물 총 갯수
	int countItem();

	// 페이징 처리 상품 조회
	List<ItemVO> selectItem(PagingVO vo);
	// 상품 추가
	int insertItem(ItemVO item);
	// 상품 조회
	ItemVO selectOneItem(int item_code);
	//상품 삭제
	int deleteItem(int item_code);
	//상품 수정
	void updateItem(ItemVO ivo);

	// 이미지 관련
	int insertImage(ImagesVO imageVO);

	String getImg(int item_code);

	// 회원 관련
	void updateMember(MemberVO mvo);

	int countMember();

	List<MemberVO> selectMember(PagingVO vo);

	int countOutMember();

	List<MemberVO> selectOutMember(PagingVO vo);

	int countOrder();

	List<Order_listVO> selectOrder(PagingVO vo);

	int updateDeliveryStatus(int ord_no);

	int updateOrderStatus(int ord_no);

}
