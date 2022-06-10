--p.80
--예제 1
SELECT ename, sal, comm, sal+comm, sal+NVL(comm, 0)
FROM emp
WHERE deptno=30;
-- sal+comm에서 comm값이 NULL이면 결과는 NULL이 된다.
-- sal+NVL(comm, 0)에서 comm 값이 NULL이면 0값 으로 반환

--예제2
SELECT ename, deptno, mgr, NVL2(mgr, mgr||'담당', '상위자')
FROM emp
WHERE deptno!=30;
--NVL2(mgr, mgr||'담당', '상위자')에서 mgr이 NULL이 아니면, 상위자 mgr||'담당' 반환
--NULL이면 '상위자' 반환

--p.81
--예제3
SELECT ename, job, NULLIF(job, 'SALESMAN') AS result
FROM emp
WHERE deptno=30;
--NULLIF(job, 'SALESMAN')에서 job이 'SALESMAN'과 같으면 NULL 반환
--같지 않다면 job을 반환

--예제4
SELECT ename, comm, sal, COALESCE(comm, sal, 50)
FROM emp;
--COALESCE(comm, sal, 50)에서 comm이 NULL이 아니면 comm 반환
--comm이 NULL이고 sal이 NULL이 아니라면 sal 반환
--둘 다 NULL이라면 50 반환

--p.82
--예제5
SELECT ename, sal, comm, GREATEST(sal, comm) 결과
FROM emp
WHERE comm IS NOT NULL;
--GREATEST(sal, comm)에서 큰 값을 반환

SELECT ename, sal, comm, GREATEST(sal, comm) 결과
FROM emp;
--GREATEST(sal, comm)에서 둘 중에 하나라도 NULL이면 결과도 NULL

--예제6
SELECT ename, sal, comm, LEAST(sal, comm) 결과
FROM emp
WHERE comm IS NOT NULL;

SELECT ename, sal, comm, LEAST(sal, comm) 결과
FROM emp;

--p.83
--예제7
SELECT  empno, ename, sal, job,
        DECODE(job, 'ANALYST', sal*1.1, --job이 'ANALYST'면 sal*1.1
                    'CLERK', sal*1.2, --job이 'CLERTK'면 sal*1.2
                    'MANAGER', sal*1.3, --job이 'MANAGER'면 sal*1.3
                    'PRESIDENT', sal*1.4, --job이 'PRESIDENT'면 sal*1.4
                    'SALESMAN', sal*1.5, --job이 'SALESMAN'면 sal*1.5
                    sal) 변경결과 --default: job이 비교한 문자열의 값이 없을 경우, sal 반환
        --default가 sal인데, 만약 sal이 없다면, NULL값 반환
FROM emp;

--p.84
--예제9
SELECT  ename, sal,
        DECODE(SIGN(sal-1000), -1, 'A', --sal 값이 1000보다 작으면 A
        DECODE(SIGN(sal-2500), -1, 'B', 'C')) grade --sal 값이 2500보다 작으면 B
                                                    --2500 이상이면 C
FROM emp;
--SIGN(sal-1000)에서 sal-1000 값이 0보다 크면 1, 0보다 작으면 -1, 0과 같으면 0 반환

--예제8
SELECT  empno, ename, sal, job,
        CASE job WHEN 'ANALYST' THEN sal*1.1 --job이 'ANALYST'면 sal*1.1
                 WHEN 'CLERK' THEN sal*1.2 --job이 'CLERTK'면 sal*1.2
                 WHEN 'MANAGER' THEN sal*1.3 --job이 'MANAGER'면 sal*1.3
                 WHEN 'PRESIDENT' THEN sal*1.4 --job이 'PRESIDENT'면 sal*1.4
                 WHEN 'SALESMAN' THEN sal*1.5 --job이 'SALESMAN'면 sal*1.5
                 ELSE sal --Default
        END salary --별칭
FROM emp;
--예제7과 같은 값

--그룹함수
--예제1
SELECT min(ename), max(ename), min(hiredate), max(hiredate)
FROM emp;
--문자와 날짜 데이터도 최대값과 최소값을 구할 수 있다.
SELECT ename, hiredate
FROM emp
ORDER BY hiredate;

