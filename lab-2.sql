USE taxation_database;
ALTER TABLE income_record
DROP COLUMN category_name;
ALTER TABLE income_record
DROP COLUMN financial_year;
ALTER TABLE income_record
ADD category_id INT,ADD year_id INT;
UPDATE income_record SET category_id=1,year_id=6 WHERE income_id=1001;
UPDATE income_record SET category_id=1,year_id=6 WHERE income_id=1002;
UPDATE income_record SET category_id=2,year_id=6 WHERE income_id=1003;
UPDATE income_record SET category_id=1,year_id=6 WHERE income_id=1004;
UPDATE income_record SET category_id=2,year_id=6 WHERE income_id=1005;
UPDATE income_record SET category_id=2,year_id=6 WHERE income_id=1006;
ALTER TABLE income_record ADD CONSTRAINT fk_taxpayer FOREIGN KEY (taxpayer_id) REFERENCES taxpayer(taxpayer_id);
ALTER TABLE income_record ADD CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES income_category(category_id);
ALTER TABLE income_record ADD CONSTRAINT fk_year FOREIGN KEY (year_id) REFERENCES financial_year (year_id);
ALTER TABLE income_record
DROP COLUMN financial_yaer;
INSERT INTO income_record VALUES(1007,999,'ABC company',500000,'2026-03-31',NULL,1,6);
INSERT INTO income_record VALUES(1008,101,'ABC company',500000,'2026-03-31',NULL,20,6);
INSERT INTO income_record VALUES(1009,101,'ABC company',500000,'2026-03-31',NULL,1,15);
DELETE FROM taxpayer WHERE taxpayer_id=101;
DELETE FROM income_category WHERE category_id=1;
SELECT DISTINCT occupation FROM taxpayer;
SELECT DISTINCT category_name FROM income_category;
SELECT DISTINCT year_label FROM financial_year;
SELECT DISTINCT income_source FROM income_record;
SELECT full_name FROM taxpayer WHERE taxpayer_id IN (SELECT taxpayer_id FROM income_record WHERE category_id=1)
UNION
SELECT full_name FROM taxpayer WHERE taxpayer_id IN (SELECT taxpayer_id FROM income_record WHERE category_id=2);
SELECT income_source FROM income_record WHERE year_id=5
UNION
SELECT income_source FROM income_record WHERE year_id=6;
SELECT full_name FROM taxpayer WHERE occupation='teacher'
UNION
SELECT full_name FROM taxpayer WHERE occupation ='software engineer';
SELECT DISTINCT t.full_name
FROM taxpayer t
JOIN income_record i1 ON
t.taxpayer_id=i1.taxpayer_id
JOIN income_record i2 ON
t.taxpayer_id =i2.taxpayer_id
WHERE i1.category_id=1
AND i2.category_id=2;
SELECT DISTINCT t.full_name
FROM taxpayer t
JOIN income_record i1 ON 
t.taxpayer_id=i1.taxpayer_id
JOIN income_record i2 ON
t.taxpayer_id=i2.taxpayer_id
WHERE i1.year_id=5
AND i2.year_id=6;
SELECT full_name
FROM taxpayer
WHERE taxpayer_id IN 
(
SELECT taxpayer_id
FROM income_record
WHERE category_id=1
)
AND taxpayer_id NOT IN 
(
SELECT taxpayer_id FROM income_record WHERE category_id=2);
SELECT income_source
FROM income_record
WHERE year_id=6
AND income_source NOT IN
( SELECT income_source FROM income_record WHERE year_id=5);
SELECT full_name FROM taxpayer WHERE taxpayer_id IN 
( SELECT taxpayer_id FROM income_record WHERE category_id=1);
SELECT full_name FROM taxpayer WHERE taxpayer_id IN 
(SELECT taxpayer_id FROM income_record WHERE year_id=6);
SELECT * FROM income_record WHERE taxpayer_id IN 
(SELECT taxpayer_id FROM taxpayer WHERE occupation='software engineer');
SELECT full_name FROM taxpayer WHERE taxpayer_id NOT IN 
(SELECT taxpayer_id FROM income_record WHERE category_id=1);
SELECT full_name FROM taxpayer WHERE taxpayer_id NOT IN 
(SELECT taxpayer_id FROM income_record WHERE year_id=6);
SELECT DISTINCT occupation FROM taxpayer WHERE occupation NOT IN ('software engineer');
SELECT full_name 
FROM taxpayer t
WHERE EXISTS
( SELECT* FROM income_record i WHERE t.taxpayer_id=i.taxpayer_id);
SELECT category_name 
FROM income_category c
WHERE EXISTS
( SELECT* FROM income_record i WHERE c.category_id=i.category_id);
SELECT year_label
FROM financial_year f
WHERE EXISTS
( SELECT* FROM income_record i WHERE f.year_id=i.year_id);
SELECT full_name FROM taxpayer t WHERE NOT EXISTS (
SELECT * FROM income_record i WHERE t.taxpayer_id=i.taxpayer_id=i.taxpayer_id);
SELECT category_name FROM income_category c WHERE NOT EXISTS  
(SELECT * FROM income_record i WHERE c.category_id =i.category_id);
SELECT full_name,annual_income FROM taxpayer WHERE annual_income >ANY 
(SELECT annual_income FROM taxpayer WHERE occupation='teacher');
SELECT full_name,annual_income FROM taxpayer WHERE annual_income>ANY 
(SELECT amount FROM income_record WHERE category_id=2);
SELECT full_name ,annual_income FROM taxpayer WHERE annual_income >ALL
(SELECT annual_income FROM taxpayer WHERE occupation='teacher');
SELECT full_name,annual_income FROM taxpayer WHERE annual_income>ALL 
(SELECT amount FROM income_record WHERE category_id=2);




