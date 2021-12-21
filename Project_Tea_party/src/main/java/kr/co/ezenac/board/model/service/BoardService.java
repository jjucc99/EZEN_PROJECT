package kr.co.ezenac.board.model.service;


import java.util.List;

import kr.co.ezenac.board.model.vo.BoardVO;

public interface BoardService {

	int insertBoard(BoardVO board);
	List<BoardVO> BoardList();
	void updateBoard(BoardVO board);
	int deleteBoard(int board_no);
	/*BoardVO selectBoard(int board_no);*/
	


	}
