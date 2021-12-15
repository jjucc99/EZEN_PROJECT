package kr.co.ezenac.members.model.service;

import kr.co.ezenac.members.model.dao.MemberDAO;
import kr.co.ezenac.members.model.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    @Autowired
    private MemberDAO mDAO;

    @Override
    public int insertMember(MemberVO member) {
        System.out.println("MemberServiceImpl.insertMember" + member);
        return mDAO.insertMember(sqlSessionTemplate, member);
    }
}
