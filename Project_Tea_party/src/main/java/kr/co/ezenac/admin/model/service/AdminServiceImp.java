package kr.co.ezenac.admin.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.ezenac.admin.model.dao.AdminDAO;
import kr.co.ezenac.admin.model.vo.BoardVO;
import kr.co.ezenac.admin.model.vo.ImagesVO;
import kr.co.ezenac.admin.model.vo.ItemVO;
import kr.co.ezenac.admin.model.vo.MemberVO;
import kr.co.ezenac.admin.model.vo.OrderVO;
import kr.co.ezenac.admin.model.vo.Order_listVO;
import kr.co.ezenac.admin.model.vo.PagingVO;

@Service("AdminService")
public class AdminServiceImp implements AdminService {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private AdminDAO aDAO;

	@Override
	public int insertItem(ItemVO item) {
		return aDAO.insertItem(sqlSession, item);
	}

	@Override
	public ItemVO selectOneItem(int item_code) {
		return aDAO.selectOneItem(sqlSession, item_code);
	}

	@Override
	public int deleteItem(int item_code) {
		return aDAO.deleteItem(sqlSession, item_code);
	}

	@Override
	public void updateItem(ItemVO ivo) {
		aDAO.updateItem(sqlSession, ivo);
	}

	@Override
	public int insertImage(ImagesVO imageVO) {
		return aDAO.insertImage(sqlSession, imageVO);
	}

	@Override
	public String getImg(int item_code) {
		 return aDAO.getImg(sqlSession, item_code);
	}

	@Override
	public void updateMember(MemberVO mvo) {
		aDAO.updateMember(sqlSession,mvo);
		
	}

	@Override
	public int countItem() {
		return aDAO.countItem(sqlSession);
	}

	@Override
	public List<ItemVO> selectItem(PagingVO vo) {
		return aDAO.selectItem(sqlSession,vo);
	}

	@Override
	public int countMember() {
		return aDAO.countMember(sqlSession);
	}

	@Override
	public List<MemberVO> selectMember(PagingVO vo) {
		return aDAO.selectMember(sqlSession,vo);
	}

	@Override
	public int countOutMember() {
		return aDAO.countOutMember(sqlSession);
	}

	@Override
	public List<MemberVO> selectOutMember(PagingVO vo) {
		return aDAO.selectOutMember(sqlSession,vo);
	}

	@Override
	public int countOrder() {
		return aDAO.countOrder(sqlSession);
	}

	@Override
	public List<OrderVO> selectOrder(PagingVO vo) {
		return aDAO.selectOrder(sqlSession,vo);
	}

	@Override
	public int updateDeliveryStatus(int ord_no) {
		return aDAO.updateDeliveryStatus(sqlSession,ord_no);
	}

	@Override
	public int updateOrderStatus(int ord_no) {
		return aDAO.updateOrderStatus(sqlSession,ord_no);
	}

	@Override
	public List<String> selectName(int ord_no) {
		return aDAO.selectName(sqlSession,ord_no);
	}

	@Override
	public Order_listVO selectOneOrder(int ord_no) {
		return aDAO.selectOneOrder(sqlSession,ord_no);
	}

	@Override
	public List<OrderVO> selectOrderDetail(int ord_no) {
		return aDAO.selectOrderDetail(sqlSession,ord_no);
	}

	@Override
	public int countNotice() {
		return aDAO.countNotice(sqlSession);
	}

	@Override
	public List<BoardVO> selectNotice(PagingVO vo) {
		return aDAO.selectNotice(sqlSession, vo);
	}

	@Override
	public BoardVO selectOneBoard(int board_no) {
		return aDAO.selectOneBoard(sqlSession, board_no);
	}
	
	
}
