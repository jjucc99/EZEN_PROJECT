package kr.co.ezenac.board.model.service;

import java.util.List;

import kr.co.ezenac.board.model.vo.BoardVO;
import kr.co.ezenac.board.model.vo.PagingVO;

public interface BoardService {

	int countQna();
	
	List<BoardVO> selectQna(PagingVO vo);
	
	int countReply(int board_no);
	
	int countNotice();

	List<BoardVO> selectNotice(PagingVO vo);

	BoardVO selectOneBoard(int board_no);
}


