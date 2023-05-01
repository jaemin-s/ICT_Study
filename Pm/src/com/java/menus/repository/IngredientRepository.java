package com.java.menus.repository;

import java.sql.*;
import java.util.*;

import com.java.common.DataBaseConnection;
import com.java.menus.domain.*;

public class IngredientRepository {
	
	private DataBaseConnection connection = DataBaseConnection.getInstance();
	//등록
	public void addIngredient(Ingredient ing) {
		String sql = "INSERT INTO ingredients VALUES (?,?)";
	}
	//수정
	
	//삭제
	
	//조회
//	private int drugNumber;
//	private String ingredient;
}
