package kr.co.ezenac.board.model.service;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.ezenac.board.model.dao.BoardDAO;
import kr.co.ezenac.board.model.vo.BoardVO;
import kr.co.ezenac.board.model.vo.PagingVO;

@Service("BoardService")
public class BoardServiceImp implements BoardService {
@Autowired
private SqlSessionTemplate sqlSession;
@Autowired
private BoardDAO bDAO;

@Override
public int insertBoard(BoardVO board) {
	System.out.println(board.getBoard_no());
	System.out.println(board.getBoard_sub());
	System.out.println(board.getBoard_content());
	System.out.println(board.getBoard_date());
	System.out.println(board.getBoard_board());
	System.out.println(board.getMem_id());
	return bDAO.insertBoard(sqlSession, board);
}

@Override
public List<BoardVO> BoardList() {
	return bDAO.BoardList(sqlSession);
}

@Override
public void updateBoard(BoardVO board) {
	bDAO.updateBoard(sqlSession, board);
	
}
@Override
public int deleteBoard(int board_no) {
	return bDAO.deleteBoard(sqlSession, board_no);
}

@Override
public int countBoard() {
return bDAO.countBoard(sqlSession);
}

@Override
public List<BoardVO> selectBoard(PagingVO vo) {
	return bDAO.selectBoard(sqlSession,vo);
}



@Override
public BoardVO viewDetail(int board_no) {
	return bDAO.viewDetail(sqlSession, board_no);
}

@Override
public List<BoardVO> selectnoticeBoard(PagingVO vo){
	return bDAO.selectnoticeBoard(sqlSession, vo);
}

@Override
public int countnoticeBoard() {
	return bDAO.countnoticeBoard(sqlSession);
}

@Override
public List<BoardVO> selectqnaBoard(PagingVO vo){
	return bDAO.selectqnaBoard(sqlSession, vo);
	
}

@Override
public int countqnaBoard() {
	return bDAO.countqnaBoard(sqlSession);
}


}



