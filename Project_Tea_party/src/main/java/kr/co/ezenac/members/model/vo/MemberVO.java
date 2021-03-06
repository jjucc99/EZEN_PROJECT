package kr.co.ezenac.members.model.vo;




public class MemberVO {
	private String mem_id;
	private String mem_pwd;
	private String mem_name;
	private String mem_addr1;
	private String mem_addr2;
	private String mem_addr3;
	private String mem_phone;
	private String mem_email;
	private char mem_check;
	private char mem_delete;
	private char mem_admin;


	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pwd() {
		return mem_pwd;
	}

	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_addr1() {
		return mem_addr1;
	}

	public void setMem_addr1(String mem_addr1) {
		this.mem_addr1 = mem_addr1;
	}

	public String getMem_addr2() {
		return mem_addr2;
	}

	public void setMem_addr2(String mem_addr2) {
		this.mem_addr2 = mem_addr2;
	}

	public String getMem_addr3() {
		return mem_addr3;
	}

	public void setMem_addr3(String mem_addr3) {
		this.mem_addr3 = mem_addr3;
	}

	public String getMem_phone() {
		return mem_phone;
	}

	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public char getMem_check() {
		return mem_check;
	}

	public void setMem_check(char mem_check) {
		this.mem_check = mem_check;
	}

	public char getMem_delete() {
		return mem_delete;
	}

	public void setMem_delete(char mem_delete) {
		this.mem_delete = mem_delete;
	}

	public char getMem_admin() {
		return mem_admin;
	}

	public void setMem_admin(char mem_admin) {
		this.mem_admin = mem_admin;
	}

	@Override
	public String toString() {
		return "MemberVO{" +
				"mem_id='" + mem_id + '\'' +
				", mem_pwd='" + mem_pwd + '\'' +
				", mem_name='" + mem_name + '\'' +
				", mem_addr1='" + mem_addr1 + '\'' +
				", mem_addr2='" + mem_addr2 + '\'' +
				", mem_addr3='" + mem_addr3 + '\'' +
				", mem_phone='" + mem_phone + '\'' +
				", mem_email='" + mem_email + '\'' +
				", mem_check=" + mem_check +
				", mem_delete=" + mem_delete +
				", mem_admin=" + mem_admin +
				'}';
	}
}
