package kr.co.ezenac.board.model.service;

import kr.co.ezenac.board.model.vo.ReplyVO;

public interface ReplyService {

	int insertReply(ReplyVO replyvo);
	ReplyVO selectReply(int reply_no);

}
