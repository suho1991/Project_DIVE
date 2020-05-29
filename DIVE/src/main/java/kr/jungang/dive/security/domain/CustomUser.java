package kr.jungang.dive.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.jungang.dive.user.domain.UserDTO;
import lombok.Getter;

@SuppressWarnings("serial")
@Getter
public class CustomUser extends User {
	private UserDTO user;

	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

	public CustomUser(UserDTO userDTO) {
		super(userDTO.getId(), userDTO.getPassword(), userDTO.getAuthorityList().stream()
				.map(authority -> new SimpleGrantedAuthority(authority.getAuthority())).collect(Collectors.toList()));
		
		this.user = userDTO;
	}
	
}
