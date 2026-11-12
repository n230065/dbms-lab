USE taxation_db;

SHOW TABLES;

SELECT * FROM Taxpayer;
SELECT * FROM Income_Category;
SELECT * FROM Financial_Year;
SELECT * FROM Income_Record;

SET AUTOCOMMIT = 0;

SELECT @@AUTOCOMMIT;

START TRANSACTION;

UPDATE Income_Record
SET amount = 850000
WHERE income_record_id = 3;

SELECT * FROM Income_Record
WHERE income_record_id = 3;

COMMIT;

START TRANSACTION;

UPDATE Income_Record
SET amount = 950000
WHERE income_record_id = 3;

SELECT * FROM Income_Record
WHERE income_record_id = 3;

ROLLBACK;

SELECT * FROM Income_Record
WHERE income_record_id = 3;

START TRANSACTION;

INSERT INTO Income_Record
(income_record_id, taxpayer_id, category_id, financial_year_id, amount)
SELECT 100, taxpayer_id, category_id, financial_year_id, amount
FROM Income_Record
WHERE income_record_id = 3;

SELECT * FROM Income_Record
WHERE income_record_id = 100;

ROLLBACK;

SELECT * FROM Income_Record
WHERE income_record_id = 100;

START TRANSACTION;

DELETE FROM Income_Record
WHERE income_record_id = 3;

SELECT * FROM Income_Record
WHERE income_record_id = 3;

ROLLBACK;

SELECT * FROM Income_Record
WHERE income_record_id = 3;

START TRANSACTION;

UPDATE Income_Record
SET amount = 850000
WHERE income_record_id = 3;

INSERT INTO Income_Record
(income_record_id, taxpayer_id, category_id, financial_year_id, amount)
SELECT 101, taxpayer_id, category_id, financial_year_id, amount
FROM Income_Record
WHERE income_record_id = 3;

SELECT * FROM Income_Record;

COMMIT;

START TRANSACTION;

UPDATE Income_Record
SET amount = 850000
WHERE income_record_id = 3;

SAVEPOINT income_update;

UPDATE Income_Record
SET amount = 1200000
WHERE income_record_id = 6;

ROLLBACK TO SAVEPOINT income_update;

SELECT * FROM Income_Record
WHERE income_record_id IN (3,6);

COMMIT;

START TRANSACTION;

INSERT INTO Income_Record
(income_record_id, taxpayer_id, category_id, financial_year_id, amount)
SELECT 102, taxpayer_id, category_id, financial_year_id, amount
FROM Income_Record
WHERE income_record_id = 3;

SAVEPOINT insert_point;

UPDATE Income_Record
SET amount = 1000000
WHERE income_record_id = 6;

ROLLBACK TO SAVEPOINT insert_point;

COMMIT;

START TRANSACTION;

UPDATE Income_Record
SET amount = 800000
WHERE income_record_id = 3;

SAVEPOINT first_point;

UPDATE Income_Record
SET amount = 900000
WHERE income_record_id = 6;

SAVEPOINT second_point;

UPDATE Income_Record
SET amount = 1000000
WHERE income_record_id = 3;

ROLLBACK TO SAVEPOINT first_point;

SELECT * FROM Income_Record;

COMMIT;

START TRANSACTION;

INSERT INTO Income_Record
(income_record_id, taxpayer_id, category_id, financial_year_id, amount)
SELECT 103, taxpayer_id, category_id, financial_year_id, amount
FROM Income_Record
WHERE income_record_id = 3;

UPDATE Income_Record
SET amount = 850000
WHERE income_record_id = 3;

SAVEPOINT before_delete;

DELETE FROM Income_Record
WHERE income_record_id = 6;

ROLLBACK TO SAVEPOINT before_delete;

COMMIT;

SELECT * FROM Income_Record;

START TRANSACTION;

UPDATE Income_Record
SET amount = 850000
WHERE income_record_id = 3;

SAVEPOINT savepoint_name;

RELEASE SAVEPOINT savepoint_name;

ROLLBACK;

START TRANSACTION;

UPDATE Income_Record
SET amount = 850000
WHERE income_record_id = 3;

SAVEPOINT sp1;

UPDATE Income_Record
SET amount = 950000
WHERE income_record_id = 6;

ROLLBACK TO SAVEPOINT sp1;

SELECT * FROM Income_Record;

ROLLBACK;

