package kr.co.ezenac.admin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import kr.co.ezenac.admin.model.service.AdminService;
import kr.co.ezenac.admin.model.vo.ImagesVO;
import kr.co.ezenac.admin.model.vo.ItemVO;


@Controller
public class AdminController {
	@Autowired
	private AdminService adService;
	
	@Resource(name="uploadPath")
	String uploadPath;

	// 어드민 홈
	@RequestMapping(value = "admin.ad", method = RequestMethod.GET)
	public String text() {
		return "admin_Item/admin_item";
	}

	// 아이템 추가
	@RequestMapping(value = "addItemForm.ad", method = RequestMethod.GET)
	public String addItemform() {
		return "admin_Item/item_add_admin_form";
	}

	// 아이템 삭제
	@RequestMapping(value = "itemDeleteForm.ad", method = RequestMethod.GET)
	public String itemdeleteform() {
		return "admin_Item/item_delete_form";
	}

	// 아이템 정보
	@RequestMapping(value = "itemInfoForm.ad", method = RequestMethod.GET)
	public String iteminfoform() {
		return "admin_Item/item_info_form";
	}

	// 아이템 추가 로직
	@RequestMapping(value = "addItem.ad", method = RequestMethod.POST)
	public String insertItem(@ModelAttribute ItemVO ivo, MultipartFile image) {
		ImagesVO imageVO=new ImagesVO();
		
		String image_name = image.getOriginalFilename();
		
		File target = new File(uploadPath+"/items", image_name);

		// 경로 생성
		if (!new File(uploadPath+"/items").exists()) {
			new File(uploadPath+"/items").mkdirs();
		}
		//파일 복사
        try {
            FileCopyUtils.copy(image.getBytes(), target);
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        imageVO.setOrd_item_no(ivo.getItem_code()+1);// 시퀀스 대신 임시로 넣어주는 코드
        imageVO.setImg_name(image_name);
        imageVO.setImg_save(uploadPath+"/items");
        imageVO.setImg_ref("item");
        imageVO.setImg_id(ivo.getItem_code());
        
		adService.insertItem(ivo);
		int result=adService.insertImage(imageVO);
		System.out.println("데이터 추가 성공 : "+result);
		return "admin_Item/admin_item";
	}

	// 아이템 정보 로직
	@RequestMapping(value = "itemInfo.ad", method = RequestMethod.GET)
	public ModelAndView selectOne(int item_code) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin_Item/item_info");
		mv.addObject("item", adService.selectOneItem(item_code));
		return mv;
	}

	// 아이템 리스트
	@RequestMapping(value = "itemList.ad", method = RequestMethod.GET)
	public ModelAndView selectItemList() {
		ModelAndView mv = new ModelAndView();
		List<ItemVO> list = adService.ItemList();
		mv.setViewName("admin_Item/item_list_admin");
		mv.addObject("list", list);
		return mv;
	}

	// 아이템 삭제 로직
	@RequestMapping(value = "itemDelete.ad", method = RequestMethod.POST)
	public String deleteItem(String item_name) {
		int result = adService.deleteItem(item_name);
		System.out.println("삭제 결과" + result);
		return "admin_Item/delete_result";
	}

	// 아이템 업데이트 로직
	@RequestMapping(value = "itemUpdate.ad", method = RequestMethod.POST)
	public String updateItem(@ModelAttribute ItemVO ivo) {
		System.out.println(ivo.getItem_code());
		System.out.println(ivo.getItem_name());
		adService.updateItem(ivo);

		return "admin_Item/admin_item";
	}

}
