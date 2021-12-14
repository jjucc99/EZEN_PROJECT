package kr.co.ezenac.mypage.model.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ItemVO {
	private int item_code;
	private String item_name;
	private int item_price;
	private String item_information;
	private int cate_code;
}
