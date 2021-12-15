package kr.co.ezenac.board.model.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReplyVO {
	private int reply_no;
	private String reply_sub;
	private String reply_content;
	private String reply_date;
	private String reply_board;
	private int board_no;
}
