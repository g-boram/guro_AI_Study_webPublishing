create database p05_quiz_store;
use p05_quiz_store;

create table orderList (
num			int			primary key ,
item		char(30)	not null	,
unitPrice	int			null		,
price		int			null		,
cnt			int			null		
);

insert into orderList values 
(1, '햄버거', 6000, 12000, 2),
(2, '피자', 21000, 21000, 1),
(3, '커피', 2500, 7500, 3);


select * from orderList;