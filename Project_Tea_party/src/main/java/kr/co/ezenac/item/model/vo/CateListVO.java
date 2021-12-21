package kr.co.ezenac.item.model.vo;

public class CateListVO {
	private String item_name;
	private int item_price;
	private String item_information;
	
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
	public String getItem_information() {
		return item_information;
	}
	public void setItem_information(String item_information) {
		this.item_information = item_information;
	}
	
	@Override
	public String toString() {
		return "CateListVO [item_name=" + item_name + ", item_price=" + item_price + ", item_information="
				+ item_information + "]";
	}
	
	
}
