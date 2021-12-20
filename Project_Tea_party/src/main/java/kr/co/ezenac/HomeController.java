package kr.co.ezenac;

import kr.co.ezenac.members.model.service.MemberService;
import kr.co.ezenac.members.model.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController {

    @Autowired
    MemberService memberService;

    @GetMapping("/")
    public String Home() {

        return "mainHome";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "mainHome";
    }

    @PostMapping("/login")
    public String loginForm(HttpSession session, @ModelAttribute("id") String id,
                            @ModelAttribute("password") String password) {
        try {
            MemberVO member = memberService.selectMember(id);
            String mem_id = member.getMem_id();
            String mem_pwd = member.getMem_pwd();
            char mem_admin = member.getMem_admin();

            // 로그인이 성공했을 때.
            if (mem_pwd.equals(password) && mem_id.equals(id)) {
                session.setAttribute("checkLogin", "success");
                session.setAttribute("mem_id", mem_id);
                session.setAttribute("checkAdmin", mem_admin);

                // 로그인이 실패했을 때
            } else {
                session.setAttribute("checkLogin", "fail");
                System.out.println("mem_id " + mem_id + "mem_pwd" + mem_pwd);
                System.out.println("id " + id + "password" + password);

            }

        } catch (Exception exception) {
            String message = exception.getMessage();
            System.out.println("오류가 났습니다.");
            System.out.println(message);
        }
        return "mainHome";
    }
}
