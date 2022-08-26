--p.80
--���� 1
SELECT ename, sal, comm, sal+comm, sal+NVL(comm, 0)
FROM emp
WHERE deptno=30;
-- sal+comm���� comm���� NULL�̸� ����� NULL�� �ȴ�.
-- sal+NVL(comm, 0)���� comm ���� NULL�̸� 0�� ���� ��ȯ

--����2
SELECT ename, deptno, mgr, NVL2(mgr, mgr||'���', '������')
FROM emp
WHERE deptno!=30;
--NVL2(mgr, mgr||'���', '������')���� mgr�� NULL�� �ƴϸ�, ������ mgr||'���' ��ȯ
--NULL�̸� '������' ��ȯ

--p.81
--����3
SELECT ename, job, NULLIF(job, 'SALESMAN') AS result
FROM emp
WHERE deptno=30;
--NULLIF(job, 'SALESMAN')���� job�� 'SALESMAN'�� ������ NULL ��ȯ
--���� �ʴٸ� job�� ��ȯ

--����4
SELECT ename, comm, sal, COALESCE(comm, sal, 50)
FROM emp;
--COALESCE(comm, sal, 50)���� comm�� NULL�� �ƴϸ� comm ��ȯ
--comm�� NULL�̰� sal�� NULL�� �ƴ϶�� sal ��ȯ
--�� �� NULL�̶�� 50 ��ȯ

--p.82
--����5
SELECT ename, sal, comm, GREATEST(sal, comm) ���
FROM emp
WHERE comm IS NOT NULL;
--GREATEST(sal, comm)���� ū ���� ��ȯ

SELECT ename, sal, comm, GREATEST(sal, comm) ���
FROM emp;
--GREATEST(sal, comm)���� �� �߿� �ϳ��� NULL�̸� ����� NULL

--����6
SELECT ename, sal, comm, LEAST(sal, comm) ���
FROM emp
WHERE comm IS NOT NULL;

SELECT ename, sal, comm, LEAST(sal, comm) ���
FROM emp;

--p.83
--����7
SELECT  empno, ename, sal, job,
        DECODE(job, 'ANALYST', sal*1.1, --job�� 'ANALYST'�� sal*1.1
                    'CLERK', sal*1.2, --job�� 'CLERTK'�� sal*1.2
                    'MANAGER', sal*1.3, --job�� 'MANAGER'�� sal*1.3
                    'PRESIDENT', sal*1.4, --job�� 'PRESIDENT'�� sal*1.4
                    'SALESMAN', sal*1.5, --job�� 'SALESMAN'�� sal*1.5
                    sal) ������ --default: job�� ���� ���ڿ��� ���� ���� ���, sal ��ȯ
        --default�� sal�ε�, ���� sal�� ���ٸ�, NULL�� ��ȯ
FROM emp;

--p.84
--����9
SELECT  ename, sal,
        DECODE(SIGN(sal-1000), -1, 'A', --sal ���� 1000���� ������ A
        DECODE(SIGN(sal-2500), -1, 'B', 'C')) grade --sal ���� 2500���� ������ B
                                                    --2500 �̻��̸� C
FROM emp;
--SIGN(sal-1000)���� sal-1000 ���� 0���� ũ�� 1, 0���� ������ -1, 0�� ������ 0 ��ȯ

--����8
SELECT  empno, ename, sal, job,
        CASE job WHEN 'ANALYST' THEN sal*1.1 --job�� 'ANALYST'�� sal*1.1
                 WHEN 'CLERK' THEN sal*1.2 --job�� 'CLERTK'�� sal*1.2
                 WHEN 'MANAGER' THEN sal*1.3 --job�� 'MANAGER'�� sal*1.3
                 WHEN 'PRESIDENT' THEN sal*1.4 --job�� 'PRESIDENT'�� sal*1.4
                 WHEN 'SALESMAN' THEN sal*1.5 --job�� 'SALESMAN'�� sal*1.5
                 ELSE sal --Default
        END salary --��Ī
