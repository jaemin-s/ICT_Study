package com.java.menus.domain;

public class Ingredient {
	private int drugNumber;
	private String ingredient;
	
	public Ingredient() {}

	public Ingredient(int drugNumber, String ingredient) {
		super();
		this.drugNumber = drugNumber;
		this.ingredient = ingredient;
	}

	public int getDrugNumber() {
		return drugNumber;
	}

	public void setDrugNumber(int drugNumber) {
		this.drugNumber = drugNumber;
	}

	public String getIngredient() {
		return ingredient;
	}

	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}

	@Override
	public String toString() {
		return ingredient + " ";
	}
	
	
}
