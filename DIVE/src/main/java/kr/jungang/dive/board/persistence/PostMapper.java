package kr.jungang.dive.board.persistence;

import java.util.List;

import kr.jungang.dive.board.domain.PostCriteria;
import kr.jungang.dive.board.domain.PostVO;

public interface PostMapper {
	public List<PostVO> getAllPost();
	
	public PostVO findById(long id);
	
	public int getTotCount(PostCriteria postCriteria);
	
	public List<PostVO> getPostWithPaging(PostCriteria postCriteria);
	
	public int insertPost(PostVO obj);
	
	public int updatePost(PostVO obj);
	
	public int deletePost(long id);

}