--예제2
SELECT avg(sal), max(sal), min(sal), sum(sal)
FROM emp
WHERE job='SALESMAN';

SELECT job
FROM emp;

--예제3
SELECT count(*) c1, count(comm) c2, avg(comm) c3, avg(NVL(comm, 0)) c4
FROM emp;
--count(*)은 emp 테이블의 행의 갯수, count(comm)은 comm값이 null 이 아닌 데이터의 갯수
--avg(comm)은 comm값이 null이 아닌 데이터의 평균
--avg(NVL(comm, 0))은 comm값이 null이면 0으로 변환하여, 전체 평균 구함

--예제4
SELECT count(deptno) c1, count(DISTINCT deptno) c2, count(DISTINCT job) c3
FROM emp;

--예제5
SELECT avg(comm), sum(comm)/14
FROM emp;
--avg(comm)은 comm값에서 NULL을 제외한 값의 평균
--sum(comm)/14은 comm값에서 NULL을 제외한 값의 평균의 뭐?????????

--예제6
SELECT avg(NVL(comm, 0)), sum(comm)/14
FROM emp;

--예제7
SELECT  count(deptno), count(distinct deptno),
        sum(deptno), sum(distinct deptno)
FROM emp;
--sum(distinct deptno)은 dpetno값의 중복을 제거한 합

--p.95
--예제1
SELECT deptno, count(*), TRUNC(avg(sal), 1), min(sal), max(sal), sum(sal)
FROM emp
GROUP BY deptno;

--예제2
SELECT deptno, count(*), avg(sal), min(sal), max(sal), sum(sal)
FROM emp
GROUP BY deptno
ORDER BY sum(sal) desc;

SELECT deptno, count(*), trunc(avg(sal)), min(sal), max(sal), sum(sal)
FROM emp
GROUP BY deptno
ORDER BY sum(sal) desc;

SELECT job, count(*), trunc(avg(sal), 1), min(sal), max(sal), sum(sal)
FROM emp
GROUP BY deptno
ORDER BY sum(sal) desc;
--Group by절에 없는 컬럼은 Select 절에 사용 불가능

--예제3
SELECT job, count(*), trunc(avg(sal)), sum(sal)
FROM emp
GROUP BY job;
--job을 기준으로 group을 나눔
--count(*)은 쿼리문장의 속도를 저하시키는 원인이 될 수 있음.

--예제4
SELECT job, deptno, count(*), trunc(avg(sal)), sum(sal)
FROM emp
GROUP BY job, deptno; --job, deptno 2개를 그룹의 기준으로 함.

--p.98 HAVING
--예제1
SELECT deptno, count(*), sum(sal)
FROM emp
GROUP BY deptno
HAVING count(*)>4; --emp테이블에 저장된 부서번호(deptno)의 갯수가 5보다 큰 부서번호를 출력

--예제2
SELECT deptno, avg(sal), sum(sal)
FROM emp
GROUP BY deptno
HAVING max(sal)>2900; --select 절에 없지만, 그룹함수는 사용 가능함.
--deptno(부서) 멤버 중에서 sal값이 2900보다 큰 데이터가 있으면 true
--부서 30번은 출력이 안됨.

--예제3
SELECT job, avg(sal), sum(sal)
FROM emp
HAVING avg(sal)>=3000
GROUP BY job;


--5/16 수업 빠짐

--Grouping sets
--p.107
--예제1
SELECT deptno, job, sum(sal)
FROM emp
GROUP BY GROUPING SETS(deptno, job);

--예제2
SELECT deptno, NULL job, sum(sal)
FROM emp
GROUP BY deptno
UNION ALL
SELECT NULL detpno, job, SUM(sal)
FROM emp
GROUP BY job;

--109페이지 시험문제에 안 내심~~~~ JOIN 많이 ㅇ내신대~

SELECT * FROM emp; --14행
SELECT * FROM dept; --4행

SELECT empno, ename, dname, loc
FROM emp, dept --emp 테이블의 행 14 * dept 테이블의 행 4 => 56
ORDER BY empno; --데이터를 복제할 때

