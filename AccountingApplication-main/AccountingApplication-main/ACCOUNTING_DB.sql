create database ACCOUNTING_APPLICATION

use ACCOUNTING_APPLICATION

create table [USER_ROLES] (
	ROLE_ID int primary key identity(1,1),
	ROLE_NAME varchar unique
)

create table [USERS] (
	USER_ID int primary key identity(1,1),
	USERNAME varchar(255) unique,
	PIN int,
	ACCOUNT_NUMBER int unique,
	BALANCE float,
	USER_ROLE int foreign key references USER_ROLES(ROLE_ID)
)

create table [TRANSFERS] (
	SENDER_ACCOUNT int foreign key references USERS(ACCOUNT_NUMBER),
	RECIEVER_ACCOUNT int foreign key references USERS(ACCOUNT_NUMBER),
	AMOUNT float,
	TRANSFER_DATE datetime default GETDATE()
)

create table [DEPOSITS] (
	USER_ID int foreign key references USERS(USER_ID),
	AMOUNT float,
	TRANSFER_DATE datetime default GETDATE()
)

create table [WITHDRAWS] (
	USER_ID int foreign key references USERS(USER_ID),
	AMOUNT float,
	TRANSFER_DATE datetime default GETDATE()
)