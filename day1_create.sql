use sys;
CREATE TABLE student 
(   
    id VARCHAR(4)  ,
    name VARCHAR(20),
    age int
);
/* ========================================================= 
                     VERİ GİRİSİ 
===========================================================*/
INSERT INTO student VALUES( null,'MEHMET ALİ', 25);
INSERT INTO student VALUES('1002', 'AYSE YILMAZ', 34);
INSERT INTO student VALUES('1003', 'JOHN STAR', 56);
INSERT INTO student VALUES('1004', 'MARY BROWN', 17);

/* ========================================================= 
                 PARCALI    VERİ GİRİSİ 
===========================================================*/
INSERT INTO student(name,age) VALUES('SAMET AY',45 );

/* ========================================================= 
               TALODAN VERI SORGULAMA
===========================================================*/

SELECT * FROM student;

/* ========================================================= 
               TALO SILME (CRUD-drop)
===========================================================*/
DROP TABLE URUNLER;
