package kr.co.ezenac.pay.model.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Order_itemVO {
	private int ord_item_no;
	private int count;
	private int item_code;
	private int ord_no;
}
