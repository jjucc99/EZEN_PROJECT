package kr.co.ezenac.board.model.vo;


public class ReplyVO {
	private int reply_no;
	private String reply_sub;
	private String reply_content;
	private String reply_date;
	private String reply_board;
	private int board_no;
	
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public String getReply_sub() {
		return reply_sub;
	}
	public void setReply_sub(String reply_sub) {
		this.reply_sub = reply_sub;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReply_date() {
		return reply_date;
	}
	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}
	public String getReply_board() {
		return reply_board;
	}
	public void setReply_board(String reply_board) {
		this.reply_board = reply_board;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	
}
