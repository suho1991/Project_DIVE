package kr.jungang.dive.board.domain;

import java.util.Date;

import kr.jungang.dive.user.domain.UserDTO;
import lombok.Data;

@Data
public class ReplyVO {
	private long id;
	private long pid;
	private long rid;
	private String content;
	private String writer;
	private long userNum;
	private Date regDate;
	private Date updateDate;
	
	private UserDTO user;
	
	
	
}
