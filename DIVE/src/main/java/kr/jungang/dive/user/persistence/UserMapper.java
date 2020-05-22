package kr.jungang.dive.user.persistence;

import kr.jungang.dive.user.domain.AuthorityVO;
import kr.jungang.dive.user.domain.UserVO;

public interface UserMapper {
	//ȸ�� ����
	public void createUser(UserVO createUserVO);
	
	//���̵�� ȸ�� ���� �˻�
	public UserVO findById(String id);
	
	//ȸ������ ����
	public void updateUser(UserVO updateUserVO);
	
	//ȸ�� Ż��
	public void deleteUser(String id);

	//���� �Է� Test��
	public void insertAuthority(AuthorityVO authorityVO);
	
	//권한 조회
	public UserVO readAuthority(long userNum);
}
