package kr.co.ezenac.admin.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.ezenac.admin.model.dao.AdminDAO;
import kr.co.ezenac.admin.model.vo.ImagesVO;
import kr.co.ezenac.admin.model.vo.ItemVO;
import kr.co.ezenac.admin.model.vo.MemberVO;
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
	public List<ItemVO> ItemList() {
		return aDAO.ItemList(sqlSession);
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
	public List<MemberVO> memberList() {
		return aDAO.memberList(sqlSession);
	}

	@Override
	public List<MemberVO> outMemberList() {
		return aDAO.outMemberList(sqlSession);
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
	
	
}
