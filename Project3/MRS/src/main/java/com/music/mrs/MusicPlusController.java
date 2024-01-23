package com.music.mrs;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.music.mrs.command.MusicVO;
import com.music.mrs.plus.service.IMusicplusService;



@RestController
public class MusicPlusController {

	@Autowired
	private IMusicplusService service;
		
	@PostMapping("/plus")
	public ResponseEntity<Void> plus(@RequestBody MusicVO currentTrack,HttpSession session) {
		System.out.println(currentTrack.getCurrentTrack());
		String musicId = currentTrack.getCurrentTrack();
		service.plus(musicId);
		int rmno = service.getnum(musicId);
		session.setAttribute("rmno", rmno);
		
		// 요청 처리 로직 추가
        return ResponseEntity.ok().build();
	}
	
	
	
	public ModelAndView getnum(String musicId) {
		System.out.println("mno 테스트" + musicId);
		int musicnum = service.getnum(musicId);
		
		ModelAndView mav = new ModelAndView("detail.jsp");
	    mav.addObject("musicnum", musicnum);
		return mav;
	}
	
	@PostMapping("/getrmno")
	public ResponseEntity<Map<String, Integer>> getrmno(@RequestBody MusicVO currentTrack) {
		System.out.println("rmno 단 테스트" + currentTrack.getCurrentTrack());
		String musicId = currentTrack.getCurrentTrack();
		int rmno =  service.getnum(musicId);
		Map<String, Integer> responseMap = new HashMap<>();
	    responseMap.put("rmno", rmno);

	    return ResponseEntity.ok(responseMap);
		
	}
	
	
}
