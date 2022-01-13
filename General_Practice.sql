use sys;
drop table ogrenciler;
drop table personel;
create TABLE ogrenciler(
id int,
isim varchar(45),
adres varchar(100),
sinav_notu int
);


INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Ankara',75);
    INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ankara',85);
    INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Istanbul',85);



select * from ogrenciler;



/* -----------------------------------------------------------------------------
  ORNEK1: Sınav notu 80'den büyük olan öğrencilerin tüm bilgilerini listele
 -----------------------------------------------------------------------------*/
select * from ogrenciler where sinav_notu>80;

/* -----------------------------------------------------------------------------
 ORNEK2: Adresi Ankara olan öğrencilerin isim ve adres bilgilerini listele
 -----------------------------------------------------------------------------*/
select adres,isim from ogrenciler where adres='ankara';

/* -----------------------------------------------------------------------------
 ORNEK3: id’si 124 olan öğrencilerin tüm bilgilerini listele
 -----------------------------------------------------------------------------*/
select * from ogrenciler where id=124;

 /* -----------------------------------------------------------------------------
ORNEK4: id’si 123 den büyük ile 125 e eşit ve küçük olan öğrencilerin tüm bilgilerini listele
 -----------------------------------------------------------------------------*/
 select * from ogrenciler where id>123 and id<=125;
 
/* -----------------------------------------------------------------------------*/
/*======================= SELECT - BETWEEN ==================================*/ 
CREATE TABLE personel
    (   
        id CHAR(5),
        isim VARCHAR(50),
        maas int
    );


    INSERT INTO personel VALUES('10001', 'Ahmet Aslan', 7000);
    INSERT INTO personel VALUES( '10002', 'Mehmet Yılmaz' ,12000);
    INSERT INTO personel VALUES('10003', 'Meryem ', 7215);
    INSERT INTO personel VALUES('10004', 'Veli Han', 5000);
    INSERT INTO personel VALUES('10005', 'Mustafa Ali', 5500);
    INSERT INTO personel VALUES('10005', 'Ayşe Can', 4000);
/* -----------------------------------------------------------------------------*/
 -- not:between iki mantiksal ifade ile tanimlayabileceginiz durumlari tek komutla yazabilme imkani verir
 --  yazdigimiz iki sinir da araliga dahildir.
 
 
 
 
/* ===========================================================================
 =============  And (Ve) Operatörü Kullanımı=========================
And ile belirtilen şartların tamamı gerçekleşiyorsa o kayıt listelenir, şartlardan
bir tanesi bile tutmazsa listelenmez.
SELECT * FROM matematik WHERE sinav1 < 50 AND sinav2 < 50
Bu örnekte hem sınav1 hem de sınav2 alanı 50'den küçük olan kayıtlar listelenecektir.
===================Or (Veya) Operatörü Kullanımı=====================
Or ile belirtilen şartlardan en az biri gerçekleşiyorsa o kayıt listelenir,
şartlardan hiçbiri gerçekleşmiyorsa o kayıt listelenmez.
SELECT * FROM matematik WHERE sinav1 < 50 OR sinav2 < 50
Bu örnekte sınav1 veya sınav2 alanı 50'den küçük olan kayıtlar listelenecektir. =*/
-- 1. yol
 select * from personel where id between '10002' and '10005';
 -- 2.yol
 select * from personel where id between '10002' and '10005';
 
 
 
 /* -----------------------------------------------------------------------------
ORNEK4: id’si 10002 den büyük ile 10005 e eşit ve küçük olan PERSONELİN tüm bilgilerini listele
 -----------------------------------------------------------------------------*/
select * from personel where id between 10002 and 10005;
 
 
 /* -----------------------------------------------------------------------------
ORNEK5: ismi Mehmet Yılmaz ile Veli Han arasındaki olan personel bilgilerini
  listeleyiniz. personelin bilgilerini listele
 -----------------------------------------------------------------------------*/
 select * from personel where isim between 'mehmet yılmaz' and 'veli han';
 
 
 /* ======================= SELECT - IN ======================================
    IN birden fazla mantıksal ifade ile tanımlayabileceğimiz durumları 
    tek komutla yazabilme imkânı verir
    SYNTAX:
    -------
    SELECT sutun1,sutun2, ...
    FROM tablo_adı
    WHERE sutun_adı IN (deger1, deger2, ...);
/* ========================================================================== */
    
