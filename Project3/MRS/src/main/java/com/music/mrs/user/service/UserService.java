package com.music.mrs.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import com.music.mrs.command.UserVO;
import com.music.mrs.user.mapper.IUserMapper;

@Service
public class UserService implements IUserService {

	@Autowired
    private IUserMapper mapper;
	
	@Override
	public void insert(UserVO data) {
//		System.out.println("insert data" + data);
		 try {
	            mapper.insert(data);
	        } catch (DuplicateKeyException e) {
	            // 이미 중복된 이메일이 있는 경우 아무 것도 하지 않습니다.
	        }
	}
	
	@Override
	public int usersIdCall(UserVO data) {
//		System.out.println("userIdCall data"+data);
		return mapper.usersIdCall(data);
	}

}
