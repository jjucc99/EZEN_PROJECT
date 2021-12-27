package kr.co.ezenac.board.controller;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import kr.co.ezenac.board.model.service.BoardService;
import kr.co.ezenac.board.model.service.ReplyService;
import kr.co.ezenac.board.model.vo.BoardVO;
import kr.co.ezenac.board.model.vo.PagingVO;
import kr.co.ezenac.board.model.vo.ReplyVO;

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
	@RequestMapping(value= "update1.board", method= RequestMethod.GET)
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
		return "board";
	}
	
	
	//게시글 삭제 전
		@RequestMapping(value= "delete1.board", method= RequestMethod.GET)
		public String delete() {
			
			return "board_delete";
		}
	
	// 게시글 삭제 후
	@RequestMapping(value= "delete.board", method=RequestMethod.POST)
	public String deleteBoard(int board_no) {
	int result=bService.deleteBoard(board_no);
	System.out.println("삭제 결과" + result);
	return "board";
	}	
	
	@GetMapping("page.board")
	public String pageBoard(PagingVO vo, Model model, @RequestParam(value="nowPage", required=false)String nowPage
, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = bService.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", bService.selectBoard(vo));
		return "board_listpage";
	}
	
	@GetMapping("notice.board")
	public String noticeBoard(PagingVO vo, Model model, @RequestParam(value="nowPage", required=false)String nowPage
, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = bService.countnoticeBoard();
		System.out.println(total);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", bService.selectnoticeBoard(vo));
		return "board_listpage";
	
	}
	
	@GetMapping("qna.board")
	public String qnaBoard(PagingVO vo, Model model, @RequestParam(value="nowPage", required=false)String nowPage
, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = bService.countqnaBoard();
		System.out.println(total);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", bService.selectqnaBoard(vo));
		return "qna_list";
	
	

	}
	
	
	//게시글 보기 전
	@RequestMapping(value= "detail1.board", method= RequestMethod.GET)
	public String view() {
		
		return "board_detail";
	}
	
	// 게시글 본다음
	@RequestMapping(value="detail.board", method=RequestMethod.POST)
	public String viewDetail(Model model,@RequestParam("board_no")int board_no) {
		model.addAttribute("board", bService.viewDetail(board_no));
		
		return "board";
	}
	}
	
	
	/*
	//게시글 조회 전
			@RequestMapping(value= "select1.board", method= RequestMethod.GET)
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
*/
	


