package kr.co.ezenac.members.controller;

import kr.co.ezenac.members.model.service.MemberService;
import kr.co.ezenac.members.model.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Locale;

@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;

    @GetMapping("test.me")
    public String text(Model model){

        return "test";
    }

    @PostMapping("test.me")
    public String pass(){
        MemberVO memberVO = new MemberVO();

        String mem_id = "5";
        String mem_pwd = "1234";
        String mem_name = "ji";
        String mem_addr1 = "강원도";
        String mem_addr2 = "원주시";
        String mem_addr3 = "문막읍";
        String mem_phone = "010-4245-5712";
        String mem_email = "jjucc99@naver.com";
        char mem_check = '0';
        char mem_delete= 'x';
        char mem_admin = 'x';

        memberVO.setMemberVO(mem_id,
                mem_pwd,
                mem_name,
                mem_addr1,
                mem_addr2,
                mem_addr3,
                mem_phone,
                mem_email,
                mem_check,
                mem_delete,
                mem_admin);

        System.out.println("MemberController" + memberVO);

        memberService.insertMember(memberVO);

        return "test";
    }
}
