CREATE TABLE student 
(   
    id VARCHAR(4)  ,
    isim VARCHAR(20),
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
INSERT INTO student(isim,age) VALUES('SAMET AY',45 );

/* ====================SELECT============================== 
               TALODAN VERI SORGULAMA
===========================================================*/

SELECT * FROM student;

/* ====================DROP================================= 
               TABLO SILME (CRUD-drop)
===========================================================*/
DROP TABLE URUNLER;

/*==============================WHERE========================================
   Verileri SELECT komutu ile veritabanından çekerken filtreleme yapmak için
---------> select * from NERDENSECİLECEK where HANGİSÜTUNDAN > 34;
    SELECT ile birlikte WHERE komutu kullanılabilir.
    SELECT sutün1, sutün2
        ...
    FROM  tablo_adı WHERE koşul;
==============================================================================*/

select * from STUDENT where AGE > 34;
/*======================= SELECT - BETWEEN ------   OR  ==================================*/ 

select * from student where id between '102' and '111';   -- BİR ARALİK VERİRİ BU ARAYİ GETİRİR
select * from student where id='104' or id='111';  -- SADECE BU İKİ İD Yİ GETİRİR

select * from student where id in('102','103','104','105'); -- BU 4 İD YE SAHİP OLANLARİ GETİRİR

select * from student where isim  like 'a%';  -- a harfiyle baslayan isimleri getirir
select * from student where isim  not like 'a%';  -- a harfiyle BASLAMAYAN isimleri getirir
select * from student where isim  not like '_y_e';  -- ikinciharfi 'y' 4. harfi'e' olan 4 harflileri getirir







