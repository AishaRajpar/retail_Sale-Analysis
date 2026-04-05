# 🛒 Retail Sales Analysis

## 📌 Project Overview

**Project Title**: Retail Sales Analysis
**Level**: Beginner

This project focuses on analyzing retail sales data using SQL. The goal is to extract meaningful insights such as customer behavior, sales trends, and performance across different categories and time periods. It includes database setup, data cleaning, exploratory data analysis (EDA), and business-driven queries.


## 🎯 Objectives

* Analyze total sales and customer activity
* Identify top-performing customers
* Find best-selling months and categories
* Understand sales distribution by gender and shift timing
* Perform data cleaning and validation

## 🗂️ Dataset Information

The dataset contains the following key columns:

* `transaction_id` → Unique ID for each transaction
* `customer_id` → Unique ID for customers
* `gender` → Customer gender
* `age` → Customer age
* `category` → Product category
* `quantity` → Number of items sold
* `price_per_unit` → Price of each item
* `cogs` → Cost of goods sold
* `total_sale` → Total sale amount
* `sale_date` → Date of transaction
* `sale_time` → Time of transaction

---

## 🛠️ Tools & Technologies

* SQL (PostgreSQL / MySQL / SQL Server)
* Git & GitHub for version control


## 📊 Key Analysis Performed

### 1. Total Transactions by Gender & Category

* Counted number of transactions for each gender in each category

### 2. Average Sales Per Month

* Calculated monthly average sales
* Identified trends over time

### 3. Best Selling Month Per Year

* Used window functions (`RANK()`) to identify top months

### 4. Top 5 Customers

* Found customers with highest total purchases

### 5. Unique Customers per Category

* Counted distinct customers in each category

### 6. Sales by Shift Timing

* Categorized orders into:

  * Morning (≤12)
  * Afternoon (12–17)
  * Evening (>17)
## 🧠 Key Concepts Used

* `GROUP BY`
* `ORDER BY`
* Aggregate functions (`SUM`, `COUNT`, `AVG`)
* Window functions (`RANK()`)
* `CASE` statements
* Data cleaning (NULL handling)
* Primary Key & Foreign Key constraints

---

## 🔍 Data Cleaning

* Checked for NULL values
* Removed incomplete records
* Ensured data consistency before analysis

---

## 📈 Findings

* Sales vary significantly across categories
* Certain months show higher sales (seasonal trends)
* Top customers contribute a large portion of revenue
* Sales distribution differs by gender and time shifts

---

## 🚀 How to Use

1. Clone this repository
2. Create database using `database_setup.sql`
3. Import dataset into your SQL environment
4. Run queries from `queries.sql`
5. Analyze results and modify queries if needed

---

## 📌 Conclusion

This project demonstrates how SQL can be used to analyze real-world retail data and generate actionable insights for business decision-making. It is a strong foundation project for beginners in data analysis.

---

## 🙌 Author

**Aisha Rajpar**

---
