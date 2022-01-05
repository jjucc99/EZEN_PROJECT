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
import kr.co.ezenac.board.model.vo.ReplyVO;

@Service("BoardService")
public class BoardServiceImp implements BoardService {
@Autowired
private SqlSessionTemplate sqlSession;
@Autowired
private BoardDAO bDAO;

@Override
public int countQna() {
	return bDAO.countQna(sqlSession);
}

@Override
public List<BoardVO> selectQna(PagingVO vo){
	return bDAO.selectQna(sqlSession, vo);
}

@Override
public int countReply(int board_no) {
	return bDAO.countReply(sqlSession, board_no);
}

@Override
public int countNotice() {
	return bDAO.countNotice(sqlSession);
}

@Override
public List<BoardVO> selectNotice(PagingVO vo) {
	return bDAO.selectNotice(sqlSession, vo);
}

@Override
public BoardVO selectOneBoard(int board_no) {
	return bDAO.selectOneBoard(sqlSession, board_no);
}

@Override
public void insertQna(BoardVO bvo) {
	bDAO.insertQna(sqlSession, bvo);
	
}

@Override
public void deleteQnA(int board_no) {
	bDAO.deleteQnA(sqlSession, board_no);
	
}

@Override
public void updateBoard(BoardVO bvo) {
	bDAO.updateBoard(sqlSession, bvo);
	
}

@Override
public void insertComment(ReplyVO rvo) {
	bDAO.insertComment(sqlSession, rvo);
	
}

@Override
public List<ReplyVO> selectComment(int board_no) {
	return bDAO.selectComment(sqlSession, board_no);
}

@Override
public int deleteReply(int reply_no) {
	return bDAO.deleteReply(sqlSession, reply_no);
}

@Override
public List<BoardVO> selectMyBoardList(PagingVO vo) {
	return bDAO.selectMyBoardList(sqlSession,vo);
}

@Override
public int countMyQnA(String mem_id) {
	return bDAO.countMyQnA(sqlSession,mem_id);
}

}



