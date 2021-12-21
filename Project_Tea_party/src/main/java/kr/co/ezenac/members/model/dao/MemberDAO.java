package kr.co.ezenac.members.model.dao;

import kr.co.ezenac.members.model.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("mDAO")
public class MemberDAO {

    public int insertMember(SqlSessionTemplate sqlSession, MemberVO memberVO) {
        return sqlSession.insert("memberMapper.insertMember", memberVO);
    }

    public MemberVO selectMember(SqlSessionTemplate sqlSession, String mem_id) {
        MemberVO memberVO = sqlSession.selectOne("memberMapper.selectOneMembers", mem_id);
        return memberVO;
    }

    public int deleteMember(SqlSessionTemplate sqlSession, String mem_id) {
        return sqlSession.delete("memberMapper.deleteOneMember", mem_id);
    }

    public int updateMember(SqlSessionTemplate sqlSession, MemberVO memberVO) {
        return sqlSession.update("memberMapper.updateOneMember", memberVO);
    }
}
