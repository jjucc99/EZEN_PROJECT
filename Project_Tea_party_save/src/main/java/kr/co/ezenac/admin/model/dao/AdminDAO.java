package kr.co.ezenac.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import kr.co.ezenac.admin.model.vo.BoardVO;
import kr.co.ezenac.admin.model.vo.ImagesVO;
import kr.co.ezenac.admin.model.vo.ItemVO;
import kr.co.ezenac.admin.model.vo.MemberVO;
import kr.co.ezenac.admin.model.vo.OrderVO;
import kr.co.ezenac.admin.model.vo.Order_listVO;
import kr.co.ezenac.admin.model.vo.PagingVO;

@Repository("aDAO")
public class AdminDAO {

	public int insertItem(SqlSessionTemplate sqlSession,ItemVO item) {
		return sqlSession.insert("adminMapper.insertItem", item);
	}

	public ItemVO selectOneItem(SqlSessionTemplate sqlSession, int item_code) {
		return sqlSession.selectOne("adminMapper.selectOneItem", item_code);
	}
	
	public int countItem(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.countItem");
	}

	public List<ItemVO> selectItem(SqlSessionTemplate sqlSession, PagingVO vo) {
		return sqlSession.selectList("adminMapper.selectItem", vo);
	}

	public int deleteItem(SqlSessionTemplate sqlSession, int item_code) {
		return sqlSession.update("adminMapper.deleteItem", item_code);
	}

	public void updateItem(SqlSessionTemplate sqlSession, ItemVO ivo) {
		sqlSession.update("adminMapper.updateItem", ivo);
	}

	public int insertImage(SqlSessionTemplate sqlSession, ImagesVO imageVO) {
		return sqlSession.insert("adminMapper.insertImage", imageVO);
	}

	public String getImg(SqlSessionTemplate sqlSession, int item_code) {
		String imgName=sqlSession.selectOne("adminMapper.selectOneItemImage",item_code);
		return imgName;
	}

	public void updateMember(SqlSessionTemplate sqlSession, MemberVO mvo) {
		sqlSession.update("adminMapper.updateMember", mvo);
	}

	public int countMember(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.countMember");
	}

	public List<MemberVO> selectMember(SqlSessionTemplate sqlSession, PagingVO vo) {
		return sqlSession.selectList("adminMapper.selectMember", vo);
	}

	public int countOutMember(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.countOutMember");
	}

	public List<MemberVO> selectOutMember(SqlSessionTemplate sqlSession, PagingVO vo) {
		return sqlSession.selectList("adminMapper.selectOutMember", vo);
	}

	public int countOrder(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.countOrder");
	}

	public List<OrderVO> selectOrder(SqlSessionTemplate sqlSession, PagingVO vo) {
		return sqlSession.selectList("adminMapper.selectOrder", vo);
	}

	public int updateDeliveryStatus(SqlSessionTemplate sqlSession, int ord_no) {
		return sqlSession.update("adminMapper.updateDeliveryStatus", ord_no);
	}

	public int updateOrderStatus(SqlSessionTemplate sqlSession, int ord_no) {
		return sqlSession.update("adminMapper.updateOrderStatus", ord_no);
	}

	public List<String> selectName(SqlSessionTemplate sqlSession, int ord_no) {
		return sqlSession.selectList("adminMapper.selectOrderName", ord_no);
	}

	public Order_listVO selectOneOrder(SqlSessionTemplate sqlSession, int ord_no) {
		return sqlSession.selectOne("adminMapper.selectOneOrder", ord_no);
	}

	public List<OrderVO> selectOrderDetail(SqlSessionTemplate sqlSession, int ord_no) {
		return sqlSession.selectList("adminMapper.selectOrderDetail", ord_no);
	}

	public int countNotice(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.countNotice");
	}

	public List<BoardVO> selectNotice(SqlSessionTemplate sqlSession, PagingVO vo) {
		return sqlSession.selectList("adminMapper.selectNotice", vo);
	}

	public BoardVO selectOneBoard(SqlSessionTemplate sqlSession, int board_no) {
		return sqlSession.selectOne("adminMapper.selectOneBoard", board_no);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int board_no) {
		return sqlSession.delete("adminMapper.deleteBoard", board_no);
	}

	public void updateBoard(SqlSessionTemplate sqlSession, BoardVO bvo) {
		sqlSession.update("adminMapper.updateBoard", bvo);
		
	}

	public void insertBoard(SqlSessionTemplate sqlSession, BoardVO bvo) {
		sqlSession.insert("adminMapper.insertBoard", bvo);
	}

	public String selectItemImgName(SqlSessionTemplate sqlSession, int item_code) {
		return sqlSession.selectOne("adminMapper.selectItemImgName", item_code);
	}

	public void deleteItemImg(SqlSessionTemplate sqlSession, int item_code) {
		sqlSession.delete("adminMapper.deleteItemImg", item_code);
		
	}
	
	
}
