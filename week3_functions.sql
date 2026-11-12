USE taxation_database;

SHOW TABLES;

SELECT * FROM Taxpayer;
SELECT * FROM Income_Category;
SELECT * FROM Financial_Year;
SELECT * FROM Income_Record;

SELECT UPPER(full_name) AS Uppercase_Name
FROM Taxpayer;

SELECT LOWER(occupation) AS Lowercase_Occupation
FROM Taxpayer;

SELECT full_name, LENGTH(full_name) AS Name_Length
FROM Taxpayer;

SELECT pan_number, LEFT(pan_number, 4) AS First_Four_Characters
FROM Taxpayer;

SELECT CONCAT(full_name, ' - ', occupation) AS Taxpayer_Details
FROM Taxpayer;

SELECT REPLACE(category_name, 'Income', 'Inc.') AS New_Category_Name
FROM Income_Category;

SELECT TRIM(full_name) AS Trimmed_Name
FROM Taxpayer;

SELECT SUBSTRING_INDEX(TRIM(full_name), ' ', 1) AS First_Name
FROM Taxpayer;

SELECT CONCAT('Taxpayer : ', full_name, '\nOccupation : ', occupation) AS Display_Details
FROM Taxpayer;

SELECT *
FROM Taxpayer
WHERE pan_number LIKE 'AP%';

SELECT annual_income, ROUND(annual_income) AS Rounded_Income
FROM Taxpayer;

SELECT annual_income, ABS(annual_income - 500000) AS Absolute_Value
FROM Taxpayer;

SELECT annual_income, POWER(annual_income, 2) AS Square_Income
FROM Taxpayer;

SELECT annual_income, MOD(annual_income, 1000) AS Remainder
FROM Taxpayer;

SELECT annual_income, ROUND(annual_income, 2) AS Rounded_Income
FROM Taxpayer;

SELECT annual_income, CEIL(annual_income) AS Ceiling_Value,
FLOOR(annual_income) AS Floor_Value
FROM Taxpayer;

SELECT FLOOR(1 + RAND() * 100) AS Random_Number;

SELECT annual_income, SQRT(annual_income) AS Square_Root
FROM Taxpayer;

SELECT annual_income, annual_income * 1.10 AS Income_After_Increment
FROM Taxpayer;

SELECT CURDATE() AS Today_Date;

SELECT NOW() AS Current_Date_Time;

SELECT start_date, YEAR(start_date) AS Financial_Year_Start_Year
FROM Financial_Year;

SELECT start_date, MONTH(start_date) AS Start_Month
FROM Financial_Year;

SELECT start_date, DAY(start_date) AS Start_Day
FROM Financial_Year;

SELECT start_date, DATE_ADD(start_date, INTERVAL 1 YEAR) AS End_Date
FROM Financial_Year;

SELECT start_date, DATE_ADD(start_date, INTERVAL 30 DAY) AS New_Date
FROM Financial_Year;

SELECT start_date, DATE_SUB(start_date, INTERVAL 7 DAY) AS Previous_Date
FROM Financial_Year;

SELECT start_date, DATEDIFF(CURDATE(), start_date) AS Number_Of_Days
FROM Financial_Year;

SELECT *
FROM Financial_Year
WHERE YEAR(start_date) = YEAR(CURDATE());

SELECT annual_income, CAST(annual_income AS SIGNED) AS Integer_Income
FROM Taxpayer;

SELECT taxpayer_id, CAST(taxpayer_id AS CHAR) AS Character_ID
FROM Taxpayer;

SELECT start_date, CAST(start_date AS DATETIME) AS Date_Time
FROM Financial_Year;

SELECT annual_income, CAST(annual_income AS DECIMAL(12,2)) AS Decimal_Income
FROM Taxpayer;

SELECT annual_income, CAST(annual_income AS CHAR) AS Income_As_String
FROM Taxpayer;

SELECT full_name, annual_income,
CAST(annual_income AS DECIMAL(12,2)) *
CAST(0.10 AS DECIMAL(4,2)) AS Estimated_Tax
FROM Taxpayer;