FROM emp;
--����7�� ���� ��

--�׷��Լ�
--����1
SELECT min(ename), max(ename), min(hiredate), max(hiredate)
FROM emp;
--���ڿ� ��¥ �����͵� �ִ밪�� �ּҰ��� ���� �� �ִ�.
SELECT ename, hiredate
FROM emp
ORDER BY hiredate;

--����2
SELECT avg(sal), max(sal), min(sal), sum(sal)
FROM emp
WHERE job='SALESMAN';

SELECT job
FROM emp;

--����3
SELECT count(*) c1, count(comm) c2, avg(comm) c3, avg(NVL(comm, 0)) c4
FROM emp;
--count(*)�� emp ���̺��� ���� ����, count(comm)�� comm���� null �� �ƴ� �������� ����
--avg(comm)�� comm���� null�� �ƴ� �������� ���
--avg(NVL(comm, 0))�� comm���� null�̸� 0���� ��ȯ�Ͽ�, ��ü ��� ����

--����4
SELECT count(deptno) c1, count(DISTINCT deptno) c2, count(DISTINCT job) c3
FROM emp;

--����5
SELECT avg(comm), sum(comm)/14
FROM emp;
--avg(comm)�� comm������ NULL�� ������ ���� ���
--sum(comm)/14�� comm������ NULL�� ������ ���� ����� ��?????????

--����6
SELECT avg(NVL(comm, 0)), sum(comm)/14
FROM emp;

--����7
SELECT  count(deptno), count(distinct deptno),
        sum(deptno), sum(distinct deptno)
FROM emp;
--sum(distinct deptno)�� dpetno���� �ߺ��� ������ ��

--p.95
--����1
SELECT deptno, count(*), TRUNC(avg(sal), 1), min(sal), max(sal), sum(sal)
FROM emp
GROUP BY deptno;

--����2
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
--Group by���� ���� �÷��� Select ���� ��� �Ұ���

--����3
SELECT job, count(*), trunc(avg(sal)), sum(sal)
FROM emp
GROUP BY job;
--job�� �������� group�� ����
--count(*)�� ���������� �ӵ��� ���Ͻ�Ű�� ������ �� �� ����.

--����4
SELECT job, deptno, count(*), trunc(avg(sal)), sum(sal)
FROM emp    
GROUP BY job, deptno; --job, deptno 2���� �׷��� �������� ��.

--p.98 HAVING
--����1
SELECT deptno, count(*), sum(sal)
FROM emp
GROUP BY deptno
HAVING count(*)>4; --emp���̺� ����� �μ���ȣ(deptno)�� ������ 5���� ū �μ���ȣ�� ���

--����2
SELECT deptno, avg(sal), sum(sal)
FROM emp
GROUP BY deptno
HAVING max(sal)>2900; --select ���� ������, �׷��Լ��� ��� ������.
--deptno(�μ�) ��� �߿��� sal���� 2900���� ū �����Ͱ� ������ true
--�μ� 30���� ����� �ȵ�.

--����3
SELECT job, avg(sal), sum(sal)
FROM emp
HAVING avg(sal)>=3000
GROUP BY job;

-- ����!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--5/16 ���� ����

--Grouping sets
--p.107
--����1
SELECT deptno, job, sum(sal)
FROM emp
GROUP BY GROUPING SETS(deptno, job);

--����2
SELECT deptno, NULL job, sum(sal)
FROM emp
GROUP BY deptno
UNION ALL
SELECT NULL detpno, job, SUM(sal)
FROM emp
GROUP BY job;

--109������ ���蹮���� �� ����~~~~ JOIN ���� �����Ŵ�~

SELECT * FROM emp; --14��
SELECT * FROM dept; --4��

SELECT empno, ename, dname, loc
FROM emp, dept --emp ���̺��� �� 14 * dept ���̺��� �� 4 => 56
ORDER BY empno; --�����͸� ������ ��

