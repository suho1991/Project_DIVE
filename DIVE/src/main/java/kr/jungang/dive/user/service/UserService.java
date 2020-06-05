package kr.jungang.dive.user.service;

import java.util.List;

import kr.jungang.dive.user.domain.UserDTO;

public interface UserService {
	//회원 가입
	public void createUser(UserDTO createUser);

	//My Page(아이디로 정보 조회)
	public UserDTO findById(String userId);

	//회원 정보 수정
	public boolean updateUser(UserDTO updateUser);
	
	//회원 리스트(only Admin)
	public List<UserDTO> getAllMember();
	
	//회원 상태 처리(only Admin)
	public UserDTO updateMemberStatus(UserDTO memberStatus);
}
