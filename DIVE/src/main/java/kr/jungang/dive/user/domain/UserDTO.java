package kr.jungang.dive.user.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserDTO {
	
	private long id;
	private String userId;
	private String password;
	private String name;
	private String nickName;
	private char sex;
	private String birthday;
	private String address;
	private String phone;
	private String email;
	private Date regDate;
	private Date updateDate;
	private boolean enabled;
	
	//연관속성 1:N 관계
	private List<AuthorityVO> authorityList;

	public UserDTO(String userId, String password, String name, char sex, String birthday, String address, String phone,
			String email) {
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.sex = sex;
		this.birthday = birthday;
		this.address = address;
		this.phone = phone;
		this.email = email;
	}

	public UserDTO(String userId, String password, String name) {
		this.userId = userId;
		this.password = password;
		this.name = name;
	}
	
	// insertUser Test용 Constructor
	public UserDTO(String userId, String password) {
		this.userId = userId;
		this.password = password;
	}

	// Update Test용
	public String updateUserPhone() {
		return "010-1234-5678";
	}

}
