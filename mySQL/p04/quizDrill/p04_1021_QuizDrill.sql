##### Quiz Drill #####
create database p04_BBS;
use p04_BBS;

##### userTbl #####
create table userTbl (
no				int			not null	auto_increment,
userID			char(20)	not null 				  ,
userPW			char(20)	not null 				  ,
userNick		char(20)	not null 				  ,
userLevel		char	 	null 		default '1'	  ,
email			char(30)	not null				  ,
cellPhone		char(15)	null					  ,
joinTime		timestamp	not null				  ,
constraint primary key(userID),
constraint unique key(no)
);

insert into userTbl values 
(null, 'goodman', 'a123', '머그컵', '1', 'goodman@naver.com', '010-123-4567', '2018-06-11'),
(null, 'tree', 'b123', '노을', '1', 'tree@daum.net', '017-423-4568', '2018-07-24'),
(null, 'apple', 'c123', '커피', '2', 'apple@naver.com', '010-723-4569', '2018-11-01'),
(null, 'sea', 'd123', '캠핑', '3', 'sea@apple.com', '011-323-4560', '2019-02-17'),
(null, 'bridge', '3123', '허브', '2', 'bridge@nate.com', '010-2623-4561', '2019-04-23');

select * from userTbl order by no;
desc userTbl;

##### articleTbl #####
create table articleTbl (
no 				int			not null	auto_increment,
writerID		char(20)	not null 				  ,
title			char(100)	not null 				  ,
content			char(200)	not null 				  ,
writeTime		timestamp	null 		default now() ,
boardTime		char(10)	not null				  ,
primary key(no),
foreign key(writerID) references userTbl(userID)
);

insert into articleTbl values 
(null, 'goodman', '가입인사', '반갑습니다.', '2018-06-12', 'free'),
(null, 'apple', '문의사항', '이미지 업로드 안됩니다.', '2018-12-23', 'image'),
(null, 'tree', '연락처변경', '연락처 변경 어떻게 하나요?', '2019-01-05', 'qna');

desc articleTbl;
select * from articleTbl order by no;



##### emailTbl #####
create table emailTbl (
no 				int			not null	auto_increment,
sendID			char(20)	not null 				  ,
sendEmail		char(30)	not null 				  ,
emailTitle		char(100)	not null 				  ,
emailContent	char(200)	null 					  ,
receiveEmail	char(30)	not null				  ,
sendTime	    timestamp	not null	default now() ,
primary key(no),
foreign key(sendID) references userTbl(userID)
);

insert into emailTbl values 
(null, 'bridge', 'bridge@nate.com', "휴대폰 분실", "연락 안됩니다.", 'manager@nate.com', '2020-03-31'),
(null, 'tree', 'tree@daum.net', "휴가 보고서", "첨부 파일 참조", 'admin@comp.co.kr', '2020-06-29');


desc emailTbl;
select * from emailTbl order by no;

##### Quiz #####  

# 1. 게시판목록 테이블(articleTbl)과 이메일 발신 내역 테이블(emailTbl)을 사용하여 [순번, 제목, 내용, 시간] 필드로 구성된 Union 결과를 조회하시오.
select no, title, content, writeTime from articleTbl union select no, emailTitle, emailContent, sendTime from emailTbl;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ;

# 2. Inner Join으로 구현하고 이를 bbsView라는 이름으로 View 객체를 생성하여 조회하시오.
CREATE VIEW bbsView AS
SELECT art.no as '순번', art.writerID as '작성자 ID' , user.userNick as '닉네임', 
user.userLevel as '회원레벨', art.title as '글제목', art.writeTime as '글작성시간'
FROM articleTbl as art
INNER JOIN userTbl as user ON user.userID = art.writerID;

SELECT * FROM bbsView;
drop view bbsView;

# userTbl 테이블에서 순번 3에 해당하는 회원 ID : apple 자료를 삭제합니다.
-- 1. 관련된 게시글 삭제
DELETE FROM articletbl WHERE writerID = 'apple';
-- 2. 회원 ID가 'apple'인 경우 삭제
DELETE FROM userTbl WHERE userID = 'apple';