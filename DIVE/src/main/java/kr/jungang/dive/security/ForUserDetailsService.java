package kr.jungang.dive.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.jungang.dive.security.domain.CustomUser;
import kr.jungang.dive.user.domain.UserVO;
import kr.jungang.dive.user.persistence.UserMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
public class ForUserDetailsService implements UserDetailsService {
	@Setter(onMethod_ = @Autowired)
	private UserMapper userMapper;
	
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		log.warn("Load User By UserName: " + userName);
		
		UserVO userVO = userMapper.findById(userName);
		log.warn("queried by member mapper: " + userVO);
		
		return userVO == null ? null : new CustomUser(userVO);
	}

}
