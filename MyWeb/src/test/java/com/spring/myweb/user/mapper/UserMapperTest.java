package com.spring.myweb.user.mapper;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.spring.myweb.command.UserVO;

@ExtendWith(SpringExtension.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/config/db-config.xml")
public class UserMapperTest {

	@Autowired
	private IUserMapper mapper;

	@Test
	@DisplayName("회원가입 성공")
	void registTest() {
		UserVO vo = new UserVO();
		vo.setUserId("abc123");
		vo.setUserPw("aaa111");
		vo.setUserName("홍길동");
		
		mapper.join(vo);
	}
	
	@Test
	@DisplayName("존재하는 회원 아이디를 조회했을 ㅅ ㅣ1이 리턴")
	void checkIdTest() {
		String id = "abc123";
		
		assertEquals(1,mapper.idCheck(id));
	}
	
	@Test
	@DisplayName("존재하는 회원 아이디와 올바른 비밀번호를 입력했을 시 회원 정보가 리턴")
	void loginTest() {
		String id = "abc123";
		String pw = "aaa111";
		
		UserVO vo = mapper.login(id, pw);
		
		assertNotNull(vo);
	}
	
	@Test
	@DisplayName("존재하지 않는 회원의 아이디를 입력하면 null이 온다")
	void getInfoTest() {
		String id = "zxy987";
		
		assertNull(mapper.getInfo(id));
		
	}
	
	@Test
	@DisplayName("id를 제외한 회원의 정보를 수정할 수 있다.")
	void updateTest() {
		String id = "abc123";
		String pNum = "010-1234-1324";
		UserVO vo = mapper.getInfo(id);
		vo.setUserPhone1(pNum);
			
		mapper.updateUser(vo);
		assertEquals(pNum, mapper.getInfo(id).getUserPhone1());
				
	}
}
