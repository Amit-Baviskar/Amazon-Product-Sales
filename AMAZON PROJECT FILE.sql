CREATE DATABASE Amazon_Data; -- CREATED A DATABASE
USE Amazon_Data; -- SELECT DATABASE

CREATE TABLE  Amazon     -- CREATED A NEW TABLE WITH ATTRIBUTES(COLUMNS)
( 
 invoice_id Varchar(50),
 branch Varchar(50),
 city Varchar(50),
 customer_type Varchar(50),
 gender Varchar(10),
 product_line Varchar(50),
 unit_price Decimal(10,2),
 quantity INT,
 VAT  Decimal(6,4),
 total Decimal(10,2),
 date DATE,
 time TIME,
 payment_method Varchar(50),
 cogs Decimal (10,2),
 gross_margin_percentage Decimal(11,9),
 gross_income DECIMAL(10,2),
 rating  Decimal(2,1)
 
);

SELECT * FROM Amazon; -- CHEACKIN DATA IMPORTED CORRECTLY


-- CHECKING FOR NULL VALUES ------------------------------
SELECT SUM(CASE WHEN  invoice_id IS NULL THEN 1 ELSE 0 END) as Null_count_invoice_id ,
SUM(CASE WHEN  branch IS NULL THEN 1 ELSE 0 END) as Null_count_branch ,
SUM(CASE WHEN  city IS NULL THEN 1 ELSE 0 END) as Null_count_city,
SUM(CASE WHEN  customer_type IS NULL THEN 1 ELSE 0 END) as Null_count_customer_type,
SUM(CASE WHEN  gender IS NULL THEN 1 ELSE 0 END) as Null_count_gender,
SUM(CASE WHEN  product_line IS NULL THEN 1 ELSE 0 END) as Null_count_product_line,
SUM(CASE WHEN  unit_price IS NULL THEN 1 ELSE 0 END) as Null_count_unit_price,
SUM(CASE WHEN  quantity IS NULL THEN 1 ELSE 0 END) as Null_count_quantity,
SUM(CASE WHEN  VAT IS NULL THEN 1 ELSE 0 END) as Null_count_VAT,
SUM(CASE WHEN  total IS NULL THEN 1 ELSE 0 END) as Null_count_total,
SUM(CASE WHEN  date IS NULL THEN 1 ELSE 0 END) as Null_count_date,
SUM(CASE WHEN  time IS NULL THEN 1 ELSE 0 END) as Null_count_time,
SUM(CASE WHEN  payment_method IS NULL THEN 1 ELSE 0 END) as Null_count_payment_method,
SUM(CASE WHEN  cogs IS NULL THEN 1 ELSE 0 END) as Null_count_cogs,
SUM(CASE WHEN  gross_margin_percentage IS NULL THEN 1 ELSE 0 END) as Null_count_gross_margin_percentage,
SUM(CASE WHEN  gross_income IS NULL THEN 1 ELSE 0 END) as Null_count_gross_income,
SUM(CASE WHEN  time_of_day IS NULL THEN 1 ELSE 0 END) as Null_count_time_of_day,
SUM(CASE WHEN  day_of_week IS NULL THEN 1 ELSE 0 END) as Null_count_day_of_week,
SUM(CASE WHEN  month_name IS NULL THEN 1 ELSE 0 END) as Null_count_month_name
FROM Amazon ;



SELECT count(*) FROM Amazon
WHERE branch IS NULL;

SELECT count(*) FROM Amazon
WHERE CITY IS NULL;

SELECT count(*) FROM Amazon
WHERE CITY IS NULL;

SELECT count(*) FROM Amazon
WHERE customer_type IS NULL;

SELECT count(*) FROM Amazon
WHERE gender IS NULL;

SELECT count(*) FROM Amazon
WHERE product_line IS NULL;

SELECT count(*) FROM Amazon
WHERE unit_price IS NULL;

SELECT count(*) FROM Amazon
WHERE quantity IS NULL;

SELECT count(*) FROM Amazon
WHERE VAT IS NULL;

SELECT count(*) FROM Amazon
WHERE total IS NULL;

SELECT count(*) FROM Amazon
WHERE payment_method IS NULL;

SELECT count(*) FROM Amazon
WHERE cogs IS NULL;

SELECT count(*) FROM Amazon
WHERE gross_income IS NULL;

SELECT count(*) FROM Amazon
WHERE gross_margin_percentage IS NULL;

SELECT * FROM Amazon;

-- DATA WRANGLING IS COMPLETED-----------------------------

-- DATA ENGINEERING ---------------

-- ADDING A NEW COLUMN time_of_day
ALTER TABLE Amazon
ADD time_of_day VARCHAR(30);