SELECT e.empno, e.ename, d.deptno, d.dname, d.loc
FROM emp e, dept d --���̺� �̸����� ��Ī(ALIAS) ��� ����
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

-- DEPT���̺� ������ ����
INSERT INTO DEPT VALUES(10,'ACCOUNTING','A1');
INSERT INTO DEPT VALUES(20,'RESEARCH','B1');
INSERT INTO DEPT VALUES(30,'SALES','C1');
INSERT INTO DEPT VALUES(40,'OPERATIONS','A1');
INSERT INTO DEPT VALUES(50,'INSA',NULL);

-- EMP���̺� ������ ����
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

-- SALGRADE���̺� ������ ����
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);

-- LOCATIONS ���̺� ������ ����
INSERT INTO LOCATIONS VALUES ('A1','SEOUL');
INSERT INTO LOCATIONS VALUES ('B1','DALLAS');
INSERT INTO LOCATIONS VALUES ('C1','CHICAGO');
INSERT INTO LOCATIONS VALUES ('D1','BOSTON');
commit;

SELECT * FROM emp; --14��
SELECT * FROM dept; --5��
SELECT * FROM dept; --4��
SELECT * FROM LOCATIONS; --4��

--īŸ�þ� ��
SELECT e.empno, e.ename, e.deptno, d.deptno, d.dname
FROM emp e, dept d; -- 14�� * 5�� = 70��

--p. 119(EQUI JOIN)
--����1
SELECT e.empno, e.ename, e.deptno, d.deptno, d.dname
FROM emp e, dept d
WHERE d.deptno = e.deptno
ORDER BY d.deptno;

--����2
SELECT e.empno, e.ename, e.deptno, d.deptno, d.dname, d.loc_code
FROM emp e, dept d
WHERE d.deptno = e.deptno AND e.job = 'SALESMAN';

--����3
SELECT e.ename, d.dname, e.deptno ed, d.deptno dd, d.loc_code dl, l.loc_code ll, e.sal, l.city
FROM emp e, dept d, locations l
WHERE d.deptno = e.deptno AND d.loc_code = l.loc_code;

--����4
SELECT e.ename, d.dname, e.deptno ed, d.deptno dd, d.loc_code dl, l.loc_code ll, e.sal, l.city
FROM emp e, dept d, locations l
WHERE d.deptno = e.deptno
    AND d.loc_code = l.loc_code
    AND e.sal > 1500
    AND l.city = 'DALLAS';

--p.121(NON-EQUI JOIN)
SELECT * FROM salgrade;

--����1
SELECT e.empno, e.ename, e.job, e.sal, s.grade, s.losal, s.hisal
FROM salgrade s, emp e
WHERE e.sal >= s.losal AND e.sal <= s.hisal;

--����2
SELECT e.empno, e.ename, e.job, e.sal, s.grade, s.losal, s.hisal
FROM salgrade s, emp e
WHERE e.sal BETWEEN s.losal AND s.hisal;
--����1�� ����� ������.

--OUTER JOIN
--����1
SELECT  e.empno, e.ename, e.job, e.deptno e_deptno,
        d.deptno d_deptno, d.dname
FROM dept d, emp e
WHERE d.deptno = e.deptno(+);
--d.deptno: �������̺�(dept), e.deptno(+): emp���̺�(�����Ͱ� ������ ��)

--����2
SELECT d.deptno, d.dname, d.loc_code, l.loc_code, l.city
FROM dept d, locations l
WHERE d.loc_code = l.loc_code(+);
--�������̺�: dept
--������ ���̺�(locations)�� '(+)' ��ȣ ����

--����3
SELECT d.deptno, d.dname, l.loc_code, l.city
FROM dept d, locations l
WHERE d.loc_code(+) = l.loc_code;

--����4
SELECT d.deptno, d.dname, l.loc_code, l.city
FROM dept d, locations l
WHERE d.loc_code(+) = l.loc_code(+);

--����5
SELECT e.ename, e.sal, e.deptno, d.deptno, d.dname
FROM emp e, dept d
WHERE e.deptno(+) = d.deptno
    AND e.sal>2000;
