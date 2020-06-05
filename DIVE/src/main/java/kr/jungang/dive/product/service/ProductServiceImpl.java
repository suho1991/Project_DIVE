package kr.jungang.dive.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.jungang.dive.board.persistence.ReplyMapper;
import kr.jungang.dive.board.service.ReplyServiceImpl;
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
	public int registerProduct(ProductVO obj) {
		return productMapper.registerProduct(obj);
	}

	@Override
	public int updateProduct(ProductVO obj) {
		return productMapper.updateProduct(obj);
	}

	@Override
	public int deleteProduct(long id) {
		return productMapper.deleteProduct(id);
	}

}