Select * FROM Amazon; -- CHECKING THE column with time_of_day with NULL

SET SQL_SAFE_UPDATES=0; -- DISABLE SAFE MODE TO UPDATE
Update Amazon
SET time_of_day="Morning"
where timediff("12:00:00",time) > 0;

Update Amazon
SET time_of_day="Afternoon"
where timediff("18:00:00",time) >0 AND timediff("12:00:00",time) < 0 ;

Update Amazon
SET time_of_day="Evening"
WHERE timediff("18:00:00",time)<=0;

SET SQL_SAFE_UPDATES=1;  -- SAFE MODE ON 

Select * FROM Amazon; -- CHECKING THE TABLE AS PER REQUIREMENTS

ALTER TABLE Amazon
ADD day_of_week VARCHAR(30);

SELECT * FROM Amazon;

SELECT DISTINCT(DAYNAME(date)) FROM Amazon; -- CHECKING DISTINCT DAY OF WEEK

SET SQL_SAFE_UPDATES=0; -- DISABLE SAFE MODE TO UPDATE
 
Update Amazon
SET day_of_week="Saturday"
WHERE DAYNAME(date)="Saturday";

Update Amazon
SET day_of_week="Friday"
WHERE DAYNAME(date)="Friday";

Update Amazon
SET day_of_week="Sunday"
WHERE DAYNAME(date)="Sunday";

Update Amazon
SET day_of_week="Monday"
WHERE DAYNAME(date)="Monday";

Update Amazon
SET day_of_week="Thursday"
WHERE DAYNAME(date)="Thursday";

Update Amazon
SET day_of_week="Wednesday"
WHERE DAYNAME(date)="Wednesday";

Update Amazon
SET day_of_week="Tuesday"
WHERE DAYNAME(date)="Tuesday";


SET SQL_SAFE_UPDATES=1; -- SAFE MODE ON 

SELECT count(*) FROM Amazon
WHERE day_of_week IS NULL; -- CHECKING IF NOT THE CODE IS PROPERLY IMPLEMENTED

--
SELECT DISTINCT(MONTHNAME(date)) FROM Amazon; -- CHECKING DISTINCT DAY OF WEEK


 
ALTER TABLE Amazon                     -- ADDING COLUMNS FRO MONTH NAME
ADD month_name VARCHAR(30);

SELECT * FROM Amazon;                 -- CHECKING ADDED COLUMN

SET SQL_SAFE_UPDATES=0;                -- DISABLE SAFE MODE TO UPDATE

Update Amazon
SET month_name="January"
WHERE MONTHNAME(date)="January";

Update Amazon
SET month_name='March'
WHERE MONTHNAME(date)='March';

Update Amazon
SET month_name='February'
WHERE MONTHNAME(date)='February';

SET SQL_SAFE_UPDATES=0; -- SAFE MODE ON

SELECT COUNT(month_name) FROM Amazon
WHERE month_name IS NULL;              -- CHECKING FOR ANY NULL VALUE


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Business Questions To Answer:
-- ------------------------------------------------------------------------------------------------------------------------------------------


-- 1) What is the count of distinct cities in the dataset?
SELECT COUNT(DISTINCT(city)) as Count_Distinct_City 
FROM Amazon;


-- 2) For each branch, what is the corresponding city?
SELECT Branch,City as Corresponding_City from Amazon 
GROUP BY Branch,City
ORDER BY Branch,City;


-- 3)  What is the count of distinct product lines in the dataset?
SELECT COUNT(DISTINCT (product_line)) as Distinct_Product_Line_Count 
FROM amazon;

 
-- 4) Which payment method occurs most frequently?
SELECT payment_method,count(payment_method) as count_of_payment 
FROM Amazon
GROUP BY payment_method
ORDER BY count(payment_method) DESC;


-- 5) Which product line has the highest sales?
SELECT Product_line,SUM(cogs) as Sales  
FROM Amazon
GROUP BY Product_line
ORDER BY SUM(cogs) DESC;


-- 6) How much revenue is generated each month?
SELECT Month_Name,SUM(gross_income) as Revenue
FROM Amazon
GROUP BY Month_Name
ORDER BY Revenue DESC;


-- 7) In which month did the cost of goods sold reach its peak?
SELECT Month_Name,SUM(cogs)  as Revenue
FROM Amazon
GROUP BY Month_Name
ORDER BY SUM(cogs) DESC;


-- 8) Which product line generated the highest revenue?
SELECT Product_Line,SUM(gross_income) as Revenue
FROM Amazon
GROUP BY Product_Line
ORDER BY Revenue DESC;