/* -----------------------------------------------------------------------------
  ORNEK7: id’si 10001,10002 ve 10004 olan personelin bilgilerini listele
 -----------------------------------------------------------------------------*/   
 select * from personel where id in(10001,10002,10004);


 
 /* -----------------------------------------------------------------------------
  ORNEK8: Maaşı sadece 7000  veya 12000 olan personelin bilgilerini listele
-----------------------------------------------------------------------------*/  
select * from personel where maas in(7000,12000);

 
  /* -----------------------------------------------------------------------------
  ORNEK8: Maaşı sadece 7000  veya adi 'meryem '   (bosluga dikkat) olan personelin bilgilerini listele
-----------------------------------------------------------------------------*/  
 select * from personel where maas=7000 or isim='meryem ';
 

 /* ======================= SELECT - LIKE ======================================
    NOT:LIKE anahtar kelimesi, sorgulama yaparken belirli patternleri 
    kullanabilmemize olanak sağlar.
    SYNTAX:
    -------
    SELECT sutün1, sutün2,…
    FROM  tablo_adı WHERE sütunN LIKE pattern
    
    PATTERN İÇİN
    -------------
    %    ---> 0 veya daha fazla karakteri belirtir. 
    _    ---> Tek bir karakteri temsil eder.
        
/* ========================================================================== */

  /* -----------------------------------------------------------------------------
  ORNEK9: ismi A harfi ile baslayanlari listeleyiniz
-----------------------------------------------------------------------------*/  
 select * from personel where isim like('a%');

 /* -----------------------------------------------------------------------------
  ORNEK10:  ismi n harfi ile bitenleri listeleyiniz
 -----------------------------------------------------------------------------*/
 select * from personel where isim like('%n');

/* -----------------------------------------------------------------------------
  ORNEK11:  isminin 2. harfi e olanları listeleyiniz
 -----------------------------------------------------------------------------*/ 
 select * from personel where isim like('_e%');

/* -----------------------------------------------------------------------------
  ORNEK12:  isminin 2. harfi e olup diğer harflerinde y olanları listeleyiniz
 -----------------------------------------------------------------------------*/
select * from personel where isim like('_e%y%');

/* -----------------------------------------------------------------------------
  ORNEK15:  isminde a harfi olmayanları listeleyiniz
 -----------------------------------------------------------------------------*/
select * from personel where isim not like('%a%');
/* -----------------------------------------------------------------------------
  ORNEK16:  maaşının son 2 hanesi 00 olmayanları listeleyiniz
 -----------------------------------------------------------------------------*/  

    select * from personel where maas not like('%00');
    
    
/* -----------------------------------------------------------------------------
  ORNEK17:  maaşının 4000 olmayanları listeleyiniz
 -----------------------------------------------------------------------------*/  
   SELECT * FROM personel
    WHERE maas NOT LIKE 4000;

/* -----------------------------------------------------------------------------
  ORNEK18: maaşı 5 haneli olanları listeleyiniz
 -----------------------------------------------------------------------------*/ 
SELECT * FROM personel
    WHERE maas NOT LIKE '_____';
