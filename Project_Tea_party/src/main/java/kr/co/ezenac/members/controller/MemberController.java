package kr.co.ezenac.members.controller;

import kr.co.ezenac.members.model.service.MemberService;
import kr.co.ezenac.members.model.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;

    @GetMapping("/members.me")
    public String text(Model model) {

        return "home";
    }

    @GetMapping("insert.me")
    public String insertHome(){
        return "insert";
    }

    @PostMapping("insert.me")
    public String insert(MemberVO memberVO) {
        memberVO.setMem_check('N');
        memberVO.setMem_delete('N');
        memberVO.setMem_admin('N');
        memberService.insertMember(memberVO);

        return "home";
    }


    @GetMapping("select.me")
    public String selectHome(){
        return "select";
    }

    @PostMapping("select.me")
    public String select(MemberVO memberVO, Model model){
        MemberVO member = memberService.selectMember(memberVO.getMem_id());
        model.addAttribute("member", member);

        return "selectHome";
    }

    @GetMapping("delete.me")
    public String deleteHome(){
        return "delete";
    }

    @PostMapping("delete.me")
    public String delete(MemberVO memberVO){

        int result = memberService.deleteMember(memberVO.getMem_id());
        return "home";
    }

    @GetMapping("update.me")
    public String update(){
        return "update";
    }
    
    @PostMapping("update_find.me")
    public String update_find(MemberVO memberVO, Model model){
        MemberVO member = memberService.selectMember(memberVO.getMem_id());
        model.addAttribute("member", member);

        return "updateHome";
    }

    @PostMapping("update.me")
    public  String update(MemberVO memberVO){
        memberService.updateMember(memberVO);
        return "home";
    }
}
