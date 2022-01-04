package kr.co.ezenac.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import kr.co.ezenac.board.model.vo.BoardVO;
import kr.co.ezenac.board.model.vo.PagingVO;
import kr.co.ezenac.board.model.vo.ReplyVO;

@Repository("bDAO")
public class BoardDAO {

	public int countQna(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.countQna");
	}
	
	public List<BoardVO> selectQna(SqlSessionTemplate sqlSession, PagingVO vo){
		return sqlSession.selectList("boardMapper.selectQna",vo);
	}
	
	public int countReply(SqlSessionTemplate sqlSession, int board_no) {
		return sqlSession.selectOne("boardMapper.countReply", board_no);
	}
	
	public int countNotice(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.countNotice");
	}

	public List<BoardVO> selectNotice(SqlSessionTemplate sqlSession, PagingVO vo) {
		return sqlSession.selectList("boardMapper.selectNotice", vo);
	}

	public BoardVO selectOneBoard(SqlSessionTemplate sqlSession, int board_no) {
		return sqlSession.selectOne("boardMapper.selectOneBoard", board_no);
	}

	public void insertQna(SqlSessionTemplate sqlSession, BoardVO bvo) {
		sqlSession.insert("boardMapper.insertQna", bvo);
		
	}

	public void deleteQnA(SqlSessionTemplate sqlSession, int board_no) {
		sqlSession.update("boardMapper.deleteQnA", board_no);
		
	}

	public void updateBoard(SqlSessionTemplate sqlSession, BoardVO bvo) {
		sqlSession.update("boardMapper.updateBoard", bvo);
		
	}


	public void insertComment(SqlSessionTemplate sqlSession, ReplyVO rvo) {
		sqlSession.insert("boardMapper.insertComment", rvo);
	}

	public List<ReplyVO> selectComment(SqlSessionTemplate sqlSession, int board_no) {
		return sqlSession.selectList("boardMapper.selectComment", board_no);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, int reply_no) {
		return sqlSession.delete("boardMapper.deleteReply", reply_no);
	}

	public List<BoardVO> selectMyBoardList(SqlSessionTemplate sqlSession,PagingVO vo) {
		return sqlSession.selectList("boardMapper.selectMyBoardList", vo);
	}

	public int countMyQnA(SqlSessionTemplate sqlSession, String mem_id) {
		return sqlSession.selectOne("boardMapper.countMyQnA",mem_id);
	}
}
	
	
	