/* -----------------------------------------------------------------------------
  ORNEK20: 1. harfi A ve 7.harfi A olan perspnelin adini listeleyiniz.
 -----------------------------------------------------------------------------*/ 

    SELECT isim FROM personel
    WHERE isim LIKE ('A_____A%');
    
 /*   ====================== SELECT - REGEXP_LIKE ================================
    Daha karmaşık pattern ile sorgulama işlemi için REGEXP_LIKE kullanılabilir.  
     -- 'c' => case-sentisitive demektir 
     -- 'i' => incase-sentisitive demektir ve default incase-sensitive aktiftir..
    Syntax:
    --------
    REGEXP_LIKE(sutun_adı, ‘pattern[] ‘, ‘c’ ] ) 
            
/* ========================================================================== */
    use sys;
    drop table kelimeler;
    CREATE TABLE kelimeler
    (
        id int UNIQUE,
        kelime VARCHAR(50) NOT NULL,
        harf_sayisi int
    );
    
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    INSERT INTO kelimeler VALUES (1015, 'hooooooto', 5);    

   
select * from kelimeler;
    
    
/* -----------------------------------------------------------------------------
  ORNEK22: İçerisinde 'ot' veya 'at' bulunan kelimeleri küçük harfe dikkat
  ederek listeleyiniz 
 -----------------------------------------------------------------------------*/ 
  select * from kelimeler where  regexp_like(kelime,'ot|at','c');
   
/* -----------------------------------------------------------------------------
  ORNEK23: İçerisinde 'ot' veya 'at' bulunan kelimeleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/ 
   select * from kelimeler where  regexp_like(kelime,'ot|at');
   
      
   
 /* -----------------------------------------------------------------------------
  ORNEK24: 'ho' veya 'hi' ile başlayan kelimeleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/   
  select * from kelimeler where regexp_like(kelime,'^ho|^hi');
    
/* -----------------------------------------------------------------------------
  ORNEK25: Sonu 't' veya 'm' ile bitenleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz. (i yazmaya gerek yok)
 -----------------------------------------------------------------------------*/   
select * from kelimeler where regexp_like(kelime,'t$|m$');
/* -----------------------------------------------------------------------------
  ORNEK26: h ile başlayıp t ile biten 3 harfli kelimeleri (h ile t küçük harfli 
  olanlari) listeleyeniz
 -----------------------------------------------------------------------------*/ 
select * from kelimeler where regexp_like(kelime,'^h|t$','c');

/* -----------------------------------------------------------------------------
  ORNEK27: İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli 
  kelimelerin tüm bilgilerini sorgulayalım.
 -----------------------------------------------------------------------------*/ 
 select * from kelimeler where regexp_like(kelime,'^h[a-zA-Z0-9]t$','c');

/* -----------------------------------------------------------------------------
  ORNEK28: İçinde m veya i veya e olan kelimelerin tüm bilgilerini listeleyiniz.
 -----------------------------------------------------------------------------*/     
 select * from kelimeler where regexp_like(kelime,'e|i|e');
  select * from kelimeler where regexp_like(kelime,'[m,i,e]');
/* -----------------------------------------------------------------------------
  ORNEK29: a veya s ile başlayan kelimelerin tüm bilgilerini listeleyiniz.
-----------------------------------------------------------------------------*/ 
 select * from kelimeler where regexp_like(kelime,'^a|^s');
