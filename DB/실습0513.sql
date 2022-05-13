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
