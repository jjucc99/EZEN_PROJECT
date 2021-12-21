package kr.co.ezenac.item.model.vo;


public class CategoryVO {
	private int cate_code;
	private String cate_name;
	
	public int getCate_code() {
		return cate_code;
	}
	public void setCate_code(int cate_code) {
		this.cate_code = cate_code;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	
	@Override
	public String toString() {
		return "CategoryVO [cate_code=" + cate_code + ", cate_name=" + cate_name + "]";
	}
	
	
}
