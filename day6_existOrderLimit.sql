use sys;
/*=========================== EXISTS, NOT EXIST ================================
   EXISTS Condition subquery'ler ile kullanilir. IN ifadesinin kullanımına benzer olarak,
    EXISTS ve NOT EXISTS ifadeleri de alt sorgudan getirilen değerlerin içerisinde 
   bir değerin olması veya olmaması durumunda işlem yapılmasını sağlar. 
   
   EXISTS operatorü bir Boolean operatördür ve true - false değer döndürür. 
    EXISTS operatorü sıklıkla Subquery'lerde satırların doğruluğunu test etmek 
    için kullanılır.
    
    Eğer bir subquery (altsorgu) bir satırı döndürürse EXISTS operatörü de TRUE 
    değer döndürür. Aksi takdirde, FALSE değer döndürecektir.
    
    Özellikle altsorgularda hızlı kontrol işlemi gerçekleştirmek için kullanılır
==============================================================================*/
   
    CREATE TABLE mart
    (
        urun_id int,
        musteri_isim varchar(50), 
        urun_isim varchar(50)
    );
    
    CREATE TABLE nisan 
    (
        urun_id int ,
        musteri_isim varchar(50), 
        urun_isim varchar(50)
    );
    
  
    INSERT INTO mart VALUES (10, 'Mark', 'Honda');
    INSERT INTO mart VALUES (20, 'John', 'Toyota');
    INSERT INTO mart VALUES (30, 'Amy', 'Ford');
    INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
    INSERT INTO mart VALUES (10, 'Adam', 'Honda');
    INSERT INTO mart VALUES (40, 'John', 'Hyundai');
    INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');
   
   INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
    INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
    INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
    INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
    INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');
    
    select * from nisan;
     select * from mart;
     /* -----------------------------------------------------------------------------
  ORNEK1: MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
  URUN_ID'lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan(demekki patron sorgu mart)
  MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız. 
  yani; ilk tabloda 10 id yi aliyo nisan a gidiyo bakiyo 10 id de kimse var mi? var sa mart taki kisi adini ve urun id sini yazdiracak
 -----------------------------------------------------------------------------*/ 
    -- in le cozersek  ama in daha yavas 10 id yi aliyo diger tabloda tek tek bakiyo
     select urun_id,musteri_isim from mart where urun_id in(select urun_id from nisan where mart.urun_id=nisan.urun_id);
     -- exists ile cozersek
      select urun_id,musteri_isim from mart where exists(select urun_id from nisan where mart.urun_id=nisan.urun_id);
     
     /* -----------------------------------------------------------------------------
  ORNEK2: Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
  NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız. 
 -----------------------------------------------------------------------------*/
 -- as n     harfi nisanın tablosunun adini n yapti as yazmasakda olurdu martın adını m yaptık as yazmadan,
 -- bu degisiklik kalici degil sadece bu sorgu icin yapti
 select urun_isim,musteri_isim from nisan as n where exists(select urun_isim from mart m where m.urun_isim=n.urun_isim);
 
  /* -----------------------------------------------------------------------------
  ORNEK3: Her iki ayda birden ortak satılmayan ürünlerin URUN_ISIM'lerini ve bu ürünleri
  NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız. 
 -----------------------------------------------------------------------------*/
select urun_isim,musteri_isim from nisan as n where not exists(select urun_isim from mart m where m.urun_isim=n.urun_isim);
 
 /*===================== IS NULL, IS NOT NULL, COALESCE ========================
    
    IS NULL, ve IS NOT NULL, BOOLEAN operatörleridir. Bir ifadenin NULL olup 
    olmadığını kontrol ederler.  
    
    COALESCE ise bir fonksiyondur ve içerisindeki parameterelerden NULL olmayan
    ilk ifadeyi döndürür. Eğer aldığı tüm ifadeler NULL ise NULL döndürürür.
    aslinda tum null lari algilayip update de kullanilabiliyor örnek4
    isim is null   yerine isim=colesce kullanılabilir 
    
    sutun_adi = COALESCE(ifade1, ifade2, .....ifadeN)
    
==============================================================================*/

    CREATE TABLE insanlar 
    (
        ssn CHAR(9), -- Social Security Number
        isim VARCHAR(50), 
        adres VARCHAR(50) 
    );

    INSERT INTO insanlar VALUES('123456789', 'Ali Can', 'Istanbul');
    INSERT INTO insanlar VALUES('234567890', 'Veli Cem', 'Ankara');
    INSERT INTO insanlar VALUES('345678901', 'Mine Bulut', 'Izmir');
    INSERT INTO insanlar (ssn, adres) VALUES('456789012', 'Bursa');
    INSERT INTO insanlar (ssn, adres) VALUES('567890123', 'Denizli');
    INSERT INTO insanlar (adres) VALUES('Sakarya');
    INSERT INTO insanlar (ssn) VALUES('999111222');
 /*    
       INSERT INTO insanlar (ssn, adres) VALUES('456789012', 'Bursa');
       INSERT INTO insanlar (ssn, adres) VALUES('567890123', 'Denizli'); 
    bu iki satirda sadece     (ssn, adres) e veri girisi yapiliyor girilmeyene null atiyor
  */     
  
  
  select * from insanlar;
  -- ufak bi trick      null;  yer rezerve edilmis ama daha deger atanmamis ,  '' ise bir karakter olarak gorur
 
 
 
 -- ORNEK:1 İSMİ NULL OLANLARİ SORGULAYİNİZ.
  select * from insanlar WHERE isim is null;
   -- ORNEK:1 İSMİ NULL OLANLARİ SORGULAYİNİZ.
   select * from insanlar WHERE isim is not null;
   /* ----------------------------------------------------------------------------
  ORNEK3: isim 'i NULL olan kişilerin isim'ine NO NAME atayınız. kisa soruda eski yolla olur
--------------------------------------------------------------------------*/
   -- alter bina kolonu degistirir 
   -- update ise evin mobilyasini degistirmek
   update insanlar set isim='NO NAME' where isim is null;
   select * from insanlar;
   