SELECT e.empno, e.ename, d.deptno, d.dname, d.loc
FROM emp e, dept d --테이블 이름에도 별칭(ALIAS) 사용 가능
ORDER BY empno;


--0523-----------------------------------------------
DROP TABLE EMP;
DROP TABLE DEPT;
DROP TABLE LOCATIONS;
DROP TABLE SALGRADE;

CREATE TABLE DEPT(
    DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
	DNAME VARCHAR2(14) ,
	LOC_CODE VARCHAR2(2) 
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
INSERT INTO DEPT VALUES(10,'ACCOUNTING','A1');
INSERT INTO DEPT VALUES(20,'RESEARCH','B1');
INSERT INTO DEPT VALUES(30,'SALES','C1');
INSERT INTO DEPT VALUES(40,'OPERATIONS','A1');
INSERT INTO DEPT VALUES(50,'INSA',NULL);

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

-- LOCATIONS 테이블에 데이터 삽입
INSERT INTO LOCATIONS VALUES ('A1','SEOUL');
INSERT INTO LOCATIONS VALUES ('B1','DALLAS');
INSERT INTO LOCATIONS VALUES ('C1','CHICAGO');
INSERT INTO LOCATIONS VALUES ('D1','BOSTON');
commit;

SELECT * FROM emp; --14행
SELECT * FROM dept; --5행
SELECT * FROM dept; --4행

--카타시안 곱
SELECT e.empno, e.ename, e.deptno, d.deptno, d.dname
FROM emp e, dept d; -- 14행 * 5행 = 70행

--p. 119(EQUI JOIN)
--예제1
SELECT e.empno, e.ename, e.deptno, d.deptno, d.dname
FROM emp e, dept d
WHERE d.deptno = e.deptno
ORDER BY d.deptno;

--예제2
SELECT e.empno, e.ename, e.deptno, d.deptno, d.dname, d.loc_code
FROM emp e, dept d
WHERE d.deptno = e.deptno AND e.job = 'SALESMAN';

--예제3
SELECT e.ename, d.dname, e.deptno ed, d.deptno dd, d.loc_code dl, l.loc_code ll, e.sal, l.city
FROM emp e, dept d, locations l
WHERE d.deptno = e.deptno AND d.loc_code = l.loc_code;

--예제4
SELECT e.ename, d.dname, e.deptno ed, d.deptno dd, d.loc_code dl, l.loc_code ll, e.sal, l.city
FROM emp e, dept d, locations l
WHERE d.deptno = e.deptno
    AND d.loc_code = l.loc_code
    AND e.sal > 1500
    AND l.city = 'DALLAS';

--p.121(NON-EQUI JOIN)
SELECT * FROM salgrade;

--예제1
SELECT e.empno, e.ename, e.job, e.sal, s.grade, s.losal, s.hisal
FROM salgrade s, emp e
WHERE e.sal >= s.losal AND e.sal <= s.hisal;

SELECT e.empno, e.ename, e.job, e.sal, s.grade, s.losal, s.hisal
FROM salgrade s, emp e
WHERE e.sal BETWEEN s.losal AND s.hisal;
--예제1과 결과는 동일함.

--OUTER JOIN
--예제1
SELECT  e.empno, e.ename, e.job, e.deptno e_deptno,
        d.deptno d_deptno, d.dname
FROM dept d, emp e
WHERE d.deptno = e.deptno(+);
--d.deptno: 기준테이블(dept), e.deptno(+): emp테이블(데이터가 부족한 쪽)

--예제2
SELECT d.deptno, d.dname, d.loc_code, l.loc_code, l.city
FROM dept d, locations l
WHERE d.loc_code = l.loc_code(+);
--기준테이블: dept
--부족한 테이블(locations)에 '(+)' 기호 삽입

--예제3
SELECT d.deptno, d.dname, l.loc_code, l.city
FROM dept d, locations l
WHERE d.loc_code(+) = l.loc_code;

--예제4
SELECT d.deptno, d.dname, l.loc_code, l.city
FROM dept d, locations l
WHERE d.loc_code(+) = l.loc_code(+);

--예제5
SELECT e.ename, e.sal, e.deptno, d.deptno, d.dname
FROM emp e, dept d
WHERE e.deptno(+) = d.deptno
    AND e.sal>2000;
--(논리적 오류)OUTER JOIN 후에 e.sal>2000 체크하여 OUTER JOIN의 효과Xx

--예제6
SELECT e.ename, e.sal, e.deptno, d.deptno, d.dname
FROM emp e, dept d
WHERE e.deptno(+) = d.deptno
    AND e.sal(+)>2000;

--SELF JOIN
--p.127
--예제1
SELECT  e.empno 사원번호, e.ename 사원이름,
        m.empno 관리자사번, m.ename 관리자이름
FROM emp e, emp m
WHERE e.mgr = m.empno
ORDER BY 1;

--예제2
SELECT w.ename||' 관리자는 '||NVL(m.ename, '미정') as "관리자 정보"
FROM emp w, emp m
WHERE w.mgr=m.empno(+)
ORDER BY 1;

--p.129
--ANSI JOIN
--CROSS JOIN(카타시안 곱)
SELECT e.ename, d.dname
FROM emp e CROSS JOIN dept d;

SELECT e.ename, d.dname
FROM emp e, dept d; --CROSS JOIN과 결과 같음.

--p.130
--NATURAL JOIN
--예제1
SELECT e.ename, deptno, d.dname --두 개의 테이블에서 공통적으로 가지고 있는 컬럼은 deptno이다.
FROM emp e NATURAL JOIN dept d; --NATURAL JOIN에서는 select절에 컬럼명만 명시한다.

--예제2
SELECT d.deptno, d.dname, loc_code, l.city
FROM dept d NATURAL JOIN locations l
WHERE d.deptno in(10, 30);

--예제3
SELECT e.ename, e.sal, deptno, d.dname, loc_code, l.city
FROM emp e NATURAL JOIN dept d NATURAL JOIN locations l
ORDER BY 1;

--USING JOIN
--예제1
SELECT e.ename, deptno, d.dname
FROM emp e JOIN dept d USING(deptno) --컬럼을 deptno로 명시해서 조인
ORDER BY e.ename desc;

--예제2
SELECT d.deptno, d.dname, loc_code, l.city
FROM dept d JOIN locations l USING(loc_code) --loc_code 컬럼으로 조인하겠다.
WHERE d.deptno IN(10, 30);

--예제3
SELECT e.ename, d.dname, l.city
FROM emp e JOIN dept d USING(deptno)
    JOIN locations l USING(loc_code);

--p.134    
--ON JOIN
--예제1
SELECT e.ename 사원명, e.sal 사원급여, m.ename 매니저명, m.sal 매니저급여
FROM emp e JOIN emp m ON(e.mgr=m.empno);

--예제2 NON EQUI JOIN
SELECT e.ename, e.sal, s.grade
FROM emp e JOIN salgrade s ON(e.sal BETWEEN s.losal AND s.hisal);

--예제3
SELECT e.ename, d.dname, l.city
FROM emp e JOIN dept d ON(e.deptno=d.deptno)
     JOIN locations l ON(d.loc_code=l.loc_code)
WHERE e.ename NOT LIKE '%A%';
--'%A%'는 'A'문자가 1개 이상 포함된 경우

--p.136
--OUTER JOIN
--예제1
SELECT d.dname, d.loc_code, l.loc_code, l.city
FROM dept d LEFT OUTER JOIN locations l
    ON(d.loc_code=l.loc_code);

--오라클 표현 -----타이핑 하다 말았음;;
SELECT d.dname, d.loc_code, l.loc_code, l.city
FROM dept d LEFT OUTER JOIN locations l
    ON(d.loc_code=l.loc_code);

--예제2
SELECT d.dname, d.loc_code, l.loc_code, l.city
FROM dept d RIGHT OUTER JOIN locations l
    ON(d.loc_code=l.loc_code);

--오라클 표현 ---------얘도 타이핑 하다 말았음~    
SELECT d.dname, d.loc_code, l.loc_code, l.city
FROM dept d RIGHT OUTER JOIN locations l
    ON(d.loc_code=l.loc_code);
    
--예제3
SELECT d.dname, d.loc_code, l.loc_code, l.city
FROM dept d FULL OUTER JOIN locations l
    ON(d.loc_code=l.loc_code);
    
--예제4
SELECT e.ename, e.sal, d.deptno, d.dname
FROM emp e RIGHT OUTER JOIN dept d
    ON e.deptno=d.deptno AND e.sal>2000;


--서브쿼리(SUB QUERY)
SELECT job
FROM emp
WHERE empno=7839;

SELECT ename, job
FROM emp
WHERE job='PRESIDENT';

SELECT ename, job
FROM emp
WHERE job=( SELECT job --이 문장을 먼저 실행하고 그 결과 값을
            FROM emp --WHERE job과 비교하여 같은 값들을 메인 쿼리에서 출력함.
            WHERE empno=7369);

--예제1
SELECT sal
FROM emp
WHERE empno=7566;

SELECT ename, sal
FROM emp
WHERE sal>( SELECT sal
            FROM emp
            WHERE empno=7566);
            
--예제2
SELECT job
FROM emp
WHERE empno=7521; --SALESMAN

SELECT sal
FROM emp
WHERE empno=7934; --1300

SELECT empno, ename, job, hiredate, sal
FROM emp
WHERE job=( SELECT job
            FROM emp
            WHERE empno=7521)
    AND sal>(SELECT sal
            FROM emp
            WHERE empno=7934);

--예제3
SELECT MAX(sal) --5000
FROM emp;

SELECT ename, deptno, sal, hiredate
FROM emp
WHERE sal=5000;

SELECT ename, deptno, sal, hiredate
FROM emp
WHERE sal=( SELECT MAX(sal)
            FROM emp);

SELECT ename, deptno, sal, hiredate
FROM emp
WHERE sal=MAX(sal);
--오류 발생 원인: MAX()는 그룹함수이기 때문에 WHERE절에 사용 불가능.
--그룹함수는 group by having절에 사용함.

--예제4
SELECT AVG(sal)
FROM emp; --2073.214....

SELECT empno, ename, job, sal, deptno
FROM emp
WHERE sal<2073.214;

SELECT empno, ename, job, sal, deptno
FROM emp
WHERE sal<( SELECT AVG(sal)
            FROM emp);

--예제5
SELECT MIN(sal)
FROM emp
WHERE deptno=20; --800

SELECT deptno, MIN(sal)
FROM emp
GROUP BY deptno
HAVING MIN(sal)>800;

SELECT deptno, MIN(sal) --부서번호와 부서의 급여 최소값 출력
FROM emp
GROUP BY deptno --deptno(부서번호)를 기준으로 그룹 설정
HAVING MIN(sal)>(SELECT MIN(sal) --20번 부서의 최소급여를 출력하는 쿼리
                FROM emp
                WHERE deptno=20);
--HAVING절에도 서브쿼리 사용 가능함.



--p.159 (다중행 서브쿼리)
--IN 연산자
--예제1
SELECT empno, ename, sal, deptno
FROM emp
WHERE sal IN(SELECT MAX(sal)
             FROM emp
             GROUP BY deptno); --이 서브쿼리는 3개를 출력
--오류 발생: sal 값은 1개만 받을 수 있음

--수정
SELECT MAX(sal)
FROM emp
GROUP BY deptno;
--sal 값은 부서별(10, 20, 30) 합계의 결과 중

--예제2
SELECT ename, sal, job
FROM emp
WHERE job != 'SQLESMAN'
    AND sal > ANY (SELECT sal
                   FROM emp
                   WHERE job = 'SALESMAN'); --sal 값은 1600, 1250, 1500
--sal > ANY의 의미는 서브쿼리의 결과값 중서 제일 작은 값(1250)보다 크면 TRUE 발생
-- > ANY의 의미: 최소값보다 크다
SELECT sal from emp
WHERE job = 'SALESMAN';

--예제2-1
SELECT ename, sal, job
FROM emp
WHERE job != 'SQLESMAN'
    AND sal > (SELECT MIN(sal)
               FROM emp
               WHERE job = 'SALESMAN');

--예제2-2
SELECT ename, sal, job
FROM emp
WHERE job != 'SALESMAN'
    AND sal < (SELECT MIN(sal)
               FROM emp
               WHERE job = 'SALESMAN');
--sal < ANY의 의미는 서브쿼리의 결과값 중서 제일 큰 값(1600)보다 작으면 TRUE 발생
-- < ANY의 의미: 최대값보다 작다

--예제2-3
SELECT ename, sal, job
FROM emp
WHERE job != 'SALESMAN'
    AND sal < (SELECT MAX(sal)
               FROM emp
               WHERE job = 'SALESMAN'); --1600

--예제3
SELECT ename, sal, job, hiredate, deptno
FROM emp
WHERE job != 'SALESMAN'
    AND sal > ALL (SELECT sal
                   FROM emp
                   WHERE job = 'SALESMAN'); --1600, 1250, 1500
--서브쿼리의 sal(1600, 1250, 1500) 값들보다 큰 값을 출력
--서브쿼리의 최대값(1600)보다 큰 값을 출력

--예제3-1
SELECT ename, sal, job, hiredate, deptno
FROM emp
WHERE job != 'SALESMAN'
    AND sal > ALL (SELECT MAX(sal)
                   FROM emp
                   WHERE job = 'SALESMAN'); --1600

--예제3-2
SELECT ename, sal, job, hiredate, deptno
FROM emp
WHERE job != 'SALESMAN'
    AND sal < ALL (SELECT sal
                   FROM emp
                   WHERE job = 'SALESMAN'); --1600, 1250, 1500
--서브쿼리의 sal(1600, 1250, 1500) 값들보다 작은 값을 출력
--서브쿼리의 최소값(1250)보다 작은 값을 출력

--예제3-3
SELECT ename, sal, job, hiredate, deptno
FROM emp
WHERE job != 'SALESMAN'
    AND sal < ALL (SELECT MIN(sal)
                   FROM emp
                   WHERE job = 'SALESMAN'); --1600, 1250, 1500

--p.162(다중 열 서브쿼리)
--예제1
SELECT ename, mgr, deptno
FROM emp
WHERE mgr IN (SELECT mgr FROM emp WHERE ename IN('FORD', 'BLAKE'))
AND deptno IN (SELECT deptno FROM emp WHERE ename IN('FORD', 'BLAKE'))
AND ename NOT IN ('FORD', 'BLAKE');
--JONES 7839 20
--SCOTT 7566 20
--논리적인 오류 발생함.

SELECT ename, mgr, deptno
FROM emp
WHERE ename = 'FORD'; --7566, 20
SELECT ename, mgr, deptno
FROM emp
WHERE ename = 'BLAKE'; --7839, 30

SELECT ename, mgr, deptno
FROM emp
WHERE mgr IN (7839, 7566)
AND deptno IN (30, 20)
AND ename NOT IN ('FORD', 'BLAKE');


--예제2
SELECT ename, mgr, deptno
FROM emp
WHERE (mgr, deptno) IN (SELECT mgr, deptno FROM emp WHERE ename IN('FORD', 'BLAKE'))
AND ename NOT IN ('FORD', 'BLAKE');
--'FORD' 값에서 mgr:7566, deptno:20인 다른 사원들 출력
--'BLAKE' 값에서 mgr:7839, deptno:30인 다른 사원들 출력

SELECT * FROM emp;


--p.164(상호연관 서브쿼리)
--예제1
SELECT ename, sal, deptno, hiredate, job
FROM emp e
WHERE sal > (SELECT AVG(sal)
             FROM emp
            WHERE deptno = e.deptno);
--1) 메인쿼리에서 emp테이블의 1행을 읽어서 e.deptno값을 서브쿼리로 전달
--2) 서브쿼리는 메인쿼리에서 받은 부서번호로 평균급여를 계산
--3) 다시 메인쿼리는 서브쿼리의 평균급여보다 큰 값이면 직원 출력
--4) 위 과정을 14번 반복하게 됨.(emp테이블 행 개수)

