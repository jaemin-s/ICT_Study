package com.spring.db.common;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.spring.db.model.ScoreVO;

public class ScoreMapper implements RowMapper<ScoreVO>{
	
	@Override
	public ScoreVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		System.out.println("mapRow 메서드 호출");
		System.out.println("rowNum: "+rowNum);
		
		ScoreVO vo = new ScoreVO(
				rs.getInt("stu_id"),
				rs.getString("stu_name"),
				rs.getInt("kor"),
				rs.getInt("eng"),
				rs.getInt("math"),
				rs.getInt("total"),
				rs.getDouble("average")
				);
		return vo;
	}
	
	
}
