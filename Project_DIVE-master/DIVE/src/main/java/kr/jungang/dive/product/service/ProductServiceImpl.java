package kr.jungang.dive.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.jungang.dive.framework.domain.AttachVO;
import kr.jungang.dive.framework.persistence.AttachMapper;
import kr.jungang.dive.product.domain.ProductCriteria;
import kr.jungang.dive.product.domain.ProductVO;
import kr.jungang.dive.product.persistence.ProductMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {
	@Setter(onMethod_ = @Autowired)
	private ProductMapper productMapper;
	
	@Setter(onMethod_ = @Autowired)
	private AttachMapper attachMapper;
	
	@Override
	public List<ProductVO> getAllProduct() {
		return productMapper.getAllProduct();
	}

	@Override
	public ProductVO findById(long id) {
		return productMapper.findById(id);
	}

	@Override
	public int getTotCount(ProductCriteria obj) {
		return productMapper.getTotCount(obj);
	}

	@Override
	public List<ProductVO> getWithPagingProduct(ProductCriteria obj) {
		return productMapper.getWithPagingProduct(obj);
	}

	@Override
	public void registerProduct(ProductVO obj) {
		productMapper.registerProduct(obj);
		if(obj.hasAttach()) {
			obj.getListAttach().forEach(attach -> {
				attach.setOwnerId(obj.getId());
				attach.setOwnerType(obj.getClass().getName());
				attachMapper.insertAttach(attach);
			});
		}
	}
	
	@Override
	public List<AttachVO> getAttachList(long id) {
		return attachMapper.findByOwner(id, ProductVO.class.getName());
	}
	
	@Override
	public boolean updateProduct(ProductVO obj) {
		attachMapper.deleteAll(obj.getId(), ProductVO.class.getName());
		boolean modifyResult = productMapper.updateProduct(obj) == 1;
		if (modifyResult && obj.hasAttach()) {
			obj.getListAttach().forEach(attach ->{
				attach.setOwnerId(obj.getId());
				attach.setOwnerType(ProductVO.class.getName());
				attachMapper.insertAttach(attach);
			});
		}
		return modifyResult;
	}

	@Override
	public int deleteProduct(long id) {
		return productMapper.deleteProduct(id);
	}

	
	


}
