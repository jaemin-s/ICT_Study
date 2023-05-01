package com.java.menu3.service;

import static com.java.view.AppUI.*;

import com.java.common.AppService;

public class ProductService implements AppService{

	@Override
	public void start() {
		while(true) {
			ProductScreen();
			int selection = inputInteger();
			switch (selection) {
			case 1: // 제품 등록
				System.out.println("menu3-1");
				break;
			case 2: // 제품 수정
				System.out.println("menu3-2");
				break;
			case 3: // 제품 삭제
				System.out.println("menu3-2");
				break;
			case 4:
				return;
			default:
				System.out.println("잘 못 입력했습니다.");
			}//end switch
			
		}//end while
		
	}//end start()

}//end class
