package kr.co.ezenac.pay.model.vo;


public class Order_itemVO {
	private int count;
	private int item_code;
	private int ord_no;
	private int cart_item_no;
	
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getItem_code() {
		return item_code;
	}
	public void setItem_code(int item_code) {
		this.item_code = item_code;
	}
	public int getOrd_no() {
		return ord_no;
	}
	public void setOrd_no(int ord_no) {
		this.ord_no = ord_no;
	}
	public int getCart_item_no() {
		return cart_item_no;
	}
	public void setCart_item_no(int cart_item_no) {
		this.cart_item_no = cart_item_no;
	}
	
}
