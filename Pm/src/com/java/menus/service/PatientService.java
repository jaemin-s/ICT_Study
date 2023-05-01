package com.java.menus.service;

import static com.java.view.AppUI.*;

import com.java.common.AppService;
import com.java.menus.domain.Patient;

public class PatientService implements AppService{

	@Override
	public void start() {
		while(true) {
			PatientScreen();
			int selection = inputInteger();
			switch (selection) {
			case 1: // 신규 환자 등록
				addPaient();
				break;
			case 2: // 처방전 작성
				addPrescription();
				break;
			case 3:
				return;
			default:
				System.out.println("잘 못 입력했습니다.");
			}//end switch
			
		}//end while
		
	}//end start()

	//신규 환자 등록
	private void addPaient() {
		System.out.println("\n============= 신규 환자 등록 ==============");
		System.out.println("이름: ");
		String name = inputString();
		
		System.out.println("주민등록번호: ");
		String id = inputString();
		
		System.out.println("주소: ");
		String address = inputString();
		
		System.out.println("전화번호: ");
		String phone = inputString();
		
		Patient paient = new Patient();
		paient.setPatientName(name);
		paient.setPatientId(id);
		paient.setPatientAddress(address);
		paient.setPatientPhone(phone);
		
		
		
		
	}//end addPrescription()

	//처방전 작성
	private void addPrescription() {
		System.out.println("\n============ 처방전 작성 =================");
		System.out.println("");
	}//end addPatient()

}//end class
