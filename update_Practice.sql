use sys;
CREATE TABLE people 
(

    ssn CHAR (9),
    name VARCHAR(50),
    address VARCHAR(80)

);




INSERT INTO PEOPLE VALUES (123456789, 'Mark Star', 'Florida');
INSERT INTO PEOPLE VALUES (234567890, 'Angie Way', 'Virginia');
INSERT INTO PEOPLE VALUES (345678901, 'Marry Tien', 'New Jersey');
INSERT INTO PEOPLE (ssn, address) VALUES (456789012, 'Michigan');
INSERT INTO PEOPLE (ssn, address) VALUES (567890123, 'California');
INSERT INTO PEOPLE (ssn, name) VALUES (567890123, 'California');

SELECT * FROM PEOPLE ;
-- Boş adları "ad daha sonra eklenecek" olarak değiştirin
update people set name='daha sonra eklenecek' where name is null;

-- Boş adresleri 'Adres daha sonra eklenecek' olarak değiştirin
update people set address='adres daha sonra eklenecek' where address is null;
-- people tablosunda 'Daha sonra eklenecek' tüm boş değerleri değiştirin
update people set name=coalesce (name, 'daha sonra eklenecek');

-- Create işçi tablosu alanları worker_id,work_name,work_salary şeklindedir.
-- worker_id, worker_id_pk adında primary key sahip olacak
-- İşçiler tablosuna 4 kayıt ekleyin
-- Konsoldaki tabloya bakın


CREATE TABLE worker 
(

    worker_id char(3),
    worker_name VARCHAR(50),
    worker_salary int not null,
     CONSTRAINT worker_id_pk PRIMARY KEY (worker_id)

);

DROP TABLE worker;

INSERT INTO WORKER VALUES ('100','oli can', 1200);
INSERT INTO WORKER VALUES ('102','Veli Han', 2000);
INSERT INTO WORKER VALUES ('103','Ayse Kan', 7000);
INSERT INTO WORKER VALUES ('104', 'Angie Ocean', 8500);

SELECT * FROM WORKER ;
-- Veli Han'ın maaşını en yüksek maasin yuzde 20 daha azi olarak update edin
UPDATE WORKER
SET worker_salary=(SELECT max(worker_salary) FROM (SELECT *FROM WORKER) AS W )-((SELECT MAX(worker_salary) FROM (SELECT * FROM WORKER )AS V)*0.20)
WHERE worker_name='Veli Han';
-- oli Can'ın maaşını en düşük maaşın yüzde 30 u kadar arttırın
update worker set worker_salary=(select min(worker_salary)*1.30 from (select * from worker) as m) where worker_name='oli can';
-- Maaş ortalama maaştan düşükse maaşları 1000 artırın
update worker set worker_salary=worker_salary+1000 where worker_salary<(select avg(worker_salary) from (select worker_salary from worker) as B);
-- Maaşın ortalama maaştan az olması durumunda maaşları ortalama maaşa eşitleyelim
update worker 
set worker_salary=(select avg(worker_salary) from (select * from worker) as B) 
where worker_salary < (select avg(worker_salary) from (select * from worker) as B);

select * from worker;

