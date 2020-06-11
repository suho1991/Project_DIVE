package kr.jungang.dive.board.mapper;

import java.util.List;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.jungang.dive.board.domain.PostVO;
import kr.jungang.dive.board.persistence.PostMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j2
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class PostMapperTest {
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwEncoder;
	@Setter(onMethod_ = @Autowired)
	private PostMapper postMapper;
	
	@Test
	public void testGetAll() {
		try {
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
