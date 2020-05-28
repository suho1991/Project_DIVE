package kr.jungang.dive.user.persistence;

import kr.jungang.dive.user.domain.AuthorityVO;
import kr.jungang.dive.user.domain.UserDTO;

public interface UserMapper {
	//회원 가입
	public void createUser(UserDTO createUser);
	
	//아이디로 정보 조회
	public UserDTO findById(String id);
	
	//정보 수정
	public boolean updateUser(UserDTO updateUser);
	
	//회원 탈퇴
	public boolean deleteUser(String id);

	//권한 부여
	public void insertAuthority(AuthorityVO authorityVO);
	
	//권한 조회
	public UserDTO readAuthority(long userNum);
}
