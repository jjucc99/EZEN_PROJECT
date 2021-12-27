package kr.co.ezenac.pay.model.vo;


public class Order_listVO {
	//주문번호 이미지 대표상품 개수 전체상품금액 배송상태 주문처리상태 구매일자
	private int ord_no;
	private String imgPath;
	private String rep_name;
	private int ord_count;
	private int ord_price;
	private String delivery_status;
	private String ord_status;
	private String ord_date;
	
	private String ord_reciever;
	private String ord_addr1;
	private String ord_addr2;
	private String ord_addr3;
	private String ord_phone;
	private int pay_no;
	
	public int getOrd_no() {
		return ord_no;
	}
	public void setOrd_no(int ord_no) {
		this.ord_no = ord_no;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public String getRep_name() {
		return rep_name;
	}
	public void setRep_name(String rep_name) {
		this.rep_name = rep_name;
	}
	public int getOrd_count() {
		return ord_count;
	}
	public void setOrd_count(int ord_count) {
		this.ord_count = ord_count;
	}
	public int getOrd_price() {
		return ord_price;
	}
	public void setOrd_price(int ord_price) {
		this.ord_price = ord_price;
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
	public String getOrd_reciever() {
		return ord_reciever;
	}
	public void setOrd_reciever(String ord_reciever) {
		this.ord_reciever = ord_reciever;
	}
	public String getOrd_addr1() {
		return ord_addr1;
	}
	public void setOrd_addr1(String ord_addr1) {
		this.ord_addr1 = ord_addr1;
	}
	public String getOrd_addr2() {
		return ord_addr2;
	}
	public void setOrd_addr2(String ord_addr2) {
		this.ord_addr2 = ord_addr2;
	}
	public String getOrd_addr3() {
		return ord_addr3;
	}
	public void setOrd_addr3(String ord_addr3) {
		this.ord_addr3 = ord_addr3;
	}
	public String getOrd_phone() {
		return ord_phone;
	}
	public void setOrd_phone(String ord_phone) {
		this.ord_phone = ord_phone;
	}
	public int getPay_no() {
		return pay_no;
	}
	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}
}
