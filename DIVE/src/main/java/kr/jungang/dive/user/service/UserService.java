package kr.jungang.dive.user.service;

import kr.jungang.dive.user.domain.UserDTO;

public interface UserService {
	//회원 가입
	public void createUser(UserDTO createUser);

	//My Page(아이디로 정보 조회)
	public UserDTO findById(String id);

	//회원 정보 수정
	public boolean updateUser(UserDTO updateUser);

	//회원 탈퇴
	public boolean deleteUser(String id);
}
