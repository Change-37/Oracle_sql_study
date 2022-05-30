SELECT ename AS "사원이름", job AS "사원업무"
FROM emp
;

SELECT ename, sal
FROM emp
WHERE deptno = 30
;

SELECT ename, sal, sal*0.1 AS "증가액", sal*1.1 AS "인상된 급여"
FROM emp
ORDER BY empno ASC
;