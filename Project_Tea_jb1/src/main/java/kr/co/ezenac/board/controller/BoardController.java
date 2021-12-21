package kr.co.ezenac.board.controller;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import kr.co.ezenac.board.model.service.BoardService;
import kr.co.ezenac.board.model.vo.BoardVO;

@Controller
public class BoardController {
	@Autowired
	private BoardService bService;
	
	//홈
	@RequestMapping(value= "board.board", method= RequestMethod.GET )
	public String text() {
		return "board";
	}
	//게시글 작성 전
		@RequestMapping(value= "insert1.board", method= RequestMethod.GET)
		public String insert() {
			
			return "board_write";
		}
	//게시글 작성 후 
		@RequestMapping(value= "insert.board", method= RequestMethod.POST )
		public String insertBoard(@ModelAttribute BoardVO board){
			bService.insertBoard(board);
			System.out.println(board.getBoard_no());
			System.out.println(board.getBoard_sub());
			System.out.println(board.getBoard_content());
			System.out.println(board.getBoard_date());
			System.out.println(board.getBoard_board());
			System.out.println(board.getMem_id());
			return "board";
		}
		
		
	//게시글 리스트
	@RequestMapping(value= "list.board", method= RequestMethod.GET)
	public ModelAndView selectBoardList() {
		ModelAndView mv=new ModelAndView();
		List<BoardVO> list=bService.BoardList();
		mv.setViewName("board_list");
		mv.addObject("list", list);
		return mv;
	}
	
	//게시글 수정 전
	@RequestMapping(value= "update.board", method= RequestMethod.GET)
	public String update() {
		
		return "board_update";
	}
	
	// 게시글 수정 후
	@RequestMapping(value= "update.board", method=RequestMethod.POST)
	public String updateboard(@ModelAttribute BoardVO board) {
		System.out.println(board.getBoard_no());
		System.out.println(board.getBoard_sub());
		System.out.println(board.getBoard_content());
		bService.updateBoard(board);
		return "board_update";
	}
	
	
	//게시글 삭제 전
		@RequestMapping(value= "delete.board", method= RequestMethod.GET)
		public String delete() {
			
			return "board_delete";
		}
	
	// 게시글 삭제 후
	@RequestMapping(value= "delete.board", method=RequestMethod.POST)
	public String deleteBoard(int board_no) {
	int result=bService.deleteBoard(board_no);
	System.out.println("삭제 결과" + result);
	return "board_delete";
	}	
	
	
	//게시글 조회 전
			@RequestMapping(value= "select.board", method= RequestMethod.GET)
			public String select() {
				
				return "board_info";
			}

	// 게시글 조회 후
	@RequestMapping(value="select.board", method=RequestMethod.POST)
	public ModelAndView selectBoard(int board_no) {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("board_info");
		mv.addObject("board", bService.selectBoard(board_no));
		return mv;
	}
	}

	


