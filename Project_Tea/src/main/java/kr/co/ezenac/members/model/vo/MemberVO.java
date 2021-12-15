package kr.co.ezenac.members.model.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
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
}
