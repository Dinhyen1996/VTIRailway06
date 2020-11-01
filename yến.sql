DROP DATABASE IF EXISTS testing_system;
CREATE DATABASE testing_system;

USE testing_system;

DROP TABLE IF EXISTS department;
CREATE TABLE if not EXISTS department(
	 department_id           TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	 department_name         VARCHAR(50),
	 `description`           TEXT
	);

DROP TABLE IF EXISTS `position` ;
CREATE TABLE `position` (
	 Position_id            TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	 Position_name          VARCHAR(50) UNIQUE NOT NULL,
     `description`          TEXT
 );
 DROP TABLE IF EXISTS  `Account`;
 CREATE TABLE `account` (
	 account_id          TINYINT UNSIGNED PRIMARY KEY,
	 emali               VARCHAR(50) UNIQUE NOT NULL,
	 use_name            NVARCHAR(50) UNIQUE KEY,
	 full_name           NVARCHAR(100)  NOT NULL,
	 department_id       TINYINT UNSIGNED,
	 position_id         TINYINT UNSIGNED ,
	 create_date         DATE,
     FOREIGN KEY (department_id) REFERENCES department(department_id),
     FOREIGN KEY (position_id) REFERENCES `position`(position_id)
 );
 DROP TABLE IF EXISTS `group`;
 CREATE TABLE `group`(
	 group_id         TINYINT UNSIGNED PRIMARY KEY,
	 groud_name       NVARCHAR(100) NOT NULL,
	 creator_id       TINYINT UNSIGNED,
	 create_date      DATE,
     FOREIGN KEY (creator_id) REFERENCES `account`(account_id)
     
	 );
 DROP TABLE IF EXISTS group_account;
 CREATE TABLE groupaccount(
	 group_id         TINYINT UNSIGNED,
	 account_id       TINYINT UNSIGNED,
	 join_date        DATE,
     FOREIGN KEY (group_id) REFERENCES `group`(group_id),
     FOREIGN KEY (account_id) REFERENCES `account`(account_id),
     PRIMARY KEY( group_id , account_id)
     
	 );
 DROP TABLE IF EXISTS typeQuestion; 
 CREATE TABLE typeQuestion (
	 type_id           TINYINT UNSIGNED,
	 type_name         ENUM('essay',"multiple-choice")
	);
 DROP TABLE IF EXISTS categoryQuestion;
 CREATE TABLE categoryQuestion(
	 category_id       TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	 categoty_name     TEXT
	 );
 DROP TABLE IF EXISTS question;
 CREATE TABLE question(
	 question_id        TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT ,
	 content            TEXT,
	 category_id        TINYINT UNSIGNED ,
	 type_id            TINYINT UNSIGNED,
	 creator_id         TINYINT UNSIGNED,
	 create_date         DATE,
      FOREIGN KEY (category_id   ) REFERENCES `categoryQuestion`(category_id)     
);
DROP TABLE IF EXISTS answer;
CREATE TABLE answer(
	answer_id          TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	content            TEXT,
	question_id        TINYINT UNSIGNED ,
	iscorrect          INT,
     FOREIGN KEY (question_id) REFERENCES `question`(question_id)
    );
CREATE TABLE exam(
	exam_id       TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	`code`        VARCHAR(10),
	title         VARCHAR(50) UNIQUE KEY,
	categoty_id    TINYINT UNSIGNED,
	durarion       DATE,
	creator_id     TINYINT UNSIGNED,
	create_date    DATE
	);
CREATE TABLE examQuestion(
	exam_id       TINYINT UNSIGNED,
	Question_id   TINYINT UNSIGNED,
	PRIMARY KEY(exam_id,Question_id),
     FOREIGN KEY (exam_id) REFERENCES `exam`(exam_id),
     FOREIGN KEY (Question_id) REFERENCES `Question`(Question_id)
	);
