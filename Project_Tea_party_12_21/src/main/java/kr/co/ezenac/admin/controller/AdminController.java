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

import java.io.File;
import kr.co.ezenac.admin.model.service.AdminService;
import kr.co.ezenac.admin.model.vo.ImagesVO;
import kr.co.ezenac.admin.model.vo.ItemVO;
import kr.co.ezenac.admin.model.vo.MemberVO;
import kr.co.ezenac.admin.model.vo.PagingVO;

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

	// ------------------------------------------상품-----------------------
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
		System.out.println("데이터 추가 성공 : " + result);
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
	public String boardList(PagingVO vo, Model model, @RequestParam(value = "nowPage", required = false) String nowPage,
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
	// 아이템 리스트
//	@RequestMapping(value = "itemList.ad", method = RequestMethod.GET)
//	public ModelAndView selectItemList() {
//		ModelAndView mv = new ModelAndView();
//		List<ItemVO> list = adService.ItemList();
//		mv.setViewName("admin_Item/item_list_admin");
//		mv.addObject("list", list);
//		return mv;
//	}
	
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

	// -------------------------------------------상품 끝---------------------------------------
	// ---------------------------------------관리자 회원 관리-------------------------------------
	// 일반 회원 목록
	@RequestMapping(value = "memberList.ad", method = RequestMethod.GET)
	public ModelAndView selectMemberList() {
		ModelAndView mv = new ModelAndView();
		List<MemberVO> list = adService.memberList();
		mv.setViewName("admin_member/member_list");
		mv.addObject("list", list);
		return mv;
	}

	// 탈퇴 회원 목록
	@RequestMapping(value = "outMemberList.ad", method = RequestMethod.GET)
	public ModelAndView selectOutMemberList() {
		ModelAndView mv = new ModelAndView();
		List<MemberVO> list = adService.outMemberList();
		mv.setViewName("admin_member/out_member_list");
		mv.addObject("list", list);
		return mv;
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

	// --------------------------------------------

}
