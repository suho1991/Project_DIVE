package kr.jungang.dive.board.domain;

import java.util.List;

import kr.jungang.dive.framework.paging.Criteria;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReplyCriteria extends Criteria {
	
	private int replyCnt;
	private List<ReplyVO> listReply;
	
	public ReplyCriteria(int replyCnt, List<ReplyVO> listReply) {
		this.replyCnt = replyCnt;
		this.listReply = listReply;
	}
	
	
	
}
