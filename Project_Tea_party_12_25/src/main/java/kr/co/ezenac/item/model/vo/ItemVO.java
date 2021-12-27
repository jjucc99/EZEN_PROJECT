package kr.co.ezenac.item.model.vo;


public class ItemVO {
	private String imgPath=null;
	private int item_code;
	private String item_name;
	private int item_price;
	private String item_information;
	private int cate_code;
	private int item_count;
	
	
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
	public int getCate_code() {
		return cate_code;
	}
	public void setCate_code(int cate_code) {
		this.cate_code = cate_code;
	}
	public int getItem_count() {
		return item_count;
	}
	public void setItem_count(int item_count) {
		this.item_count = item_count;
	}
	
	@Override
	public String toString() {
		return "ItemVO [imgPath=" + imgPath + ", item_code=" + item_code + ", item_name=" + item_name + ", item_price="
				+ item_price + ", item_information=" + item_information + ", cate_code=" + cate_code + ", item_count="
				+ item_count + "]";
	}
	
	
}
