package kr.co.ezenac;

import kr.co.ezenac.members.model.service.MemberService;
import kr.co.ezenac.members.model.vo.LoginVO;
import kr.co.ezenac.members.model.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
    public String Home() throws Exception {
        return "main/index";
    }
   
    @GetMapping("/mypage")
    public String myPage(){
        return "main/myPage";
    }

    

    @GetMapping("/login")
    public String login(@CookieValue(value = "REMEMBER", required = false) Cookie rememberCookie, Model model) throws Exception {

        //쿠키에 값이 있을 경우 값을 아이디에 값을 세팅
        if (rememberCookie != null) {
            String rememberedId = rememberCookie.getValue();
            model.addAttribute("rememberedId", rememberedId);
        }

        return "main/login";
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
            char mem_delete = member.getMem_delete();
            // 복호화 비교
            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
            
            
            // 로그인이 성공했을 때.
            if (encoder.matches(pw, mem_pwd) && mem_id.equals(id)) {
                session.setAttribute("checkLogin", "success");
                session.setAttribute("mem_id", mem_id);
                session.setAttribute("checkAdmin", mem_admin);
                session.setAttribute("checkMember", mem_delete);

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

                return "redirect:/main";
            }
            // 로그인이 실패했을 때
            else {
                session.setAttribute("checkLogin", "fail");
                System.out.println("mem_id " + mem_id + "mem_pwd" + mem_pwd);
                System.out.println("id " + id + "password" + pw);

                return "/main/login";
            }
        } catch (Exception exception) {
            String message = exception.getMessage();
            System.out.println("오류가 났습니다.");
            System.out.println(message);
        }
        return "";
    }

    @GetMapping("/join")
    public String join() {
        return "main/join";
    }


    /*
        1. 아이디 중복 체크 => 나중에 자바스크립트로 만들기!
        2. 비밀번호 확인 => 자바스크립트로 만들기!
        3. 주소 API를 통한 주소 찾기.
     */
    // @PostMapping 는 ==  @ResponseBody 와 같은 역할을 한다.
    /*
        두개를 동시에 쓰는 이유는 페이지 이동을 안하고 필요한 데이터만 받아야 하는 경우인데요.
        이런 경우에는 컨트롤러에 @ResponseBody를 붙여 ajax를 이용해 jsp페이지와 model데이터가
        아닌 필요한 데이터만을 받아오면 됩니다.
     */
    // RequestBody => ajax 값 전체
    // 받는 것에 따라
    @PostMapping("/checkId")
    @ResponseBody
    public String checkId(@RequestBody String id) {
        MemberVO searchMember = memberService.selectMember(id);

        String check = "";
        if (searchMember != null){
            check = "N";
        }

        System.out.println(check);
        return check;
    }

    @PostMapping("/join")
    public String joinForm(MemberVO memberVO) throws Exception {
        memberVO.setMem_delete('N');
        memberVO.setMem_admin('N');

        memberService.insertMember(memberVO);

        return "redirect:/";
    }

    @GetMapping("/checkMember")
    public String checkMemberId(){
        return "main/checkMember";
    }

    @PostMapping("/checkMember")
    public String checkMember(@RequestParam("mem_id") String mem_id, Model model){
        System.out.println("checkMember" + mem_id);
        MemberVO member = memberService.selectMember(mem_id);
        if (member == null){
            return "main/backToTheHome";
        }else {
            model.addAttribute("member", member);
            return "main/checkUpdate";
        }
    }
    
    @GetMapping("/profile/{mem_id}")
    public String profile(@PathVariable("mem_id")String mem_Id, Model model){
        MemberVO memberVO = memberService.selectMember(mem_Id);
        model.addAttribute("memberVO", memberVO);

        return "main/profile";
    }
    
    @PostMapping("/update")
    public String updateMember(MemberVO memberVO){
        //아이디는 리드 온리 해놓고 비밀번호만 2번 쓰게 만들기
        memberService.updateMember(memberVO);
        return "redirect:/mypage";
    }
}
