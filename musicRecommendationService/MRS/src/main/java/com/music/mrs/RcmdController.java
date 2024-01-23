package com.music.mrs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.music.mrs.rcmd.service.IRcmdService;

@Controller
@RequestMapping("/rcmd")
public class RcmdController {
	
	@Autowired
	private IRcmdService service;

}
