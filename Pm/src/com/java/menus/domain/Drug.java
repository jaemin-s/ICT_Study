package com.java.menus.domain;

public class Drug {
	private int drugNumber;
	private int drugPrice;
	private String companyName;
	private String drugName;
	private String ingredient;
	
	public Drug() {}

	public Drug(int drugNumber, int drugPrice, String companyName, String drugName, String ingredient) {
		super();
		this.drugNumber = drugNumber;
		this.drugPrice = drugPrice;
		this.companyName = companyName;
		this.drugName = drugName;
		this.ingredient = ingredient;
	}

	public int getDrugNumber() {
		return drugNumber;
	}

	public void setDrugNumber(int drugNumber) {
		this.drugNumber = drugNumber;
	}

	public int getDrugPrice() {
		return drugPrice;
	}

	public void setDrugPrice(int drugPrice) {
		this.drugPrice = drugPrice;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getDrugName() {
		return drugName;
	}

	public void setDrugName(String drugName) {
		this.drugName = drugName;
	}

	public String getIngredient() {
		return ingredient;
	}

	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}

	@Override
	public String toString() {
		return "제품 이름 = " + drugNumber + ", 가격 = " + drugPrice + ", 제조회사 = " + companyName
				+ ", 약 번호=" + drugName + "\n";
	}
	
	
	
}
