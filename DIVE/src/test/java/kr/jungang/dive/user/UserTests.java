package kr.jungang.dive.user;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.jungang.dive.user.domain.UserVO;
import kr.jungang.dive.user.persistence.UserMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
@FixMethodOrder(MethodSorters.NAME_ASCENDING) //test 오름차순으로 실행됨
public class UserTests {
	@Setter(onMethod_ = @Autowired)
	private UserMapper userMapper;

	//회원가입
	@Test
	public void test_01_createtUser() {
		try {
			UserVO newAccount = new UserVO("TEST", "TEST");
			userMapper.createtUser(newAccount);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//아이디로 회원정보 검색
	@Test
	public void test_02_findById() {
		try {
			UserVO findId = userMapper.findById("MASTER");
			log.info(findId);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
