package kr.jungang.dive.board.domain;

import org.springframework.web.util.UriComponentsBuilder;

import kr.jungang.dive.framework.paging.Criteria;
import lombok.Data;

@Data
public class PostCriteria extends Criteria {
	private String type;
	private String keyword;
	
	public String[] getTypeArr() {
		// type값이 null 이면 비어있는 문자열배열 반환, null이 아니라면  
		return type == null ? new String[] {} : type.split("");
 	}
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
					.queryParam("pageNum", this.pageNum)
					.queryParam("amount", this.amount)
					.queryParam("type", this.type)
					.queryParam("keyword", this.keyword);
		
		return builder.toUriString();
	}
}

