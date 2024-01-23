package com.music.mrs.user.service;

import com.music.mrs.command.UserVO;

public interface IUserService {

	 // 사용자를 데이터베이스에 추가하는 메서드
    void insert(UserVO data);
    
    int usersIdCall(UserVO data);
	
}
