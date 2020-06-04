package kr.jungang.dive.board.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.jungang.dive.board.domain.ReplyVO;
import kr.jungang.dive.framework.paging.Criteria;

public interface ReplyMapper {
	public List<ReplyVO> getReplyWithPaging(
			@Param("cri") Criteria criteria,
			@Param("pid") long pid);

			
	public int getTotCountOfPost(long pid);
	
	public ReplyVO findById(long id);

	public int insertReply(ReplyVO vo);
	public int updateReply(ReplyVO obj);
	public int deleteReply(long id);

}
