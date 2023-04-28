package com.java.menu1.service;

import com.java.common.AppService;

import static com.java.view.AppUI.*;

public class SearchService implements AppService{

	@Override
	public void start() {
		while(true) {
			SearchScreen();
			int selection = inputInteger();
			switch (selection) {
			case 1:
				
				break;
			case 2:
				System.out.println("menu1-2");
				break;
			case 3:
				return;
			default:
				System.out.println("잘 못 입력했습니다.");
			}//end switch
			
		}//end while
		
	}//end start()


}//end class
