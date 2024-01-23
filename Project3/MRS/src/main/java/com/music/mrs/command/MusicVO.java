package com.music.mrs.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//use music;
//
//CREATE TABLE users (
// users_id int PRIMARY KEY AUTO_INCREMENT,
// display_name VARCHAR(250) NOT NULL,
// email VARCHAR(250) NOT NULL unique 체크
//);
//
//SELECT * FROM users;
//SELECT * FROM reply;
//
//drop table reply;
//
//CREATE TABLE reply (
//rno INT PRIMARY KEY AUTO_INCREMENT,
//rmno int  NOT NULL,
//urno INT NOT NULL,
//rdisplay_name varchar(250) not null,
//reply_content VARCHAR(3000) NOT NULL,
//reg_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
//FOREIGN KEY (urno) REFERENCES users (users_id) ON DELETE CASCADE,
//FOREIGN KEY (rmno) REFERENCES musicplus (mno) ON DELETE CASCADE
//);
//
//CREATE TABLE musicplus (
//	mno INT PRIMARY KEY AUTO_INCREMENT,
// music_id varchar(250) not null unique 체크
//);


@Getter
@Setter
@ToString
public class MusicVO {

	private String currentTrack;
	
	private int rmno;
}
