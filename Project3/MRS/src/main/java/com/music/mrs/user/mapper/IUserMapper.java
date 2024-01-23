package com.music.mrs.user.mapper;


import com.music.mrs.command.UserVO;


public interface IUserMapper {

	 // 사용자를 데이터베이스에 추가하는 메서드
    void insert(UserVO data);
    
    int usersIdCall(UserVO data);
}
