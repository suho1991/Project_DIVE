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
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/security-context.xml" })
@Log4j2
@FixMethodOrder(MethodSorters.NAME_ASCENDING) // test 오름차순으로 실행됨
public class UserMapperTests {
	@Setter(onMethod_ = @Autowired)
	private UserMapper userMapper;

	// 회원 가입
	@Test
	public void test_01_createUser() {
		try {
			UserVO newUser = new UserVO("USER_A", "USER_A");
			userMapper.createUser(newUser);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 아이디로 회원정보 검색
	@Test
	public void test_02_findById() {
		try {
			UserVO findId = userMapper.findById("MASTER");
			log.info(findId);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 회원정보 수정
	@Test
	public void test_03_updateUser() {
		try {
			UserVO updateUser = userMapper.findById("MASTER");
			updateUser.updateUserPhone();
			userMapper.updateUser(updateUser);
			log.info("수정완료");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 회원 탈퇴
	@Test
	public void test_04_deleteUser() {
		try {
			String deleteId = "USER";
			userMapper.deleteUser(deleteId);
			log.info(deleteId + "삭제완료");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//권한 조회
	@Test
	public void test_05_readAuthority() {
		UserVO userAuthority = userMapper.readAuthority("SUB");
		log.info(userAuthority);
		
		userAuthority.getAuthorityList().forEach(AuthorityVO -> log.info(AuthorityVO));
	}
}
