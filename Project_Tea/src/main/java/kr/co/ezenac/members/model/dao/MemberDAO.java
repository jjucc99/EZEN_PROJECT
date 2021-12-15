package kr.co.ezenac.members.model.dao;

import kr.co.ezenac.members.model.vo.MemberVO;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("mDAO")
public class MemberDAO {

    public int insertMember(SqlSessionTemplate sqlSessionTemplate, MemberVO memberVO) {
        System.out.println("MemberDAO.insertMember" + memberVO);
        return sqlSessionTemplate.insert("memberMapper.insertMember", memberVO);
    }
}
