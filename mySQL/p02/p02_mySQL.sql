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
