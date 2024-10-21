##### Quiz #####

create database shoppingMall;
use shoppingMall;

# 테이블 생성
create table productList (
seq				int				not null		auto_increment,
productCode		char(30)		not null 					  ,
productName 	char(10)		null 					  	  ,
stockVol		int				null					  	  ,	
pDate			char(20)		null						  ,
personCharge	char(20)		null 						  ,
sellPrice		int				null 						  ,
constraint primary key(productCode),
constraint unique key(seq)
);

# 테이블 이름 변경 = rename to
rename table productList to store;

# 테이블 수정사항
# 필드명,자료형 변경 --- alter table [테이블명] change 기존컬럼명 변경컬럼명 자료형;
alter table store change productCode pCode char(30);
alter table store change productName pName char(30);
# 자료형 변경 --- modify
alter table store modify pDate datetime;
# 필드추가  --- alter table [테이블명] add [컬럼명] 자료형 제약조건
alter table store add pCost int null;
alter table store add gType char(30) null;
alter table store add salesVol int null;
# 필드 삭제 --- ALTER TABLE [테이블명] DROP COLUMN [컬럼명];
alter table store drop column personCharge;
# 데이터 입력 --- insert into
insert into store (seq, pCode, pName, stockVol, salesVol, pDate, sellPrice, pCost, gType) values 
(null, 'F257', '삼겹살', 52, 71, '2020-03-11', 6400, 4800, 'Food'),
(null, 'D105', '썬크림', 30, 104, '2020-02-24', null, 5200, 'Daily'),
(null, 'P30', '보급형 휴대폰', 5, 7, '2020-12-27', 360000, 470000, 'Phone'),
(null, 'P70', '폴더블 폰', 2, 2, '2020-03-04', 1325000, 1190000, 'Phone'),
(null, 'F330', '생수', 61, 242, '2020-02-26', 7800, 6100, 'Food'),
(null, 'C45', '발목양말', 27, 11, '2019-11-30', 1500, 840, 'Wear'),
(null, 'F647', '라면', 260, 193, '2020-02-25', 4150, 3300, 'Food'),
(null, 'D002', '치약', 23, 0, '2020-01-09', 0, 0, null),
(null, 'D913', '키친타월', 46, 15, '2019-12-14', 4580, 2900, 'Daily'),
(null, 'D854', '핸드크림', 9, 3, '2019-07-08', 5000, 5000, 'Daily');

select seq as '번호', pCode as '상품코드', pName as '상품명', stockVol as '재고량', salesVol as '판매량', 
pDate as '생산일', sellPrice as '판매가', pCost as '원가',gType as '분류' from store order by seq;

select * from store;
SET SQL_SAFE_UPDATES = 0;


# 전체자료에서 판매가 필드와 분류 필드에 NULL이 입력되어 있는 자료만 조회하세요.(출력 필드 ➜ 번호, 상품코드, 상품명, 판매가, 분류)
SELECT seq, pCode, pName, sellPrice, gType FROM store
WHERE sellPrice IS NULL or gType IS NULL;

# 상품코드 D105인 썬크림의 판매가를 8500원으로 수정하세요.
update store set sellPrice = 8500 where pCode = 'D105';

# 상품코드 D002, 상품명 치약의 데이터를 아래 내용으로 수정하세요.
update store set salesVol=54, sellPrice=5900, pCost=3400, gType='Daily' where pCode='D002';

# 전체데이터에서 판매량의 내림차순으로 상위 3개의 데이터만 조회하세요.
SELECT * FROM store ORDER BY salesVol DESC LIMIT 3;

# 상품 분류 컬럼에서 상품의 종류를 중복하지 않고 1개씩 조회하세요. 단, 분류필드만 조회합니다.
SELECT DISTINCT gType FROM store;

# 전체 데이터를 상품 분류의 오름차순으로 정렬하여 조회한 결과에서 분류가 동일한 데이터의 재고량 내림차순으로 정렬하여 조회하세요.
SELECT * FROM store ORDER BY gType ASC, stockVol DESC;

# 상품코드에서 'D'와 'F'를 포함하는 모든 자료를 조회하세요.
SELECT * FROM store WHERE pCode LIKE '%D%' OR pCode LIKE '%F%';

# 재고량이 30개 이하인 모든 상품을 조회하세요.
SELECT * FROM store WHERE stockVol <= 30;

# 상품명이 '삼겹살'인 제품의 상품코드와 생산일을 각각 'F412'와 '2020-03-21'로 변경하세요.
UPDATE store SET pCode = 'F412', pDate = '2020-03-21' WHERE pName = '삼겹살';

# 상품분류에서 'Food'에 해당하는 상품들중에서 최대판매량 제품과 최소판매량 제품을 조회하세요.
# 최대 판매량 제품 조회
SELECT * FROM store WHERE gType = 'Food' ORDER BY salesVol DESC LIMIT 1;
# 최소 판매량 제품 조회
SELECT * FROM store WHERE gType = 'Food' ORDER BY salesVol ASC LIMIT 1;







