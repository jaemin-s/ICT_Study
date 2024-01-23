package com.spring.myweb.user.mapper;

import org.apache.ibatis.annotations.Param;

import com.spring.myweb.command.UserVO;
import com.spring.myweb.util.PageVO;

public interface IUserMapper {
	
	//아이디 중복 확인
	int idCheck(String id);
	
	//회원 가입
	void join(UserVO vo);
	
	//로그인
	String login(String id);
	
	//회원 정보 얻어오기
	UserVO getInfo(@Param("id") String id,@Param("paging") PageVO vo);
	
	//회원 정보 수정
	void updateUser(UserVO vo);
}
