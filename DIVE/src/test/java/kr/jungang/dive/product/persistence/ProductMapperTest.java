package kr.jungang.dive.product.persistence;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j2
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class ProductMapperTest {
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwEncoder;
	@Setter(onMethod_ = @Autowired)
	private ProductMapper productMapper;
	
	@Test
	public void testGetAll() {
		try {
			productMapper.getAllProduct().forEach(list -> log.info(list));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
