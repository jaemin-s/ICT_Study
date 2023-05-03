package com.java.menus.service;

import static com.java.view.AppUI.*;

import com.java.common.AppService;
import com.java.menus.domain.Drug;
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

		System.out.print("의약품 이름: ");
		String medName = inputString();
		
		System.out.print("의약품 가격(정수로 입력,원): ");
		int medPrice = inputInteger();
		if(medPrice == 0) {
			System.out.println("잘 못 입력했습니다");
			return;
		}
		
		System.out.print("주요 성분: ");
		String ingredient = inputString();
		
		System.out.print("제조회사: ");
		String comName = inputString();
		
		Drug drug = new Drug();
		drug.setDrugName(medName);
		drug.setDrugPrice(medPrice);
		drug.setIngredient(ingredient);
		drug.setCompanyName(comName);
		
		drugRepository.insertDrug(drug);
		System.out.println(drugRepository.searchDrug("'"+medName+"'")); 
	}
	
	//의약품 수정
	private void fixDrug() {
		System.out.println("\n============= 의약품 수정 ==============");
		System.out.print("수정할 의약품 번호: ");
		int dNum = inputInteger();
		String dName = drugRepository.searchDrugName(dNum);
		if(dName.equals("")) {
			System.out.println("없는 제품입니다.");
			return;
		}
		if(dNum == 0) {
			System.out.println("잘 못 입력했습니다");
			return;
		}
		System.out.println(drugRepository.searchDrug("'"+dName+"'")); 
		
		System.out.println("수정할 항목을 번호로 선택해 주세요.");
		System.out.println("1. 의약품 이름 | 2. 의약품 가격 | 3. 제조회사 ");
		int select = inputInteger();
		
		if(select == 1) {
			System.out.print("변경할 이름을 입력해주세요. : ");
			String after = "drug_name = \'"+inputString()+"\'";
			drugRepository.updateDrug(dNum,after);
		} else if(select == 2) {
			System.out.println("변경할 가격을 입력해주세요.(정수만) : ");
			String after = "drug_price = "+inputInteger();
			drugRepository.updateDrug(dNum,after);
		} else if(select == 3) {
			System.out.print("변경할 회사이름을 입력해주세요. : ");
			String after = "company_name = \'"+inputString()+"\'";
			drugRepository.updateDrug(dNum,after);
		}else {
			System.out.println("잘 못 입력하였습니다. ");
		}
		
	
	}
	

}//end class
