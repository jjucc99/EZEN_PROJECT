package kr.co.ezenac.pay.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ezenac.members.model.vo.MemberVO;
import kr.co.ezenac.pay.model.service.PayService;
import kr.co.ezenac.pay.model.vo.CartListVO;
import kr.co.ezenac.pay.model.vo.CartUpdateVO;
import kr.co.ezenac.pay.model.vo.Order_listVO;
import kr.co.ezenac.pay.model.vo.PayVO;
import kr.co.ezenac.pay.model.vo.SubOrderVO;

@Controller
public class PayController {
	
	@Autowired
	private PayService service;
	
	@Resource(name="uploadPath")
		String uploadPath;

	//결제 성공여부 체크용
	private int i=0;
	public int getI() {
		return i;
	}

	public void setI(int i) {
		this.i = i;
	}

	//이미지 경로 가져오기
	public String getimage(int item_code) {
		String fileName=service.getImg(item_code);
		return uploadPath+"/items/"+fileName;
		}// C:\images /items/ sos.jpg
		
	//장바구니 리스트 보기
	@RequestMapping(value="cart.pay", method=RequestMethod.GET)
	public String listPay(HttpSession session, Model model){
		
		//결제 실패 시 장바구니로 돌아옴
		if(getI()==2) {
			model.addAttribute("checkI", getI());
			setI(0);
		}
		
		String mem_id= (String)session.getAttribute("mem_id");
				
		List<CartListVO> list=service.cartList(mem_id);
		int total=0;
		
		 for(CartListVO vo: list) {
			//이미지 경로지정
			 int item_code=vo.getItem_code();
			 String path=getimage(item_code);
			 vo.setImgPath(path);
			 
			 //합계 계산
			 int sum= vo.getCart_amount()*vo.getItem_price();
			 vo.setSum(sum);
			 
			//총합 계산
			 total+=sum;
			 }
		model.addAttribute("total", total);
		model.addAttribute("cartList",list);
		return "cartList";
	}
	
	//장바구니 수량 수정
	@RequestMapping(value="cartUpdate.pay", method =RequestMethod.POST)
	@ResponseBody
	public String cartUpdate(@RequestBody Map<String, String> map){

		int cart_item_no=Integer.parseInt(map.get("cart_item_no"));
		int cart_amount=Integer.parseInt(map.get("cart_amount"));		
		
		CartUpdateVO cuvo=new CartUpdateVO();
		cuvo.setCart_amount(cart_amount);
		cuvo.setCart_item_no(cart_item_no);

		service.cartUpdate(cuvo);
		return "cart.pay";
	}
	
	//장바구니 상품 삭제
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
			 
			//합계 계산
			 int sum= vo.getCart_amount()*vo.getItem_price();
			 vo.setSum(sum);
			 
			 //총합 계산
				 total+=sum;
		}
		
		 model.addAttribute("total", total);
		model.addAttribute("orderList",list);
		
		//주문자 정보 가져오기
		 MemberVO mvo=service.getMember(mem_id);
		 model.addAttribute("mem_name", mvo.getMem_name());
		 model.addAttribute("mem_addr1", mvo.getMem_addr1());
		 model.addAttribute("mem_addr2", mvo.getMem_addr2());
		 model.addAttribute("mem_addr3", mvo.getMem_addr3());
		 model.addAttribute("mem_phone", mvo.getMem_phone());
		 
		return "pay";
	}
	
	//결제 주문 처리
	@RequestMapping(value = "pay.pay", method = RequestMethod.POST)
	public String payment(HttpSession session, @RequestParam List<Integer> payList, @ModelAttribute PayVO pvo){
		
		String mem_id= (String)session.getAttribute("mem_id");
		pvo.setMem_id(mem_id);
		
		//Order_List에 저장하고 ord_no가져오기
		int ord_no=service.insertOrderList(pvo);
		
		//order_item에 저장 및 cart_item 삭제
		int Ok=service.insertOrderItem(payList,ord_no);
		
		//성공 여부에 따라 페이지 이동
		String url="redirect:cart.pay";
		if(Ok==1) {
		url="redirect:orderList.pay";
		setI(1);
		}else {
			setI(2);
		}
		return url;
	}
	
	//주문내역 가져오기
	@RequestMapping(value = "orderList.pay", method=RequestMethod.GET)
	public String orderList(HttpSession session, Model model) {
		
		//결제페이지에서 성공적으로 넘어왔을 때
		if(getI()==1) {
			model.addAttribute("checkI", getI());
		setI(0);
		}
		
		String mem_id= (String)session.getAttribute("mem_id");		
		//구매내역 가져오기
		List<Order_listVO> orderList=service.selectOrder(mem_id);
		
		//대표 이미지 저장하기
		for(Order_listVO ordvo: orderList) {
			int item_code=Integer.parseInt(ordvo.getImgPath());//현재 아이템 코드
			 String path=getimage(item_code);
			 ordvo.setImgPath(path);
		}
		
		model.addAttribute("orderList",orderList);
		return "myOrder";
	}
	
	//주문상태 변경
	@RequestMapping(value="changeStatus.pay", method=RequestMethod.POST)
	@ResponseBody
	public String changeStatus(@RequestBody Map<String, String> map) {
		int ord_no = Integer.parseInt(map.get("no"));
		String ord_status=map.get("ord_status");
		
		Order_listVO ovo=new Order_listVO();
		ovo.setOrd_no(ord_no);
		ovo.setOrd_status(ord_status);
		
		service.changeStatus(ovo);
		
		return "orderList.pay";
	}
	
	@RequestMapping(value="orderItem.pay", method=RequestMethod.GET)
	public String orderItem(HttpSession session, @RequestParam int ord_no, Model model) {
/*
* CartListVO 이용: cart_item_no=상세주문번호, item_name=이름 cart_amount=수량, item_price=가격,
* , item_code=상품코드(검색용) imgPath=이미지,sum=합계
* ->Order_item, item을 join해서 ord_no으로 검색
*/
		List<CartListVO> ordItemList=service.orderItemList(ord_no);
		for(CartListVO vo: ordItemList) {
			//이미지 저장
			int item_code=vo.getItem_code();
			String imgPath=getimage(item_code);
			vo.setImgPath(imgPath);
			
			//합계 저장
			int sum=vo.getCart_amount()*vo.getItem_price();
			vo.setSum(sum);
		}
		model.addAttribute("ordItemList", ordItemList);
		
		/*
		 * PayVO 이용: ord_price=총 금액, ord~=배송지 정보, pay_method=결제수단, ord_status=주문상태,
		 * ->order_List를 Pay와 join해서 ord_no로 검색
		 */
		PayVO ordInfo=service.getOrdInfo(ord_no);
		model.addAttribute("ordInfo", ordInfo);
		model.addAttribute("ord_no",ord_no);
		
		return "orderItemList";
	}
	
	@RequestMapping(value="checkReview.pay", method=RequestMethod.POST)
	@ResponseBody
	public String checkReview(HttpSession session,@RequestBody Map<String, String> map) {
		String mem_id= (String)session.getAttribute("mem_id");
		int item_code=Integer.parseInt(map.get("code"));
		
		SubOrderVO subvo=new SubOrderVO();
		subvo.setStr(mem_id); subvo.setNum(item_code);
		
		int reviewCount=service.checkReview(subvo);
		
		String result="no";
		if(reviewCount!=0) {
			result="yes";
		}
		
		return result;
	}
	
}
