package kr.co.ezenac.review.model.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewBoardVO {
	private int r_board_no;
	private String r_board_sub;
	private String r_board_content;
	private String r_board_date;
	private String mem_id;
	private int item_code;
}
