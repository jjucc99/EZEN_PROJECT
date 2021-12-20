package kr.co.ezenac;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String Home(HttpSession session){
    	session.setAttribute("mem_id", "oracle");
        return "mainHome";
    }
}
