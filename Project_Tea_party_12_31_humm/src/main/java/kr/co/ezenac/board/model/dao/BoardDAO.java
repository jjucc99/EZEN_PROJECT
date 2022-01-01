package kr.co.ezenac.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import kr.co.ezenac.board.model.vo.BoardVO;
import kr.co.ezenac.board.model.vo.PagingVO;

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
}
	
	
	