SELECT deptno, ROUND(AVG(sal), 0)
FROM emp
GROUP BY deptno
ORDER BY 1;

--fROM절 서브쿼리 --> inline view라고 한다.
--예제1
SELECT e.empno, e.ename, e.deptno, d.dname, d.loc_code
FROM (SELECT * FROM emp WHERE deptno = 10) e, --부서번호가 10번인 사원들의 가상 테이블의 이름을 d
     (SELECT * FROM dept) d --dept테이블의 모든 컬럼들의 결과값을 d라는 이름으로 가상 테이블을 작성
WHERE e.deptno = d.deptno;
--상호연고나 서브쿼리로 변경가능한 경우에도 inline view가 서능 더 좋음

--p.170(TOP-N 서브쿼리)
--예제1
SELECT rownum, empno, ename, sal
FROM emp
ORDER BY sal DESC;
--from절의 emp 테이블의 내용을 한 행씩 읽어서 rownum 값은 1부터 시작하여 1씩 증가된 값이 부여된다.
--from절의 emp 테이블의 내용을 반복해서(14번) 읽을 때 1 증가된 값을 부여.

SELECT rownum, empno, ename, sal
FROM (SELECT empno, ename, sal
      FROM emp
      ORDER BY sal DESC);

SELECT rownum, empno, ename, sal
FROM emp
WHERE rownum<6;
--from절의 emp테이블의 내용을 한 행씩 읽어서 rownum값은 1부여하고
--where절에서 조건이 참이면 from절의 emp 테이블의 그 다음 행을 읽어서 1 증가된 값을 부여한다.

