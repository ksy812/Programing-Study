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
