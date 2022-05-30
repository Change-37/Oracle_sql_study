CREATE TABLE Salesperson (
    name varchar2(20) PRIMARY KEY,
    age number(3),
    salary number(10)
);

CREATE TABLE Customer (
    name varchar2(20) PRIMARY KEY,
    city varchar2(20),
    industrytype varchar2(20)
);

CREATE TABLE Orders (
    orderid number(8),
    custname varchar2(20),
    salesperson varchar2(20),
    amount number(8),
    PRIMARY KEY (custname, salesperson),
    FOREIGN KEY(custname) REFERENCES Customer(name) ON DELETE CASCADE,
    FOREIGN KEY(salesperson) REFERENCES Salesperson(name) ON DELETE CASCADE
);

SELECT DISTINCT name, salary
FROM salesperson
;

SELECT name
FROM customer
WHERE city LIKE '%»ê'
;

SELECT salesperson, COUNT(orderid)
FROM orders
GROUP BY salesperson
ORDER BY salesperson ASC
;

SELECT salesperson.name, salesperson.age
FROM salesperson, customer, orders
WHERE salesperson.name = orders.salesperson AND customer.name = orders.custname AND customer.city = 'ºÎ»ê'
;

UPDATE salesperson
SET salary = 45000
WHERE name = 'Á¤ÇÑ¼­'
;


CREATE TABLE Employee(
    empno number(8),
    name varchar2(20),
    phoneno varchar2(20),
    address varchar2(20),
    sex varchar2(8),
    position varchar2(20),
    deptno number(4),
    PRIMARY KEY (empno),
    FOREIGN KEY (deptno) REFERENCES Department(deptno)
)
;

CREATE TABLE Department (
    deptno number(4),
    deptname varchar2(20),
    manager varchar2(20),
    PRIMARY KEY (deptno)
)
;

CREATE TABLE Project (
    projno number(4),
    projname varchar2(20),
    deptno number(4),
    PRIMARY KEY (projno),
    FOREIGN KEY (deptno) REFERENCES Department(deptno)
)
;

CREATE TABLE Works (
    empno number(8),
    projno number(4),
    workhour varchar2(8),
    PRIMARY KEY (empno, projno),
    FOREIGN KEY (empno) REFERENCES Employee(empno),
    FOREIGN KEY (projno) REFERENCES Project(projno)
)
;

INSERT into department
values(3, '¹«½¼ÆÀ', null)
;

SELECT name
FROM employee
;

SELECT manager
FROM department
;

SELECT COUNT(empno)
FROM employee
WHERE deptno IN ( SELECT deptno
                  FROM department
                  WHERE manager = '±èÁö¿ø'
);

SELECT project.projno, project.projname, COUNT(empno)
FROM project, works
WHERE project.projno = works.projno
GROUP BY (project.projno, project.projname) HAVING COUNT(empno) >= 2
;