-- tabloda isim deki null lar NO NAME yaziyo peki simdi de bu islemi geri dondurelim
   
   
    update insanlar set isim=null where isim='NO NAME';
   
   
   /* ----------------------------------------------------------------------------
  ORNEK4:   isim 'i NULL olanlara 'Henuz isim girilmedi'
            adres 'i NULL olanlara 'Henuz adres girilmedi'
            ssn 'i NULL olanlara ' no ssn' atayalım.
            çoklu değişimde ve  WHERE isim IS NULL or adres is null....; 
            gibi ifade yazmamak için. coalesce=birleşmek
-----------------------------------------------------------------------------*/  
   update insanlar set isim=COaLESCE(isim,'henüz girilmedi'),
   adres=coalesce(adres,'henüz adres girilmedi'),
   ssn=coalesce(ssn,'NO SSN');
   
   /*================================ ORDER BY  ===================================
   ORDER BY cümleciği bir SORGU deyimi içerisinde belli bir SUTUN'a göre 
   SIRALAMA yapmak için kullanılır.
   
   Syntax
   -------
      ORDER BY sutun_adi ASC   -- ARTAN
      ORDER BY sutun_adi DESC  -- AZALAN
==============================================================================*/       
    CREATE TABLE kisiler 
    (   id int PRIMARY KEY, -- yani hem not null, hem unique , hemde baglamada kullanilabilir
        ssn CHAR(9) ,
        isim VARCHAR(50), 
        soyisim VARCHAR(50), 
        maas int,
        adres VARCHAR(50) 
    );
    
    INSERT INTO kisiler VALUES(1,123456789, 'Ali','Can', 3000,'Istanbul');
    INSERT INTO kisiler VALUES(2,234567890, 'Veli','Cem', 2890,'Ankara');
    INSERT INTO kisiler VALUES(3,345678901, 'Mine','Bulut',4200,'Adiyaman');
    INSERT INTO kisiler VALUES(4,256789012, 'Mahmut','Bulut',3150,'Adana');
    INSERT INTO kisiler VALUES (5,344678901, 'Mine','Yasa', 5000,'Ankara');
    INSERT INTO kisiler VALUES (6,345458901, 'Veli','Yilmaz',7000,'Istanbul');

    INSERT INTO kisiler VALUES(7,123456789, 'Ali','Can', 3000,'Istanbul');
    INSERT INTO kisiler VALUES(8,234567890, 'Veli','Cem', 2890,'Ankara');
    INSERT INTO kisiler VALUES(9,345678901, 'Mine','Bulut',4200,'Ankara');
    INSERT INTO kisiler VALUES(10,256789012, 'Mahmut','Bulut',3150,'Istanbul');
    INSERT INTO kisiler VALUES (11,344678901, 'Mine','Yasa', 5000,'Ankara');
    INSERT INTO kisiler VALUES (12,345458901, 'Veli','Yilmaz',7000,'Istanbul');
   
   /* ----------------------------------------------------------------------------
  ORNEK1: kisiler tablosunu adres'e göre sıralayarak sorgulayınız.
 -----------------------------------------------------------------------------*/ 
 select * from kisiler order by adres;
 
  /* ----------------------------------------------------------------------------
  ORNEK2: kisiler tablosunu maas'e göre ter sıralayarak sorgulayınız.
 -----------------------------------------------------------------------------*/ 
 
  select * from kisiler order by  maas desc;
 
 
 /* ----------------------------------------------------------------------------
  ORNEK4: ismi Mine olanları, maas'e göre AZALAN sırada sorgulayınız.
-----------------------------------------------------------------------------*/
    select * from kisiler where isim='mine' order by maas desc;
