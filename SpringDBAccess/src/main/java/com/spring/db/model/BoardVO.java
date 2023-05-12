package com.spring.db.model;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
 CREATE TABLE JDbc_board(
	boARD_NO INT PRIMARY KEY AUTO_INCREMENT,
    Writer varchAR(30) NOT nULL,
    TITLE VARChar(100) not NULL,
    cONTeNT VArchar(2000),
    REG_DAtE DaTETIMe default curRENT_TIMESTAMP
);
 */
@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class BoardVO {
	
	private int boardNo;
	private String writer;
	private String title;
	private String content;
	private LocalDateTime regDate;

}
