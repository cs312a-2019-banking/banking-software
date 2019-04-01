CREATE SCHEMA BANK_APP;
USE BANK_APP;

CREATE TABLE USER(
	USER_ID INT PRIMARY KEY NOT NULL UNIQUE,
    USER_F_NAME VARCHAR(45),
    USER_L_NAME VARCHAR(45),
    USER_EMAIL VARCHAR(120),
    USER_TELEPHONE VARCHAR(20),
	USER_DATE_CREATED DATETIME NOT NULL
)ENGINE=INNODB;

CREATE TABLE ACCOUNT(
	ACCOUNT_NUMBER INT PRIMARY KEY NOT NULL UNIQUE,
    ACCOUNT_BALANCE FLOAT NOT NULL,
    ACCOUNT_TITLE VARCHAR(45),
	ACCOUNT_DATE_CREATED DATETIME NOT NULL,
    USER_ID INT NOT NULL,
    FOREIGN KEY (USER_ID) REFERENCES USER(USER_ID) ON UPDATE CASCADE
)ENGINE=INNODB;

CREATE TABLE TRANSACTION(
	TRANSACTION_NUM INT PRIMARY KEY NOT NULL UNIQUE,
    TRANSACTION_AMOUNT FLOAT NOT NULL,
    TRANSACTION_DESSCRIPTION VARCHAR(20),
    TRANSACTION_DATE DATETIME NOT NULL,
    TRANSACTION_TYPE VARCHAR(30) NOT NULL,
    TRANSACTION_TAG VARCHAR(45),
    ACCOUNT_NUMBER INT NOT NULL,
	FOREIGN KEY (ACCOUNT_NUMBER) REFERENCES ACCOUNT(ACCOUNT_NUMBER) ON UPDATE CASCADE
)ENGINE=INNODB;

CREATE TABLE SETTINGS(
	USER_ID INT PRIMARY KEY,
    USER_TAGS JSON,
    SETTINGS_SEND_EMAILS BOOL,
    FOREIGN KEY (USER_ID) REFERENCES USER(USER_ID) ON UPDATE CASCADE
)ENGINE=INNODB;

/*
format for user_tags json
	{ "tags" : ["tag1", "tag2", "tag3"]}
*/

/*
CREATE TRIGGER USER_SETTING
*/
