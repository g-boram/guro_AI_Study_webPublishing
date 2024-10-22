create database company;
use company;
SET SQL_SAFE_UPDATES = 0;


create table staffList(
num			int			not null,
id			char(10)			   ,
name		char(10)	not null,
age			int					,
aaddress	char(50)	not null,
primary key(id)		
);
desc	staffList;

insert into	staffList values
(1, 'test1', '테스터1', 27, '서울 서대문구'),
(2, 'guest', '게스트', 34, '경기도 과천시'),
(3, 'lemon', '관리자', 10, '대전시 중구');

insert into	staffList values (3, 'lemon', '관리자', 10, '대전시 중구');


select * from staffList order by num desc;

update staffList set age=30 where id='guest';

delete from staffList where num=1;

