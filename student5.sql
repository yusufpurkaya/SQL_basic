use sys;
create table student5 (
id varchar(5),
cinsiyet varchar(5),
isim varchar(40),
memleket varchar(15),
egitim varchar(15),
yas int
);
select * from student5; 
insert into student5 values('101','E','Bilal','Kahramanmaraş','lisans',18);
insert into student5 values('102','K','ayse','Adana','lisans',55);
insert into student5 values('107','E','yusuf','adana','lise',48);
insert into student5 values('110','K','aylin efe','izmir','lise',30);
insert into student5 values('111','E','Abdullah ucmak','Kahramanmaraş','lisans',70);
insert into student5(id,isim) values('112','mehmet');
select * from student5;

/* -----------------------------------------------------------------------------
  ORNEK1: yasi  40'den büyük olan öğrencilerin tüm bilgilerini listele
 -----------------------------------------------------------------------------*/

select * from student5 where yas>40;

/* -----------------------------------------------------------------------------
  ORNEK2: memeleketi  maraş  olan öğrencilerin tüm bilgilerini listele
 -----------------------------------------------------------------------------*/
select * from student5 where memleket='kahramanmaraş';


/* -----------------------------------------------------------------------------
  ORNEK2:id si 104 ile 111 arasini getiriniz
 -----------------------------------------------------------------------------*/

select * from student5 where id between '102' and '111';


/* -----------------------------------------------------------------------------
  ORNEK2:id si 104 ve 111 olani getiriniz
 -----------------------------------------------------------------------------*/
select * from student5 where id='104' or id='111';

/* -----------------------------------------------------------------------------
  ORNEK2:id si 102 ve yasi 70 olani getiriniz
 -----------------------------------------------------------------------------*/
select * from student5 where id='102' or yas=70;

/* -----------------------------------------------------------------------------
  ORNEK2:id si 102 ,103,104,105  olani getiriniz
 -----------------------------------------------------------------------------*/

select * from student5 where id in('102','103','104','105');


  /* -----------------------------------------------------------------------------
  ORNEK9: ismi A harfi ile baslayanlari listeleyiniz
-----------------------------------------------------------------------------*/  

select * from student5 where isim  like 'a%';


  /* -----------------------------------------------------------------------------
  ORNEK9: ismi 4.  harfi A ile baslayanlari listeleyiniz
-----------------------------------------------------------------------------*/  
select * from student5 where isim  like '___a%';

select * from student5 where isim  like '%l';


/* -----------------------------------------------------------------------------
  ORNEK12:  isminin 2. harfi e olup diğer harflerinde y olanları listeleyiniz
 -----------------------------------------------------------------------------*/

select * from student5 where isim like '_y%l%';
/* -----------------------------------------------------------------------------
  ORNEK15:  isminde a harfi olmayanları listeleyiniz
 -----------------------------------------------------------------------------*/

select * from student5 where isim not like '%a%';


/* -----------------------------------------------------------------------------
  ORNEK15:  isminde 5 harfli olmayanlari  listeleyiniz
 -----------------------------------------------------------------------------*/

select * from student5 where isim not like '_____';






