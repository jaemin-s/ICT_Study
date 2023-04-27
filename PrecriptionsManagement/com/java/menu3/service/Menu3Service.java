package com.java.menu3.service;

import static com.java.view.AppUI.*;

import com.java.common.AppService;

public class Menu3Service implements AppService{

	@Override
	public void start() {
		while(true) {
			menu3Screen();
			int selection = inputInteger();
			switch (selection) {
			case 1:
				System.out.println("menu3-1");
				break;
			case 2:
				System.out.println("menu3-2");
				break;
			case 3:
				return;
			default:
				System.out.println("잘 못 입력했습니다.");
			}//end switch
			
		}//end while
		
	}//end start()

}//end class
