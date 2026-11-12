  USE taxation_database;
  CREATE VIEW highest_income AS
  SELECT *
  FROM income_record 
  WHERE amount=(SELECT  MAX(amount) FROM income_record);
  SELECT * FROM highest_income;
  CREATE VIEW lowest_income AS
  SELECT * 
  FROM income_record WHERE amount=(SELECT MIN(amount) FROM income_record);
  SELECT * FROM lowest_income;
  CREATE VIEW avg_income AS
  SELECT *
  FROM income_record WHERE amount>(SELECT AVG(amount) FROM income_record);
  SELECT * FROM avg_income;
  CREATE VIEW high_income_records AS
  SELECT * FROM 
  income_record WHERE amount=(SELECT MAX(amount) FROM income_record);
  SELECT * FROM high_income_records;
  CREATE VIEW business_owners AS
  SELECT * FROM
  taxpayer WHERE occupation='bussiness owner';
  SELECT * FROM business_owners;
  CREATE VIEW taxpayers_with_income AS 
  SELECT * FROM taxpayer
  WHERE taxpayer_id IN(SELECT taxpayer_id FROM income_record);
  SELECT * FROM taxpayers_with_income;
  CREATE VIEW taxpayers_with_business_income AS
  SELECT * FROM taxpayer
  WHERE taxpayer_id IN(SELECT taxpayer_id FROM income_record WHERE category_id 
  IN(SELECT category_id FROM income_category WHERE category_name='business'));
  SELECT * FROM taxpayers_with_business_income;
  CREATE VIEW  income_2025_2026 AS
  SELECT ir.* 
  FROM income_record ir 
  INNER JOIN financial_year fy 
  ON ir.year_id =fy.year_id
  WHERE fy.year_label='2025-2026';
  SELECT * FROM income_2025_2026;