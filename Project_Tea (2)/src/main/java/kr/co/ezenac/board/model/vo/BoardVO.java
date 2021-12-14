package kr.co.ezenac.board.model.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO {
	private int board_no;
	private String board_sub;
	private String board_content;
	private String board_date;
	private String board_board;
	private String mem_id;
}
