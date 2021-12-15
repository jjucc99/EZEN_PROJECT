package kr.co.ezenac.members.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Locale;

@Controller
public class MemberController {

    @RequestMapping(value = "test.me", method = RequestMethod.GET)
    public String text(Locale locale, Model model) {

        String txt="프로젝트 안 망하게 해주세요";
        model.addAttribute("txt", txt );

        return "test";
    }
}
