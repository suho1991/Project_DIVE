package kr.jungang.dive.user.mapper;

import java.util.stream.IntStream;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.jungang.dive.user.domain.AuthorityVO;
import kr.jungang.dive.user.domain.UserDTO;
import kr.jungang.dive.user.persistence.UserMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j2
@FixMethodOrder(MethodSorters.NAME_ASCENDING) // Test가 오름차순으로 실행됨
public class UserMapperTests {
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwEncoder;
	@Setter(onMethod_ = @Autowired)
	private UserMapper userMapper;

/*
	//회원 가입
	@Test
	public void test_01_createUser() {
		try {
			UserDTO newUser = new UserDTO("USER_B", "USER_B");
			userMapper.createUser(newUser);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
*/
	//아이디로 회원정보 검색
	@Test
	public void test_02_findById() {
		try {
			UserDTO findId = userMapper.findById("devcolton");
			log.info(findId);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
/*
	//회원정보 수정
	@Test
	public void test_03_updateUser() {
		try {
			UserDTO updateUser = userMapper.findById("MASTER");
			updateUser.updateUserPhone();
			userMapper.updateUser(updateUser);
			log.info("수정완료");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//권한 조회
	@Test
	public void test_05_readAuthority() {
		UserDTO userAuthority = userMapper.readAuthority(17);
		log.info(userAuthority);

		userAuthority.getAuthorityList().forEach(AuthorityVO -> log.info(AuthorityVO));
	}

	//회원 생성 테스트
	@Test
	public void test_06_createUser() {
		try {
			//for(int i = 0; i < 10; i++) {}를 아래와 같이 사용 가능
			IntStream.rangeClosed(11, 20).forEach(i -> {
				if (i < 18) {
					UserDTO obj = new UserDTO("user" + i, pwEncoder.encode("user" + i), "Lee" + i);
					userMapper.createUser(obj);
				} else if (i < 19) {
					UserDTO obj = new UserDTO("member" + i, pwEncoder.encode("user" + i), "Kim" + i);
					userMapper.createUser(obj);
				} else {
					UserDTO obj = new UserDTO("admin" + i, pwEncoder.encode("user" + i), "Hong" + i);
					userMapper.createUser(obj);
				}
			});
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//권한 부여 테스트
	@Test
	public void test_07_insertAuthority() {
		try {
			IntStream.rangeClosed(1, 10).forEach(i -> {
				if (i < 8) {
					AuthorityVO obj = new AuthorityVO(i, "ROLE_USER");
					userMapper.insertAuthority(obj);
				} else if (i < 9) {
					AuthorityVO obj = new AuthorityVO(i, "ROLE_MEMBER");
					userMapper.insertAuthority(obj);
				} else {
					AuthorityVO obj = new AuthorityVO(i, "ROLE_ADMIN");
					userMapper.insertAuthority(obj);
					obj = new AuthorityVO(i, "ROLE_MEMBER");
					userMapper.insertAuthority(obj);
				}
			});
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	*/
}
