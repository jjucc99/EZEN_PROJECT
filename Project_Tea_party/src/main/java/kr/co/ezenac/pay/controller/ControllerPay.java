package kr.co.ezenac.pay.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ezenac.members.model.vo.MemberVO;
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

		int total=0;
		
		 for(CartListVO vo: list) {
			//이미지 경로지정
			 int item_code=vo.getItem_code();
			 String path=getimage(item_code);
			 vo.setImgPath(path);
			 
			 //총합 계산
			 if(vo.getCart_amount()<=vo.getItem_count()) {
				 total+=vo.getCart_amount()*vo.getItem_price();
			 }
			 }
		 
		model.addAttribute("cartList",list);
		model.addAttribute("total", total);
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
	
	//상품삭제
	@RequestMapping(value="cartDelete.pay", method=RequestMethod.POST)
	@ResponseBody
	public String cartDelete(@RequestBody Map<String, String> map) {
		int cart_item_no = Integer.parseInt(map.get("key"));
		service.cartDelete(cart_item_no);
		return "cart.pay";
	}
	
	
	//상품주문
	@RequestMapping(value="goOrder.pay", method=RequestMethod.POST)
	public String goOrder(HttpSession session, @RequestParam List<Integer> orderList,Model model) {
		String mem_id= (String)session.getAttribute("mem_id");
		
		//체크된 상품만 리스트 등록
		List<CartListVO> list=service.orderList(orderList);
		
		int total=0;
		
		 for(CartListVO vo: list) {
			//이미지 경로지정
			 int item_code=vo.getItem_code();
			 String path=getimage(item_code);
			 vo.setImgPath(path);
			 
			 //총합 계산
			 if(vo.getCart_amount()<=vo.getItem_count()) {
				 total+=vo.getCart_amount()*vo.getItem_price();
			 }
		}
		
		 //주문자 정보 넘기기
		 MemberVO mvo;
		 
		model.addAttribute("total", total);
		model.addAttribute("orderList",list);
		return "order";
	}
	
	@RequestMapping(value = "pay.pay", method = RequestMethod.POST)
	public String payment() {
		
		return null;
	}
}