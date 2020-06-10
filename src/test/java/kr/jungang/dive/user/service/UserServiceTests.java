package kr.jungang.dive.user.service;

import static org.junit.Assert.assertNotNull;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.jungang.dive.user.domain.UserDTO;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
						"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j2
@FixMethodOrder(MethodSorters.NAME_ASCENDING) // test 오름차순으로 실행됨
public class UserServiceTests {
	@Setter(onMethod_ = @Autowired)
	private UserService userService;

	//userService와 잘 연결되었는 확인
	@Test
	public void test_01_userServiceExist() {
		log.info("assertNotNull Message: " + userService);
		assertNotNull(userService);
	}

	//회원 가입
	@Test
	public void test_02_createUserService() {
		UserDTO createUser = new UserDTO();
		createUser.setUserId("jokerb");
		createUser.setPassword("joker");
		createUser.setName("a");
		createUser.setNickName("a");
		createUser.setSex('a');
		createUser.setBirthday("123156");
		createUser.setAddress("a");
		createUser.setPhone("a");
		createUser.setEmail("a");
		log.info("check" + createUser.getId());
		try {
			userService.createUser(createUser);
		} catch (Exception e) {
			e.printStackTrace();
		}
		log.info("success!" + createUser.getId());
	}

	//My Page(아이디로 정보 조회)
	@Test
	public void test_03_findByIdService() {
		try {
			UserDTO myInfo = userService.findById("a");
			log.info(myInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//회원 정보 수정
	@Test
	public void test_04_updateUserService() {
		UserDTO updateDTO = userService.findById("jokerb");
		updateDTO.setPassword("Killer");
		boolean count = userService.updateUser(updateDTO);
		log.info(count + "건 수정 완료");
	}
	
}
