package kr.jungang.dive.user.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.jungang.dive.user.domain.AuthorityVO;
import kr.jungang.dive.user.domain.UserDTO;
import kr.jungang.dive.user.persistence.UserMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
//Controller와 Mapper사이 다리역할
public class UserServiceImpl implements UserService {
	@Setter(onMethod_ = @Autowired)
	private UserMapper userMapper;
	
	@Override
	public void createUser(UserDTO createUser) {
		userMapper.createUser(createUser);
		
		AuthorityVO authority = new AuthorityVO(createUser.getId(), "ROLE_MEMBER");
		userMapper.insertAuthority(authority);
	}

	@Override
	public UserDTO findById(String userId) {
		UserDTO findById = userMapper.findById(userId);
		
		return findById;
	}

	@Override
	public boolean updateUser(UserDTO updateUser) {
		return userMapper.updateUser(updateUser);
	}

	@Override
	public UserDTO findMyId(String name, String email) {
		return userMapper.findMyId(name, email);
	}
	
	@Override
	public void changePassword(String password) {
		userMapper.changePassword(password);
	}
	
	@Override
	public List<UserDTO> getAllMember() {
		return userMapper.getAllMember();
	}

	@Override
	public UserDTO updateMemberStatus(UserDTO memberStatus) {
		return userMapper.updateMemberStatus(memberStatus);
	}
}
