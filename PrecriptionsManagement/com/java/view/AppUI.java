package com.java.view;

import java.util.*;

public class AppUI {
	
	private static Scanner sc = new Scanner(System.in);
	
	public static String inputString() {
		return sc.nextLine();
	}//end inputString()
	
	public static int inputInteger() {
		int num = 0;
		try {
			num = sc.nextInt();
		} catch (InputMismatchException e) {
			System.out.println("정수로 입력해 주세요.");
		} finally {
			sc.nextLine();
		}
		return num;
	}//end inputInteger()
	
	//시작 화면 출력
	public static void startScreen() {
		System.out.println("\n========== 처방 관리 시스템 ==========");
		System.out.println("### 1. 1");
		System.out.println("### 2. 2");
		System.out.println("### 3. 3");
		System.out.println("### 4. 프로그램 종료");
		System.out.println("--------------------------------------");
		System.out.print(">>> ");
	}//end startScreen()
	
	//조회 서비스 화면 출력
	public static void menu1Screen() {
		System.out.println("\n========== 1번 메뉴 ==========");
		System.out.println("### 1. 1-1");
		System.out.println("### 2. 1-2");
		System.out.println("### 3. 첫 화면으로 가기");
		System.out.println("-----------------------------------");
		System.out.print(">>> ");
	}//end menu1Screen()
	
	//처방전 관리 화면 출력
	public static void menu2Screen() {
        System.out.println("\n========= 2번 메뉴 =========");
        System.out.println("### 1. 2-1");
        System.out.println("### 2. 2-2");
        System.out.println("### 3. 첫 화면으로 가기");
        System.out.println("----------------------------------------");
        System.out.print(">>> ");
    }//end menu2Screen()
	
	//영화 관리 시스템 화면 출력
	public static void menu3Screen() {
        System.out.println("\n========= 3번 메뉴 =========");
        System.out.println("### 1. 3-1");
        System.out.println("### 2. 3-2");
        System.out.println("### 3. 첫 화면으로 가기");
        System.out.println("----------------------------------------");
        System.out.print(">>> ");
    }//end menu3Screen()
	
} //end class