--p.171(스칼라 서브쿼리)
--예제1
SELECT empno, ename,
    (case WHEN deptno = (SELECT deptno FROM dept
                         WHERE loc_code='B1')
    THEN 'TOP' ELSE 'BRENCH' end) as location
    FROM emp;
--select 절의 서브쿼리는 emp 테이블의 부서번호와 dept 테이블의 loc_code가 'B1'인
--부서번호가 같을 경우 'TOP'출력, 다르면 'BRENCH' 출력

--예제2
SELECT ename, deptno, sal,
    (SELECT ROUND(AVG(sal), 0) FROM emp WHERE deptno=e.deptno) AS asal
FROM emp e;

--예제3
SELECT empno, ename, deptno, hiredate
FROM emp e
ORDER BY (SELECT dname
          FROM dept
          WHERE deptno = e.deptno) desc;

--
SELECT deptno, dname
FROM dept d
WHERE EXISTS (SELECT 'A'
              FROM emp
              WHERE deptno=d.deptno);
--dept 테이블의 한 행을 읽고, EXISTS 절의 서브쿼리에서 dept테이블의 deptno와
--emp 테이블의 deptno값을 비교하는데, 비교하는 중간에 값이 같을 경우에는 emp 텡비ㅡㄹ의
--나머지 값을 읽지 않는다.
--dept 테이블의 deptno값고 ㅏemp테이블의 deptno값이 같은 경우가 없을 경우에는 false가 반환된다.

SELECT deptno, dname
FROM dept d
WHERE NOT EXISTS (SELECT 'A'
              FROM emp
              WHERE deptno=d.deptno);

--p.176(WITH)
--예제1
SELECT deptno, SUM(sal)
FROM emp
GROUP BY deptno
HAVING SUM(sal) > ( SELECT AVG(SUM(sal))
                    FROM emp
                    GROUP BY deptno);

--예제2
WITH ABC AS(SELECT deptno, SUM(sal)
            FROM emp
            GROUP BY deptno)
--서브쿼리의 이름을 ABC라고 정의하고
--이것의 결과를 임시 테이블 스테이스에 저장한다.
SELECT *
FROM ABC
WHERE sum > ( SELECT AVG(sal) FROM emp);
--ABC가 서브쿼리로 변환되는 것이 아니고 ABC자리에
--서브쿼리의 결과값을 가지고 나머지 쿼리를 실행한다.

