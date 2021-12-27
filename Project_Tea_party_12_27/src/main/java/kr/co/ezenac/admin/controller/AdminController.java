package kr.co.ezenac.admin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import kr.co.ezenac.admin.model.service.AdminService;
import kr.co.ezenac.admin.model.vo.BoardVO;
import kr.co.ezenac.admin.model.vo.ImagesVO;
import kr.co.ezenac.admin.model.vo.ItemVO;
import kr.co.ezenac.admin.model.vo.MemberVO;
import kr.co.ezenac.admin.model.vo.OrderVO;
import kr.co.ezenac.admin.model.vo.Order_listVO;
import kr.co.ezenac.admin.model.vo.PagingVO;
import kr.co.ezenac.pay.model.vo.CartListVO;

@Controller
public class AdminController {
	@Autowired
	private AdminService adService;

	@Resource(name = "uploadPath")
	String uploadPath;

	// 관리자 전체 홈
	@RequestMapping(value = "admin.ad", method = RequestMethod.GET)
	public String home() {
		return "admin_home";
	}

	// -----------------------상품----------------------------
	// 이미지 경로 가져오기
	public String getItemImage(int item_code) {
		String fileName = adService.getImg(item_code);
		return uploadPath + "/items/" + fileName;
	}

	// 아이템 추가
	@RequestMapping(value = "addItemForm.ad", method = RequestMethod.GET)
	public String addItemform() {
		return "admin_Item/item_add_admin_form";
	}

	// 아이템 추가 로직
	@RequestMapping(value = "addItem.ad", method = RequestMethod.POST)
	public String insertItem(@ModelAttribute ItemVO ivo, MultipartFile image) {
		ImagesVO imageVO = new ImagesVO();

		String image_name = image.getOriginalFilename();

		File target = new File(uploadPath + "/items", image_name);

		// 경로 생성
		if (!new File(uploadPath + "/items").exists()) {
			new File(uploadPath + "/items").mkdirs();
		}
		// 파일 복사
		try {
			FileCopyUtils.copy(image.getBytes(), target);
		} catch (Exception e) {
			e.printStackTrace();
		}

		imageVO.setOrd_item_no(1);
		imageVO.setImg_name(image_name);
		imageVO.setImg_save(uploadPath + "/items");
		imageVO.setImg_ref("item");
		imageVO.setImg_id(ivo.getItem_code());

		adService.insertItem(ivo);
		int result = adService.insertImage(imageVO);
		return "redirect:itemList.ad";
	}

	// 아이템 정보 로직
	@RequestMapping(value = "itemInfo.ad", method = RequestMethod.GET)
	public ModelAndView selectOne(int item_code) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin_Item/item_info");
		ItemVO ivo = adService.selectOneItem(item_code);
		String img_path = getItemImage(item_code);
		ivo.setImg_path(img_path);
		mv.addObject("item", ivo);

