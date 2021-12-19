package kr.co.ezenac.pay.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.ezenac.pay.model.service.PayService;
import kr.co.ezenac.pay.model.vo.PayVO;

@Controller
public class PayControllert {

	@RequestMapping(value = "hello.pay", method = RequestMethod.GET)
	public String text(Model model) {

		String txt = "프로젝트 안 망하게 해주세요";
		model.addAttribute("txt", txt);

		return "t/insertForm";// form
	}

	@Autowired
	private PayService payService;

	@RequestMapping(value = "insert.pay", method = RequestMethod.POST)
	public String insertPay(@ModelAttribute PayVO pvo) {

		payService.insertPay(pvo);

		return "redirect:/list.pay";
	}

	@RequestMapping(value = "list.pay", method = { RequestMethod.GET }, produces = "application/xml;charset=utf-8")
	public String selectPay(PayVO pvo, Model model) {
		List<PayVO> list = payService.payList();

		model.addAttribute("list", list);
		return "t/listPay";
	}

	@RequestMapping(value = "update.pay", method = RequestMethod.POST)
	public String updatePay(@ModelAttribute PayVO pvo) {
		payService.updatePay(pvo);
		return "redirect:/list.pay";
	}

	@RequestMapping(value = "delete.pay", method = RequestMethod.GET)
	public String deletePay(@RequestParam int pay_no) {
		payService.deletePay(pay_no);
		return "redirect:/list.pay";
	}

	@RequestMapping(value = "selectOne.pay", method = RequestMethod.GET)
	public ModelAndView selectOne(@RequestParam int pay_no) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t/infoPay");
		mav.addObject("selectOne", payService.selectOne(pay_no));

		return mav;
	}
}
