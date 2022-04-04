--DROP TABLE EMP;
--DROP TABLE DEPT;
--DROP TABLE LOCATIONS;
--DROP TABLE SALGRADE;

CREATE TABLE DEPT(
    DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
	DNAME VARCHAR2(14) ,
	LOC VARCHAR2(13) 
);
CREATE TABLE EMP(
    EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER(4),
	HIREDATE DATE,
	SAL NUMBER(7,2),
	COMM NUMBER(7,2),
	DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT
);

CREATE TABLE SALGRADE( 
    GRADE NUMBER,
	LOSAL NUMBER,
	HISAL NUMBER 
);
CREATE TABLE LOCATIONS (
     LOC_CODE  CHAR(2) ,
     CITY      VARCHAR2(12)
) ;

-- DEPT테이블에 데이터 삽입
INSERT INTO DEPT VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES(20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES(30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES(40,'OPERATIONS','BOSTON');

-- EMP테이블에 데이터 삽입
INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,to_date('09-12-1982','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,to_date('12-1-1983','dd-mm-yyyy'),1100,NULL,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);

-- SALGRADE테이블에 데이터 삽입
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);

commit; --위의 모든 내용을 물리적으로 저장을 확정한다.

SELECT * FROM emp; --emp 테이블에 있는 내용을 읽어서 모든 컬럼을 화면에 출력한다.
SELECT * FROM dept;
select empno, ename, sal, comm from emp;
select empno, sal, comm, ename from emp; --출력시, 컬럼이 정의된 순서는 무관하다.

select ename, sal, sal+300 from emp;

select ename, sal, 2*sal+300 from emp;
select ename, sal, 2*(sal+300) from emp;

select empno, ename, sal, comm, comm+300 from emp;
-- comm+300에서 comm 값이 NULL값이면, 그 결과도 NULL이 된다.

SELECT ename AS name, sal, sal*12 "Annual Salary"
FROM emp;
--26페이지

SELECT ename 결과1, 'ABCde' 결과2, sal 결과3, 500 결과4
FROM emp;

SELECT ename || ':' || empno || ':' || job 이름_사번_담당업무
FROM emp;

SELECT ename || ' is a ' || job AS "Employees Details"
FROM emp;

SELECT ename || ' : 1 Year Salary = ' || sal*12 Monthly
FROM emp; --sal*12는 월급 1년(12개월)을 곱하면 연봉이 된다.

SELECT ALL * FROM emp; --ALL이 생략된 형태
SELECT * FROM emp;

SELECT DISTINCT job FROM emp; --job 컬럼을 대상으로 중복 제거
SELECT DISTINCT deptno, job FROM emp;
--dept(부서번호)와 job컬럼의 값이 중복되지 않게 출력

SELECT ROWID, rownum, ename, sal
FROM emp;

SELECT ROWID, rownum, ename, sal
FROM emp
WHERE rownum<=3;

SELECT * FROM emp;

SELECT empno, ename, job, sal
FROM emp
WHERE job='MANAGER';

SELECT empno, ename, job, sal
FROM emp
WHERE job='manager'; --실제 데이터는 모두 대문자로 저장되어 있다.

SELECT empno, ename, job, sal
FROM emp
WHERE sal>=3000;

SELECT ename, sal, deptno
FROM emp
WHERE deptno!=30;

SELECT ename, sal, deptno
FROM emp
WHERE deptno<>30;

SELECT ename, sal, deptno
FROM emp
WHERE deptno^=30;

SELECT ename, job, sal, deptno
FROM emp
WHERE sal BETWEEN 1300 AND 1700;
-- sal<=1700 AND sal>=1300

SELECT ename, job, sal, deptno
FROM emp
WHERE sal BETWEEN 1700 AND 1300;
-- sal<=1300 AND sal>=1700

SELECT empno, ename, job, sal, hiredate
FROM emp
WHERE empno IN(7902, 7788, 7566);
-- IN(7902, 7788, 7566)는 emp테이블에 있는 데이터 중에서 empno값이 존재할 경우
-- TRUE 값이 리턴됨.

SELECT empno, ename, job, sal, hiredate
FROM emp
WHERE empno=7902 OR empno=7788 OR empno=7566;

SELECT ename, sal, job
FROM emp
WHERE ename LIKE '_A%'; -- _는 문자 1개, %는 문자 0개 이상
-- ename의 두번째 글자가 A인 것만 출력

SELECT ename, sal, job
FROM emp
WHERE ename LIKE '%A%'; -- ename에 'A' 문자가 포함되면 TRUE를 리턴함.

SELECT empno, ename, job, sal, comm, deptno
FROM emp
WHERE comm = NULL; -- 결과가 없음. comm=NULL의 결과는 NULL

SELECT empno, ename, job, sal, comm, deptno
FROM emp
WHERE comm IS NULL; -- comm에 있는 데이터가 NULL이면 TRUE 값이 리턴

SELECT empno, ename, job, sal, comm, deptno
FROM emp
WHERE comm < NULL; -- 결과가 없음. comm < NULL의 결과는 NULL



SELECT empno, ename, job, sal, deptno
FROM emp
WHERE sal >= 2800 AND job = 'MANAGER';

SELECT empno, ename, job, sal, deptno
FROM emp
WHERE sal >= 2800 AND job = 'Manager'; --데이터는 대소문자 구별함

SELECT empno, ename, job, sal, deptno
FROM emp
WHERE sal >= 2800 OR job = 'MANAGER';

SELECT empno, ename, job, sal, deptno
FROM emp
WHERE job IN('MANAGER', 'CLERK', 'ANALYST');

SELECT empno, ename, job, sal, deptno
FROM emp
WHERE job NOT IN('MANAGER', 'CLERK', 'ANALYST');

SELECT ename, sal, job
FROM emp
WHERE sal BETWEEN 1000 AND 3000;

SELECT ename, sal, job
FROM emp
WHERE sal NOT BETWEEN 1000 AND 3000;

SELECT *
FROM emp
WHERE ename NOT LIKE 'A%';

SELECT ename, sal, comm, deptno
FROM emp
WHERE comm IS NOT NULL;

SELECT ename, sal, comm, deptno
FROM emp
WHERE (NVL(comm, 0) = 0); --NVL(comm, 0)에서 comm이 NULL이면 0값으로 변경

--예제1(p.43)
SELECT empno, ename, job, sal
FROM emp
WHERE sal > 1500 AND job = 'PRESIDENT' OR job = 'SALESMAN';

--예제2(p.43)
SELECT empno, ename, job, sal
FROM emp
WHERE sal > 1500 AND (job = 'PRESIDENT' OR job = 'SALESMAN');

--예제3(p.43)
SELECT empno, ename, job, sal
FROM emp
WHERE sal > 1500 AND job IN('PRESIDENT', 'SALESMAN');

--예제3(p.45)
SELECT empno, ename, job, sal, hiredate
FROM emp
ORDER BY hiredate; --입사날짜를 오름차순(과거->현재 순으로)

SELECT empno, ename, job, sal
FROM emp
ORDER BY hiredate;

SELECT empno, ename, job, sal, hiredate
FROM emp
ORDER BY hiredate DESC;

--예제2(p.45)
SELECT empno, ename, job, deptno, hiredate
FROM emp
ORDER BY deptno ASC, sal DESC;

--예제3 (p. 46)
SELECT empno, ename, job, sal, deptno, hiredate
FROM emp
ORDER BY 4;

SELECT empno, ename, job, deptno, sal, hiredate
FROM emp
ORDER BY 4, 5 DESC;
--4번째 컬럼 deptno는 오름차순, 5번째 컬럼 sal은 내림차순

SELECT empno, sal, sal*12 ANN_SAL
FROM emp
ORDER BY ANN_SAL; -- 별칭으로 정렬의 기준으로 사용할 수 있다.

-- 예제5 (p.47)
SELECT DISTINCT deptno, job
FROM emp
ORDER BY job; -- 업무를 기준으로 오름차순

--SELECT DISTINCT deptno, job
--FROM emp
--ORDER BY sal;
-- DISTINCT를 사용할 경우에는, SELECT 절에 있는 컬럼만 사용 가능
-- 그래서 당연히 오류 발생함.

SELECT DISTINCT deptno, job
FROM emp
ORDER BY deptno;

SELECT empno, sal, sal*12 ANN_SAL
FROM emp
ORDER BY deptno; -- DISTINCT를 사용하지 않았다면, emp 테이블에 있는 모든 컬럼을
-- 정렬 기준으로 사용할 수 있다.


SELECT DISTINCT job, sal+comm
FROM emp
ORDER BY sal; -- sal은 불가능

SELECT DISTINCT job, sal+comm
FROM emp
ORDER BY sal+comm; -- sal+comm은 가능

SELECT DISTINCT job, sal+comm
FROM emp
ORDER BY 2;


-- p.55
-- 예제1
SELECT empno, ename, job, LOWER(job), INITCAP(job)
FROM emp
WHERE deptno = 10;

-- p.56
-- 예제2
SELECT empno, ename, job,
       CONCAT(empno, ename) ename1,
       CONCAT(ename, empno) e_empno,
       CONCAT(ename, job) e_job
       -- CONCAT(ename, job)은 ename과 job을 연결해서 하나의 컬럼을 만든다.
FROM emp
WHERE deptno = 10;

-- 예제3 // 이거 꼭 내신대~!!~!!!
SELECT empno, ename, job, sal, deptno
FROM emp
WHERE SUBSTR(ename, 1, 1) > 'K' AND SUBSTR(ename, 1, 1) < 'Y'
ORDER BY ename;
-- ename의 값에서 첫번째 문자 1개를 반환한다.

-- 예제4
SELECT empno, ename, LENGTH(ename), sal, LENGTH(sal)
FROM emp
WHERE deptno = 20;

-- p.57
-- 예제5
SELECT ename,
       INSTR(ename, 'L') e_null,
       INSTR(ename, 'L', 1, 1) e_11,
       -- ename의 문자열 데이터에서 1번째 값에서 'L'자를 검색하여, 처음 발견된 'L'의 위치 반환
       INSTR(ename, 'L', 1, 2) e_12,
       -- ename의 문자열 데이터에서 1번째 값에서 'L'자를 검색하여, 두번째로 발견된 'L'의 위치 반환
       INSTR(ename, 'L', 4, 1) e_41
       -- ename의 문자열 데이터에서 4번째 값에서 'L'자를 검색하여, 처음 발견된 'L'의 위치 반환
FROM emp
ORDER BY ename;

--한글 한 글자: AL32UTF-8(3Byte)
SELECT parameter, value
FROM NLS_DATABASE_PARAMETERS
WHERE  parameter='NLS_CHARACTERSET';

--예제 6
SELECT  SUBSTRB('I am here with you', 5, 3) 결과1,
        -- 영문자는 1글자를 1Byte로 인식하기 때문에, 5는 문자열의 5번째 위치(공백)에서부터 3개의 문자열 반환
        -- '_he'
        SUBSTR('나 여기 있어', 5, 3) 결과2,
        SUBSTRB('나 여기 있어', 5, 3) 결과3,
        -- 한글 1글자는 3Byte로 설정되어 있기 때문에, 5는 '여' 문자를 가리킨다. 3은 3바이트이기 때문에 '여'를 반환.
        -- 한글 1글자만 출력함.
        SUBSTRB('나 여기 있어', 5, 4) 결과4,
        SUBSTRB('나 여기 있어', 5, 5) 결과5,
        SUBSTRB('나 여기 있어', 5, 6) 결과6
        -- 한글 1글자는 3Byte로 설정되어 있기 때문에, 5는 '여' 문자를 가리킨다. 6은 6바이트이기 때문에 '여기'를 반환.
FROM dual; -- 오라클에서 제공하는 가상 테이블

-- 예제7
SELECT  ename,
        SUBSTR(ename, 1, 3),
        -- ename의 문자열 데이터에서 1번째 위치부터 3개의 문자열 반환
        SUBSTR(ename, 3),
        -- ename의 문자열 데이터에서 3번째 위치부터 문자열 끝까지 반환
        SUBSTR(ename, -3, 2)
        -- ename의 문자열 데이터에서 오른쪽을 기준으로하여, 3번째부터 2개의 문자열 반환
FROM emp
WHERE deptno = 10;

-- p.59
-- 예제1
SELECT ename, LPAD(ename, 15, '*'), sal, LPAD(sal, 10, '*')
FROM emp
WHERE deptno = 10;
-- LPAD(ename, 15, '*')에서 15는 전제차리수를 의미하고, 왼쪽 빈 공간을 '*'로 채움

-- 예제2
SELECT ename, RPAD(ename, 15, '*'), sal, RPAD(sal, 10, '*')
FROM emp
WHERE deptno = 10;
-- LPAD(ename, 15, '*')에서 15는 전제차리수를 의미하고, 오른쪽 빈 공간을 '*'로 채움

-- 예제3
SELECT ename, job, LTRIM(job, 'A'), sal, LTRIM(sal, 1)
FROM emp
WHERE deptno = 20;
-- LTRIM(job, 'A')에서 담당업무 데이터가 맨 왼쪽에 'A'문자가 있으면 삭제
-- LTRIM(sal, 1)에서 급여 데이터가 맨 왼쪽에 숫자 1이 있으면 삭제
-- 연속해서 있을 경우에는 모두 삭제됨.

-- 예제4
SELECT ename, job, RTRIM(job, 'T'), sal, RTRIM(sal, 0)
FROM emp
WHERE deptno = 10;
-- RTRIM(job, 'T')에서 담당업무 데이터가 맨 오른쪽에 'T'문자가 있으면 삭제
-- RTRIM(sal, 0)에서 급여 데이터가 맨 오른쪽에 숫자 0이 있으면 삭제
-- 연속해서 있을 경우에는 모두 삭제됨.

-- 예제5
SELECT ename, REPLACE(ename, 'SC', '*?') AS 변경결과
FROM emp
WHERE deptno = 20;
-- REPLACE(ename, 'SC', '*?')dptj ename 데이터 중에서 'SC'문자열이 포함되어있다면,
-- '*?'으로 변경해서 출력함.

-- 예제6
SELECT ename, TRANSLATE(ename, 'SC', '*?') 변경결과2
FROM emp
WHERE deptno = 20;
-- TRANSLATE(ename, 'SC', '*?')에서 ename의 데이터 중 'S'->'*', 'C'->'?' 변경함.
-- "연속되어있는가"는 상관없음.

-- 예제7
SELECT  TRIM(LEADING 'A' FROM 'AABDCADD') 결과1, -- 문자열의 왼쪽에 있는 'A'를 제거
        TRIM('A' FROM 'AABDCADD') 결과2, -- 왼쪽, 오른쪽에 있는 'A'를 제거
        TRIM(TRAILING 'D' FROM 'AABDCADD') 결과3 -- 문자열의 오른쪽에 있는 'D'를 제거
FROM DUAL;

-- 예제8
SELECT  empno, ename,
        TRANSLATE(ename, 'ABCDEFGHIJKLMNOPQRSUVWXYZ', 'abcdefghijklmnopqrsuvwxyz') u_lower
FROM emp
WHERE deptno = 10;
-- 대문자를  소문자로 바꾸는 문장.

SELECT  empno, ename,
        LOWER(ename) u_lower
FROM emp
WHERE deptno = 10;

-- p.63
-- 예제1
SELECT  ROUND(4567.678) 결과1, ROUND(4567.678, 0) 결과2,
        ROUND(4567.678, 2) 결과3, ROUND(4567.678, -2) 결과4
FROM DUAL;

-- 예제2
SELECT  TRUNC(4567.678) 결과1, TRUNC(4567.678, 0) 결과2,
        TRUNC(4567.678, 2) 결과3, TRUNC(4567.678, -2) 결과4
FROM DUAL; -- TRUNC는 그냥 냅다 다 버림

-- 예제3
SELECT  POWER(2, 10) 결과1, -- 2의 10제곱
        CEIL(3.7) 결과2, -- 소수점 이하 첫째 자리 올림
        FLOOR(3.7) 결과3 -- 소수점 이하 첫째 자리 내림
FROM DUAL;

-- p.64
-- 예제4
SELECT sal, mod(sal, 30)
FROM emp
WHERE deptno = 10;

-- 예제5
SELECT ename, sal, sign(sal-2975)
FROM emp
WHERE deptno = 20;

-- p.65
SELECT sysdate
FROM dual; -- 날짜만 나옴

SELECT SYSTIMESTAMP
FROM dual; -- 타임스탬프

-- 오라클 날짜 형식 조회
SELECT value
FROM NLS_SESSION_PARAMETERS
WHERE parameter='NLS_DATE_FORMAT';

-- 예제1
SELECT ename, hiredate, hiredate+3, hiredate + 5/24
FROM emp
WHERE deptno = 30;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
-- 날짜 형식을 변경. HH24안쓰면? 12가 기본값...

-- 예제2
SELECT  ename, hiredate, sysdate, sysdate-hiredate "Total Days",
        TRUNC((sysdate-hiredate)/7, 0) Weeks,
        ROUND (mod((sysdate-hiredate), 7), 0) DATS
FROM emp
ORDER BY sysdate-hiredate desc;

-- 예제3
SELECT  EXTRACT(day from sysdate) 일자, EXTRACT(month from sysdate) 월,
        EXTRACT(year from sysdate) 년도
FROM DUAL;