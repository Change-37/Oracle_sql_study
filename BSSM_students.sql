CREATE TABLE depart (
    depart_id number,
    depart_name varchar2(100),
    primary key (depart_id)
);
DROP TABLE depart;

CREATE TABLE classes (
    grade_id number,
    class_id number,
    depart_id number,
    m_teacher number,
    s_teacher number,
    primary key (grade_id, class_id),
    foreign key (depart_id) references depart(depart_id) on delete cascade,
    foreign key (m_teacher) references teacher(teacher_id) on delete cascade,
    foreign key (s_teacher) references teacher(teacher_id) on delete cascade
);
DROP TABLE classes;

CREATE TABLE student (
    grade_id number,
    class_id number,
    student_id number,
    student_name varchar2(20),
    gender varchar2(20),
    primary key (grade_id, class_id, student_id),
    foreign key (grade_id, class_id) references classes(grade_id, class_id) on delete cascade
);
DROP TABLE student;

CREATE TABLE teacher (
    teacher_id number,
    teacher_name varchar2(20),
    primary key (teacher_id)
);
DROP TABLE teacher;

INSERT INTO depart values (1, '����Ʈ����߰�');
INSERT INTO depart values (2, '�Ӻ�������Ʈ����߰�');
INSERT INTO depart values (3, '-');

INSERT INTO teacher values (1,'��*��');
INSERT INTO teacher values (2,'��*��');
INSERT INTO teacher values (3,'��*��');
INSERT INTO teacher values (4,'��*��');
INSERT INTO teacher values (5,'��*��');
INSERT INTO teacher values (6,'��*��');
INSERT INTO teacher values (7,'��*��');
INSERT INTO teacher values (8,'��*��');
INSERT INTO teacher values (9,'��*��');
INSERT INTO teacher values (10,'��*��');
INSERT INTO teacher values (11,'��*��');
INSERT INTO teacher values (12,'��*��');
INSERT INTO teacher values (13,'��*��');
INSERT INTO teacher values (14,'��*��');
INSERT INTO teacher values (15,'��*��');
INSERT INTO teacher values (16,'��*��');

INSERT INTO classes values (1, 1, 3, 1, 9);
INSERT INTO classes values (1, 2, 3, 2 , 10);
INSERT INTO classes values (1, 3, 3, 3, 11);
INSERT INTO classes values (1, 4, 3, 4, 12);
INSERT INTO classes values (2, 1, 1, 5, 13);
INSERT INTO classes values (2, 2, 1, 6, 14);
INSERT INTO classes values (2, 3, 2, 7, 15);
INSERT INTO classes values (2, 4, 2, 8, 16);

INSERT INTO student values (1,1,1,'��*��','��');
INSERT INTO student values (1,1,2,'��*��','��');
INSERT INTO student values (1,1,3,'��*��','��');
INSERT INTO student values (1,2,1,'��*��','��');
INSERT INTO student values (1,2,2,'��*��','��');
INSERT INTO student values (1,2,3,'��*��','��');
INSERT INTO student values (1,3,1,'��*��','��');
INSERT INTO student values (1,3,2,'��*��','��');
INSERT INTO student values (1,3,3,'��*��','��');
INSERT INTO student values (1,4,1,'��*��','��');
INSERT INTO student values (1,4,2,'��*��','��');
INSERT INTO student values (1,4,3,'��*��','��');
INSERT INTO student values (2,1,1,'��*��','��');
INSERT INTO student values (2,1,2,'��*��','��');
INSERT INTO student values (2,1,3,'��*��','��');
INSERT INTO student values (2,2,1,'��*��','��');
INSERT INTO student values (2,2,2,'��*��','��');
INSERT INTO student values (2,2,3,'��*��','��');
INSERT INTO student values (2,3,1,'��*��','��');
INSERT INTO student values (2,3,2,'��*��','��');
INSERT INTO student values (2,3,3,'��*��','��');
INSERT INTO student values (2,4,1,'��*��','��');
INSERT INTO student values (2,4,2,'��*��','��');
INSERT INTO student values (2,4,3,'��*��','��');



--CREATE VIEW vw_student
--AS  SELECT s.grade_id, s.class_id, s.student_id, student_name, gender, depart_name, 
--    (SELECT teacher_name FROM teacher, classes WHERE m_teacher = teacher_id) as main_t, 
--    (SELECT teacher_name FROM teacher, classes WHERE s_teacher = teacher_id) as sub_t
--    FROM student s, classes c, depart d, teacher t
--    WHERE c.grade_id = s.grade_id and c.class_id = s.class_id and c.depart_id = d.depart_id
--    ;
CREATE VIEW vw_student
AS  SELECT s.grade_id, s.class_id, s.student_id, student_name, gender, depart_name,
        t_m.teacher_name as ��,
        t_s.teacher_name as ��
    FROM student s, classes c, depart d, teacher t_m, teacher t_s
    WHERE c.grade_id = s.grade_id and
        c.class_id = s.class_id and
        c.depart_id = d.depart_id and
        c.m_teacher = t_m.teacher_id and
        c.s_teacher = t_s.teacher_id
;
DROP VIEW vw_student;
    
SELECT teacher_name
FROM classes, teacher
WHERE m_teacher = teacher_id
;
SELECT *
FROM vw_student;