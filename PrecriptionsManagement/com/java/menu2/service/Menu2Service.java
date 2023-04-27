package com.java.menu2.service;

import static com.java.view.AppUI.*;

import com.java.common.AppService;

public class Menu2Service implements AppService{

	@Override
	public void start() {
		while(true) {
			menu2Screen();
			int selection = inputInteger();
			switch (selection) {
			case 1:
				System.out.println("menu2-1");
				break;
			case 2:
				System.out.println("menu2-2");
				break;
			case 3:
				return;
			default:
				System.out.println("잘 못 입력했습니다.");
			}//end switch
			
		}//end while
		
	}//end start()

}//end class
