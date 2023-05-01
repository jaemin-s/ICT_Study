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
		System.out.println("### 1. 조회 서비스");
		System.out.println("### 2. 환자 관리");
		System.out.println("### 3. 제품 관리");
		System.out.println("### 4. 프로그램 종료");
		System.out.println("--------------------------------------");
		System.out.print(">>> ");
	}//end startScreen()
	
	//1. 조회 서비스 화면 출력
	public static void SearchScreen() {
		System.out.println("\n========== 조회 서비스 ==========");
		System.out.println("### 1. 처방 이력 조회");
		System.out.println("### 2. 의약품 조회");
		System.out.println("### 3. 첫 화면으로 가기");
		System.out.println("-----------------------------------");
		System.out.print(">>> ");
	}//end SearchScreen()
	
	//2. 환자 관리 화면 출력
	public static void PatientScreen() {
        System.out.println("\n========= 환자 관리 =========");
        System.out.println("### 1. 신규 환자 등록");
        System.out.println("### 2. 처방전 작성");
        System.out.println("### 3. 첫 화면으로 가기");
        System.out.println("----------------------------------------");
        System.out.print(">>> ");
    }//end PaientScreen()
	
	//제품 관리 화면 출력
	public static void ProductScreen() {
        System.out.println("\n========= 제품 관리 =========");
        System.out.println("### 1. 제품 등록하기");
        System.out.println("### 2. 제품 정보수정");
        System.out.println("### 3. 제품 삭제하기");
        System.out.println("### 4. 첫 화면으로 가기");
        System.out.println("----------------------------------------");
        System.out.print(">>> ");
    }//end ProductScreen()
	
} //end class