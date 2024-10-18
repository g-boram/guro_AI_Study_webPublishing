create database community;
use community;

create table bbs_TBL (
no				int			auto_increment 	,
writerID		char(30)	not null		,
articleTitle	char(50)	not null		,
readCnt			int			not null		,
writeTM			timestamp	not null		,
filename		char(100)	null			,
constraint pk_BBS_TBL primary key (no)
);

desc bbs_TBL;

insert into bbs_TBL (writerID, articleTitle, readCnt, writeTM) values ('tree', '연습글 제목 입니다.', 0, now());
insert into bbs_TBL (writerID, articleTitle, readCnt, writeTM) values 
( 'hana02', '안녕하세요!', 0, now( ) ),
( 'tree', '자기 소개입니다.', 0, now( ) ),
( 'camping', '카페 매니저님 질문있습니다!', 0, now( ) );

select * from bbs_TBL;

# 전체 데이서 갯수 조회
select count(*) from bbs_TBL;
# 출력값에 문자 연결 / 컬럼명 지정 (as : alias-별칭)
select concat(count(*), '개') '전체개수' from bbs_TBL;
