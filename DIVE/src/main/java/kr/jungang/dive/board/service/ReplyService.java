package kr.jungang.dive.board.service;

import kr.jungang.dive.board.domain.ReplyCriteria;
import kr.jungang.dive.board.domain.ReplyVO;
import kr.jungang.dive.framework.paging.Criteria;

public interface ReplyService {
	public ReplyCriteria getReplyWithPaging(Criteria criteria, long pid);

	public ReplyVO findById(long id);

	public int insertReply(ReplyVO obj);
	public int updateReply(ReplyVO obj);
	public int deleteReply(long id);
}
