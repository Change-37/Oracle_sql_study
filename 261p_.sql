CREATE OR REPLACE VIEW vw_book(bookname)
AS SELECT bookname
FROM book
WHERE bookname LIKE '%축구%'
;

SELECT * FROM vw_book;

DROP view vw_book;

create or replace view vw_cinecust
as select cinename, name
from cinema, reservation, viewer
where cinema.cineid = reservation.cineid AND viewer.custid = reservation.custid
;

select * from vw_cinecust;

create or replace view vw_daehanviewer
as select moviedate, count(reservation.custid) as count
from cinema, reservation
where cinema.cineid = reservation.cineid 
AND cinema.cinename like '대한'
group by moviedate
order by moviedate ASC
;

select * from vw_daehanviewer;


create view vw_cinereserv(cinename, cnt)
as select a.cinename, count(*)
from cinema a, reservation b
where a.cineid = b.cineid
group by a.cinename
;

select * from vw_cinereserv; -- 전체 보기

select cnt from vw_cinereserv where cinename='롯데'; -- 일부 보기

select min(cnt) from vw_cinereserv; -- 예약수 최저값

select count(*) from vw_cinereserv; -- 뷰가 몇줄로 구성되어있는지

select cinename from vw_cinereserv where cnt > 100; -- 100보다 많은 예약수를 가졌는지

select cinename from vw_cinereserv order by cnt; -- 예약수를 기준으로 정렬