		return mv;
	}

	// 상품 리스트
	@GetMapping("itemList.ad")
	public String itemList(PagingVO vo, Model model, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		int total = adService.countItem();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", adService.selectItem(vo));
		return "admin_Item/item_list";
	}

	// 아이템 삭제 로직
	@RequestMapping(value = "itemDelete.ad", method = RequestMethod.GET)
	public String deleteItem(int item_code) {
		int result = adService.deleteItem(item_code);
		System.out.println("삭제 결과" + result);
		return "redirect:itemList.ad";
	}

	// 아이템 업데이트 로직
	@RequestMapping(value = "itemUpdate.ad", method = RequestMethod.POST)
	public String updateItem(@ModelAttribute ItemVO ivo) {
		System.out.println(ivo.getItem_code());
		System.out.println(ivo.getItem_name());
		adService.updateItem(ivo);

		return "redirect:itemList.ad";
	}

	// -------관리자 회원 관리----------------
	// 회원 리스트 페이징
	@GetMapping("memberList.ad")
	public String memberList(PagingVO vo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		int total = adService.countMember();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", adService.selectMember(vo));
		return "admin_member/member_list";
	}

	// 탈퇴 회원 리스트 페이징
	@GetMapping("outMemberList.ad")
	public String outMemberList(PagingVO vo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		int total = adService.countOutMember();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", adService.selectOutMember(vo));
		return "admin_member/out_member_list";
	}

	// 회원 복구 or 탈퇴
	@RequestMapping(value = "memberDelete.ad", method = RequestMethod.POST)
	public String deleteMember(@ModelAttribute MemberVO mvo) {
		char mem_delete = mvo.getMem_delete();
		if (mem_delete == 'N') {
			char delete = 'Y';
			mvo.setMem_delete(delete);
			adService.updateMember(mvo);
			return "redirect:memberList.ad";
		} else {
			char delete = 'N';
			mvo.setMem_delete(delete);
			adService.updateMember(mvo);
			return "redirect:outMemberList.ad";
		}
	}

	// -------------주문내역----------------------
	@GetMapping("orderList.ad")
	public String orderList(PagingVO vo, Model model, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		int total = adService.countOrder();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		List<OrderVO> list1 = adService.selectOrder(vo);

		for (OrderVO ordvo : list1) {
			int ord_no = ordvo.getOrd_no();
			List<String> list2 = adService.selectName(ord_no);
			int order_item_count = list2.size() - 1;
			String item_name = list2.get(0);
//			System.out.println("order_item_count"+order_item_count);
//			System.out.println("item_name"+item_name);
			ordvo.setItem_name(item_name);
			ordvo.setOrder_item_count(order_item_count);
		}

		model.addAttribute("viewAll", list1);//
		return "admin_order/order_list";
	}

	// 배송상태 변경
	@RequestMapping(value = "deliveryStatus.ad", method = RequestMethod.POST)
	public String deliveryStatus(int ord_no) {
		adService.updateDeliveryStatus(ord_no);
		return "redirect:orderList.ad";
	}

	// 주문상태 변경
	@RequestMapping(value = "orderStatus.ad", method = RequestMethod.POST)
	public String orderStatus(int ord_no) {
		adService.updateOrderStatus(ord_no);
		return "redirect:orderList.ad";
	}

	// 주문 디테일
	@RequestMapping(value = "orderDetail.ad", method = RequestMethod.GET)
	public String orderDetail(int ord_no, Model m) {
		Order_listVO olvo = adService.selectOneOrder(ord_no);
		List<OrderVO> ovo = adService.selectOrderDetail(ord_no);
		int total = 0;
		for (OrderVO list : ovo) {
			total += list.getItem_price() * list.getOrder_item_count();
		}
		m.addAttribute("orderList", olvo);
		m.addAttribute("orderDetail", ovo);
		m.addAttribute("total", total);

		return "admin_order/order_detail";
	}

	// ----------------------게시판 관리----------------
	// 운영자 게시판 관리
	@GetMapping("boardList.ad")
	public String BoardList(PagingVO vo, Model model, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		int total = adService.countNotice();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", adService.selectNotice(vo));
		return "admin_board/notice_list";
	}

	// 게시판 정보 로직
	@RequestMapping(value = "boardInfo.ad", method = RequestMethod.GET)
	public ModelAndView selectOneBoard(int board_no) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin_board/board_info");
		BoardVO bvo = adService.selectOneBoard(board_no);
		mv.addObject("board", bvo);

		return mv;
	}

	// 게시글 삭제 로직
	@RequestMapping(value = "boardDelete.ad", method = RequestMethod.POST)
	public String deleteBoard(int board_no) {
		int result = adService.deleteBoard(board_no);
		return "redirect:boardList.ad";
	}

	// 게시글 업데이트 로직
	@RequestMapping(value = "boardUpdate.ad", method = RequestMethod.POST)
	public String updateBoard(@ModelAttribute BoardVO bvo) {
		adService.updateBoard(bvo);
		return "redirect:boardList.ad";
	}

	// 공지추가
	@RequestMapping(value = "addBoardForm.ad", method = RequestMethod.GET)
	public String addBoardform() {
		return "admin_board/board_insert";
	}

	// 게시글(공지) 추가 로직
	@RequestMapping(value = "boardInsert.ad", method = RequestMethod.POST)
	public String insertBoard(@ModelAttribute BoardVO bvo) {
		adService.insertBoard(bvo);
		return "redirect:boardList.ad";
	}
}
