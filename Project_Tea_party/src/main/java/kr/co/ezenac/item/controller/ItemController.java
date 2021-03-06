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

import kr.co.ezenac.admin.model.vo.BoardVO;
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

        model.addAttribute("cate_code", cate_code);
        model.addAttribute("catelist", list);
        return "item_Cate";
    }

	// 카테고리 신상(메인)
		@RequestMapping(value = "main", method = RequestMethod.GET)
		public String main(Model model) {

			List<CateListVO> list = itemService.cateNewList();
			for (CateListVO cvo : list) {
				int item_code = cvo.getItem_code();
				String path = getimg(item_code);
				cvo.setImgPath(path);
			}

			model.addAttribute("cateNewList", list);
			return "main/main";
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
			@RequestParam(value = "nowPage", required = false) String nowPage, HttpSession session) {
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
		
		//페이징
		int total = itemService.countReview();
		if (nowPage == null) {
			nowPage = "1";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), 5);
	
		model.addAttribute("catelist", ivo);
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", rlist);
		
		String mem_id = (String) session.getAttribute("mem_id");
		model.addAttribute("mem_id", mem_id);
		
		return "item_Info";
	}

	// 나의 review
		@RequestMapping(value = "myReview.item", method = RequestMethod.GET)
		public String myReview(Model model, PagingVO vo, @RequestParam(value = "nowPage", required = false) String nowPage,
				HttpSession session) {
			String mem_id = (String) session.getAttribute("mem_id");
			
			int total = itemService.countMyReview(mem_id);
			// 페이징
			if (nowPage == null) {
				nowPage = "1";
			}
			vo = new PagingVO(total, Integer.parseInt(nowPage), 10);
			
			// 리뷰		
			model.addAttribute("paging", vo);
			vo.setMem_id(mem_id);
			model.addAttribute("viewAll", itemService.myRList(vo));

			return "myReviewList";
		}
	
	
	//장바구니에 넣기
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
	public String reviewForm(@RequestParam int item_code, Model m) {
		m.addAttribute("item_code", item_code);
		
		ItemVO ivo = itemService.infoItem(item_code);
		String item_name=ivo.getItem_name();
		m.addAttribute("item_name", item_name);
		
		return "review_Form";
	}
	//review insert
	@RequestMapping(value = "reviewInsert.item", method = RequestMethod.POST)
	public String reviewInsert(@ModelAttribute ReviewBoardVO rvo, @RequestParam(value = "image", required = false)MultipartFile image,HttpSession session) {
		ImagesVO imageVO = new ImagesVO();
		
		//session
		String mem_id = (String) session.getAttribute("mem_id");
		rvo.setMem_id(mem_id);
		
		itemService.reviewInsert(rvo);

		//이미지 처리
		int item_code=rvo.getItem_code();
		String image_name = image.getOriginalFilename();	
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
		//int selectSeq=itemService.selectSeq();

		imageVO.setImg_name(image_name);
		imageVO.setImg_save(uploadPath + "/reviews");
		imageVO.setImg_ref("review");
		imageVO.setImg_id(rvo.getR_board_no());
		//insert처리
		itemService.reviewImg(imageVO);

		
		return "redirect:oneItem.item?item_code="+item_code;
	}
	
	//review정보로직
	@RequestMapping(value = "reviewUpdateForm.item", method = RequestMethod.GET)
	public String updateReviewForm(@ModelAttribute ReviewBoardVO rvo, Model model, HttpSession session) {
		ReviewBoardVO selectReview = itemService.selectReview(rvo);
		//String mem_id = (String) session.getAttribute("mem_id");//세션은 모든것을 저장가능하게한다. setAttribu로 넣는다.Object
		//System.out.println(selectReview);
		
		String img_path = getReviewImg(rvo.getR_board_no());
		selectReview.setImg_path(img_path);
		model.addAttribute("review",selectReview);
		
		ItemVO ivo = itemService.infoItem(selectReview.getItem_code());
		String item_name=ivo.getItem_name();
		model.addAttribute("item_name", item_name);
		
		return "review_Update";
		
	}
	
	//review 수정
	@RequestMapping(value = "reviewUpdate.item",method = RequestMethod.POST)
	public String updateReview(@ModelAttribute ReviewBoardVO rvo,MultipartFile image,String imgFlag) {
		int item_code=rvo.getItem_code();
		itemService.updateReview(rvo);
		if(imgFlag.equals("N")) {
			int r_board_no=rvo.getR_board_no();
			
			String fileName=itemService.getReImgName(r_board_no);
			//System.out.println(fileName+"이미지이름");
			File file = new File(uploadPath + "/reviews"+fileName);
			if(file.exists()) {
				if(file.delete()) {
					System.out.println("이미지 삭제 성공");
				} else {
					System.out.println("이미지 삭제 실패");
				}
			}else {
				System.out.println("이미지가 존재하지 않습니다.");
			}
			itemService.deleteReviewImg(r_board_no);

			ImagesVO imageVO = new ImagesVO();
			String image_name = image.getOriginalFilename();
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
			imageVO.setImg_name(image_name);
			imageVO.setImg_save(uploadPath + "/reviews");
			imageVO.setImg_ref("review");
			imageVO.setImg_id(rvo.getR_board_no());
			
			itemService.reviewImg(imageVO);
		}
		
		return "redirect:oneItem.item?item_code="+item_code;
	}
	
	//review 삭제
	@RequestMapping(value = "reviewDelete.item",method = RequestMethod.GET)
	public String deleteReview(@ModelAttribute ReviewBoardVO rvo,int r_board_no) {
		int item_code=rvo.getItem_code();
		itemService.deleteReview(r_board_no);
		return "redirect:oneItem.item?item_code="+item_code;
	}
}
