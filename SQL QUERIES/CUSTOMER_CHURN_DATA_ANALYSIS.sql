
CREATE DATABASE CustomerChurnDB;
GO

USE CustomerChurnDB;



select * from customer;


-- TOTAL CUSTOMERS 
SELECT COUNT(*) AS TotalCustomers
FROM customer;


-- TOTAL CHURNED CUSTOMER ARE 
SELECT COUNT(*) AS ChurnedCustomers
FROM CUSTOMER
WHERE Churn = 1;


-- TOTAL RETAINED CUSTOMERS ARE 
SELECT COUNT(*) AS RetainedCustomers
FROM CUSTOMER
WHERE Churn = 0;


-- THE CHURN RATE IS 
SELECT
ROUND(
    COUNT(CASE WHEN Churn = 1 THEN 1 END)
    * 100.0 / COUNT(*),
 2
) AS ChurnRate
FROM Customer;



-- GENDER ANALYSIS 
SELECT
    Gender,
    COUNT(*) AS Customers
FROM Customer
GROUP BY Gender;

-- CHURN BY CUSTOMER GENDERS
SELECT
    Gender,
    COUNT(*) AS ChurnedCustomers
FROM Customer
WHERE Churn = 1
GROUP BY Gender;


-- SUBSCRIPTION TYPE ANALYSIS
SELECT
    [Subscription_Type],
    COUNT(*) AS Customers
FROM Customer
GROUP BY [Subscription_Type];


-- CHURN BY SUBSCRIPTION TYPE 
SELECT
    [Subscription_Type],
    COUNT(*) AS ChurnedCustomers
FROM Customer
WHERE Churn = 1
GROUP BY [Subscription_Type];


-- CONTRACT LENGTH ANALYSIS
SELECT
    [Contract_Length],
    COUNT(*) AS Customers
FROM Customer
GROUP BY [Contract_Length];


-- AVERAGE SPENDING 
SELECT
ROUND(AVG([Total_Spend]),2) AS AverageSpend
FROM Customer;

-- AVERAGE AGE 
SELECT
ROUND(AVG(Age),2) AS AverageAge
FROM Customer;


-- Churn Percentage by Subscription Type
SELECT
    Subscription_Type,
    COUNT(CASE WHEN Churn = 1 THEN 1 END) * 100.0 / COUNT(*) AS ChurnPercentage
FROM Customer
GROUP BY Subscription_Type;


-- Average Spend by Subscription Type
SELECT
    Subscription_Type,
    ROUND(AVG(Total_Spend),2) AS AverageSpend
FROM Customer
GROUP BY Subscription_Type;


-- Average Age by Subscription Type
SELECT
    Subscription_Type,
    ROUND(AVG(Age),2) AS AverageAge
FROM Customer
GROUP BY Subscription_Type;

-- Churn by Contract Length
SELECT
    Contract_Length,
    COUNT(*) AS ChurnedCustomers
FROM Customer
WHERE Churn = 1
GROUP BY Contract_Length;

-- Average Spending by Churn Status
SELECT
    Churn,
    ROUND(AVG(Total_Spend),2) AS AverageSpend
FROM Customer
GROUP BY Churn;


-- Average Support Calls by Churn
SELECT
    Churn,
    ROUND(AVG(Support_Calls),2) AS AvgSupportCalls
FROM Customer
GROUP BY Churn;

-- Average Payment Delay by Churn
SELECT
    Churn,
    ROUND(AVG(Payment_Delay),2) AS AvgPaymentDelay
FROM Customer
GROUP BY Churn;


-- Top 10 Highest Spending Customers
SELECT TOP 10
    CustomerID,
    Total_Spend
FROM Customer
ORDER BY Total_Spend DESC;


-- Age Group Analysis
SELECT
CASE
    WHEN Age < 30 THEN 'Young'
    WHEN Age BETWEEN 30 AND 50 THEN 'Middle Age'
    ELSE 'Senior'
END AS AgeGroup,
COUNT(*) AS Customers
FROM Customer
GROUP BY
CASE
    WHEN Age < 30 THEN 'Young'
    WHEN Age BETWEEN 30 AND 50 THEN 'Middle Age'
    ELSE 'Senior'
END;


-- Retention Rate
SELECT
ROUND(
COUNT(CASE WHEN Churn = 0 THEN 1 END)
* 100.0 / COUNT(*),
2
) AS RetentionRate
FROM Customer;