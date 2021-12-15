package kr.co.ezenac.members.servce;

import kr.co.ezenac.members.model.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service("MemberService")
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

    private SqlSessionTemplate sqlSession;
    private MemberVO memberVO;
}
