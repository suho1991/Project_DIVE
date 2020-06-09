package kr.jungang.dive.user.service;

import java.util.HashMap;
import java.util.List;

import kr.jungang.dive.user.domain.UserDTO;

public interface UserService {
	//회원 가입
	public void createUser(UserDTO createUser);

	//My Page(아이디로 정보 조회)
	public UserDTO findById(String userId);

	//회원 정보 수정
	public boolean updateUser(UserDTO updateUser);
	
	//아이디 찾기
	public UserDTO findMyId(String name, String email);
	
	//PASSWORD 변경(Naver -> SMPT PORT: 587, SERVER NAME: smtp.naver.com, ID: courage5683, PASS: 네이버로그인 비번)
	public void changePassword(String password);
	
	//회원 리스트(only Admin)
	public List<UserDTO> getAllMember();
	
	//회원 상태 처리(only Admin)
	public UserDTO updateMemberStatus(UserDTO memberStatus);
}
