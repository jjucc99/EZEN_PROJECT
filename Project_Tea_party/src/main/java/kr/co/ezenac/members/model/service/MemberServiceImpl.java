package kr.co.ezenac.members.model.service;

import kr.co.ezenac.members.model.dao.MemberDAO;
import kr.co.ezenac.members.model.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Autowired
    private MemberDAO mDAO;

    @Override
    public int insertMember(MemberVO mvo) {
        System.out.println("MemberServiceImpl.insertMember" + mvo);
        BCryptPasswordEncoder encoder =new BCryptPasswordEncoder();
        String pwd = mvo.getMem_pwd();
        System.out.println(pwd);
        String securePwd=encoder.encode(pwd);
        mvo.setMem_pwd(securePwd);
        return mDAO.insertMember(sqlSession, mvo);
    }

    @Override
    public MemberVO selectMember(String mem_id) {
     return mDAO.selectMember(sqlSession, mem_id);
    }

    @Override
    public int deleteMember(String mem_id) {
        System.out.println(" MemberServiceImpl 여기 왔음!");
        return mDAO.deleteMember(sqlSession, mem_id);
    }

    @Override
    public int updateMember(MemberVO memberVO) {
        return mDAO.updateMember(sqlSession, memberVO);
    }
}
