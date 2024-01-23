use music;



CREATE TABLE users (
	user_id VARCHAR(30) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_pw VARCHAR(1000) NOT NULL,
    user_name VARCHAR(100) NOT NULL,
    user_email1 VARCHAR(100) NOT NULL,
    user_email2 VARCHAR(100) NOT NULL,
    user_phone int
);

CREATE TABLE board (
	bno INT PRIMARY KEY AUTO_INCREMENT,
    writer VARCHAR(30) NOT NULL,
    title VARCHAR(100) NOT NULL,
    content VARCHAR(3000),
    reg_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE reply (
	rno INT PRIMARY KEY AUTO_INCREMENT,
    bno INT,
    
    FOREIGN KEY (bno) 
    REFERENCES freeboard(bno)
    ON DELETE CASCADE,
    
    reply_id VARCHAR(30) NOT NULL,
    reply_content VARCHAR(3000) NOT NULL,
    reply_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_date DATETIME DEFAULT NULL
);

CREATE TABLE playlist(
	mno INT PRIMARY KEY AUTO_INCREMENT,
	music_name VARCHAR(100) NOT NULL,
    singer VARCHAR(300) NOT NULL,
    vidio_id VARCHAR(100) NOT NULL
);