--(���� ����)OUTER JOIN �Ŀ� e.sal>2000 üũ�Ͽ� OUTER JOIN�� ȿ��Xx

--����6
SELECT e.ename, e.sal, e.deptno, d.deptno, d.dname
FROM emp e, dept d
WHERE e.deptno(+) = d.deptno
    AND e.sal(+)>2000;

--SELF JOIN
--p.127
--����1
SELECT  e.empno �����ȣ, e.ename ����̸�,
        m.empno �����ڻ��, m.ename �������̸�
FROM emp e, emp m
WHERE e.mgr = m.empno
ORDER BY 1;

--����2
SELECT w.ename||' �����ڴ� '||NVL(m.ename, '����') as "������ ����"
FROM emp w, emp m
WHERE w.mgr=m.empno(+)
ORDER BY 1;

--p.129
--ANSI JOIN
--CROSS JOIN(īŸ�þ� ��)
SELECT e.ename, d.dname
FROM emp e CROSS JOIN dept d;

SELECT e.ename, d.dname
FROM emp e, dept d; --CROSS JOIN�� ��� ����.

--p.130
--NATURAL JOIN
--����1
SELECT e.ename, deptno, d.dname --�� ���� ���̺��� ���������� ������ �ִ� �÷��� deptno�̴�.
FROM emp e NATURAL JOIN dept d; --NATURAL JOIN������ select���� �÷��� ����Ѵ�.

--����2
SELECT d.deptno, d.dname, loc_code, l.city
FROM dept d NATURAL JOIN locations l
WHERE d.deptno in(10, 30);

--����3
SELECT e.ename, e.sal, deptno, d.dname, loc_code, l.city
FROM emp e NATURAL JOIN dept d NATURAL JOIN locations l
ORDER BY 1;

--USING JOIN
--����1
SELECT e.ename, deptno, d.dname
FROM emp e JOIN dept d USING(deptno) --�÷��� deptno�� ����ؼ� ����
ORDER BY e.ename desc;

--����2
SELECT d.deptno, d.dname, loc_code, l.city
FROM dept d JOIN locations l USING(loc_code) --loc_code �÷����� �����ϰڴ�.
WHERE d.deptno IN(10, 30);

--����3
SELECT e.ename, d.dname, l.city
FROM emp e JOIN dept d USING(deptno)
    JOIN locations l USING(loc_code);

--p.134    
--ON JOIN
--����1
SELECT e.ename �����, e.sal ����޿�, m.ename �Ŵ�����, m.sal �Ŵ����޿�
FROM emp e JOIN emp m ON(e.mgr=m.empno);

--����2 NON EQUI JOIN
SELECT e.ename, e.sal, s.grade
FROM emp e JOIN salgrade s ON(e.sal BETWEEN s.losal AND s.hisal);

--����3
SELECT e.ename, d.dname, l.city
FROM emp e JOIN dept d ON(e.deptno=d.deptno)
     JOIN locations l ON(d.loc_code=l.loc_code)
WHERE e.ename NOT LIKE '%A%';
--'%A%'�� 'A'���ڰ� 1�� �̻� ���Ե� ���

--p.136
--OUTER JOIN
--����1
SELECT d.dname, d.loc_code, l.loc_code, l.city
FROM dept d LEFT OUTER JOIN locations l
    ON(d.loc_code=l.loc_code);

--����Ŭ ǥ�� -----Ÿ���� �ϴ� ������;;
SELECT d.dname, d.loc_code, l.loc_code, l.city
FROM dept d LEFT OUTER JOIN locations l
    ON(d.loc_code=l.loc_code);

--����2
SELECT d.dname, d.loc_code, l.loc_code, l.city
FROM dept d RIGHT OUTER JOIN locations l
    ON(d.loc_code=l.loc_code);

