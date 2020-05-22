package kr.jungang.dive.user.domain;

import lombok.Data;

@Data
public class AuthorityVO {
	private long userNum;
	private String authority;
	
	public AuthorityVO(long userNum, String authority) {
		this.userNum = userNum;
		this.authority = authority;
	}
}
