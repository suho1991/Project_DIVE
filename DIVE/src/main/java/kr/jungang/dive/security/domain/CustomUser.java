package kr.jungang.dive.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.jungang.dive.user.domain.UserVO;
import lombok.Getter;

@Getter
public class CustomUser extends User {
	private static final long serialVersionUID = 1L;

	private UserVO user;

	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

	public CustomUser(UserVO userVo) {
		super(userVo.getId(), userVo.getPassword(), userVo.getAuthorityList().stream()
				.map(authority -> new SimpleGrantedAuthority(authority.getAuthority())).collect(Collectors.toList()));
		
		this.user = userVo;
	}
}
