USE taxation_database;
SELECT *
FROM income_record
WHERE amount=(SELECT MAX(amount) FROM income_record);
SELECT *
FROM income_record
WHERE amount=(SELECT MIN(amount) FROM income_record);
SELECT *
FROM income_record
WHERE amount>(SELECT AVG(amount) FROM income_record);
SELECT * FROM taxpayer
WHERE  taxpayer_id IN 
(SELECT taxpayer_id FROM taxpayer WHERE occupation='bussiness owner');
SELECT * FROM taxpayer
WHERE taxpayer_id IN 
(SELECT taxpayer_id FROM income_record);
SELECT * FROM taxpayer 
WHERE taxpayer_id in(SELECT taxpayer_id FROM income_record WHERE category_id in
(SELECT category_id FROM income_category WHERE category_name='business'));
SELECT * FROM income_record
WHERE year_id IN(SELECT year_id FROM financial_year WHERE year_label='2025-2026');
SELECT * FROM income_record
WHERE amount> 
(SELECT MIN(amount) FROM income_record WHERE category_id IN(SELECT category_id FROM income_category WHERE
category_name='business'));
SELECT * FROM income_record
WHERE amount<(SELECT MAX(amount) FROM income_record WHERE category_id IN(SELECT category_id FROM income_category
WHERE category_name='salary'));
SELECT * FROM taxpayer
WHERE taxpayer_id IN (SELECT taxpayer_id FROM income_record WHERE amount>( SELECT AVG(amount) FROM income_record));
SELECT * FROM income_category
WHERE category_id IN(SELECT category_id FROM income_record);
SELECT * FROM taxpayer
WHERE taxpayer_id NOT IN(SELECT taxpayer_id FROM income_record WHERE category_id IN(SELECT category_id FROM 
income_category WHERE category_name='investement'));
SELECT * FROM taxpayer
WHERE taxpayer_id IN(SELECT taxpayer_id FROM income_record WHERE amount=(SELECT MAX(amount) FROM income_record));
SELECT * FROM income_record
WHERE amount>(SELECT AVG(amount) FROM income_record WHERE category_id IN(SELECT category_id FROM income_category 
WHERE category_name='business'));
SELECT * FROM income_record
WHERE amount> ANY(SELECT amount FROM income_record WHERE category_id IN(SELECT category_id FROM
income_category WHERE category_name='investment'));
SELECT * FROM income_record
WHERE amount> ALL(SELECT amount FROM income_record WHERE category_id IN(SELECT category_id FROM
income_category WHERE category_name='investment'));
SELECT * FROM income_category
WHERE category_id IN(SELECT category_id FROM income_record WHERE amount=(SELECT MAX(amount) FROM income_record));
