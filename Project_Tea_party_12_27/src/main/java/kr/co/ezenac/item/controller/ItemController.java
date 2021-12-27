package kr.co.ezenac.item.controller;

import java.io.File;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import kr.co.ezenac.item.model.service.ItemService;
import kr.co.ezenac.item.model.vo.Cart_itemVO;
import kr.co.ezenac.item.model.vo.CateListVO;
import kr.co.ezenac.item.model.vo.ImagesVO;
import kr.co.ezenac.item.model.vo.ItemVO;
import kr.co.ezenac.item.model.vo.PagingVO;
import kr.co.ezenac.item.model.vo.ReviewBoardVO;

@Controller
public class ItemController {
	@Autowired
	private ItemService itemService;

	// images
	@Resource(name = "uploadPath")
	String uploadPath;

	// item 홈
	@RequestMapping(value = "test.item", method = RequestMethod.GET)
	public String text() {
		return "item";
	}

	// item 리스트
	@RequestMapping(value = "list.item", method = RequestMethod.GET)
	public ModelAndView selectList() {
		ModelAndView mv = new ModelAndView();
		List<ItemVO> list = itemService.itemList();

		mv.setViewName("item_List");
		mv.addObject("list", list);

		return mv;
	}

	// 이미지 경로 가져오기
	public String getimg(int item_code) {
		String fileName = itemService.getImg(item_code);

		return uploadPath + "/items/" + fileName;
	}

	// 카테고리
	@RequestMapping(value = "cate.item", method = RequestMethod.GET)
	public String category(String cate_code, Model model) {

		List<CateListVO> list = itemService.cateList(cate_code);
		for (CateListVO cvo : list) {
			int item_code = cvo.getItem_code();
			String path = getimg(item_code);
			cvo.setImgPath(path);
		}

		model.addAttribute("catelist", list);
		return "item_Cate";
	}

	
	// 리뷰이미지 경로 가져오기
		public String getReviewImg(int r_board_no) {
			//System.out.println(r_board_no);
			String fileName = itemService.getReImg(r_board_no);
			return uploadPath + "/reviews/" + fileName;
		}
	// 상품 상세정보
	@RequestMapping(value = "oneItem.item", method = RequestMethod.GET)
	public String selectOneItem(int item_code, Model model, PagingVO vo,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, HttpSession session) {

		ItemVO ivo = itemService.infoItem(item_code);
		String path = getimg(item_code);
		ivo.setImgPath(path);

		// 리뷰

		List<ReviewBoardVO> rlist = itemService.rList(item_code);
		for (ReviewBoardVO rvo : rlist) {
			int reV = rvo.getR_board_no();
			String reviewPath = getReviewImg(reV);
			//System.out.println(reviewPath);
			
			rvo.setImgPath(reviewPath);
		}
		System.out.println(rlist);
		int total = itemService.countReview();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		model.addAttribute("catelist", ivo);
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", rlist);
		return "item_Info";
	}

	@RequestMapping(value = "insertCart.item", method = RequestMethod.GET)
	public String cart(HttpSession session, @ModelAttribute Cart_itemVO cvo) {
		// 멤버 아이디 세션에서 가져오기
		// 멤버 아이디와 상품코드와 상품수량을 가지고 넘어왔다.
		int item_code = cvo.getItem_code();
		String mem_id = (String) session.getAttribute("mem_id");

		int cartno = itemService.cartno(mem_id);
		// 회원의 단 하나의 장바구니를 가져와서

		cvo.setCart_no(cartno);
		// 장바구니에 상품과 코드와 수량을 넘겨

		// 장바구니로 상품코드, 수량 넘기기(insert)
		itemService.insertCart(cvo);

		return "redirect:oneItem.item?item_code=" + item_code;
	}

	@RequestMapping(value = "review.item", method = RequestMethod.POST)
	public String reviewForm(int item_code, Model m) {
		m.addAttribute("item_code", item_code);
		return "review_Form";
	}

	@RequestMapping(value = "reviewInsert.item", method = RequestMethod.POST)
	public String reviewInsert(@ModelAttribute ReviewBoardVO rvo, MultipartFile image,HttpSession session) {
		ImagesVO imageVO = new ImagesVO();
		String image_name = image.getOriginalFilename();
		System.out.println(rvo.getItem_code());
		//session
		String mem_id = (String) session.getAttribute("mem_id");
		rvo.setMem_id(mem_id);
		System.out.println(mem_id);
		//이미지처리
		int item_code=rvo.getItem_code();
		File target = new File(uploadPath + "/reviews", image_name);

		// 경로 생성
		if (!new File(uploadPath + "/reviews").exists()) {
			new File(uploadPath + "/reviews").mkdirs();
		}
		// 파일 복사
		try {
			FileCopyUtils.copy(image.getBytes(), target);
		} catch (Exception e) {
			e.printStackTrace();
		}
		itemService.reviewInsert(rvo);
		
		imageVO.setImg_name(image_name);
		imageVO.setImg_save(uploadPath + "/reviews");
		imageVO.setImg_ref("review");
		imageVO.setImg_id(rvo.getR_board_no());
		//insert처리
		itemService.reviewImg(imageVO);
		
		
		return "redirect:oneItem.item?item_code="+item_code;
	}

}
