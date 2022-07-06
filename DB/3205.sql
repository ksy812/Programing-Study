--1
CREATE user "exDB3205" identified by "3205";

--2
grant connect, resource, dba to "exDB3205";

--3
CREATE TABLE custTbl3205(
    customerID CHAR(8) NOT NULL CONSTRAINT PK_custTbl3205 PRIMARY KEY,
    cname NVARCHAR2(10) NOT NULL,
    birthdate NUMBER(4) NOT NULL,
    areacode CHAR(3),
    contact CHAR(11),
    city NVARCHAR2(2) NOT NULL,
    address NVARCHAR2(20) NOT NULL,
    mileage NUMBER(10),
    grade CHAR(1),
    joindate DATE
);
CREATE TABLE buyTbl3205(
    orderID NUMBER(8) NOT NULL CONSTRAINT PK_buyTbl3205 PRIMARY KEY,
    customerID CHAR(8) NOT NULL CONSTRAINT FK_buyTbl3205 REFERENCES custTbl3205,
    productname NCHAR(6) NOT NULL,
    pfname NCHAR(4),
    price NUMBER(8) NOT NULL,
    quantity NUMBER(3) NOT NULL
);
commit;

--4
INSERT INTO custTbl3205 VALUES('KSY', '김소연', 1991, '011', '22222222', '서울', '관악구 관악로', 1173, 'E', to_date('2004.08.12', 'yyyy.mm.dd'));
INSERT INTO custTbl3205 VALUES('LWN', '이위너', 1990, '019', '33333333', '경남', '창원시 마산합포구', 770, 'H', to_date('2001.01.23', 'yyyy.mm.dd'));
INSERT INTO custTbl3205 VALUES('JNB', '잔나비', 1979, '018', '77777777', '전남', '강진구 강진읍', 172, 'H', to_date('2001.07.13', 'yyyy.mm.dd'));
INSERT INTO custTbl3205 VALUES('AML', '앤마리', 1983, '010', '88888888', '경기', '안산시 상록구', 765, 'F', to_date('2005.08.25', 'yyyy.mm.dd'));
INSERT INTO custTbl3205 VALUES('BHS', '박효신', 1986, '011', '11111111', '서울', '관악구 남부순환로', 1802, 'C', to_date('2005.10.19', 'yyyy.mm.dd'));
INSERT INTO custTbl3205 VALUES('JBJ', '장범준', 1978, '011', '44444444', '인천', '부평구 부평대로', 2626, 'B', to_date('2008.05.10', 'yyyy.mm.dd'));
INSERT INTO custTbl3205 VALUES('LJH', '임재현', 1989, NULL, NULL, '부산', '금정구 중앙대로', 286, 'G', to_date('1998.02.14', 'yyyy.mm.dd'));
INSERT INTO custTbl3205 VALUES('KBT', '김방탄', 1981, '016', '55555555', '경북', '울릉군 울릉읍', 182, 'H', to_date('2003.06.25', 'yyyy.mm.dd'));
INSERT INTO custTbl3205 VALUES('PSR', '박새로이', 1985, NULL, NULL, '경기', '수원시 팔달구', 370, 'G', to_date('2013.05.05', 'yyyy.mm.dd'));
INSERT INTO custTbl3205 VALUES('TAY', '태연', 1993, '011', '66666666', '서울', '송파구 올림픽로', 474, 'F', to_date('1997.05.03', 'yyyy.mm.dd'));
commit;

INSERT INTO buyTbl3205 VALUES(101, 'LWN', '운동화', NULL, 30000, 5);
INSERT INTO buyTbl3205 VALUES(102, 'KSY', '도서', '서적', 15000, 9);
INSERT INTO buyTbl3205 VALUES(103, 'AML', '모니터', '전자', 200000, 7);
INSERT INTO buyTbl3205 VALUES(104, 'LWN', '운동화', NULL, 30000, 10);
INSERT INTO buyTbl3205 VALUES(105, 'PSR', '노트북', '전자', 1000000, 1);
INSERT INTO buyTbl3205 VALUES(106, 'LJH', '운동화', NULL, 30000, 3);
INSERT INTO buyTbl3205 VALUES(107, 'AML', '선풍기', NULL, 28000, 1);
INSERT INTO buyTbl3205 VALUES(108, 'KSY', '모니터', '전자', 200000, 1);
INSERT INTO buyTbl3205 VALUES(109, 'JBJ', '청바지', '의류', 50000, 3);
INSERT INTO buyTbl3205 VALUES(110, 'PSR', '메모리', '전자', 80000, 12);
INSERT INTO buyTbl3205 VALUES(111, 'BHS', '모니터', '전자', 200000, 5);
INSERT INTO buyTbl3205 VALUES(112, 'LJH', '도서', '서적', 15000, 21);
INSERT INTO buyTbl3205 VALUES(113, 'KBT', '청바지', '의류', 50000, 1);
commit;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY.MM.DD';

--5
select * from custTbl3205;

--6
select * from buyTbl3205;

--7
DELETE
FROM buyTbl3205
WHERE customerId='AML';
select * from buyTbl3205;

--8
INSERT INTO buyTbl3205 VALUES(114, 'KSY', ' 선풍기', '가전', 13500, 1);
select * from buyTbl3205;

--9
SELECT orderId, customerId, productname, pfname, price, price*0.9 AS "할인 가격", quantity
FROM buyTbl3205;

--10
SELECT *
FROM buyTbl3205
WHERE customerID='LWN';

--11
SELECT pfname, price
FROM buyTbl3205
ORDER BY productname;

--12
SELECT *
FROM buyTbl3205
WHERE productname IN('메모리', '모니터', '운동화');

--13
SELECT *
FROM custTbl3205
WHERE joindate < to_date('1999.12.31');

--14
SELECT *
FROM custTbl3205
WHERE SUBSTR(address, 3, 1)='구';

--15
SELECT *
FROM custTbl3205
WHERE contact IS NOT NULL;

--16
SELECT *
FROM buyTbl3205
WHERE price BETWEEN 30000 AND 80000;

--17
SELECT *
FROM custTbl3205
ORDER BY joindate DESC;

--18
SELECT cname||'의 주소는 '||address||'입니다.'
FROM custTbl3205;

--19
SELECT DISTINCT customerid, productname
FROM buyTbl3205
ORDER BY productname DESC;

--20
SELECT cname, city, address, contact
FROM custTbl3205
WHERE city NOT LIKE '서울' AND birthdate BETWEEN 1980 ANd 1989;

--21
SELECT customerid, cname
FROM custTbl3205
WHERE customerid LIKE '%L%'
ORDER BY birthdate ASC;

--22
--***************************************************************
SELECT NEXT_DAY(ADD_MONTHS(sysdate, 150), 4)
FROM dual;

--23
SELECT cname, joindate
FROM custTbl3205
WHERE EXTRACT(YEAR FROM joindate)=2005;

--24
SELECT customerId, cname, address
FROM custTbl3205
WHERE SUBSTR(customerId, 1, 1)>'B' AND SUBSTR(customerId, 1, 1)<'P';

--25
SELECT REPLACE(productname, '운동', '축구')
FROM buyTbl3205
WHERE customerid='LWN';

commit;
