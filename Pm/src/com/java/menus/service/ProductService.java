package com.java.menus.service;

import static com.java.view.AppUI.*;

import com.java.common.AppService;
import com.java.menus.domain.Drug;
import com.java.menus.domain.Patient;
import com.java.menus.repository.DrugRepository;

public class ProductService implements AppService{
	
	private final DrugRepository drugRepository = new DrugRepository();
	
	@Override
	public void start() {
		while(true) {
			ProductScreen();
			int selection = inputInteger();
			switch (selection) {
			case 1: // 제품 등록
				addDrug();
				break;
			case 2: // 제품 수정
				fixDrug();
				System.out.println("menu3-2");
				break;
			case 3:
				return;
			default:
				System.out.println("잘 못 입력했습니다.");
			}//end switch
			
		}//end while
		
	}//end start()
	

	// 의약품 등록
	private void addDrug() {
		System.out.println("\n============= 의약품 등록 ==============");
		System.out.println("의약품 번호: ");
		int medNum  = inputInteger();
		
		System.out.println("의약품 이름: ");
		String medName = inputString();
		
		System.out.println("의약품 가격: ");
		int medPrice = inputInteger();
		
		System.out.println("제조회사: ");
		String comName = inputString();
		
		Drug drug = new Drug();
		drug.setDrugNumber(medNum);
		drug.setDrugName(medName);
		drug.setDrugPrice(medPrice);
		drug.setCompanyName(comName);
		
	}
	
	//의약품 수정
	private void fixDrug() {
		System.out.println("\n============= 의약품 수정 ==============");
		System.out.println("수정할 의약품 번호: ");
		int dNum = inputInteger();
		
		System.out.println("수정할 항목을 번호로 선택해 주세요.");
		System.out.println("1. 의약품 이름 | 2. 의약품 가격 | 3. 제조회사 ");
		int select = inputInteger();
		
		if(select == 2) {
			System.out.println("변경할 가격을 정수로 입력해주세요.");
			updateDrug(select,inputInteger());
		} else if(select == 1 || select == 3) {
			System.out.println("변경할 이름을 입력해주세요.");
			updateDrug(select,inputString());
		} else {
			System.out.println("잘 못 입력하였습니다.");
		}
		
	
	}
	

}//end class