--����Ŭ ǥ�� ---------�굵 Ÿ���� �ϴ� ������~    
SELECT d.dname, d.loc_code, l.loc_code, l.city
FROM dept d RIGHT OUTER JOIN locations l
    ON(d.loc_code=l.loc_code);
    
--����3
SELECT d.dname, d.loc_code, l.loc_code, l.city
FROM dept d FULL OUTER JOIN locations l
    ON(d.loc_code=l.loc_code);
    
--����4
SELECT e.ename, e.sal, d.deptno, d.dname
FROM emp e RIGHT OUTER JOIN dept d
    ON e.deptno=d.deptno AND e.sal>2000;


--��������(SUB QUERY)
SELECT job
FROM emp
WHERE empno=7839;

SELECT ename, job
FROM emp
WHERE job='PRESIDENT';

SELECT ename, job
FROM emp
WHERE job=( SELECT job --�� ������ ���� �����ϰ� �� ��� ����
            FROM emp --WHERE job�� ���Ͽ� ���� ������ ���� �������� �����.
            WHERE empno=7369);

--����1
SELECT sal
FROM emp
WHERE empno=7566;

SELECT ename, sal
FROM emp
WHERE sal>( SELECT sal
            FROM emp
            WHERE empno=7566);
            
--����2
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

--����3
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
--���� �߻� ����: MAX()�� �׷��Լ��̱� ������ WHERE���� ��� �Ұ���.
--�׷��Լ��� group by having���� �����.

--����4
SELECT AVG(sal)
FROM emp; --2073.214....

SELECT empno, ename, job, sal, deptno
FROM emp
WHERE sal<2073.214;

SELECT empno, ename, job, sal, deptno
FROM emp
WHERE sal<( SELECT AVG(sal)
            FROM emp);

--����5
SELECT MIN(sal)
FROM emp
WHERE deptno=20; --800

SELECT deptno, MIN(sal)
FROM emp
GROUP BY deptno
HAVING MIN(sal)>800;

SELECT deptno, MIN(sal) --�μ���ȣ�� �μ��� �޿� �ּҰ� ���
FROM emp
GROUP BY deptno --deptno(�μ���ȣ)�� �������� �׷� ����
HAVING MIN(sal)>(SELECT MIN(sal) --20�� �μ��� �ּұ޿��� ����ϴ� ����
                FROM emp
                WHERE deptno=20);
--HAVING������ �������� ��� ������.



--p.159 (������ ��������)
--IN ������
--����1
SELECT empno, ename, sal, deptno
FROM emp
WHERE sal IN(SELECT MAX(sal)
             FROM emp
             GROUP BY deptno); --�� ���������� 3���� ���
--���� �߻�: sal ���� 1���� ���� �� ����

--����
SELECT MAX(sal)
FROM emp
GROUP BY deptno;
--sal ���� �μ���(10, 20, 30) �հ��� ��� ��

--����2
SELECT ename, sal, job
FROM emp
WHERE job != 'SQLESMAN'
    AND sal > ANY (SELECT sal
                   FROM emp
                   WHERE job = 'SALESMAN'); --sal ���� 1600, 1250, 1500
--sal > ANY�� �ǹ̴� ���������� ����� �߼� ���� ���� ��(1250)���� ũ�� TRUE �߻�
-- > ANY�� �ǹ�: �ּҰ����� ũ��
SELECT sal from emp
WHERE job = 'SALESMAN';

--����2-1
SELECT ename, sal, job
FROM emp
WHERE job != 'SQLESMAN'
    AND sal > (SELECT MIN(sal)
               FROM emp
               WHERE job = 'SALESMAN');

--����2-2
SELECT ename, sal, job
FROM emp
WHERE job != 'SALESMAN'
    AND sal < (SELECT MIN(sal)
               FROM emp
               WHERE job = 'SALESMAN');
--sal < ANY�� �ǹ̴� ���������� ����� �߼� ���� ū ��(1600)���� ������ TRUE �߻�
-- < ANY�� �ǹ�: �ִ밪���� �۴�

