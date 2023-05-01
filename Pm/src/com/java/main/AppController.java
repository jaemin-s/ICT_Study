package com.java.main;

import com.java.common.AppService;
import com.java.menus.service.*;

public class AppController {
	
private AppService service;
	
	//시스템을 정해주는 기능
	public void chooseSystem(int selectNumber) {
		switch (selectNumber) {
		case 1:
			service = new SearchService();
			break;
		case 2:
			service = new PatientService();
			break;
		case 3:
			service = new ProductService();
			break;
		case 4:
			System.out.println("# 프로그램을 종료합니다.");
			System.exit(0);
		default:
			System.out.println("# 메뉴를 다시 입력하세요.");
		}//end switch(selectNumber)
		
		service.start();
		
	}//end chooseSystem
	
}//end class
