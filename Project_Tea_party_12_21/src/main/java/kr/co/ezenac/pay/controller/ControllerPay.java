package kr.co.ezenac.pay.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.ezenac.pay.model.service.PayService;
import kr.co.ezenac.pay.model.vo.CartListVO;
import kr.co.ezenac.pay.model.vo.CartUpdateVO;

@Controller
public class ControllerPay {
	
	@Autowired
	private PayService service;
	
	@Resource(name="uploadPath")
		String uploadPath;
	
	//이미지 경로 가져오기
	public String getimage(int item_code) {
		String fileName=service.getImg(item_code);
		return uploadPath+"/items/"+fileName;
		}// C:\images /items/ sos.jpg
	
	//장바구니 주문내역 보기
	@RequestMapping(value="cart.pay", method=RequestMethod.GET)
	public String listPay(HttpSession session, Model model) {
		String mem_id= (String)session.getAttribute("mem_id");
		
		List<CartListVO> list=service.cartList(mem_id);

		//이미지 경로지정
		 for(CartListVO vo: list) {
			 int item_code=vo.getItem_code();
			 String path=getimage(item_code);
			 vo.setImgPath(path);
			 
		//합계 계산	 
			 int amount=vo.getCart_amount();
			 int price=vo.getItem_price();
			 int sum=amount*price;
			 vo.setSum(sum);
			 }
		 
		model.addAttribute("cartList",list);
		
		return "cartList";
	}
	
	//장바구니 수량 수정
	@RequestMapping(value="cartUpdate.pay", method =RequestMethod.POST)
	public String cartUpdate(@RequestParam int cart_amount ,@RequestParam int cart_item_no){

		CartUpdateVO cuvo=new CartUpdateVO();
		cuvo.setCart_amount(cart_amount);
		cuvo.setCart_item_no(cart_item_no);

		service.cartUpdate(cuvo);
		return "redirect:/cart.pay";
	}
	
	@RequestMapping(value="cartDelete.pay", method=RequestMethod.POST)
	public String cartDelete(@RequestParam int cart_item_no) {
		service.cartDelete(cart_item_no);
		return "redirect:/cart.pay";
	}
}