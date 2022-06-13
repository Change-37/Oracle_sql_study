--CREATE TABLE depart (
--    depart_id number,
--    depart_name varchar2(100),
--    primary key (depart_id)
--);
--DROP TABLE depart;
--
--CREATE TABLE classes (
--    grade_id number,
--    class_id number,
--    depart_id number,
--    m_teacher varchar2(20),
--    s_teacher varchar2(20),
--    primary key (grade_id, class_id),
--    foreign key (depart_id) references depart(depart_id) on delete cascade
--);
--DROP TABLE classes;
--
--CREATE TABLE student (
--    grade_id number,
--    class_id number,
--    student_id number,
--    name varchar2(20),
--    gender varchar2(20),
--    primary key (grade_id, class_id, student_id),
--    foreign key (grade_id, class_id) references classes(grade_id, class_id) on delete cascade
--);
--DROP TABLE student;

--INSERT INTO depart values (1, '����Ʈ����߰�');
--INSERT INTO depart values (2, '�Ӻ�������Ʈ����߰�');
--INSERT INTO depart values (3, '-');
--
--INSERT INTO classes values (1, 1, 3, '��*��', '��*��');
--INSERT INTO classes values (1, 2, 3, '��*��', '��*��');
--INSERT INTO classes values (1, 3, 3, '��*��', '��*��');
--INSERT INTO classes values (1, 4, 3, '��*��', '��*��');
--INSERT INTO classes values (2, 1, 1, '��*��', '��*��');
--INSERT INTO classes values (2, 2, 1, '��*��', '��*��');
--INSERT INTO classes values (2, 3, 2, '��*��', '��*��');
--INSERT INTO classes values (2, 4, 2, '��*��', '��*��');
--
--INSERT INTO student values (1,1,1,'��*��','��');
--INSERT INTO student values (1,1,2,'��*��','��');
--INSERT INTO student values (1,1,3,'��*��','��');
--INSERT INTO student values (1,2,1,'��*��','��');
--INSERT INTO student values (1,2,2,'��*��','��');
--INSERT INTO student values (1,2,3,'��*��','��');
--INSERT INTO student values (1,3,1,'��*��','��');
--INSERT INTO student values (1,3,2,'��*��','��');
--INSERT INTO student values (1,3,3,'��*��','��');
--INSERT INTO student values (1,4,1,'��*��','��');
--INSERT INTO student values (1,4,2,'��*��','��');
--INSERT INTO student values (1,4,3,'��*��','��');
--INSERT INTO student values (2,1,1,'��*��','��');
--INSERT INTO student values (2,1,2,'��*��','��');
--INSERT INTO student values (2,1,3,'��*��','��');
--INSERT INTO student values (2,2,1,'��*��','��');
--INSERT INTO student values (2,2,2,'��*��','��');
--INSERT INTO student values (2,2,3,'��*��','��');
--INSERT INTO student values (2,3,1,'��*��','��');
--INSERT INTO student values (2,3,2,'��*��','��');
--INSERT INTO student values (2,3,3,'��*��','��');
--INSERT INTO student values (2,4,1,'��*��','��');
--INSERT INTO student values (2,4,2,'��*��','��');
--INSERT INTO student values (2,4,3,'��*��','��');

CREATE VIEW vw_student
AS  SELECT s.grade_id, s.class_id, s.student_id, name, gender, depart_name, m_teacher, s_teacher
    FROM student s, classes c, depart d
    WHERE c.grade_id = s.grade_id and c.class_id = s.class_id and c.depart_id = d.depart_id
    ;
    
SELECT *
FROM vw_student;