--����2-3
SELECT ename, sal, job
FROM emp
WHERE job != 'SALESMAN'
    AND sal < (SELECT MAX(sal)
               FROM emp
               WHERE job = 'SALESMAN'); --1600

--����3
SELECT ename, sal, job, hiredate, deptno
FROM emp
WHERE job != 'SALESMAN'
    AND sal > ALL (SELECT sal
                   FROM emp
                   WHERE job = 'SALESMAN'); --1600, 1250, 1500
--���������� sal(1600, 1250, 1500) ���麸�� ū ���� ���
--���������� �ִ밪(1600)���� ū ���� ���

--����3-1
SELECT ename, sal, job, hiredate, deptno
FROM emp
WHERE job != 'SALESMAN'
    AND sal > ALL (SELECT MAX(sal)
                   FROM emp
                   WHERE job = 'SALESMAN'); --1600

--����3-2
SELECT ename, sal, job, hiredate, deptno
FROM emp
WHERE job != 'SALESMAN'
    AND sal < ALL (SELECT sal
                   FROM emp
                   WHERE job = 'SALESMAN'); --1600, 1250, 1500
--���������� sal(1600, 1250, 1500) ���麸�� ���� ���� ���
--���������� �ּҰ�(1250)���� ���� ���� ���

--����3-3
SELECT ename, sal, job, hiredate, deptno
FROM emp
WHERE job != 'SALESMAN'
    AND sal < ALL (SELECT MIN(sal)
                   FROM emp
                   WHERE job = 'SALESMAN'); --1600, 1250, 1500

--p.162(���� �� ��������)
--����1
SELECT ename, mgr, deptno
FROM emp
WHERE mgr IN (SELECT mgr FROM emp WHERE ename IN('FORD', 'BLAKE'))
AND deptno IN (SELECT deptno FROM emp WHERE ename IN('FORD', 'BLAKE'))
AND ename NOT IN ('FORD', 'BLAKE');
--JONES 7839 20
--SCOTT 7566 20
--������ ���� �߻���.

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


--����2
SELECT ename, mgr, deptno
FROM emp
WHERE (mgr, deptno) IN (SELECT mgr, deptno FROM emp WHERE ename IN('FORD', 'BLAKE'))
AND ename NOT IN ('FORD', 'BLAKE');
--'FORD' ������ mgr:7566, deptno:20�� �ٸ� ����� ���
--'BLAKE' ������ mgr:7839, deptno:30�� �ٸ� ����� ���

SELECT * FROM emp;


--p.164(��ȣ���� ��������)
--����1
SELECT ename, sal, deptno, hiredate, job
FROM emp e
WHERE sal > (SELECT AVG(sal)
             FROM emp
            WHERE deptno = e.deptno);
--1) ������������ emp���̺��� 1���� �о e.deptno���� ���������� ����
--2) ���������� ������������ ���� �μ���ȣ�� ��ձ޿��� ���
--3) �ٽ� ���������� ���������� ��ձ޿����� ū ���̸� ���� ���
--4) �� ������ 14�� �ݺ��ϰ� ��.(emp���̺� �� ����)

SELECT deptno, ROUND(AVG(sal), 0)
FROM emp
GROUP BY deptno
ORDER BY 1;

--fROM�� �������� --> inline view��� �Ѵ�.
--����1
SELECT e.empno, e.ename, e.deptno, d.dname, d.loc_code
FROM (SELECT * FROM emp WHERE deptno = 10) e, --�μ���ȣ�� 10���� ������� ���� ���̺��� �̸��� d
     (SELECT * FROM dept) d --dept���̺��� ��� �÷����� ������� d��� �̸����� ���� ���̺��� �ۼ�
WHERE e.deptno = d.deptno;
--��ȣ���� ���������� ���氡���� ��쿡�� inline view�� ���� �� ����

--p.170(TOP-N ��������)
--����1
SELECT rownum, empno, ename, sal
FROM emp
ORDER BY sal DESC;
--from���� emp ���̺��� ������ �� �྿ �о rownum ���� 1���� �����Ͽ� 1�� ������ ���� �ο��ȴ�.
--from���� emp ���̺��� ������ �ݺ��ؼ�(14��) ���� �� 1 ������ ���� �ο�.

