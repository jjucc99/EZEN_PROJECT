package kr.co.ezenac.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.ezenac.board.model.vo.BoardVO;

@Repository("bDAO")
public class BoardDAO {

	public int insertBoard(SqlSessionTemplate sqlSession, BoardVO board) {
		System.out.println(board.getBoard_no());
		System.out.println(board.getBoard_sub());
		System.out.println(board.getBoard_content());
		System.out.println(board.getBoard_date());
		System.out.println(board.getBoard_board());
		System.out.println(board.getMem_id());
		return sqlSession.insert("boardMapper.insertBoard",board);
		
	}
		
	public int deleteBoard(SqlSessionTemplate sqlSession, int board_no) {
		
		return sqlSession.delete("boardMapper.deleteBoard", board_no);
		
	}
	
	public void updateBoard(SqlSessionTemplate sqlSession, BoardVO board) {
		sqlSession.update("boardMapper.updateBoard", board);
		
}
	
	/*
	public BoardVO selectBoard(SqlSessionTemplate sqlSession, int board_no) {
	BoardVO board=sqlSession.selectOne("boardMapper.selectBoard", board_no);
	String str=board.getBoard_date();
	String result=str.substring(0, str.lastIndexOf(" "));
	board.setBoard_date(result);
	return board;
	
	}
	*/
	public List<BoardVO> BoardList(SqlSessionTemplate sqlSession) {
	List<BoardVO> list=sqlSession.selectList("boardMapper.selectBoard");	
		for(BoardVO board: list) {
			String str=board.getBoard_date();
			String result=str.substring(0, str.lastIndexOf(" "));
			board.setBoard_date(result);
		}
		
		return list;
	}
	
	
	}







	
	



