package kr.co.ezenac.board.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ezenac.board.model.dao.ReplyDAO;
import kr.co.ezenac.board.model.vo.BoardVO;
import kr.co.ezenac.board.model.vo.PagingVO;
import kr.co.ezenac.board.model.vo.ReplyVO;

	@Service("ReplyService")
	public class ReplyServiceImp implements ReplyService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ReplyDAO rDAO;

	@Override
	public int insertReply(ReplyVO replyvo) {
		System.out.println(replyvo.getReply_no());
		System.out.println(replyvo.getReply_sub());
		System.out.println(replyvo.getReply_content());
		System.out.println(replyvo.getReply_date());
		System.out.println(replyvo.getReply_board());
		System.out.println(replyvo.getBoard_no());
		return rDAO.insertReply(sqlSession, replyvo);
		
	}
	
	@Override
	public ReplyVO selectReply(int Reply_no) {
		return rDAO.selectReply(sqlSession, Reply_no);
	}
}
