
-- ============================== DELETE ===================================  
    -- DELETE FROM tablo_adı;  Tablonun tüm içerğini siler.
    -- Bu komut bir DML komutudur. Dolayısıyla devamında WHERE gibi cümlecikler
    -- kullanılabilir.
    
    
    -- DELETE FROM tablo_adı
    -- WHERE sutun_adi = veri;
   
    use sys;
    CREATE TABLE ogrenciler
    (
        id CHAR(3),
        isim VARCHAR(50),
        veli_isim VARCHAR(50),
        yazili_notu int       
    );
  
    INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Hasan',75);
    INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ayse',85);
    INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Hasan',85);
    INSERT INTO ogrenciler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
    INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can',99);
  savepoint abc;
    -- savepoint sikintisi varsa -> SET autocommit=0; 
    -- ayarlar sql execution auto commit tiki kaldr
--    DELETE FROM ogrenciler;     -- Tüm verileri sil.
--    ROLLBACK TO  ABC;  -- Silinen Verileri geri getir.
--    SELECT * FROM ogrenciler;
    
/* =============================================================================
         Seçerek silmek için WHERE Anahtar kelimesi kullanılabilir. 
===============================================================================*/     
/* -----------------------------------------------------------------------------
  ORNEK1: id'si 124 olan ogrenciyi siliniz.
 -----------------------------------------------------------------------------*/ 
  delete from ogrenciler where id='124';
    
    
/* -----------------------------------------------------------------------------
  ORNEK2: ismi Kemal Yasa olan satırını siliniz.
 -----------------------------------------------------------------------------*/   
     delete from ogrenciler where isim='kemal Yasa';
      
      select * from ogrenciler;
/* -----------------------------------------------------------------------------
  ORNEK3: ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim.
 -----------------------------------------------------------------------------*/        
   delete from ogrenciler where isim ='nesibe yilmaz' or isim = 'mustafa bak'; -- yada asagidaki
   
   delete from ogrenciler where isim in ('Nesibe Yilmaz',' Mustafa Bak') ; -- yada asagidaki ama in kullanimi onemli 
   
   DELETE FROM ogrenciler WHERE REGEXP_LIKE(isim, 'Nesibe Yilmaz|Mustafa Bak');
   
/* ----------------------------------------------------------------------------
  ORNEK4: İsmi Ali Can ve id'si 123 olan kaydı siliniz.
 -----------------------------------------------------------------------------*/    
      delete from ogrenciler where isim='ali can' and id='123';
   
   
/* ----------------------------------------------------------------------------
  ORNEK5: id 'si 126'dan büyük olan kayıtları silelim.
 -----------------------------------------------------------------------------*/  
  delete from ogrenciler where id>'126';
    
 
 /* ----------------------------------------------------------------------------
  ORNEK6: id'si 123, 125 ve 126 olanları silelim.
 -----------------------------------------------------------------------------*/     
    delete from ogrenciler where id in('123','125','126');
    
    select * from ogrenciler;
/* ----------------------------------------------------------------------------
  ORNEK7:  TABLODAKİ TÜM KAYITLARI SİLELİM..
 -----------------------------------------------------------------------------*/     
   DELETE FROM ogrenciler; 
   --  drop table ogrenciler; -- bu komut tum tabloyu siler
    
    
-- *************************************************    
    
      -- tablodaki kayitlari silmek ile tabloyu silmek farkli islemlerdir
-- silme komutlari da iki basamaklidir, biz genelde geri getirilebilecek sekilde sileriz 
-- ancak bazen guvenlik gibi sebeplerle geri getirilmeyecek sekilde silinmesi istenebilir   
/* ======================== DELETE - TRUNCATE - DROP ============================   
  
  1-) TRUNCATE komutu DELETE komutu gibi bir tablodaki verilerin tamamını siler.
    Ancak, seçmeli silme yapamaz. Çünkü Truncate komutu DML değil DDL komutudur.*/ 
         TRUNCATE TABLE ogrenciler;  -- doğru yazım
       
    
   /* 2-) DELETE komutu beraberinde WHERE cümleciği kullanılabilir. TRUNCATE ile 
    kullanılmaz.
        TRUNCATE TABLE ogrenciler
        WHERE veli_isim='Hasan';  .....yanlış yazım
        
-- TRUNCATE komutu tablo yapısını değiştirmeden, 
-- tablo içinde yer alan tüm verileri tek komutla silmenizi sağlar.
        
    3-) Delete komutu ile silinen veriler ROLLBACK Komutu ile kolaylıkla geri 
    alınabilir.
    
    4-) Truncate ile silinen veriler geri alınması daha zordur. Ancak
    Transaction yöntemi ile geri alınması mümkün olabilir.
    
    5-) DROP komutu da bir DDL komutudur. Ancak DROP veriler ile tabloyu da 
    siler. 
==============================================================================*/ 
    -- INSERT veri girişinden sonra SAVEPOİNT ABC; ile verileri buraya sakla
    -- (yanlışlık yapma olasılığına karşın önlem gibi, AYNI İSİMDE BAŞKA TABLO VARSA)
    -- sonra istediğini sil (ister tümü ister bir kısmı)
    -- sonra savepoint yaptığın yerden alttaki gibi rollback ile verileri geri getir
  -- trick su eger sonradan veri girisi olursa tekrar savepoint yapmaliyiz
  drop table ogrenciler;  -- bunu yaparsan rollback to ise yaramaz 
   
   --   tablodan silinen verileri    insert ettikten sonra   " savepoint abc;  " komutu ekleyerek sonra sinda 
   --    "rollback to abc; " diyerek getirebiliriz 
  
  
  select * from ogrenciler; -- once tabloya bak
        delete from ogrenciler;  -- sonra tablodaki verileri sil ama tablo kalacak
        
      --   truncate table ogrenciler; tabloyu degil icerigini siler ama geri getirilemez  
        
        select * from ogrenciler; -- sonra tekrar tabloya bak bos bi tablo var sadece
        rollback to abc; -- ve silinen verileri tekrar getirdi