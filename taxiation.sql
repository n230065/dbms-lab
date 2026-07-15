CREATE DATABASE taxation_database;
USE taxation_database;
CREATE TABLE taxpayer(taxpayer_id INT PRIMARY KEY,pan_number VARCHAR(10) not null UNIQUE,full_name VARCHAR(100) not null,
date_of_birth DATE not null,occupation VARCHAR(50) not null,annual_income DECIMAL(12,2) not null,email VARCHAR(100) UNIQUE,
is_active BOOLEAN);
CREATE TABLE income_category(category_id INT PRIMARY KEY,category_name VARCHAR(50) not null UNIQUE,description VARCHAR(200) not null,
taxable BOOLEAN not null);
CREATE TABLE financial_year(year_id INT PRIMARY KEY,year_label VARCHAR(9) not null UNIQUE,start_date DATE not null,
end_date DATE not null, filing_deadline DATE,is_current BOOLEAN not null);
CREATE TABLE income_record(income_id INT PRIMARY KEY,taxpayer_id INT not null,income_source VARCHAR(100) not null,
category_name VARCHAR(50) not null,amount DECIMAL(12,2) not null,received_date DATE not null,financial_yaer VARCHAR(9) not null);
INSERT INTO taxpayer VALUES(101,'ABCDE1234F','ravi kumar','1995-06-15','software engineer',850000.00,'ravi.kumar@example.com',TRUE),
(102,'BCDEF2345G','priya sharma','1992-11-22','doctor',120000.00,'priya.sharma@example.com',TRUE),
(103,'CDEFG3456H','arjun reddy','1998-03-10','bussiness owner',180000.00,'arjun.reddy@example.com',TRUE),
(104,'DEFGH4567J','sneha patel','1998-08-05','teacher',620000.00,'sneha.patel@example.com',TRUE),
(105,'EFGHJ5678K','kiran roa','1990-01-18','freelancer',750000.00,'kiran.roa@example.com',TRUE),
(106,'FGHJK6789L','meera singh','1985-12-30','consultant',150000.00,'meera.singh@example.com',FALSE);
INSERT INTO income_category VALUES(1,'salary','income recieved from employment',TRUE),
(2,'business','income earned from business activities',TRUE),
(3,'house property','income recieved property or rent',TRUE),
(4,'capital gains','income from transfer of eligible assests',TRUE),
(5,'other sources','income such as bank interest ',TRUE),
(6,'agricultural income','income from eligible agricultural activities',FALSE);
INSERT INTO financial_year VALUES(1,'2020-2021','2020-04-01','2021-03-31','2021-07-31',FALSE),
(2,'2021-2022','2022-04-01','2022-03-31','2022-07-31',FALSE),
(3,'2022-2023','2023-04-01','2023-03-31','2023-07-31',FALSE),
(4,'2023-2024','2024-04-01','2024-03-31','2024-07-31',FALSE),
(5,'2024-2025','2025-04-01','2025-03-31','2025-07-31',FALSE),
(6,'2025-2026','2026-04-01','2026-03-31','2026-07-31',TRUE);
INSERT INTO income_record VALUES(1001,101,'technova solutions','salary',850000.00,'2026-03-31','2025-2026'),
(1002,102,'city care hospital','salary',1200000.00,'2026-03-31','2025-2026'),
(1003,103,'reddy enterprises','business',1800000.00,'2026-03-31','2025-2026'),
(1004,104,'sunrise school','salary',620000.00,'2026-03-31','2025-2026'),
(1005,105,'web design projects','business',750000.00,'2026-03-31','2025-2026'),
(1006,106,'professional consulting','business',1500000.00,'2026-03-31','2025-2026');
INSERT INTO taxpayer VALUES(107,'GHJKL7890M','rahul verma','1996-05-20','engineer',900000.00,'rahul.verma@example.com',TRUE);
UPDATE taxpayer
SET annual_income=950000.00
WHERE taxpayer_id=101;
UPDATE taxpayer
SET occupation='software consultant'
WHERE taxpayer_id=105;
UPDATE taxpayer
SET is_active=TRUE
WHERE taxpayer_id=106;
DELETE FROM taxpayer
WHERE taxpayer_id=107;
INSERT INTO income_category VALUES(7,'rental income','income recieved from rental properities',TRUE);
ALTER TABLE taxpayer
ADD phone_number VARCHAR(15);
ALTER TABLE income_record
ADD remarks VARCHAR(200);
ALTER TABLE taxpayer
MODIFY occupation VARCHAR(100);
CREATE TABLE tax_office(office_id INT PRIMARY KEY,office_name VARCHAR(100) NOT NULL ,city VARCHAR(50) not null);
INSERT INTO tax_office VALUES(1,'hyderabad tax office','hyderabad'),(2,'vijayawada tax office','vijayawada');
TRUNCATE TABLE tax_office;
DROP TABLE tax_office;




