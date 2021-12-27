package kr.co.ezenac.board.model.service;


import java.util.List;
import kr.co.ezenac.board.model.vo.BoardVO;
import kr.co.ezenac.board.model.vo.PagingVO;

public interface BoardService {

	int insertBoard(BoardVO board);
	List<BoardVO> BoardList();
	void updateBoard(BoardVO board);
	int deleteBoard(int board_no);
	//게시글 보기
	BoardVO viewDetail(int board_no);
	// 게시물 총 갯수
	 int countBoard();

	// 페이징 처리 게시글 조회
	 List<BoardVO> selectBoard(PagingVO vo);
	
	//공지사항 조회 (페이징)
	 List<BoardVO>selectnoticeBoard(PagingVO vo);
	
	//공지 갯수
	int countnoticeBoard();
	
	//Q&A 
	List<BoardVO>selectqnaBoard(PagingVO vo);
	
	//Q&A count
	int countqnaBoard();
}
