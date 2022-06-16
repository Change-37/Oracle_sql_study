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

INSERT INTO depart values (1, '¼ÒÇÁÆ®¿þ¾î°³¹ß°ú');
INSERT INTO depart values (2, 'ÀÓº£µðµå¼ÒÇÁÆ®¿þ¾î°³¹ß°ú');
INSERT INTO depart values (3, '-');

INSERT INTO teacher values (1,'±¸*¿µ');
INSERT INTO teacher values (2,'Á¶*°â');
INSERT INTO teacher values (3,'±è*¿µ');
INSERT INTO teacher values (4,'À¯*Âù');
INSERT INTO teacher values (5,'Â÷*¹Î');
INSERT INTO teacher values (6,'¹Ú*Çö');
INSERT INTO teacher values (7,'±è*ÅÂ');
INSERT INTO teacher values (8,'±è*ºÀ');
INSERT INTO teacher values (9,'ÀÌ*¼÷');
INSERT INTO teacher values (10,'Áø*ºó');
INSERT INTO teacher values (11,'±è*Á¤');
INSERT INTO teacher values (12,'±è*ÇÊ');
INSERT INTO teacher values (13,'ÀÌ*¿µ');
INSERT INTO teacher values (14,'ÃÖ*ÁØ');
INSERT INTO teacher values (15,'Á¤*Áø');
INSERT INTO teacher values (16,'¼­*Èñ');

INSERT INTO classes values (1, 1, 3, 1, 9);
INSERT INTO classes values (1, 2, 3, 2 , 10);
INSERT INTO classes values (1, 3, 3, 3, 11);
INSERT INTO classes values (1, 4, 3, 4, 12);
INSERT INTO classes values (2, 1, 1, 5, 13);
INSERT INTO classes values (2, 2, 1, 6, 14);
INSERT INTO classes values (2, 3, 2, 7, 15);
INSERT INTO classes values (2, 4, 2, 8, 16);

INSERT INTO student values (1,1,1,'°­*¼®','³²');
INSERT INTO student values (1,1,2,'±è*¹Î','³²');
INSERT INTO student values (1,1,3,'±è*Âù','³²');
INSERT INTO student values (1,2,1,'°­*Á¦','³²');
INSERT INTO student values (1,2,2,'°­*ÈÆ','³²');
INSERT INTO student values (1,2,3,'±Ç*ºó','³²');
INSERT INTO student values (1,3,1,'°í*¿µ','¿©');
INSERT INTO student values (1,3,2,'±è*°Ç','³²');
INSERT INTO student values (1,3,3,'±è*¿ì','³²');
INSERT INTO student values (1,4,1,'°­*ºó','³²');
INSERT INTO student values (1,4,2,'±¸*ÇÏ','¿©');
INSERT INTO student values (1,4,3,'±Ç*¿ø','³²');
INSERT INTO student values (2,1,1,'±è*¼­','³²');
INSERT INTO student values (2,1,2,'±è*¿ï','¿©');
INSERT INTO student values (2,1,3,'¹Ú*Àº','¿©');
INSERT INTO student values (2,2,1,'±Ç*¼­','³²');
INSERT INTO student values (2,2,2,'±è*¹Î','³²');
INSERT INTO student values (2,2,3,'±è*Çö','³²');
INSERT INTO student values (2,3,1,'±Ç*¿í','³²');
INSERT INTO student values (2,3,2,'±è*Çü','³²');
INSERT INTO student values (2,3,3,'±è*Çö','³²');
INSERT INTO student values (2,4,1,'±è*¼ö','³²');
INSERT INTO student values (2,4,2,'±è*Áø','¿©');
INSERT INTO student values (2,4,3,'±è*Àº','¿©');



--CREATE VIEW vw_student
--AS  SELECT s.grade_id, s.class_id, s.student_id, student_name, gender, depart_name, 
--    (SELECT teacher_name FROM teacher, classes WHERE m_teacher = teacher_id) as main_t, 
--    (SELECT teacher_name FROM teacher, classes WHERE s_teacher = teacher_id) as sub_t
--    FROM student s, classes c, depart d, teacher t
--    WHERE c.grade_id = s.grade_id and c.class_id = s.class_id and c.depart_id = d.depart_id
--    ;
CREATE VIEW vw_student
AS  SELECT s.grade_id, s.class_id, s.student_id, student_name, gender, depart_name,
        t_m.teacher_name as ´ã,
        t_s.teacher_name as ºÎ
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