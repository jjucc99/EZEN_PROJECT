package kr.co.ezenac.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.ezenac.board.model.service.ReplyService;
import kr.co.ezenac.board.model.vo.ReplyVO;
@Controller
public class ReplyController {
	@Autowired
	private ReplyService rService;

	//댓글 작성 전
			@RequestMapping(value= "reply1.board", method= RequestMethod.GET)
			public String insert() {
				
				return "reply_write";
			}

	//댓글 작성 후
	@RequestMapping(value= "reply.board", method= RequestMethod.POST )
	public String insertReply(@ModelAttribute ReplyVO replyvo){
		rService.insertReply(replyvo);
		System.out.println(replyvo.getReply_no());
		System.out.println(replyvo.getReply_sub());
		System.out.println(replyvo.getReply_content());
		System.out.println(replyvo.getReply_date());
		System.out.println(replyvo.getReply_board());
		System.out.println(replyvo.getBoard_no());
		return "board_listpage";
}
	
	//답글 조회 전
	@RequestMapping(value= "selectreply1.board", method= RequestMethod.GET)
	public String select() {
		
		return "reply_info";
	}

// 답글 조회 후
@RequestMapping(value="selectreply.board", method=RequestMethod.POST)
public ModelAndView selectBoard(int reply_no) {
ModelAndView mv=new ModelAndView();
mv.setViewName("reply_info");
mv.addObject("reply", rService.selectReply(reply_no));
return mv;
	
}
}
