package kr.jungang.dive.user.persistence;

import kr.jungang.dive.user.domain.UserVO;

public interface UserMapper {
	//회원 가입
	public void createUser(UserVO createUserVO);
	
	//아이디로 회원 정보 검색
	public UserVO findById(String id);
	
	//회원정보 수정
	public void updateUser(UserVO updateUserVO);
	
	//회원 탈퇴
	public void deleteUser(String id);
	
	public UserVO readAuthority(String id);
}
