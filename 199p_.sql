CREATE TABLE NewBook(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number
);

ALTER TABLE NewBook add isbn varchar2(13);
ALTER TABLE NewBook modify isbn number;
ALTER TABLE NewBook drop column isbn;

DROP TABLE NewBook;

CREATE TABLE NewBook(
    bookname varchar2(20) NOT NULL,
    publisher varchar2(20) UNIQUE,
    price NUMBER DEFAULT 10000 CHECK(price > 1000),
    PRIMARY KEY (bookname, publisher)
);


ALTER TABLE NewBook drop CONSTRAINT SYS_C008641;

ALTER TABLE NewBook add CONSTRAINT book_pk primary key(bookid);
ALTER TABLE NewBook drop CONSTRAINT book_pk;

insert
    into NewBook(bookname, publisher)
    values('C', 'C');
commit;

SELECT *
FROM newbook
;

CREATE TABLE NewCustomer (
    custid number PRIMARY KEY,
    name varchar2(40),
    address varchar2(40),
    phone varchar2(30)
);

CREATE TABLE NewOrders (
    orderid number,
    custid number NOT NULL,
    bookid number NOT NULL,
    saleprice number,
    PRIMARY KEY(orderid),
    FOREIGN KEY(custid) REFERENCES NewCustomer(custid) ON DELETE CASCADE
);


UPDATE customer
SET address='대한민국 부산'
WHERE custid=5
;

UPDATE customer
SET address=(
    SELECT address
    FROM customer
    WHERE name='김연아')
WHERE name='박세리'
;

CREATE TABLE cinema (
    cineid number(8) PRIMARY KEY,
    cinename varchar2(20),
    address varchar2(20)
);

CREATE TABLE screens (
    cineid number(8),
    screenid number(8) CHECK(screenid >= 1 AND screenid <= 10),
    moviename varchar2(20),
    price number(8) CHECK(price < 20000),
    chair number(8),
    PRIMARY KEY(cineid, screenid),
    FOREIGN KEY(cineid) REFERENCES cinema(cineid)
);

CREATE TABLE viewer (
    custid number(8),
    name varchar2(20),
    address varchar2(20),
    PRIMARY KEY(custid)
);

CREATE TABLE reservation (
    cineid number(8),
    screenid number(8),
    custid number(8),
    chairid number(8),
    moviedate date,
    PRIMARY KEY (cineid, screenid, custid),
    FOREIGN KEY(cineid, screenid) REFERENCES screens(cineid, screenid),
    FOREIGN KEY(custid) REFERENCES viewer(custid)
);
DROP TABLE reservation;

SELECT cinename, location
FROM cinema
;

SELECT cinename
FROM cinema
WHERE location='잠실'
;

SELECT name
FROM viewer
WHERE address='잠실'
;

SELECT cineid, screenid, moviename
FROM screens
WHERE price<=8000
;

SELECT viewer.name
FROM cinema, reservation, viewer
WHERE cinema.location = viewer.address AND cinema.cineid = reservation.cineid AND reservation.custid = viewer.custid
;

SELECT COUNT(*)
FROM cinema
;

SELECT AVG(price)
FROM screens
;

SELECT COUNT(moviedate)
FROM reservation
WHERE moviedate = '2020-09-01'
;

SELECT moviename
FROM screens, cinema
WHERE screens.cineid = cinema.cineid AND cinema.cinename = '대한'
;

SELECT name
FROM viewer
WHERE custid IN ( SELECT custid
                  FROM reservation
                  WHERE cineid IN ( SELECT cineid
                                    FROM cinema
                                    WHERE cinename = '대한'
        )
)
;

SELECT SUM(price * chair)
FROM screens
WHERE cineid IN ( SELECT cineid
                  FROM cinema
                  WHERE cinename = '대한'
)
;

SELECT cineid, COUNT(screenid)
FROM screens
GROUP BY cineid
;

SELECT COUNT(screenid)
FROM screens, cinema
WHERE screens.cineid = cinema.cineid AND cinema.location = '잠실'
GROUP BY cinema.location
;

SELECT AVG(screens.chair)
FROM screens, reservation
WHERE screens.cineid = reservation.cineid AND screens.screenid = reservation.screenid AND moviedate = TO_DATE('2020-09-01','yyyy-mm-dd')
GROUP BY moviedate
;

SELECT MAX(screens.chair)
FROM screens, reservation
WHERE screens.cineid = reservation.cineid AND screens.screenid = reservation.screenid AND moviedate = TO_DATE('2020-09-01','yyyy-mm-dd')
GROUP BY moviedate
;

INSERT INTO cinema
VALUES (4, 'CGV', '강남')
;

INSERT INTO screens
VALUES (4, 1, '어벤저스', 12000, 200)
;

INSERT INTO viewer
VALUES (1, '김상필', '잠실')
;

INSERT INTO reservation
VALUES (4, 1, 1, 23, TO_DATE('2020-09-01','yyyy-mm-dd'))
;

UPDATE screens
SET price = price * 1.1
;