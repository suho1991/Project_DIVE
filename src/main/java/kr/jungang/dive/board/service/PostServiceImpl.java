package kr.jungang.dive.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.jungang.dive.board.domain.PostCriteria;
import kr.jungang.dive.board.domain.PostVO;
import kr.jungang.dive.board.persistence.PostMapper;
import kr.jungang.dive.user.persistence.UserMapper;
import kr.jungang.dive.user.service.UserServiceImpl;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
@AllArgsConstructor
public class PostServiceImpl implements PostService {

	@Setter(onMethod_ = @Autowired)
	private PostMapper postMapper;

	
	@Override
	public void insertPost(PostVO obj) {
		postMapper.insertPost(obj);
	}

	@Override
	public int getTotCount(PostCriteria postCriteria) {
		return postMapper.getTotCount(postCriteria);
	}

	@Override
	public List<PostVO> getAllPost() {
		return postMapper.getAllPost();
	}

	@Override
	public List<PostVO> getPostWithPaging(PostCriteria postCriteria) {
		return postMapper.getPostWithPaging(postCriteria);
	}

	@Override
	public PostVO findById(int id) {
		return postMapper.findById(id);
	}

	@Override
	public int deletePost(int id) {
		return postMapper.deletePost(id);
	}

	@Override
	public int updatePost(PostVO obj) {
		return postMapper.updatePost(obj);
	}

}
