package kr.co.ezenac.members.model.service;

import kr.co.ezenac.members.model.dao.MemberDAO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service("memberService")
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

    private SqlSessionTemplate sqlSessionTemplate;
    private MemberDAO mDAO;
}
