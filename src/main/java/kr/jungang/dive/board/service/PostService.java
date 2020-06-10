package kr.jungang.dive.board.service;

import java.util.List;

import kr.jungang.dive.board.domain.PostCriteria;
import kr.jungang.dive.board.domain.PostVO;

public interface PostService {
	public void insertPost(PostVO obj);
	
	public int getTotCount(PostCriteria postCriteria);

	public List<PostVO> getAllPost();
	
	public List<PostVO> getPostWithPaging(PostCriteria postCriteria);

	public PostVO findById(int id);

	public int deletePost(int id);

	public int updatePost(PostVO obj);
}
