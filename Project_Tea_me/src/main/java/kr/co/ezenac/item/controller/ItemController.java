package kr.co.ezenac.item.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Controller
public class ItemController {
	
	@RequestMapping(value="/test.item", method = RequestMethod.GET)
	public String text(Locale locale,Model model) {
		
		String txt="프로젝트 안망하게 해주세요";
		model.addAttribute("txt",txt);
		
		return "/item";
	}
	
}
