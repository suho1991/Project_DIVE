package kr.jungang.dive.product.domain;

import java.util.Date;
import java.util.List;

import kr.jungang.dive.framework.domain.AttachVO;
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
	private List<AttachVO> listAttach;
	
	private AttachVO productImg;

	
	public boolean hasAttach() {
		return listAttach != null && !listAttach.isEmpty();
	}
}
