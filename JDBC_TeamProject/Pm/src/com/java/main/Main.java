package com.java.main;

import static com.java.view.AppUI.*;
public class Main {

	public static void main(String[] args) {
		
		AppController controller = new AppController();
		
		while(true) {
			startScreen();
			int selectNumber = inputInteger();
			controller.chooseSystem(selectNumber);
		}//end while
		
	}//end main

}//end class
