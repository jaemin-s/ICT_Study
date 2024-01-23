package com.music.mrs.plus.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import com.music.mrs.plus.mapper.IMusicplusMapper;

@Service
public class MusicplusService implements IMusicplusService {

	@Autowired
    private IMusicplusMapper mapper;
	
	
	@Override
	public void plus(String musicId) {
		try {
            mapper.plus(musicId);
        } catch (DuplicateKeyException e) {
        
        }
	}
	
	@Override
	public int getnum(String musicId) {
		Integer num = mapper.getnum(musicId);
		  if (num == null) {
		        num = 0;
		    }
		return num;
	}

}
