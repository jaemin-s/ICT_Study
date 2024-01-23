package com.music.mrs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.music.mrs.command.MusicVO;
import com.music.mrs.command.ReplyVO;
import com.music.mrs.command.UserVO;
import com.music.mrs.plus.service.IMusicplusService;
import com.music.mrs.reply.service.IReplyService;
import com.music.mrs.user.mapper.IUserMapper;

/*CREATE TABLE reply (
		   rno INT PRIMARY KEY AUTO_INCREMENT,
		   wrno INT,
		   
		   reply_content VARCHAR(3000) NOT NULL,
		   reg_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
		   FOREIGN KEY (wrno) REFERENCES users (users_id) ON DELETE CASCADE
		);

		CREATE TABLE play(
			playno INT PRIMARY KEY AUTO_INCREMENT,
		    playid VARCHAR(250) NOT NULL 
		);*/



@RestController
public class ReplyController {

	@Autowired
	private IReplyService service;
	
	@Autowired
	private IMusicplusService mservice;
	
	
	//댓글 등록
	@PostMapping("/regist")
	public String replyRegist(@RequestBody ReplyVO vo,HttpSession session){
		
		int rmno = (int) session.getAttribute("rmno");
		System.out.println(rmno);
		UserVO uservo = (UserVO) session.getAttribute("userinfo");
		System.out.println(uservo);
		System.out.println(vo.getReplyContent());
		service.replyRegist(rmno,vo, uservo);
		return "Success";
	}
	
	//글 목록 불러오기
	@GetMapping("/getList/{rmno}/{pageNum}")
	public Map<String, Object> getList(@PathVariable int rmno,@PathVariable int pageNum,HttpSession session){
		
		
		System.out.println("musicnum 테스트" + rmno);
		List<ReplyVO> list = service.getList(rmno,pageNum);
		int total = service.getTotal(rmno);
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("total", total);
		
		return map;
	}
	
	@PutMapping("/update/{rno}")
	public ResponseEntity<String> update(@PathVariable int rno, @RequestBody ReplyVO replyContent,HttpSession session) {
		int urno = (int) session.getAttribute("urno");
		ReplyVO reply = service.getrno(rno);
		System.out.println("urno 테스트" + urno);
		System.out.println("replyContent 테스트" + replyContent);
		reply.setReplyContent(replyContent.getReplyContent());
		try {
		service.update(reply,urno);
			return ResponseEntity.ok("success");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Update failed");
		}
	}
	
	@DeleteMapping("/delete/{rno}")
	public ResponseEntity<String> delete(@PathVariable int rno,HttpSession session) {
		int urno = (int) session.getAttribute("urno");
		System.out.println("urno 테스트" + urno);
		try {
		service.delete(rno,urno);
		return ResponseEntity.ok("success");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Delete failed");
		}
	}
	
}
