package kr.jungang.dive.user.persistence;

import java.util.List;

import kr.jungang.dive.framework.paging.Criteria;
import kr.jungang.dive.user.domain.AuthorityVO;
import kr.jungang.dive.user.domain.UserDTO;

public interface UserMapper {
	//회원 가입
	public void createUser(UserDTO createUser);
	
	//아이디로 정보 조회
	public UserDTO findById(String userId);
	
	//정보 수정
	public boolean updateUser(UserDTO updateUser);
	
	//권한 부여
	public void insertAuthority(AuthorityVO authorityVO);
	
	//권한 조회
	public UserDTO readAuthority(long userNum);
	
	//아이디 찾기
	public String findMyId();
	
	//회원 리스트(only Admin)
	public List<UserDTO> getAllMember();
	
	//회원 리스트 페이징 처리
	public List<UserDTO> getAllMemberWithPaging(Criteria driteria);
	
	//회원 상태 처리(only Admin)
	public UserDTO updateMemberStatus(UserDTO memberStatus);
}
