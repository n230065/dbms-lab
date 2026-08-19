USE taxation_database;
SHOW TABLES;
SELECT * FROM taxpayer;
SELECT * FROM income_category;
SELECT *FROM  financial_year;
SELECT *FROM income_record;
SELECT t.full_name,i.income_source FROM taxpayer t INNER JOIN income_record i ON t.taxpayer_id=i.taxpayer_id;
SELECT t.full_name,c.category_name FROM taxpayer t INNER JOIN income_record i ON t.taxpayer_id =i.taxpayer_id 
INNER JOIN income_category c ON i.category_id=c.category_id;
SELECT i.income_source,f.year_label FROM income_record i INNER JOIN financial_year f ON i.year_id=f.year_id;
SELECT t.full_name,t.annual_income,i.amount FROM taxpayer t INNER JOIN income_record i ON t.taxpayer_id=i.taxpayer_id;
SELECT t.full_name,i.income_source,c.category_name,f.year_label FROM taxpayer t INNER JOIN income_record i ON
t.taxpayer_id=i.taxpayer_id INNER JOIN income_category c ON i.category_id=c.category_id INNER JOIN financial_year f
ON i.year_id=f.year_id;
SELECT t.full_name,i.income_source,c.category_name FROM taxpayer t INNER JOIN income_record i ON t.taxpayer_id=i.taxpayer_id
INNER JOIN income_category c ON i.category_id=c.category_id WHERE c.category_name='salary';
SELECT t.full_name,t.occupation,i.income_source,c.category_name FROM taxpayer t INNER JOIN income_record i ON 
t.taxpayer_id=i.taxpayer_id INNER JOIN income_category c ON i.category_id=c.category_id WHERE c.category_name='business';
SELECT t.full_name,t.pan_number,f.start_date,f.end_date FROM taxpayer t
INNER JOIN income_record i ON t.taxpayer_id=i.taxpayer_id INNER JOIN financial_year f ON i.year_id=f.year_id;
SELECT t.full_name ,c.category_name,c.description FROM taxpayer t INNER JOIN income_record i ON 
t.taxpayer_id=i.taxpayer_id INNER JOIN income_category c ON i.category_id =c.category_id;
SELECT t.full_name,t.pan_number,t.occupation,i.income_source,c.category_name,i.amount,f.year_label,f.start_date,f.end_date
FROM taxpayer t INNER JOIN income_record i ON t.taxpayer_id=i.taxpayer_id INNER JOIN income_category c ON i.category_id =c.category_id INNER JOIN
financial_year f ON i.year_id =f.year_id;
SELECT t.full_name,i.income_source FROM taxpayer t LEFT JOIN income_record i ON  t.taxpayer_id=i.taxpayer_id;
SELECT t.full_name,i.income_source FROM taxpayer t RIGHT JOIN income_record i ON  t.taxpayer_id=i.taxpayer_id;
SELECT t.full_name,c.category_name FROM taxpayer t CROSS JOIN income_category c;
SELECT t1.full_name AS taxpayer1,t2.full_name AS taxpayer2,t1.occupation FROM taxpayer t1 INNER JOIN taxpayer t2 ON
t1.occupation=t2.occupation AND t1.taxpayer_id<t2.taxpayer_id;
SELECT t.full_name,i.income_source,f.year_label FROM taxpayer t LEFT JOIN income_record i ON 
t.taxpayer_id=i.taxpayer_id LEFT JOIN financial_year f ON i.year_id=f.year_id;



