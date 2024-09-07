
--1.---Display table content-----
SELECT *  FROM sales_data.dbo.sales;

--2.---Identify the amouunt unique Country in the dataset
SELECT COUNT(DISTINCT Country) No_of_Country 
FROM sales_data.dbo.sales;

--3.---Identify the unique Country in the dataset
SELECT DISTINCT Country No_of_Country 
FROM sales_data.dbo.sales;


--4.---Identify unique Product_Category in the dataset
SELECT COUNT (DISTINCT Product_Category) No_of_Product_Category
FROM sales_data.dbo.sales;

--5.---Identify unique Sub_category in the dataset
SELECT COUNT(DISTINCT sub_category) Sub_categories 
FROM sales_data.dbo.sales;


--6.---- What age group bought the most bikes?
SELECT  Age_Group, Customer_Gender, SUM(order_quantity) Total_Order
FROM sales_data.dbo.sales
WHERE Product_Category = 'Bikes'
GROUP BY Age_Group,Customer_Gender
ORDER BY Total_order DESC;

--7.---- what age group bought the most Accessories?
SELECT  Age_Group,Customer_Gender, SUM(order_quantity) Total_Order
FROM sales_data.dbo.sales
WHERE Product_Category LIKE '%Accessories%'
GROUP BY Age_Group,Customer_Gender
ORDER BY Total_order DESC;


--8.---Get products with the total amount of sales
SELECT Product_Category, SUM(Revenue) Total_Revenue
FROM sales_data.dbo.sales
GROUP BY  Product_Category
ORDER BY Total_Revenue DESC;


--9.---Get products with the total amount of sales specifying the product subcategories
SELECT Product_Category, sub_category, SUM(Revenue) Total_Revenue
FROM sales_data.dbo.sales
GROUP BY Product_Category,sub_category
ORDER BY Total_Revenue DESC;


--10.---Top 10 sub-category with highest revenue based on country
SELECT TOP 10 Sub_Category, Country, SUM(revenue) Total_Revenue
FROM sales_data.dbo.sales
GROUP BY country, sub_category
ORDER BY Total_Revenue DESC;


--11.---Country's total revenue per product category and sub_category
SELECT Country, Product_Category, Sub_category, SUM(Revenue) Total_Revenue
FROM sales_data.dbo.sales
GROUP BY Country,Product_Category,Sub_category
ORDER BY Country,Total_Revenue DESC;


--12.---Total profit on bike sales for each country
SELECT Country,  SUM(profit) Total_Profit 
FROM sales_data.dbo.sales
WHERE Product_Category = 'Bikes'
GROUP BY Country
ORDER BY Total_Profit DESC;


--13.--Getting order by their product category.
SELECT Country, Product_category, Sub_category,
COUNT(order_quantity) Total_Order 
FROM sales_data.dbo.sales
GROUP BY Country, product_category,sub_category
ORDER BY Total_Order DESC;


-----SALES PERFORMANCE ANALYSIS-------

--14.----How do sales vary by age group, gender, or country over time?
SELECT Year,Month,Age_Group,Customer_Gender,Country,
    SUM(Order_Quantity) Total_Quantity_Sold,
    SUM(Revenue)  Total_Revenue
FROM sales_data.dbo.sales
GROUP BY Year, Month, Age_Group,Customer_Gender, Country
ORDER BY Year, Month, Age_Group, Customer_Gender, Country;


--15.---Country's generated revenue per year
SELECT Country,Year, SUM(Revenue) Total_Revenue
FROM sales_data.dbo.sales
GROUP BY Country,Year
ORDER BY Country,Year;


--16.---Which product categories or sub-categories generate the highest revenue or profit across different states or countries?
SELECT Country,Product_Category,Sub_Category,
SUM(revenue) Total_Revenue,
SUM(profit) Total_Profit
FROM sales_data.dbo.sales
GROUP BY Country,Product_Category,Sub_Category
ORDER BY Total_Profit DESC;


-------CUSTOMER BEHAVIOUR------ 

--17.---What product categories are most popular among different age groups or genders?
SELECT Age_Group,Customer_Gender,Product_Category,
SUM(order_quantity) Total_Qty_Sold
FROM sales_data.dbo.sales
GROUP BY Age_Group,Customer_Gender,Product_Category
ORDER BY Total_Qty_Sold DESC;


--18.---What are the most profitable customer segments based on age, gender, and location?
SELECT Country,Age_Group,Customer_Gender,Product_Category,
SUM(Profit) Total_Profit
FROM sales_data.dbo.sales
GROUP BY Country,Age_Group,Customer_Gender,Product_Category
ORDER BY Total_Profit DESC;


---19.---- what age group bought the most Clothing?
SELECT  Age_Group,Customer_Gender, SUM(order_quantity) Total_Order
FROM sales_data.dbo.sales
WHERE Product_Category LIKE '%Clothing%'
GROUP BY Age_Group,Customer_Gender
ORDER BY Total_order DESC;

--20.----Best year with highest sales
SELECT Year,SUM(Revenue) Total_Sales,
RANK() OVER(ORDER BY SUM(Revenue) DESC) Sales_Position
FROM sales_data.dbo.sales
GROUP BY Year
ORDER BY Sales_Position ASC;









