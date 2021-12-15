package kr.co.ezenac.pay.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ezenac.pay.model.service.PayService;

@Controller
public class PayController {

	//@Autowired
	//private PayService payService;
	
	@RequestMapping(value = "test.pay", method = RequestMethod.GET)
	public String text(Locale locale, Model model) {
		
		String txt="프로젝트 안 망하게 해주세요";
		model.addAttribute("txt", txt );
		
		return "pay";
	}
}
