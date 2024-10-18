create database p02_mySQL;
use p02_mySQL;


# 제약조건 지정 / 기본키 두개 선언
create table userList (
	no			int			auto_increment  not null		,
    userID		char(20)					not null		,
	userPW		char(20)					not null		,
    userNick	char(20)					not null		,
    userLevel	char						not null  default '1' ,
    email		char(30)					not null		,
    cellPhone	char(15)					null			,
    joinTime	datetime					not null default now(),
	constraint primary key(no, userID),
    constraint unique key(no)
);
desc userList;
drop table userList;

# 테이블 이름 변경
alter table userList rename memberList;

desc memberList;

# 테이블 컬럼명 변경하기
alter table memberList change column userNick name char(10);
alter table memberList change column address addr char(50);

# 자료형 변경하기
alter table memberList change column joinTime joinTime timestamp;

# 컬럼 추가
alter table memberList add column address char(50) null;
alter table memberList add column age smallint null;

# 컬럼 삭제
alter table memberList drop column cellPhone;
alter table memberList drop column joinTime;


insert into memberList (userID, userPW, name, email, addr, age) values 
('hana02', 1234, '김하나', 'hana@naver.com', '서울시 송파구 성내동 23', 25),
('orange', 1234, '이성수', 'ssyu3@daum.net', '경기도 부천시 원미구 중동 46', 36),
('camping', 1234, '박인호', 'good@google.com', '서울시 서대문구 대현동 9', 24),
('amp93', 1234, '김시현', 'card@naver.com', '경기도 파주시 운정동 85', 36),
('boxer', 1234, '최정인', 'send@test.co.kr', '서울시 강남구 역삼동 12', 30),
('time5', 1234, '하정태', 'hajeong@daum.net', '경기도 용인시 기흥구 보라동 63', 31),
('skyblue', 1234, '박윤정', 'heart@google.com', '경기도 남양주시 다산동 205', 36),
('tree', 1234, '이가람', 'tree@naver.com', '경기도 부천시 원미구 상동 7', 31);

select * from memberList;
# distinct - 중복제거 
select distinct userPW from memberList;
# 두개의 컬럼 조회시 중복제거를 정확히 할 수 없기에 중복제거가 되지않는다.
select distinct (age), name from memberList;
select count(distinct age) from memberList;
# where 사용한 조건 검색
select * from memberList where age=36 && name='이성수';
select * from memberList where age<30;
select * from memberList where age<25 || age>30;
select * from memberList where age between 25 and 30;

# 문자열 조건 검색
select * from memberList where name='김시현';

# 대표문자 = 와일드 카드 
#        = % 와 like 조합 - 기호 사용하지 않음
select * from memberList where addr like '서울시%';
select * from memberList order by no asc;

# 같은 컬럼으로 여러개의 데이터 조회시
select * from memberList where userID='camping' or userID='tree';
select * from memberList where userID in ('camping','tree');

# 전체 자료에서 google 이메일 계정을 사용하는 자료 조회
select * from memberList where email like '%google%';

# no 컬럼의 1차 정렬 = 전체 자료 정렬
select * from memberList order by no asc;
# 2차 정렬 => 1차 정렬의 결과중에서 동일한 대상의 재정렬
select * from memberList order by age desc;
# 2차 정렬
select * from memberList order by age desc, name asc;

# 출력 범위 지정(= 출력 개수 지정 / limit 시작인덱스, 출력할 개수)
select * from memberList limit 4, 2;

# Quiz3. 성이 "이" 씨인 사람 조회
select * from memberList where name like '이%';

# Quiz4. 경기도 주소를 갖는 자료 오름차순 조회
select no, name as 이름, addr as 주소, userID, age from memberList where addr like '경기도%' order by addr asc;

# 네이버 메일을 사용하는 회원들의 인원수 조회
select count(*) from memberList where email like '%@naver.com';

# 집계함수 / 통계함수 => count(), max(), min(), avg(), sum(), ...
# group by 를 적용한 컬럼은(age)은 같은 데이터들은 묶어 1개로 표시한다. (중복x)
select count(name) as nameCnt, age as '나이' from memberList group by age;
# group by의 조건절 having
# having 조건절은 group by를 반드시 사용해야만 적용할 수 있다 group by 결과에 대한 조건.
# 또한 having은 group by 결과에 대한 조건만 적용할 수 있다.
# 참고. where 조건절을 전체 데이터에 대하여 조건을 적용하는 것.
select no, name, age, addr from memberList;
select age from memberList where age >= 30;
select count(no), age from memberList group by age having count(no) >= 2;


# 수정 및 삭제 안전 모드 해제
set sql_safe_updates = 0;	# update, delete 제한 없음
set sql_safe_updates = 1;	# 기본설정

# DDL, DCL, DML, TCL(Transaction Control Language)
select * from memberList;         
set autocommit = 0;
insert into memberList (userID, userPW, name, email, addr, age) values ('lemon', '1234', '레몬', 'lemon@nate.com', '서울시 구로구', 41);
commit;
delete from memberList where no=10;

rollback;

