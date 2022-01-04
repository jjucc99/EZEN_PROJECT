package kr.co.ezenac.item.model.vo;


public class Cart_itemVO {
	private int cart_item_no;
	private int cart_amount;
	private int cart_no;
	private int item_code;
	
	
	public int getCart_item_no() {
		return cart_item_no;
	}
	public void setCart_item_no(int cart_item_no) {
		this.cart_item_no = cart_item_no;
	}
	public int getCart_amount() {
		return cart_amount;
	}
	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
	}
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	public int getItem_code() {
		return item_code;
	}
	public void setItem_code(int item_code) {
		this.item_code = item_code;
	}
	
	@Override
	public String toString() {
		return "Cart_itemVO [cart_item_no=" + cart_item_no + ", cart_amount=" + cart_amount + ", cart_no=" + cart_no
				+ ", item_code=" + item_code + "]";
	}	
}
