package kr.jungang.dive.product.domain;

import java.util.Date;

import kr.jungang.dive.user.domain.UserDTO;
import lombok.Data;

@Data
public class ProductVO {
	private long id;
	private String title;
	private String description;
	private String writer;
	private long userNum;
	private long price;
	private String region;
	private Date regDate;
	private Date updateDate;
	private long likeCount;
	private long hitsCount;
	private boolean enabled;
	
	private UserDTO user;
}
