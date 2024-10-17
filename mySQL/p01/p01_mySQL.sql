show databases;
create database p01_quiz_store;
# 데이터 베이스 사용하기
use p01_quiz_store;
drop database sample;

create table orderList (
num			int			primary key	,
item		char(30)	not null	,
unitPrice	int			null		,
price		int			null		,
cnt			int			null
);
insert into orderList values (3, '커피', 2500, 7500, 3);
select * from orderList;
 
drop table student;

# 테이블 데이터 정의 설명서
desc student;

# 자료 조회
select num, id, name, age, address from student;
select * from student;
select * from student order by num asc;

# 자료 입력
insert into student (num, id, age, name, address) 
values (1, 'tester01', 10, '테스터10', '경기도 남양주시');

insert into student values (2, 'id-2', 'moutain', 20, 'address-2');

# 수정, 삭제 하기 전 설정
set sql_safe_updates=0;

# 수정하기
update student set age=16;
update student set num=1 where id='id-1';

# 삭제하기
delete from student where num=1;

# Quiz02
create table goodList (
num			int			primary key,
code		char(5)		not null,
name		char(30)	not null,
price		int			null,
maker		char(20)	null,
cnt			int			null,
mfg			timestamp	default now()
);

insert into goodList values 
(1, 'A001', '디지털TV', 520000, '제일', 7, '2016-04-27'),
(2, 'A002', 'DVD', 240000, '제일', 4, '2016-06-08'),
(3, 'U101', 'DSLR', 830000, '우수', 8, '2015-12-19'),
(4, 'U102', '전자사전', 160000, '우수', 3, '2015-11-30'),
(5, 'H704', '전자렌지', 90000, '하나', 11, '2016-02-15');

select * from goodList;
