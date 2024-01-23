package com.music.mrs.rcmd.service;

import javax.servlet.http.HttpSession;

public interface IRcmdService {

	void searchKeyword(String keyword, String accessToken);

}
