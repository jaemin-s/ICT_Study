package com.java.menus.service;

import com.java.common.AppService;
import com.java.menus.domain.*;
import com.java.menus.repository.PrescriptionRepository;
import com.java.menus.repository.DrugRepository;

import static com.java.menus.repository.PrescriptionRepository.*;
import static com.java.menus.repository.DrugRepository.*;
import static com.java.view.AppUI.*;

import java.util.List;

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
				showSearchPrescription();
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
	private List<Prescription> searchPrescription() {
		System.out.println("\n### 처방이력을 조회할 환자의 주민등록번호를 (-)를 포함하여 입력하세요.");
		System.out.print(">>> ");
		String patientId = inputString();
		return prescriptionRepository.searchHistory(patientId);
	}
	
	//처방이력검색 후 조회결과 출력
	private int showSearchPrescription() {
		List<Prescription> prescriptions = searchPrescription();
		
		if(!prescriptions.isEmpty()) {
			System.out.println("\n========================== 처방이력 조회 결과 ==========================");
			for(Prescription pre : prescriptions) {
				System.out.println(pre);
			}
		} else {
			System.out.println("\n### 조회 결과가 없습니다.");
		}
		
		return prescriptions.size();
	}
	
	//약 이름검색
	private void searchDrug() {
		String drugName = "";
		System.out.println("\n### 조회할 의약품 이름을 입력하세요.(약품이름의 일부를 입력해도 됩니다.)");
		System.out.print(">>> ");
		drugName = "'%" + inputString() + "%'";
		List<Drug> drugs = drugRepository.searchDrug(drugName);
		for(Drug d : drugs) {
			System.out.println(d);
		}
	}
	
	//약 이름 검색 후 조회결과 출력
//	private int showSearchDrug() {
//		List<Drug> drugs = searchDrug();
//		
//		if(!drugs.isEmpty()) {
//			System.out.println("\n========================== 의약품 조회 결과 ==========================");
//			for(Drug drug : drugs) {
//				System.out.println(drug);
//			}
//		} else {
//			System.out.println("\n### 조회 결과가 없습니다.");
//		}
//		
//		return drugs.size();
//	}


}//end class
