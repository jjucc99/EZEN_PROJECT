package kr.co.ezenac.admin.model.vo;

import java.util.Date;

public class Order_listVO {
	private int ord_no;
	private Date ord_date;
	private String ord_receiver;
	private String ord_addr1;
	private String ord_addr2;
	private String ord_addr3;
	private String ord_phone;
	private String delivery_status;
	private String ord_status;
	private String mem_id;
	private int pay_no;
	private int ord_price;
	public int getOrd_no() {
		return ord_no;
	}
	public void setOrd_no(int ord_no) {
		this.ord_no = ord_no;
	}
	public Date getOrd_date() {
		return ord_date;
	}
	public void setOrd_date(Date ord_date) {
		this.ord_date = ord_date;
	}
	public String getOrd_receiver() {
		return ord_receiver;
	}
	public void setOrd_receiver(String ord_receiver) {
		this.ord_receiver = ord_receiver;
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
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getPay_no() {
		return pay_no;
	}
	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}
	public int getOrd_price() {
		return ord_price;
	}
	public void setOrd_price(int ord_price) {
		this.ord_price = ord_price;
	}
	

}
