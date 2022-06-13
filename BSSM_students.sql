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

--INSERT INTO depart values (1, '¼ÒÇÁÆ®¿þ¾î°³¹ß°ú');
--INSERT INTO depart values (2, 'ÀÓº£µðµå¼ÒÇÁÆ®¿þ¾î°³¹ß°ú');
--INSERT INTO depart values (3, '-');
--
--INSERT INTO classes values (1, 1, 3, '±¸*¿µ', 'ÀÌ*¼÷');
--INSERT INTO classes values (1, 2, 3, 'Á¶*°â', 'Áø*ºó');
--INSERT INTO classes values (1, 3, 3, '±è*¿µ', '±è*Á¤');
--INSERT INTO classes values (1, 4, 3, 'À¯*Âù', '±è*ÇÊ');
--INSERT INTO classes values (2, 1, 1, 'Â÷*¹Î', 'ÀÌ*¿µ');
--INSERT INTO classes values (2, 2, 1, '¹Ú*Çö', 'ÃÖ*ÁØ');
--INSERT INTO classes values (2, 3, 2, '±è*ÅÂ', 'Á¤*Áø');
--INSERT INTO classes values (2, 4, 2, '±è*ºÀ', '¼­*Èñ');
--
--INSERT INTO student values (1,1,1,'°­*¼®','³²');
--INSERT INTO student values (1,1,2,'±è*¹Î','³²');
--INSERT INTO student values (1,1,3,'±è*Âù','³²');
--INSERT INTO student values (1,2,1,'°­*Á¦','³²');
--INSERT INTO student values (1,2,2,'°­*ÈÆ','³²');
--INSERT INTO student values (1,2,3,'±Ç*ºó','³²');
--INSERT INTO student values (1,3,1,'°í*¿µ','¿©');
--INSERT INTO student values (1,3,2,'±è*°Ç','³²');
--INSERT INTO student values (1,3,3,'±è*¿ì','³²');
--INSERT INTO student values (1,4,1,'°­*ºó','³²');
--INSERT INTO student values (1,4,2,'±¸*ÇÏ','¿©');
--INSERT INTO student values (1,4,3,'±Ç*¿ø','³²');
--INSERT INTO student values (2,1,1,'±è*¼­','³²');
--INSERT INTO student values (2,1,2,'±è*¿ï','¿©');
--INSERT INTO student values (2,1,3,'¹Ú*Àº','¿©');
--INSERT INTO student values (2,2,1,'±Ç*¼­','³²');
--INSERT INTO student values (2,2,2,'±è*¹Î','³²');
--INSERT INTO student values (2,2,3,'±è*Çö','³²');
--INSERT INTO student values (2,3,1,'±Ç*¿í','³²');
--INSERT INTO student values (2,3,2,'±è*Çü','³²');
--INSERT INTO student values (2,3,3,'±è*Çö','³²');
--INSERT INTO student values (2,4,1,'±è*¼ö','³²');
--INSERT INTO student values (2,4,2,'±è*Áø','¿©');
--INSERT INTO student values (2,4,3,'±è*Àº','¿©');

CREATE VIEW vw_student
AS  SELECT s.grade_id, s.class_id, s.student_id, name, gender, depart_name, m_teacher, s_teacher
    FROM student s, classes c, depart d
    WHERE c.grade_id = s.grade_id and c.class_id = s.class_id and c.depart_id = d.depart_id
    ;
    
SELECT *
FROM vw_student;