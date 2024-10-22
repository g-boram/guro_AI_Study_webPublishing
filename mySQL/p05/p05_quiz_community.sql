drop database community;
create database community;
use community;


##### memberList #####
create table memberList (
seq		int 		unique key		auto_increment,
name	char(10)					not null	  ,
memID	char(20)	primary key		not null	  ,
tel		char(15)					null		  ,
regTM	timestamp					default now() 
);
insert into memberList values
(null, '바다', 'sea', '0102223333', '2022-07-12'),
(null, '망고', 'yellow', '0105556666', '2022-08-29'),
(null, '나무', 'tree', '0108889999', now());

select * from memberList;


##### clubFree #####
create table clubFree (
seq		int 		primary key		auto_increment,
memID	char(20)					not null	  ,
money	int							not	null	  ,
payTM	timestamp					not null
);
insert into clubFree values
(null, 'yellow', 20000, '2023-01-05'),
(null, 'sea', 20000, '2023-01-07'),
(null, 'sea', 25000, '2023-02-06'),
(null, 'yellow', 25000, '2023-02-10');

select * from clubFree;


CREATE VIEW joinView AS
SELECT c.seq, m.name, c.memID, c.money, c.payTM
FROM clubFree as c 
INNER JOIN memberList as m ON c.memID = m.memID order by seq desc;

select * From joinView;
drop view joinView;

