create table teacher(
    tid number(4),
    tname varchar2(5),
    tphone varchar2(15),
    primary key(tid)
);
drop table teacher;
 
create table members(
    mid number(4),
    mname varchar2(5),
    mphone varchar2(15),
    primary key (mid)
);
drop table members;

create table classes(
    cid number(8),
    cname varchar2(20),
    teacher number(4),
    croom varchar2(4),
    day number(1),
    start_time number(4),
    end_time number(4),
    cur_member number(3),
    max_member number(3),
    primary key(cid),
    foreign key (teacher) references teacher(tid) on delete cascade
);
drop table classes;

create table registration(
    mid number(4),
    cid number(8),
    primary key (mid, cid),
    foreign key (mid) references members(mid) on delete cascade,
    foreign key (cid) references classes(cid) on delete cascade
);
drop table registration;