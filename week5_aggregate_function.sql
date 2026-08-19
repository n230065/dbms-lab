USE taxation_database;
SHOW TABLES;
SELECT * FROM taxpayer;
SELECT * FROM income_category;
SELECT * FROM financial_year;
SELECT * FROM income_record;
SELECT COUNT(*) 
FROM income_record;
SELECT  SUM(amount)
FROM income_record;
SELECT AVG(amount)
FROM income_record;
SELECT MAX(amount)
FROM income_record;
SELECT MIN(amount)
FROM income_record;
SELECT category_id,COUNT(*)
FROM income_record
GROUP BY category_id;
SELECT category_id,SUM(amount)
FROM income_record
GROUP BY category_id;
SELECT category_id,AVG(amount)
FROM income_record
GROUP BY category_id;
SELECT category_id,MAX(amount)
FROM income_record
GROUP BY category_id;
SELECT category_id,MIN(amount)
FROM income_record
GROUP BY category_id;
SELECT year_id,SUM(amount)
FROM income_record
GROUP BY year_id;
SELECT year_id,COUNT(*)
FROM income_record
GROUP BY year_id;
SELECT category_id,year_id,SUM(amount)
FROM income_record
GROUP BY category_id,year_id;
SELECT category_id,year_id,SUM(amount)
FROM income_record
GROUP BY category_id,year_id;

SELECT category_id,SUM(amount)
FROM income_record
GROUP BY category_id 
HAVING SUM(amount)>1000000;
SELECT category_id,AVG(amount) 
FROM income_record
GROUP BY category_id
HAVING AVG(amount)>500000;
SELECT year_id,COUNT(*) 
FROM income_record
GROUP BY year_id
HAVING COUNT(*)>3;
SELECT category_id,SUM(amount) 
FROM income_record 
GROUP BY category_id
ORDER BY SUM(amount) DESC;
SELECT category_id,SUM(amount)
FROM income_record
GROUP BY category_id
HAVING SUM(amount)>100000
ORDER BY SUM(amount) DESC;
SELECT category_id,SUM(amount) ,AVG(amount)
FROM income_record
GROUP BY category_id;
SELECT category_id,year_id,SUM(amount)
FROM income_record
GROUP BY category_id,year_id
ORDER BY SUM(amount) DESC;
SELECT i.year_id,COUNT(DISTINCT i.taxpayer_id)
FROM income_record i
JOIN taxpayer t
ON i.taxpayer_id=t.taxpayer_id
GROUP BY i.year_id;

SELECT category_id,SUM(amount)
FROM income_record
GROUP BY category_id
ORDER BY SUM(amount) DESC;
SELECT year_id,SUM(amount)
FROM income_record
GROUP BY year_id
ORDER BY SUM(amount) DESC;
SELECT category_id,AVG(amount) 
FROM income_record
GROUP BY category_id
ORDER BY AVG(amount) DESC;
SELECT category_id,COUNT(*) 
FROM income_record
GROUP BY category_id
HAVING COUNT(*)>2;
SELECT year_id,SUM(amount)
FROM  income_record 
GROUP BY year_id
HAVING SUM(amount)>1000000;
SELECT category_id,COUNT(*),SUM(amount),AVG(amount),MAX(amount),MIN(amount)
FROM income_record
GROUP BY category_id;