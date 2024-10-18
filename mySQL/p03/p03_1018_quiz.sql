create database studyManager;
use studyManager;

create table memInfo (
seq			int			not null		auto_increment,
name		char(5)		null 						  ,
userid 		char(15)	not null 					  ,
email		char(30)	not null					  ,	
tel1		char(4)		null						  ,
tel2		char(4)		null 						  ,
tel3		char(4)		null 						  ,
age			int			null 						  ,
address		char(50)	null 						  ,
joinTM		timestamp					default now() ,
constraint primary key(userid, email),
constraint unique key(seq)
);

desc memInfo;
drop table memInfo;
set sql_safe_updates=0;

# 1. [테이블 명세]와 [입력자료]를 참조하여 테이블을 구현하고 전체자료를 입력하세요.
insert into memInfo (name, userid, email, tel1, tel2, tel3, age, address, joinTM) values 
('한규준', 'hjoon', 'you@naver.com', '010', '1111', '1234', 32, '서울시 서초구 방배2동', '2021-02-03'),
('피터', 'peter', 'momo@daum.net', '011', '2222', '2234', NULL, '경기도 성남시 야탑동 100', '2021-02-04'),
('박희진', 'park', 'phj@google.com', '010', '3333', '3234', 32, '인천시 연수구 청학동', NULL),
('토르', 'thor', '', '019', '4444', '4234', 36, '서울시 중랑구 상봉동 99', '2021-03-11'),
('최주연', 'joyeon', 'great4@apple.com', '010', '5555', '5234', 49, '서울시 마포구 망원동', '2021-05-29'),
('유채연', 'yuchea', 'bchae@daum.net', '010', '6666', '6234', 32, '', '2021-06-14'),
('스타크', 'stark', 'tony@stark.com', '017', '7777', '7234', 54, '대전시 유성구 구성동', '2021-09-03');

# 2. memInfo 테이블의 전체자료를 조회하세요.
select * from memInfo order by seq asc;

# 3. 토르의 이메일 주소에 "thor@naver.com" 데이터를 입력하세요.
update memInfo set email='thor@naver.com' where name='토르';

# 4. 아이디 컬럼에 있는 "yuchae" 데이터의 주소 컬럼에 저장된 공백데이터를 "경기도 고양시 마두동"으로 수정하세요.
update memInfo set address='경기도 고양시 마두동' where userid='yuchea';

# 5. tel1의 자료에서 "010"이 아닌 데이터를 모두 "010"으로 수정하세요.
update memInfo set tel1='010';

# 6. 번호 컬럼에 있는 7번 데이터를 삭제하세요.
delete from memInfo where seq=7;

# 7. 아이디 컬럼에 있는 "peter" 데이터에서 나이 컬럼의 값을 "21"로 수정해주세요.
update memInfo set age=21 where userid='peter';

# 8. 나이가 30대인 모든 자료를 조회하세요.
select * from memInfo where age >= 30 && age <= 39;

# 9. "서울시"에 거주하는 모든 자료를 조회하세요.
select * from memInfo where address like '서울시%';

# 10. 이메일 주소로 "daum"을 사용하는 데이터를 모두 조회하세요.
select * from memInfo where email like '%daum%';

# 11. 이름 컬럼의 전체 데이터를 오름차순으로 정렬하세요.
select * from memInfo order by name asc;

# 12. 나이 컬럼의 전체 데이터를 내림차순으로 1차 정렬한 후 이름 컬럼의 데이터를 오름차순으로 2차 정렬하세요.
select * from memInfo order by age desc, name asc;

# 13. 가입날짜가 null 인 데이터를 조회하세요.
select * from memInfo where joinTM is null; 


