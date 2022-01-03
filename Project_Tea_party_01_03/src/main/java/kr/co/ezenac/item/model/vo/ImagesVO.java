package kr.co.ezenac.item.model.vo;

public class ImagesVO {
	private int ord_item_no; // 시퀀스값(자동)
	private String img_name; // 이미지 이름(파일명)
	private String img_save; // 경로
	private String img_ref; // 종류 "item", "review", "board"
	private int img_id; // 종류의 고유번호
	private int r_board_no;
	
	public int getOrd_item_no() {
		return ord_item_no;
	}
	public void setOrd_item_no(int ord_item_no) {
		this.ord_item_no = ord_item_no;
	}
	public String getImg_name() {
		return img_name;
	}
	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}
	public String getImg_save() {
		return img_save;
	}
	public void setImg_save(String img_save) {
		this.img_save = img_save;
	}
	public String getImg_ref() {
		return img_ref;
	}
	public void setImg_ref(String img_ref) {
		this.img_ref = img_ref;
	}
	public int getImg_id() {
		return img_id;
	}
	public void setImg_id(int img_id) {
		this.img_id = img_id;
	}
	public int getR_board_no() {
		return r_board_no;
	}
	public void setR_board_no(int r_board_no) {
		this.r_board_no = r_board_no;
	}
	
}