CREATE USER IF NOT EXISTS 'tax_clerk1'@'localhost'
IDENTIFIED BY 'Tax@123';

GRANT SELECT ON taxation_db.Taxpayer
TO 'tax_clerk1'@'localhost';

GRANT INSERT ON taxation_db.Income_Record
TO 'tax_clerk1'@'localhost';

SHOW GRANTS FOR 'tax_clerk1'@'localhost';

CREATE OR REPLACE VIEW Taxpayer_Income_Summary AS
SELECT * FROM Income_Record;

GRANT SELECT ON taxation_db.Taxpayer_Income_Summary
TO 'tax_clerk1'@'localhost';

SHOW GRANTS FOR 'tax_clerk1'@'localhost';

REVOKE INSERT ON taxation_db.Income_Record
FROM 'tax_clerk1'@'localhost';

SHOW GRANTS FOR 'tax_clerk1'@'localhost';

CREATE USER IF NOT EXISTS 'tax_data_entry'@'localhost'
IDENTIFIED BY 'Entry@123';

GRANT SELECT, INSERT ON taxation_db.Income_Record
TO 'tax_data_entry'@'localhost';

CREATE USER IF NOT EXISTS 'tax_officer'@'localhost'
IDENTIFIED BY 'Officer@123';

GRANT SELECT, INSERT, UPDATE ON taxation_db.Income_Record
TO 'tax_officer'@'localhost';

GRANT SELECT ON taxation_db.Taxpayer_Income_Summary
TO 'tax_officer'@'localhost';

REVOKE UPDATE ON taxation_db.Income_Record
FROM 'tax_officer'@'localhost';

SHOW GRANTS FOR 'tax_data_entry'@'localhost';

SHOW GRANTS FOR 'tax_officer'@'localhost';

CREATE OR REPLACE VIEW Taxation_Summary AS
SELECT * FROM Income_Record;

GRANT SELECT ON taxation_db.Taxation_Summary
TO 'tax_data_entry'@'localhost';

GRANT SELECT, INSERT ON taxation_db.Income_Record
TO 'tax_data_entry'@'localhost';

SHOW GRANTS FOR 'tax_data_entry'@'localhost';

GRANT DELETE ON taxation_db.Income_Record
TO 'tax_officer'@'localhost';

SHOW GRANTS FOR 'tax_officer'@'localhost';

REVOKE DELETE ON taxation_db.Income_Record
FROM 'tax_officer'@'localhost';

SHOW GRANTS FOR 'tax_officer'@'localhost';

START TRANSACTION;

INSERT INTO Income_Record
(income_record_id, taxpayer_id, category_id, financial_year_id, amount)
SELECT 104, taxpayer_id, category_id, financial_year_id, amount
FROM Income_Record
WHERE income_record_id = 3;

SELECT * FROM Income_Record
WHERE income_record_id = 104;

COMMIT;

START TRANSACTION;

UPDATE Income_Record
SET amount = 950000
WHERE income_record_id = 3;

ROLLBACK;

START TRANSACTION;

UPDATE Income_Record
SET amount = 850000
WHERE income_record_id = 3;

SAVEPOINT valid_update;

UPDATE Income_Record
SET amount = 1200000
WHERE income_record_id = 6;

ROLLBACK TO SAVEPOINT valid_update;

COMMIT;

CREATE OR REPLACE VIEW Taxation_Summary AS
SELECT * FROM Income_Record;

GRANT SELECT ON taxation_db.Taxation_Summary
TO 'tax_data_entry'@'localhost';

GRANT SELECT, INSERT ON taxation_db.Income_Record
TO 'tax_data_entry'@'localhost';

GRANT UPDATE ON taxation_db.Income_Record
TO 'tax_data_entry'@'localhost';

SHOW GRANTS FOR 'tax_data_entry'@'localhost';

REVOKE UPDATE ON taxation_db.Income_Record
FROM 'tax_data_entry'@'localhost';

SHOW GRANTS FOR 'tax_data_entry'@'localhost';

USE taxation_db;

SHOW TABLES;

SELECT * FROM Taxpayer;
SELECT * FROM Income_Category;
SELECT * FROM Financial_Year;
SELECT * FROM Income_Record;

SELECT @@AUTOCOMMIT;

SET AUTOCOMMIT = 1;

SELECT CURRENT_USER();

SHOW GRANTS FOR 'tax_clerk1'@'localhost';