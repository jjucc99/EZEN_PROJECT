package kr.co.ezenac.item.controller;

import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.ezenac.item.model.service.ItemService;
import kr.co.ezenac.item.model.vo.CateListVO;
import kr.co.ezenac.item.model.vo.ItemVO;

@Controller
public class ItemController {
	@Autowired
	private ItemService itemService;
	
	//images
	@Resource(name="uploadPath")
		String uploadPath;
	
	// item 홈
	@RequestMapping(value = "test.item", method = RequestMethod.GET)
	public String text() {
		return "item";
	}

	// 아이템 추가
	@RequestMapping(value = "addForm.item", method = RequestMethod.GET)
	public String addItemform() {
		return "item_Add";
	}

	// 아이템 삭제
	@RequestMapping(value = "deleteForm.item", method = RequestMethod.GET)
	public String deleteItemform() {
		return "item_Delete";
	}

	// 아이템 수정
	@RequestMapping(value = "updateForm.item")
	public String updateItemform() {
		return "item_Update";
	}

	// item 추가
	@RequestMapping(value = "add.item", method = RequestMethod.POST)
	public String insertItem(@ModelAttribute ItemVO ivo) {
		itemService.insertItem(ivo);
		return "item";
	}

	// item 삭제
	@RequestMapping(value = "delete.item", method = RequestMethod.POST)
	public String deleteItem(@ModelAttribute ItemVO ivo) {
		itemService.deleteItem(ivo);
		return "item";
	}

	// item 수정
	@RequestMapping(value = "update.item", method = RequestMethod.POST)
	public String update(@ModelAttribute ItemVO ivo) {
		itemService.update(ivo);
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
	
	/*
	 * //info //@GetMapping("info.item/{item_code}")
	 * 
	 * @RequestMapping(value = "info.item/{item_code}", method = RequestMethod.GET)
	 * public String selectOne(@PathVariable("item_code") String item_code, Model
	 * model) { ItemVO ivo=itemService.infoItem(item_code);
	 * model.addAttribute("infoItem",ivo);
	 * 
	 * return "item/item_Info"; //이 메소드에서만 item-context.xml의 prefix 기능이 안 됨. }
	 */
	
	/*
	 * //info
	 * itemService.infoItem(item_code)
	 * @GetMapping("info.item/{item_code}") public ModelAndView
	 * selectOne(@PathVariable("item_code") ItemVO item_code) { ModelAndView mv=new
	 * ModelAndView(); System.out.println(item_code+"아이템");
	 * 
	 * mv.setViewName("item_Info");
	 * mv.addObject("infoItem",itemService.infoItem(item_code));
	 * 
	 * return mv; }
	 */
		//이미지 경로 가져오기
		public String getimg(int item_code) {
			String fileName=itemService.getImg(item_code);
			
			return uploadPath+"/items/"+fileName;
		}
			
		
	@GetMapping("cate.item/{categoryId}") 
		public String category(@PathVariable("categoryId") String categoryId, Model model) { 

		List<CateListVO> list= itemService.cateList(categoryId);
		for(CateListVO cvo : list) {
			int item_code=cvo.getItem_code();
			String path=getimg(item_code);
			cvo.setImgPath(path);
		}
		
		model.addAttribute("catelist",list);
		
		return "item/item_Cate";
		}
	
	/*
	 * public String getimg(int item_code) { String
	 * fileName=itemService.getImg(item_code);
	 * 
	 * return uploadPath+"/items/"+fileName; }
	 */
	
	@GetMapping("cate.item/oneItem.item/{item_code}")
	public String selectOneItem(@PathVariable("item_code") int item_code ,Model model) {
		System.out.println(item_code+"아이템정보");
		ItemVO ivo=itemService.infoItem(item_code);
		String path=getimg(item_code);
		ivo.setImgPath(path);
		model.addAttribute("item",ivo);
		
		return "item/item_Info";
	}
}
