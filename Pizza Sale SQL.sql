
SELECT * FROM PIZZA_SALES

--ALTERING THE TIME COLUMN

ALTER TABLE PIZZA_SALES 
ALTER COLUMN ORDER_TIME TIME

--1. TOTAL REVENUE:

SELECT SUM(TOTAL_PRICE) AS [TOTAL REVENUE] FROM PIZZA_SALES

--2. AVERAGE ORDER VALUE

SELECT (SUM(TOTAL_PRICE)/COUNT(DISTINCT ORDER_ID)) AS [AVERAGE ORDER VALUE] FROM PIZZA_SALES

--3. TOTAL PIZZAS SOLD

SELECT SUM(QUANTITY) AS [TOTAL PIZZAS SOLD] FROM PIZZA_SALES

--4. TOTAL ORDERS

SELECT COUNT(DISTINCT ORDER_ID) AS [TOTAL ORDERS] FROM PIZZA_SALES

--5. AVERAGE PIZZAS PER ORDER

SELECT ROUND((SUM(QUANTITY)/COUNT(DISTINCT ORDER_ID)),2) AS [AVERAGE PIZZAS PER ORDER] FROM PIZZA_SALES

--DAILY TREND FOR TOTAL ORDERS

SELECT DATENAME(WEEKDAY,ORDER_DATE) AS [ORDER DAY], COUNT(DISTINCT ORDER_ID) AS [TOTAL ORDERS] FROM PIZZA_SALES
GROUP BY DATENAME(WEEKDAY,ORDER_DATE)
ORDER BY [TOTAL ORDERS] DESC

-- HOURLY TREND FOR ORDERS

SELECT DATEPART(HOUR,ORDER_TIME) AS [ORDER TIME], COUNT(DISTINCT ORDER_ID) AS [TOTAL ORDERS] FROM PIZZA_SALES
GROUP BY DATEPART(HOUR,ORDER_TIME)
ORDER BY [ORDER TIME]

--TOTAL PIZZAS SOLD BY PIZZA CATEGORY

SELECT PIZZA_CATEGORY, SUM(QUANTITY) AS [TOTAL PIZZAS SOLD] FROM PIZZA_SALES
GROUP BY PIZZA_CATEGORY
ORDER BY [TOTAL PIZZAS SOLD] DESC

-- TOP 5 BEST SELLERS BY TOTAL PIZZAS SOLD

SELECT TOP 5 PIZZA_NAME, SUM(QUANTITY) AS [TOTAL PIZZAS SOLD] FROM PIZZA_SALES
GROUP BY PIZZA_NAME
ORDER BY [TOTAL PIZZAS SOLD] DESC

--BOTTOM 5 BEST SELLERS BY TOTAL PIZZAS SOLD

SELECT TOP 5 PIZZA_NAME, SUM(QUANTITY) AS [TOTAL PIZZAS SOLD] FROM PIZZA_SALES
GROUP BY PIZZA_NAME
ORDER BY [TOTAL PIZZAS SOLD]

--% OF SALES BY PIZZA CATEGORY

SELECT PIZZA_CATEGORY, ROUND(SUM(TOTAL_PRICE)*100/(SELECT SUM(TOTAL_PRICE) FROM PIZZA_SALES),2) AS [% OF SALES] FROM PIZZA_SALES
GROUP BY PIZZA_CATEGORY

--% OF SALES BY PIZZA SIZE

SELECT PIZZA_SIZE, ROUND(SUM(TOTAL_PRICE)*100/(SELECT SUM(TOTAL_PRICE) FROM PIZZA_SALES),2) AS [% OF SALES] FROM PIZZA_SALES
GROUP BY PIZZA_SIZE