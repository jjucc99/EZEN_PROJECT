package kr.co.ezenac.admin.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ezenac.admin.model.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminService adService;
	
	@RequestMapping(value = "addItem.ad", method = RequestMethod.GET)
	public String text(Locale locale, Model model) {
		
		String txt="프로젝트 안 망하게 해주세요";
		model.addAttribute("txt", txt );
		
		return "/test";
	}
}