/* -----------------------------------------------------------------------------
  ORNEK30: içerisinde en az 2 adet oo barıdıran kelimelerin tüm bilgilerini 
  listeleyiniz.
-----------------------------------------------------------------------------*/ 
     select * from kelimeler where regexp_like(kelime,'[o]{2}');
  
 /* -----------------------------------------------------------------------------------------------------------------
  
  ************************      DAY   3  ************************************************************   DAY 3 *************************************************
  
------------------------------------------------------------------------------------------------------------------------*/ 
/*============== CONSTRAINTS - KISITLAMALAR ======================================
           
    NOT NULL - Bir Sütunun  NULL içermemesini garanti eder. 
    UNIQUE - Bir sütundaki tüm değerlerin BENZERSİZ olmasını garanti eder.  
    PRIMARY KEY - Bir sütünün NULL içermemesini ve sütundaki verilerin 
                  BENZERSİZ olmasını garanti eder.(NOT NULL ve UNIQUE birleşimi gibi)
    FOREIGN KEY - Başka bir tablodaki Primary Key’i referans göstermek için kullanılır. 
                  Böylelikle, tablolar arasında ilişki kurulmuş olur. 
                  foreign ve primary ile tablolar birbirine bağlamadan da, id leri ayni olan satirlarda işlem yap diyebiliriz, böylelikle
                  ayni field verilebilir, parent child ilişkisi olmamiş olur
    CHECK - Bir sutundaki tüm verilerin belirlenen özel bir şartı sağlamasını garanti eder. 
    DEFAULT - Herhangi bir değer atanamadığında Başlangıç değerinin atanmasını sağlar.
 ========================================================================================*/
 CREATE TABLE calisanlar
    (
        id CHAR(5) PRIMARY KEY, -- not null+ unique
        isim VARCHAR(50) UNIQUE,
        maas int NOT NULL,
        ise_baslama DATE
    );
 INSERT INTO calisanlar VALUES( '10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
   INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
   INSERT INTO calisanlar VALUES('10010', null, 5000, '2018-04-14');-- 2. kez null benzersizlik kisitlamasini bozmaz
    INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
    INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14'); 
    INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); -- maas null olamaz
    INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
	INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');-- can zaten var
    INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');-- '' bunu int kabul etmez
    INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');-- '' bunu (hiçlik) string kabul eder
     INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); -- id tekrarl olamaz primary key 
      INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');-- primary key old. null yazamayz
      
      select * from calisanlar;
      
      
      /*------------
-- KISITLAMALAR (  FOREIGN KEY)
----------------------------------------------------------------*/
      
    CREATE TABLE adresler
    (
        adres_id CHAR(5),     
        sokak VARCHAR(50),
        cadde VARCHAR(30),
        sehir VARCHAR(15),
        CONSTRAINT id_clsnlr FOREIGN KEY(adres_id) REFERENCES calisanlar(id) -- (solda tablo seçiliyken üstteki info dan ismi kontrol edebilirsin)
    );
    
    INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
    INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
    INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
    -- parent tabloda olmayan id ile child a ekleme yapamayiz
    
    -- FK'ye null değeri atanabilir. 
    INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
      
      select * from adresler;
      -- bağlantl tablolarda child silinmeden parent silinmez
      drop table calisanlar;
      drop table adresler; 
      
      
      /*============================== ON DELETE CASCADE =============================

  Her defasında önce child tablodaki verileri silmek yerine ON DELETE CASCADE
  silme özelliğini aktif hale getirebiliriz.
  
  Bunun için FK olan satırın en sonuna ON DELETE CASCADE komutunu yazmak yeterli
  
==============================================================================*/ 
 use sys;
 CREATE TABLE talebeler
    (
        id CHAR(3) primary key,  
        isim VARCHAR(50),
        veli_isim VARCHAR(50),
        yazili_notu int
    );
    
    INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
    INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
	INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
    INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
	INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);

     CREATE TABLE notlar 
    ( talebe_id char(3), 
        ders_adi varchar(30), 
        yazili_notu int, 
        CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) 
        REFERENCES talebeler(id) ON DELETE CASCADE); -- on delete cascade sayesinde
       -- parent taki silinen bir kayıt ile ilişkili olan tüm child kayıtlarını
       -- siler.  
       -- mesela bir hastane silindi o hastanedeki bütün kayıtlar silinmeli, oda böyle olur.
       -- cascade yoksa önce child temizlenir sonra parent
    

    INSERT INTO notlar VALUES ('123','kimya',75);
    INSERT INTO notlar VALUES ('124', 'fizik',65);
    INSERT INTO notlar VALUES ('125', 'tarih',90);
	INSERT INTO notlar VALUES ('126', 'Matematik',90);   
      
      
      select * from talebeler;
      select * from notlar;
      
      delete from talebeler where id='124';  -- parent teki id 124 u silebiliriz  boylece hem childde hem parentte sildik
											 -- primary key kimdeyse o parenttir
      
      DELETE FROM talebeler
    WHERE id = 124;


 /* -----------------------------------------------------------------------------------------------------------------
  
  ************************      DAY   4  ************************************************************   DAY 4 *************************************************
  
------------------------------------------------------------------------------------------------------------------------*/ 





