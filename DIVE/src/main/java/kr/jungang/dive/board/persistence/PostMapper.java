package kr.jungang.dive.board.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.jungang.dive.board.domain.PostVO;
import kr.jungang.dive.framework.paging.Criteria;

public interface PostMapper {
	public List<PostVO> getAllPost();
	
	public PostVO findById(long id);
	
	public int getTotCount(@Param("cri") Criteria cri);
	
	public List<PostVO> getPostWithPaging(@Param("cri") Criteria cri);
	
	public int insertPost(PostVO obj);
	
	public int updatePost(PostVO obj);
	
	public int deletePost(long id);

}
