package kr.co.ezenac.members.model.service;

import kr.co.ezenac.members.model.vo.MemberVO;

public interface MemberService {
    int insertMember(MemberVO member);
    MemberVO selectMember(String mem_id);
    int deleteMember(String mem_id);
    int updateMember(MemberVO memberVO);
}
