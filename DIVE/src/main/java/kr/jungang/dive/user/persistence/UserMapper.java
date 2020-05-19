package kr.jungang.dive.user.persistence;

import kr.jungang.dive.user.domain.UserVO;

public interface UserMapper {
	public UserVO findById(String id);
	
	public void createtUser(UserVO userVO);
}