-- 9) In which city was the highest revenue recorded?
SELECT City,sum(gross_income+cogs) as Revenue 
FROM amazon
GROUP BY City 
ORDER BY Revenue DESC;


-- 10) Which product line incurred the highest Value Added Tax?
SELECT Product_line , SUM(VAT)
FROM amazon
GROUP BY Product_Line;


-- 11) For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad."
SELECT amazon.Product_Line,
    CASE
        WHEN quantity > avg_quantity THEN "GOOD"
        ELSE "BAD"
    END AS SALES_INDICATOR
FROM (
    SELECT product_line, AVG(quantity) AS avg_quantity
    FROM amazon
    GROUP BY amazon.product_line
) AS avg_table
INNER JOIN amazon ON avg_table.product_line = amazon.product_line;


-- 12) Identify the branch that exceeded the average number of products sold.
SELECT Branch,City
FROM amazon
WHERE Quantity> (SELECT AVG(quantity) FROM amazon);


-- 13) Which product line is most frequently associated with each gender?
SELECT Product_Line,Gender
FROM amazon 
GROUP BY GENDER,Product_Line 
ORDER BY Product_Line;


-- 14) Calculate the average rating for each product line.
SELECT Product_line,AVG(rating)
FROM amazon 
GROUP BY Product_Line
ORDER BY AVG(rating) DESC;


-- 15) Count the sales occurrences for each time of day on every weekday.
SELECT COUNT(quantity),time_of_day,WEEKDAY(date),Month_Name
FROM amazon
GROUP BY WEEKDAY(date),Month_Name,time_of_day;


-- 16) Identify the customer type contributing the highest revenue.
SELECT customer_type,SUM(gross_income+cogs) AS Revenue
FROM amazon
GROUP BY customer_type
ORDER BY Revenue DESC;


-- 17)  Determine the city with the highest VAT percentage.
SELECT DISTINCT city,round(SUM(VAT) over(Partition by city),2) as VAT_total,round((SUM(VAT) over(Partition by city)/SUM(VAT) over()*100),2) AS VAT_percentage
FROM amazon
ORDER BY VAT_percentage DESC;


-- 18) Identify the customer type with the highest VAT payments.
SELECT customer_type,sum(VAT) AS TOTAL_VAT
FROM amazon
GROUP BY customer_type
ORDER BY TOTAL_VAT DESC;


-- 19) What is the count of distinct customer types in the dataset?
SELECT customer_type,COUNT(DISTINCT(customer_type)) AS CUSTOMER_TYPE
FROM amazon
GROUP BY customer_type;


-- 20) What is the count of distinct payment methods in the dataset?
SELECT COUNT(DISTINCT(payment_method)) AS PAYMENT_METHOD  
FROM amazon;


-- 21) Which customer type occurs most frequently?
SELECT customer_type,COUNT(customer_type) AS COUNT_CUSTOMER_TYPE 
FROM amazon
GROUP BY customer_type
ORDER By COUNT_CUSTOMER_TYPE DESC;


-- 22) Identify the customer type with the highest purchase frequency.
SELECT Customer_type,COUNT(invoice_id) as purcahse_frequency
FROM AMAZON 
GROUP BY customer_type
ORDER BY COUNT(invoice_id) DESC;


-- 23) Determine the predominant gender among customers.
SELECT gender,customer_type,COUNT(invoice_id)
FROM AMAZON 
GROUP BY gender,customer_type
ORDER BY COUNT(invoice_id) DESC;



-- 24) Examine the distribution of genders within each branch.
SELECT BRANCH, CITY, COUNT(GENDER) AS GENDER_SUM,GENDER
FROM amazon
GROUP BY BRANCH, CITY,GENDER
ORDER BY GENDER_SUM DESC;


-- 25) Identify the time of day when customers provide the most ratings.
SELECT avg(rating) AS avg_Rating , time_of_day
FROM amazon 
GROUP BY time_of_day;


-- 26) Determine the time of day with the highest customer ratings for each branch.
SELECT MAX(rating) AS MAX_Rating , time_of_day
FROM amazon 
GROUP BY time_of_day;


-- 27) Identify the day of the week with the highest average ratings.
SELECT day_of_week,avg(rating) as AVG_RATING
FROM amazon
GROUP BY day_of_week
ORDER BY AVG_RATING DESC;


-- 28) Determine the day of the week with the highest average ratings for each branch.
SELECT day_of_week,BRANCH,CITY,avg(rating) as MAX_AVG_RATING
FROM amazon
GROUP BY day_of_week,BRANCH,CITY
ORDER BY MAX_AVG_RATING DESC;

