package kr.jungang.dive.framework.paging;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class Criteria {
	protected int pageNum;
	protected int amount;
	
	private String type;
	private String keyword;

	public Criteria() {
		this(1,16);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public Criteria(int pageNum, int amount, String type, String keyword) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.type = type;
		this.keyword = keyword;
	}
	
	public String[] getTypeArr() {
		// type이 null이면 비어 있는 문자열 배열 반환, null아니면 문자열을 낱개로 쪼개서 반환한다.
		// split("") : 문자열 자르기
		return type == null ? new String[] {} : type.split("");
	}
	
	// 품질 향상
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		return builder.toUriString();
	}

}
