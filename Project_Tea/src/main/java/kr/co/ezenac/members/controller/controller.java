package kr.co.ezenac.members.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class controller {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String text(Locale locale, Model model) {
		
		String txt="프로젝트 안 망하게 해주세요";
		model.addAttribute("txt", txt );
		
		return "/members/test";
	}
}