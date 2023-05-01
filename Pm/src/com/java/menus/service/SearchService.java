package com.java.menus.service;

import com.java.common.AppService;
import com.java.menus.domain.*;

import static com.java.view.AppUI.*;

import java.util.List;

public class SearchService implements AppService{

	@Override
	public void start() {
		while(true) {
			SearchScreen();
			int selection = inputInteger();
			switch (selection) {
			case 1:
				showSearchPrescription();
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
	
	
	private List<Prescription> searchPrescription() {
		System.out.println("\n### 처방이력을 조회할 환자의 주민등록번호를 입력하세요.");
		System.out.println(">>> ");
		String patientId = inputString();
		return PrescriptionRepository.searchHistory(patientId);
	}
	
	//처방이력검색
	private void showSearchPrescription() {
		List<Prescription> prescriptions = searchPrescription();
		
		if(!prescriptions.isEmpty()) {
			System.out.println("\n========================== 처방이력 조회 결과 ==========================");
			for(Prescription prescription : prescriptions) {
				System.out.println(prescription);
			}
			
		}
		
	}


}//end class
