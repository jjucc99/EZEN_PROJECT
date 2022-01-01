package kr.co.ezenac.board.model.vo;

import java.util.Date;

public class BoardVO {
	private int board_no;
	private String board_sub;
	private String board_content;
	private Date board_date;
	private String board_board;
	private String mem_id;
	private int replyCount;
	
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getBoard_sub() {
		return board_sub;
	}
	public void setBoard_sub(String board_sub) {
		this.board_sub = board_sub;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	public String getBoard_board() {
		return board_board;
	}
	public void setBoard_board(String board_board) {
		this.board_board = board_board;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	@Override
	public String toString() {
	return "BoardVO [board_no=" + board_no + 
			", board_sub=" + board_sub + 
			", board_content=" +board_content+
			", board_date=" + board_date +
			",board_board=" + board_board+
			",mem_id="+mem_id+"]";
	}
	
}

