package kr.co.ezenac.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.ezenac.board.model.service.BoardService;
import kr.co.ezenac.board.model.vo.BoardVO;
import kr.co.ezenac.board.model.vo.PagingVO;
import kr.co.ezenac.board.model.vo.ReplyVO;

@Controller
public class BoardController {
	@Autowired
	private BoardService bService;

	private int chk = 0;

	public int getChk() {
		return chk;
	}

	public void setChk(int chk) {
		this.chk = chk;
	}

	// QnA 리스트 페이지
	@GetMapping("qnaList.board")
	public String memberList(PagingVO vo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage) {

		// 페이징 처리
		int total = bService.countQna();
		if (nowPage == null) {
			nowPage = "1";
		}

		vo = new PagingVO(total, Integer.parseInt(nowPage));
		model.addAttribute("paging", vo);

		// {글번호 (시퀀스), 제목 (qna댓글 수), 작성자, 작성일} 가져오기
		List<BoardVO> qnaList = bService.selectQna(vo);

		// 답글 카운트
		for (BoardVO bvo : qnaList) {
			bvo.setReplyCount(bService.countReply(bvo.getBoard_no()));
		}
		model.addAttribute("chk", getChk());
		setChk(0);
		model.addAttribute("qnaList", qnaList);
		return "qnaList";
	}

	// 공지 리스트 조회
	@GetMapping("noticeList.board")
	public String BoardList(PagingVO vo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage) {

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

	// QnA 작성 폼으로 이동
	@RequestMapping(value = "qnaInsertForm.board", method = RequestMethod.GET)
	public String addItemform() {
		return "qnaInsertForm";
	}

	// QnA 작성 로직
	@RequestMapping(value = "qnaInsert.board", method = RequestMethod.POST)
	public String insertQna(@ModelAttribute BoardVO bvo) {
		bService.insertQna(bvo);
		return "redirect:qnaList.board";
	}

	// QnA 정보 로직
	@RequestMapping(value = "qnaInfo.board", method = RequestMethod.GET)
	public String QnAInfo(@ModelAttribute BoardVO bvo, Model model, HttpSession session) {
		String mem_id = bvo.getMem_id();
		int board_no = bvo.getBoard_no();// 작성자
		Character checkAdmin = (Character) session.getAttribute("checkAdmin");
		String chk_mem_id = (String) session.getAttribute("mem_id");// 원글 작성자
		BoardVO sendbvo = bService.selectOneBoard(board_no);
		List<ReplyVO> list = bService.selectComment(board_no);
		model.addAttribute("reply", list);
		model.addAttribute("board", sendbvo);

		if(checkAdmin ==null || chk_mem_id == null) {
			checkAdmin='N';
			chk_mem_id = "다른 사용자";
		}
		
		if (checkAdmin != 'N' || mem_id.equals(chk_mem_id)) {
			return "qna_info";
		} else {
			setChk(1);
			return "redirect:qnaList.board";
		}

	}

	// QnA 삭제 로직
	@RequestMapping(value = "qnaDelete.board", method = RequestMethod.POST)
	public String deleteBoard(int board_no) {
		bService.deleteQnA(board_no);
		return "redirect:qnaList.board";
	}

	// 게시글 업데이트 로직
	@RequestMapping(value = "boardUpdate.board", method = RequestMethod.POST)
	public String updateBoard(@ModelAttribute BoardVO bvo) {
		bService.updateBoard(bvo);
		return "redirect:qnaList.board";
	}

	// 댓글
	@RequestMapping(value = "insertComment.board", method = RequestMethod.POST)
	public String insertComment(@ModelAttribute ReplyVO rvo, HttpSession session) {
		String mem_id = (String) session.getAttribute("mem_id");

		rvo.setReply_sub(mem_id);
		bService.insertComment(rvo);
		int board_no = rvo.getBoard_no();
		return "redirect:qnaInfo.board?board_no=" + board_no+"&mem_id="+mem_id;
	}

	// 공지 리스트 조회
	@RequestMapping(value = "commentList.board", method = RequestMethod.GET)
	@ResponseBody
	public List<ReplyVO> commentList(HttpServletRequest request) {
		int board_no = Integer.parseInt(request.getParameter("board_no"));

		List<ReplyVO> list = bService.selectComment(board_no);
		return list;
	}

	@RequestMapping(value = "deleteReply.board", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, String> deleteReply(HttpServletRequest request) {
		int reply_no = Integer.parseInt(request.getParameter("reply_no"));

		int result = bService.deleteReply(reply_no);

		HashMap<String, String> resultMap = new HashMap<String, String>();
		if (result == 1) {
			resultMap.put("resultCode", "1");
			resultMap.put("resultMSG", "성공했습니다");
		} else {
			resultMap.put("resultCode", "0");
			resultMap.put("resultMSG", "실패했습니다");
		}

		return resultMap;
	}

	// 마이 페이지 QnA 리스트 조회
	@GetMapping("myBoardList.board")
	public String myBoardList(PagingVO vo, Model model, HttpSession session,
			@RequestParam(value = "nowPage", required = false) String nowPage) {
		String mem_id = (String) session.getAttribute("mem_id");
		int total = bService.countMyQnA(mem_id);
		if (nowPage == null) {
			nowPage = "1";
		}
		
		vo = new PagingVO(total, Integer.parseInt(nowPage));
		model.addAttribute("paging", vo);
		vo.setMem_id(mem_id);
		List<BoardVO> list=bService.selectMyBoardList(vo);
		
	
		// 답글 카운트
		for (BoardVO bvo : list) {
			bvo.setReplyCount(bService.countReply(bvo.getBoard_no()));
		}
		model.addAttribute("viewAll",list);
		return "myboard_list";
	}
}
