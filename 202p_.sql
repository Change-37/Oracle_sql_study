SELECT ename AS "����̸�", job AS "�������"
FROM emp
;

SELECT ename, sal
FROM emp
WHERE deptno = 30
;

SELECT ename, sal, sal*0.1 AS "������", sal*1.1 AS "�λ�� �޿�"
FROM emp
ORDER BY empno ASC
;