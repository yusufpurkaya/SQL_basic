use sys;
/* ============================= SUBQUERIES ====================================
    SORGU içinde çalişan SORGUYA SUBQUERY (ALT SORGU) denilir.
==============================================================================*/
CREATE TABLE calisanlar 
    (
        id int, 
        isim VARCHAR(50), 
        sehir VARCHAR(50), 
        maas int, 
        isyeri VARCHAR(20)
    );
    INSERT INTO calisanlar VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
    INSERT INTO calisanlar VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
    INSERT INTO calisanlar VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
    INSERT INTO calisanlar VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
    INSERT INTO calisanlar VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
    INSERT INTO calisanlar VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
    INSERT INTO calisanlar VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');
    
    CREATE TABLE markalar
    (
        marka_id int, 
        marka_isim VARCHAR(20), 
        calisan_sayisi int
    );
    
    INSERT INTO markalar VALUES(100, 'Vakko', 12000);
    INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
    INSERT INTO markalar VALUES(102, 'Adidas', 10000);
    INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);
    
   /* ============================= SUBQUERIES ====================================
     ORNEK1: calisan sayisi 15.000’den cok olan markalarin isimlerini ve bu 
  markada  calisanlarin isimlerini ve maaşlarini listeleyin
==============================================================================*/
    select * from calisanlar;
    select * from markalar;
   -- iki tablo isyeri/markaisim den bagli gibi
 select isim,maas,isyeri from calisanlar
 where isyeri in (select marka_isim from markalar where calisan_sayisi>15000);
    -- isyeri piercardin veya LCW olani getirecek cunku onlarin calisan sayisi 15000 den fazla
     /* ============================= SUBQUERIES ====================================
   ORNEK2: marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve 
  şehirlerini listeleyiniz
==============================================================================*/
  
    select isim,sehir,maas from calisanlar
    where isyeri in(select marka_isim from markalar where marka_id>101);
    
    
     /* ============================= SUBQUERIES ====================================
ORNEK3: Ankara’da calisani olan markalarin marka id'lerini ve calisan
  sayilarini listeleyiniz.
==============================================================================*/
select marka_id, calisan_sayisi from markalar where marka_isim in (select isyeri from calisanlar where sehir='ankara');

    
    /* ===================== AGGREGATE METOT KULLANIMI ===========================
    Aggregate Metotlari(SUM,COUNT, MIN,MAX, AVG) Subquery içinde kullanilabilir.
    Ancak, Sorgu tek bir değer döndürüyor olmalidir.
    SUM-> TOPLAMA YAPİYOR
    COUNT-> SAYAR 
    AVG-> ORTALAMASİNİ BULUR
==============================================================================*/   
      
  /* -----------------------------------------------------------------------------
  ORNEK4: Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin
  toplam maaşini listeleyen bir Sorgu yaziniz.
 -----------------------------------------------------------------------------*/
 select * from calisanlar;
    select * from markalar;   
    
    select marka_isim , calisan_sayisi, (select sum(maas) from calisanlar where markalar.marka_isim=calisanlar.isyeri) 
    from markalar;
    -- eger markalar tablo sundakiyle calisanlar tablosundaki tablo sutun adlari ayni olsaydi tabloadi.sutunadi diyerek 
    -- sql e yardimci olurduk ayni olmadigi halde yinede yaptik
    
    select marka_isim , calisan_sayisi, (select sum(maas) from calisanlar where markalar.marka_isim=calisanlar.isyeri) as toplam_maas
    from markalar;         -- as  ' toplam_maas '  maas toplamini icerecek sutuna ad koyduk
    
    --  markalar.marka_isim=calisanlar.isyeri yazma nedenimiz ayni sutuna denk gelsin diye
  /* ============================= SUBQUERIES ====================================
  ORNEK5: Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin
  ortalama maaşini listeleyen bir Sorgu yaziniz.
==============================================================================*/ 
    select marka_isim, calisan_sayisi,(select avg(maas) from calisanlar) from markalar;
    -- istiyorum ki vaggo satiri vaggo satirinda yazilsin o zaman 
    
       select marka_isim, calisan_sayisi,(select avg(maas) from calisanlar where marka_isim=isyeri) from markalar;
    -- bu ort maaslari kusuratli getirdi yuvarlayip getirsin
    
        -- bide isim koyalim ort maasa
      select marka_isim, calisan_sayisi,(select round(avg(maas)) from calisanlar where marka_isim=isyeri) as ORTALAMA_maas from markalar;

    
      
    /* ============================= SUBQUERIES ====================================
 ORNEK6: Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin
  maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.
==============================================================================*/ 
    select marka_isim, calisan_sayisi,(select max(maas) from calisanlar where marka_isim=isyeri) adimax_maasolsun,
    (select min(maas) from calisanlar where marka_isim=isyeri) adimin_maasolsun from markalar;
    
    
    
   
     /* ============================= SUBQUERIES ====================================
  ORNEK7: Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu 
  listeleyen bir SORGU yaziniz.
==============================================================================*/ 


select marka_id, marka_isim, (select COUNT(sehir) from calisanlar
                                     where marka_isim=isyeri  ) sehir_sayisi
 from markalar;






