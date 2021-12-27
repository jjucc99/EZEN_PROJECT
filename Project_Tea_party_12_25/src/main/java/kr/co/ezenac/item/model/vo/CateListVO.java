package kr.co.ezenac.item.model.vo;

public class CateListVO {
	private String imgPath=null;
	private int item_code;
	private String item_name;
	private int item_price;
	private String item_information;
	
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public int getItem_code() {
		return item_code;
	}
	public void setItem_code(int item_code) {
		this.item_code = item_code;
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
	public String getItem_information() {
		return item_information;
	}
	public void setItem_information(String item_information) {
		this.item_information = item_information;
	}
	
	
	@Override
	public String toString() {
		return "CateListVO [imgPath=" + imgPath + ", item_name=" + item_name + ", item_price=" + item_price
				+ ", item_information=" + item_information + "]";
	}
	
	
}
