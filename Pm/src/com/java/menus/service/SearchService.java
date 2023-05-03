package com.java.menus.service;

import com.java.common.AppService;
import com.java.menus.repository.PrescriptionRepository;
import com.java.menus.repository.DrugRepository;

import static com.java.view.AppUI.*;


public class SearchService implements AppService{
	
	private final PrescriptionRepository prescriptionRepository = new PrescriptionRepository();
	private final DrugRepository drugRepository = new DrugRepository();
	
	@Override
	public void start() {
		while(true) {
			SearchScreen();
			int selection = inputInteger();
			switch (selection) {
			case 1:
				searchPrescription();
				break;
			case 2:
				searchDrug();
				break;
			case 3:
				return;
			default:
				System.out.println("잘 못 입력했습니다.");
			}//end switch
			
		}//end while
		
	}//end start()  입력변수

	

	//처방이력 검색
	private void searchPrescription() {
		System.out.println("\n### 처방이력을 조회할 환자의 주민등록번호를 (-)를 포함하여 입력하세요.");
		System.out.print(">>> ");
		String patientId = inputString();
		prescriptionRepository.searchHistory(patientId);
	}
	

	//약 이름검색
	private void searchDrug() {
		String drugName = "";
		System.out.println("\n### 조회할 의약품 이름을 입력하세요.(약품이름의 일부를 입력해도 됩니다.)");
		System.out.print(">>> ");
		drugName = "'%" + inputString() + "%'";
		drugRepository.searchDrug(drugName);
	}
	



}//end class
