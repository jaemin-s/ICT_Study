package com.spring.myweb.freeboard.mapper;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.spring.myweb.command.FreeBoardVO;

@ExtendWith(SpringExtension.class) //테스트 환경을 만들어 주는 junit5 객체 로딩
@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/config/db-config.xml"
})
public class FreeBoardMapperTest {

	@Autowired
	private IFreeBoardMapper mapper;
	
	//단위 테스트 (unit test) - 가장 작은 단위의 테스트
	//테스트 시나리오
	//- 단언 (Assertion) 기법
	
	@Test
	@DisplayName("Mapper 계층의 regist를 호출하면서 FreeBoardVO를 전달하면 데이터가 INSERT 된다")
	void registTest() {
		//given - when - then 패턴을 따릅니다. (생략가능)
		
		//given: 테스트를 위해 주어질 데이터 (ex: parameter)
		FreeBoardVO vo = new FreeBoardVO();
		vo.setTitle("두번째 글");
		vo.setWriter("abc1234");
		vo.setContent("ㄷㄷ");
		//when: 테스트 실제 상황
		mapper.regist(vo);
		//then: 테스트 결과를 확인
	}
	
	@Test
	@DisplayName("전체 글 목록을 조회하고, 조회된 글 개수를 파악")
	void getListTest() {
		List<FreeBoardVO> list = mapper.getList();
		
		list.forEach(vo -> System.out.println(vo));
		
//		assertEquals(1, list.size());
	}
	
	@Test
	@DisplayName("글 번호가 2번인 글을 조회")
	void getContentTest() {
		
		//given
		int bno = 1;
		//when
		FreeBoardVO vo =mapper.getContent(bno);
		
		System.out.println(vo);
	}
	
	@Test
	@DisplayName("글 번호가 1번인 글의 제목과 내용을 수정 후 다시 조회했을 때"
			+ " 제목이 수정한 제목으로 바뀌었음을 단언")
	void updateTest() {
		
		int bno = 1;
		
		FreeBoardVO vo = mapper.getContent(bno);
		vo.setTitle("new title2");
		
		mapper.update(vo);
		
		System.out.println(mapper.getContent(bno));
		assertEquals("new title2",mapper.getContent(bno).getTitle());
	}
	
	@Test
	@DisplayName("글 번호가 2번인 글을 삭제한 후에 리스트를 전체 조회했을 때"
			+ " 글의 개수는 1개일 것이고, 2번 글을 조회했을 때 null이 반환되어야 한다.")
	void deleteTest() {
		int bno = 2;
		
		mapper.delete(bno);
		
		assertNull(mapper.getContent(bno));
	}
	
}
