package kr.co.ezenac.board.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ezenac.board.model.dao.BoardDAO;
import kr.co.ezenac.board.model.vo.BoardVO;

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
}
/*
@Override
public BoardVO selectBoard(int board_no) {
	return bDAO.selectBoard(sqlSession, board_no);
}

}
*/



