package kr.co.ezenac;

import kr.co.ezenac.members.model.service.MemberService;
import kr.co.ezenac.members.model.vo.LoginVO;
import kr.co.ezenac.members.model.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class HomeController {

    @Autowired
    MemberService memberService;

    @GetMapping("/")
    public String Home(@CookieValue(value = "REMEMBER", required = false) Cookie rememberCookie, Model model) throws Exception {

        //쿠키에 값이 있을 경우 값을 아이디에 값을 세팅
        if (rememberCookie != null) {
            String rememberedId = rememberCookie.getValue();
            model.addAttribute("rememberedId", rememberedId);
        }

        return "mainHome";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) throws Exception {
        session.invalidate();
        return "redirect:/";
    }

    @PostMapping("/login")
    public String loginForm(LoginVO loginVO,
                            HttpServletResponse response,
                            HttpServletRequest request) throws Exception {

        HttpSession session = request.getSession();
        Cookie[] cookies = request.getCookies();

        try {
            //유저가 입력한 값이 없을 경우
            loginVO.checkInfo();

            String id = loginVO.getId();
            String pw = loginVO.getPw();
            boolean rememberId = loginVO.isRememberId();

            // 찾은 멤버에서 ID와 PW의 값을 찾는다.
            MemberVO member = memberService.selectMember(id);
            String mem_id = member.getMem_id();
            String mem_pwd = member.getMem_pwd();
            char mem_admin = member.getMem_admin();

            // 로그인이 성공했을 때.
            if (mem_pwd.equals(pw) && mem_id.equals(id)) {
                session.setAttribute("checkLogin", "success");
                session.setAttribute("mem_id", mem_id);
                session.setAttribute("checkAdmin", mem_admin);

                //유저가 아이디를 저장하기를 원했을 때.
                Cookie rememberCookie = new Cookie("REMEMBER", loginVO.getId());
                Cookie rememberCheck = new Cookie("CHECKED", "check");

                rememberCookie.setPath("/");
                rememberCheck.setPath("/");
                if (rememberId) {

                    // 30분의 유효시간
                    //아이디를 저장하기를 원했을 때 원했다면 자동으로 checkBox 체크하기
                    rememberCookie.setMaxAge(60 * 60 * 24 * 7);
                    rememberCheck.setMaxAge(60 * 60 * 24 * 7);

                } else {
                    //아닐 경우 쿠키 바로 삭제.
                    rememberCheck.setMaxAge(0);
                    rememberCookie.setMaxAge(0);
                }
                response.addCookie(rememberCheck);
                response.addCookie(rememberCookie);
            }
            // 로그인이 실패했을 때
            else {
                session.setAttribute("checkLogin", "fail");
                System.out.println("mem_id " + mem_id + "mem_pwd" + mem_pwd);
                System.out.println("id " + id + "password" + pw);
            }
        } catch (Exception exception) {
            String message = exception.getMessage();
            System.out.println("오류가 났습니다.");
            System.out.println(message);
        }
        return "redirect:/";
    }

    @GetMapping("/join")
    public String join() {
        return "join";
    }
    /*
        1. 아이디 중복 체크 => 나중에 자바스크립트로 만들기!
        2. 비밀번호 확인 => 자바스크립트로 만들기!
        3. 주소 API를 통한 주소 찾기.
     */

//    @PostMapping("/checkId")
//    @ResponseBody
//    public String check_Id(@RequestParam("inputId") String inputId) {
//        MemberVO member = memberService.selectMember(inputId);
//        String check = "";
//
//        if (!member.getMem_id().equals(null)){
//            check = member.getMem_id();
//        }else{
//            check = "fail";
//        }
//
//        return check;
//    }


    @PostMapping("/join")
    public String joinForm(MemberVO memberVO) throws Exception {
        memberVO.setMem_check('N');
        memberVO.setMem_delete('N');
        memberVO.setMem_admin('N');

        memberService.insertMember(memberVO);

        return "redirect:/";
    }
}
