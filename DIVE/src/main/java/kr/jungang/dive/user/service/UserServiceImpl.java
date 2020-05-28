package kr.jungang.dive.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.jungang.dive.user.domain.AuthorityVO;
import kr.jungang.dive.user.domain.UserDTO;
import kr.jungang.dive.user.persistence.UserMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service("UserService")
@AllArgsConstructor
//Controller와 Mapper사이 다리역할
public class UserServiceImpl implements UserService {
	@Setter(onMethod_ = @Autowired)
	private UserMapper userMapper;
	
	@Override
	public void createUser(UserDTO createUser) {
		userMapper.createUser(createUser);
		
		AuthorityVO authority = new AuthorityVO(createUser.getUserNum(), "ROLE_MEMBER");
		userMapper.insertAuthority(authority);
	}

	@Override
	public UserDTO findById(String id) {
		UserDTO findById = userMapper.findById(id);
		
		return findById;
	}

	@Override
	public boolean updateUser(UserDTO updateUser) {
		return userMapper.updateUser(updateUser);
	}

	@Override
	public boolean deleteUser(String id) {
		return userMapper.deleteUser(id);
	}
}
