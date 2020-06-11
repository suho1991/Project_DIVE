package kr.jungang.dive.framework.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.jungang.dive.framework.domain.AttachVO;
import kr.jungang.dive.product.domain.ProductVO;

public interface AttachMapper {
	public List<AttachVO> findByOwner(@Param("ownerId") long ownerId, @Param("ownerType") String ownerType);
	
	public AttachVO findByOwnerItem(@Param("ownerId") long ownerId, @Param("ownerType") String ownerType);
	
	public void insertAttach(AttachVO obj);
	
	public void deleteAttach(AttachVO obj);
	
	public void deleteAll(@Param("ownerId") long ownerId, @Param("ownerType") String ownerType);
	
	public List<AttachVO> getOldFiles(@Param("listProduct") List<ProductVO> listProduct, @Param("ownerType") String ownerType);
}
