package kr.co.ezenac.admin.model.vo;

public class OrderVO {
	// 주문번호 아이디 주문일시 대표상품 개수 배송상태 주문상태
	private int ord_no;
	private String mem_id;
	private String order_item;
	private int order_item_count;
	private String delivery_status;
	private String ord_status;
	private String ord_date;
	private String item_name;
	private int item_price;
	
	public int getOrd_no() {
		return ord_no;
	}
	public void setOrd_no(int ord_no) {
		this.ord_no = ord_no;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getOrder_item() {
		return order_item;
	}
	public void setOrder_item(String order_item) {
		this.order_item = order_item;
	}
	public int getOrder_item_count() {
		return order_item_count;
	}
	public void setOrder_item_count(int order_item_count) {
		this.order_item_count = order_item_count;
	}
	public String getDelivery_status() {
		return delivery_status;
	}
	public void setDelivery_status(String delivery_status) {
		this.delivery_status = delivery_status;
	}
	public String getOrd_status() {
		return ord_status;
	}
	public void setOrd_status(String ord_status) {
		this.ord_status = ord_status;
	}
	public String getOrd_date() {
		return ord_date;
	}
	public void setOrd_date(String ord_date) {
		this.ord_date = ord_date;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}

}
