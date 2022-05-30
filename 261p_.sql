CREATE OR REPLACE VIEW vw_book(bookname)
AS SELECT bookname
FROM book
WHERE bookname LIKE '%�౸%'
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
AND cinema.cinename like '����'
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

select * from vw_cinereserv; -- ��ü ����

select cnt from vw_cinereserv where cinename='�Ե�'; -- �Ϻ� ����

select min(cnt) from vw_cinereserv; -- ����� ������

select count(*) from vw_cinereserv; -- �䰡 ���ٷ� �����Ǿ��ִ���

select cinename from vw_cinereserv where cnt > 100; -- 100���� ���� ������� ��������

select cinename from vw_cinereserv order by cnt; -- ������� �������� ����