SELECT rownum, empno, ename, sal
FROM (SELECT empno, ename, sal
      FROM emp
      ORDER BY sal DESC);

SELECT rownum, empno, ename, sal
FROM emp
WHERE rownum<6;
--from���� emp���̺��� ������ �� �྿ �о rownum���� 1�ο��ϰ�
--where������ ������ ���̸� from���� emp ���̺��� �� ���� ���� �о 1 ������ ���� �ο��Ѵ�.

--p.171(��Į�� ��������)
--����1
SELECT empno, ename,
    (case WHEN deptno = (SELECT deptno FROM dept
                         WHERE loc_code='B1')
    THEN 'TOP' ELSE 'BRENCH' end) as location
    FROM emp;
--select ���� ���������� emp ���̺��� �μ���ȣ�� dept ���̺��� loc_code�� 'B1'��
--�μ���ȣ�� ���� ��� 'TOP'���, �ٸ��� 'BRENCH' ���

--����2
SELECT ename, deptno, sal,
    (SELECT ROUND(AVG(sal), 0) FROM emp WHERE deptno=e.deptno) AS asal
FROM emp e;

--����3
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
--dept ���̺��� �� ���� �а�, EXISTS ���� ������������ dept���̺��� deptno��
--emp ���̺��� deptno���� ���ϴµ�, ���ϴ� �߰��� ���� ���� ��쿡�� emp �޺�Ѥ���
--������ ���� ���� �ʴ´�.
--dept ���̺��� deptno���� ��emp���̺��� deptno���� ���� ��찡 ���� ��쿡�� false�� ��ȯ�ȴ�.

SELECT deptno, dname
FROM dept d
WHERE NOT EXISTS (SELECT 'A'
              FROM emp
              WHERE deptno=d.deptno);

--p.176(WITH)
--����1
SELECT deptno, SUM(sal)
FROM emp
GROUP BY deptno
HAVING SUM(sal) > ( SELECT AVG(SUM(sal))
                    FROM emp
                    GROUP BY deptno);

--����2
WITH ABC AS(SELECT deptno, SUM(sal)
            FROM emp
            GROUP BY deptno)
--���������� �̸��� ABC��� �����ϰ�
--�̰��� ����� �ӽ� ���̺� �����̽��� �����Ѵ�.
SELECT *
FROM ABC
WHERE sum > ( SELECT AVG(sal) FROM emp);
--ABC�� ���������� ��ȯ�Ǵ� ���� �ƴϰ� ABC�ڸ���
--���������� ������� ������ ������ ������ �����Ѵ�.


--0826
-- p.144
select * from emp;

create table emp_history (name, title, deptid)
as select ename, job, deptno from emp;

select * from emp_history;

select ename, job from emp
UNION -- ���� �����ʹ� 1���� ����Ѵ�.
select name, title from emp_history;

select ename, job from emp
UNION ALL -- 2���� ���̺��� ��� �����͸� ����Ѵ�.
select name, title from emp_history;

delete emp_history where title='CLERK';

select ename, job from emp
INTERSECT -- 2���� ���̺��� ����� �����͸� ����Ѵ�.
select name, title from emp_history;

select ename, job from emp
MINUS -- emp ���̺�� emp_history ���̺��� ����� �����͸�  �����ϰ�
-- emp ���̺� �ִ� �����͸� ���
select name, title from emp_history;

-- p.149
select deptno, TO_CHAR(NULL) location, hiredate from emp
UNION
select  deptno, dname, TO_DATE(null) from dept;

select deptno, TO_CHAR(NULL) location, hiredate from emp
UNION
select  deptno, dname, TO_CHAR(null) from dept;
-- UNION�� �ϱ����ؼ��� �÷����� ������ Ÿ���� ���ƾ� �Ѵ�.