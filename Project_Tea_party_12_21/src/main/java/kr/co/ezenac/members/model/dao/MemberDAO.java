package kr.co.ezenac.members.model.dao;

import kr.co.ezenac.members.model.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("mDAO")
public class MemberDAO {

    public int insertMember(SqlSessionTemplate sqlSession, MemberVO memberVO) {
        String mem_id = memberVO.getMem_id();
        int check = 0;


        int insertMember = sqlSession.insert("memberMapper.insertMember", memberVO);
        int insertMemberCart = sqlSession.insert("memberMapper.insertMemberCart", mem_id);
        if(insertMemberCart + insertMember == 2) {
            check = 1;
        }else {
            check = 0;
        }
        return check;
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
