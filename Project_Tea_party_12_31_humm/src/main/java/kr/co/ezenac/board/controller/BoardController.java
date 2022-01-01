package kr.co.ezenac.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.ezenac.board.model.service.BoardService;
import kr.co.ezenac.board.model.vo.BoardVO;
import kr.co.ezenac.board.model.vo.PagingVO;

@Controller
public class BoardController {
	@Autowired
	private BoardService bService;
	
	
	//QnA 리스트 페이지
	@GetMapping("qnaList.board")
	public String memberList(PagingVO vo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage) {
		
		//페이징 처리
		int total = bService.countQna();
		if (nowPage == null) {
			nowPage = "1";
		}
		
		vo = new PagingVO(total, Integer.parseInt(nowPage));
		model.addAttribute("paging", vo);
		
		//{글번호 (시퀀스), 제목 (qna댓글 수), 작성자, 작성일} 가져오기
		List<BoardVO> qnaList=bService.selectQna(vo);
		
		//답글 카운트
		for(BoardVO bvo : qnaList) {
			bvo.setReplyCount(bService.countReply(bvo.getBoard_no()));
		}
		
		model.addAttribute("qnaList",qnaList);
		return "qnaList";
	}
	
	// 공지 리스트 조회
		@GetMapping("noticeList.board")
		public String BoardList(PagingVO vo, Model model, @RequestParam(value = "nowPage", required = false) String nowPage) {
	
			int total = bService.countNotice();
			if (nowPage == null) {
				nowPage = "1";
			}
			
			vo = new PagingVO(total, Integer.parseInt(nowPage));
			model.addAttribute("paging", vo);
			model.addAttribute("viewAll", bService.selectNotice(vo));
			return "notice_list";
		}

		// 게시판 정보 로직
		@RequestMapping(value = "noticeInfo.board", method = RequestMethod.GET)
		public ModelAndView selectOneBoard(int board_no) {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("notice_info");
			BoardVO bvo = bService.selectOneBoard(board_no);
			mv.addObject("board", bvo);

			return mv;
		}
}


