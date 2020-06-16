package kr.jungang.dive.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.jungang.dive.board.domain.ReplyCriteria;
import kr.jungang.dive.board.domain.ReplyVO;
import kr.jungang.dive.board.persistence.ReplyMapper;
import kr.jungang.dive.framework.paging.Criteria;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper replyMapper;

	@Override
	public ReplyCriteria getReplyWithPaging(Criteria criteria, long pid) {
		return new ReplyCriteria(replyMapper.getTotCountOfPost(pid), replyMapper.getReplyWithPaging(criteria, pid));
	}

	@Override
	public ReplyVO findById(long id) {
		return replyMapper.findById(id);
	}

	@Override
	public int insertReply(ReplyVO obj) {
		return replyMapper.insertReply(obj);
	}

	@Override
	public int updateReply(ReplyVO obj) {
		return replyMapper.updateReply(obj);
	}

	@Override
	public int deleteReply(long id) {
		return replyMapper.deleteReply(id);
	}
	
	

}
