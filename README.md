# 🍽️ Restaurant Orders Analysis — SQL Project

This project involves analyzing three months of restaurant order data to uncover customer trends, optimize the menu and improve business operations using advanced SQL techniques.

---

## 📌 Project Objectives

- Extract meaningful insights from transaction and menu data
- Identify most and least ordered dishes
- Determine peak ordering times and high-value orders
- Recommend data-driven decisions for inventory, staffing, and promotions

---

## 📂 Dataset Overview

The project is based on two tables:

1. *orders*
   - order_details_id (Primary Key)
   - order_id
   - order_date
   - order_time
   - item_id

2. *menu*
   - menu_item_id (Primary Key)
   - item_name
   - category
   - price

---

## 🔍 Key Analysis Questions

- What is the average price of dishes by category?
- Which are the most and least ordered items?
- What are the most and least expensive menu items?
- What time of day sees the highest number of orders?
- Which dishes sell best during peak times?
- Which day of the week has the most orders?
- What are the top 5 highest-value orders?
- What is the total dishes count for each category among the top five highest-spending orders?
- Which expensive items are underperforming?

---

## 🛠️ SQL Techniques Used

- JOIN clauses to merge orders and menu data
- Aggregations (SUM, COUNT, AVG) and GROUP BY for summaries
- CTEs (Common Table Expressions) for modular query design
- Window Functions to find top values
- CASE statements to categorize time-of-day buckets
- DATE functions to extract weekdays
- Subqueries for multi-step logic (e.g., filtering top orders)

---

## 📊 Insights & Outcomes

- Evening is the busiest time — ideal for promotions and added staff
- Italian and Asian categories dominate premium dishes
- A list of underperforming but high-priced items was generated for marketing action
- Mondays see the highest order volume, suggesting early-week marketing opportunities

---

## 📁 Files Included

- restaurant_orders.sql — all SQL queries
- restaurant_orders_analysis.pdf — visual report (presentation-style)
- menu.csv, orders.csv — sample datasets for practice

---

## 🚀 How to Run

1. Import orders.csv and menu.csv into your SQL environment (PostgreSQL recommended)
2. Run queries from restaurant_orders.sql in sequence
3. Explore, adapt, and expand the analysis as needed!

---

## 📎 License

This project is open-source and available for educational and portfolio use.

---

## 🙋‍♀️ About Me

I'm Sohini Mandal — aspiring data analyst passionate about transforming raw data into meaningful stories.  
Let’s connect on [LinkedIn]. https://www.linkedin.com/in/sohini-mandal05/


---
