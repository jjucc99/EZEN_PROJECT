package kr.co.ezenac.board.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.ezenac.board.model.vo.ReplyVO;

@Repository("rDAO")
public class ReplyDAO {


	public int insertReply(SqlSessionTemplate sqlSession, ReplyVO replyvo) {
		System.out.println(replyvo.getReply_no());
		System.out.println(replyvo.getReply_sub());
		System.out.println(replyvo.getReply_content());
		System.out.println(replyvo.getReply_date());
		System.out.println(replyvo.getReply_board());
		System.out.println(replyvo.getBoard_no());
		return sqlSession.insert("replyMapper.insertReply",replyvo);
		
	}
	
	
	public ReplyVO selectReply(SqlSessionTemplate sqlSession, int reply_no) {
	ReplyVO replyvo=sqlSession.selectOne("replyMapper.selectReply", reply_no);
	String str=replyvo.getReply_date();
	String result=str.substring(0, str.lastIndexOf(" "));
	replyvo.setReply_date(result);
	return replyvo;
	
	}
	
}
