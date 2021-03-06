package kr.co.ezenac.board.model.service;

import java.util.List;

import kr.co.ezenac.board.model.vo.BoardVO;
import kr.co.ezenac.board.model.vo.PagingVO;
import kr.co.ezenac.board.model.vo.ReplyVO;

public interface BoardService {

	int countQna();
	
	List<BoardVO> selectQna(PagingVO vo);
	
	int countReply(int board_no);
	
	int countNotice();

	List<BoardVO> selectNotice(PagingVO vo);

	BoardVO selectOneBoard(int board_no);

	void insertQna(BoardVO bvo);

	void deleteQnA(int board_no);

	void updateBoard(BoardVO bvo);

	void insertComment(ReplyVO rvo);

	List<ReplyVO> selectComment(int board_no);

	int deleteReply(int reply_no);

	List<BoardVO> selectMyBoardList(PagingVO vo);

	int countMyQnA(String mem_id);


}