/* ----------------------------------------------------------------------------
  ORNEK5: soyismi 'i Bulut olanları maas sıralı olarak sorgulayınız.
-----------------------------------------------------------------------------*/ 
  select * from kisiler where soyisim='bulut' order by 5;  -- 5 yazdim cunku maas 5. sutun yani bole de yazilabilir
 
 -- **************LİMİT*********************************************
 -- LİSTEDEN İLK 10 VERİYİ GETİr
 
 select * from kisiler limit 10;
  -- 10. veriden sonraki 2 veriyi getirsin
  select * from kisiler limit 10,2; -- bu ilk sayi dahil degil 11 den basla 2 adim at demek(11. ve 12. elemanlari alir getirir)
   
   -- maasi cok tan aza sirala ilk 3 maasi al gel yani en yuksek maasi alan 3 kisiyi getir
    select * from kisiler order by  maas desc limit 3;
 /* *************************ORACLE DA COZSEYDİK ***********************/  
--    select * from kisiler order by  maas desc fetch next 3 rows only; eger oraclesql kullansaydik bole yazardik
   
   /* ----------------------------------------------------------------------------
  ORNEK3: MAAŞ'a göre sıralamada 4. 5.  6. kişilerin bilgilerini listeleyen 
  sorguyu yazınız.
-----------------------------------------------------------------------------*/   
   
   SELECT * FROM kisiler order by maas limit 3,3;
   
   
   
/* ----------------------------------------------------------------------------
  ORNEK5: kisi ismine ve urun adına göre (gruplayarak) satılan ürünlerin toplamını bulan ve
  ve bu toplam değeri 3 ve fazlası olan kayıtları toplam urun miktarlarina göre
  ters siralayarak listeyen sorguyu yazınız.
 -----------------------------------------------------------------------------*/  
 -- mesela ali armut 2, ali armut 2 vardi ali armut 4 yazacak
select isim , urun_adi ,sum(urun_miktari) from manav
 group by isim, urun_adi
 having sum(urun_miktari)>=3
 order by sum(urun_miktari) desc;
 
 /* neden where yerine having kullandik?  cunku hem group by hem sum kullandigimiz icin. 
  where sum(urun_miktari)>=3
 order by sum(urun_miktari);  -- where den sonrakini alip order by ile siralayacak
 -- aggregate fonksiyonlari ile ilgili bir koşul koymak için
 -- group by dan sonra having cümleciği kullanilir. */ 
 
 
 /* ----------------------------------------------------------------------------
  ORNEK6: satılan urun_adi'na göre (gruplayarak) MAX urun sayılarını sıralayarak listeleyen 
  sorguyu yazınız. NOT: Sorgu, sadece MAKS urun_miktari MIN urun_miktarına 
  eşit olmayan kayıtları listelemelidir.
  
 -----------------------------------------------------------------------------*/  
 select urun_adi , max(urun_miktari)from manav
group by urun_adi
 having max(urun_miktari)!=min(urun_miktari)
 order by max(urun_miktari);
 
 /*
 siralama group by
 having
 order by
 */
 /*============================= DISTINCT =====================================
    
    DISTINCT cümleciği bir SORGU ifadesinde benzer olan satırları filtrelemek
    için kullanılır. Dolayısıyla seçilen sutun yada sutunlar için benzersiz veri
    içeren satırlar oluşturmaya yarar.
   
    SYNTAX
    -------
    SELECT DISTINCT sutun_adi1, sutun_adi2, sutun_adi3
    FROM  tablo_adı;
==============================================================================*/
 
 /* ----------------------------------------------------------------------------
  ORNEK1: satılan farklı meyve türlerinin sayısını listeleyen sorguyu yazınız.
-----------------------------------------------------------------------------*/   
select distinct(urun_adi) from manav; -- elma,armut,uzum getirdi

select count(distinct(urun_adi)) from manav; -- bu ise 3 dedi

/* -----------------------------------------------------------------------------
  ORNEK2: satılan meyve + isimlerin farklı olanlarını listeyen sorguyu yazınız.
------------------------------------------------------------------------------*/
select distinct urun_adi,isim from manav;  -- nedense burada parantezli yazinca hata verdi  distinct(urun_adi,isim)

 
 /* ----------------------------------------------------------------------------
  ORNEK3: satılan meyvelerin urun_mikarlarinin benzersiz  olanlarının 
  toplamlarini listeyen sorguyu yazınız.
-----------------------------------------------------------------------------*/  

select sum( distinct urun_miktari) from manav;

 
 