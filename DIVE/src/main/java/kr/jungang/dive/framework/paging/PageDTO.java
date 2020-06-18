package kr.jungang.dive.framework.paging;

import lombok.Data;

@Data
public class PageDTO {
	private static final int PAGING_LINK_AMOUNT = 10;
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	
	private Criteria cri;
	
	public PageDTO(int total, Criteria cri) {
		this.total = total;
		this.cri = cri;
		
		this.endPage = (int) (Math.ceil(cri.getPageNum() / (float) PAGING_LINK_AMOUNT)) * PAGING_LINK_AMOUNT;
		this.startPage = this.endPage - (PAGING_LINK_AMOUNT - 1);
		
		int realEnd = (int) (Math.ceil((float) total / cri.getAmount())); 
		
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd; 
	}
}
