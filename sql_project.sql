--SQL Retail Sales Analysis
create database sql_project_p1;


--create Table
create table retail_sales(
transactions_id	int primary key,
sale_date date,	
sale_time time,
customer_id	int,
gender varchar(15),
age	int,
category varchar(15),
quantiy	int,
price_per_unit	float,
cogs float,
total_sale float
);
select *from retail_sales
limit 10;

select count(*) from retail_sales;


--check null values
select *from retail_sales
where transactions_id IS NULL
OR
sale_date IS NULL
OR
sale_time IS NULL
OR
customer_id IS NULL
OR
gender IS NULL
OR
age IS NULL
OR
category IS NULL 
OR
quantiy IS NULL
OR
price_per_unit IS NULL
OR
cogs IS NULL
OR
total_sale IS NULL;


--delete rows where rows are null
delete  from retail_sales
where transactions_id IS NULL
OR
sale_date IS NULL
OR
sale_time IS NULL
OR
customer_id IS NULL
OR
gender IS NULL
OR
age IS NULL
OR
category IS NULL 
OR
quantiy IS NULL
OR
price_per_unit IS NULL
OR
cogs IS NULL
OR
total_sale IS NULL;


--Data Eploration
--How many sales we have?
select  count(*) as total_sale from retail_sales

--how many unique customers we have?
select  count( DISTINCT customer_id) as total_sale from retail_sales

select distinct category from retail_sales


-- Data Analysis & Business Key Problems & Answers

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)


-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
select *from retail_sales 
where sale_date='2022-11-05';



-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and 
--the quantity sold is more than 10 in the month of Nov-2022

select *  from retail_sales
where category='Clothing' 
AND
TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
AND
quantiy >= 4;


-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT 
    category,
    SUM(total_sale) as net_sale,
	COUNT(*) as total_orders
FROM retail_sales
GROUP BY 1;



-- Q.4 Write a SQL query to find the average age of customers 
--who purchased items from the 'Beauty' category.
select AVG(age) as avg_age from retail_sales 
where category='Beauty';


-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
select *From retail_Sales 
where total_sale >1000;


-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) 
--made by each gender in each category.
SELECT gender, category, COUNT(transactions_id) AS total_transactions
FROM retail_Sales
GROUP BY gender, category; 


-- Q.7 Write a SQL query to calculate the average sale for each month.
--Find out best selling month in each year
SELECT 
       year,
       month,
    avg_sale
FROM 
(    
SELECT 
    EXTRACT(YEAR FROM sale_date) as year,
    EXTRACT(MONTH FROM sale_date) as month,
    AVG(total_sale) as avg_sale,
    RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) as rank
FROM retail_sales
GROUP BY 1, 2
) as t1
WHERE rank = 1;



-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
select customer_id, sum(total_sale) as high_sale from retail_sales
GROUP BY 1
ORDER BY 2 DESC
limit 5;


-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

SELECT 
    category,    
    COUNT(DISTINCT customer_id) as cnt_unique_cs
FROM retail_sales
GROUP BY category;



--- Q.10 Write a SQL query to create each shift and number of orders 
--(Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

SELECT *,
    CASE
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END as shift
FROM retail_sales;

SELECT 
    shift,
    COUNT(*) as total_orders    
FROM hourly_sale
GROUP BY shift

-- End of project







