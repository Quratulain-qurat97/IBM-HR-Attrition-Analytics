-- .What is the age distribution of employees who leave, and which age group has the 
-- .highest attrition rate? 
SELECT
CASE
WHEN Age <25 THEN 'Under 25' 
WHEN Age BETWEEN 25 AND 34 THEN 'Age 25-34'
WHEN Age BETWEEN 35 AND 44 THEN 'Age 35-44'
WHEN Age BETWEEN 45 AND 54 THEN 'Age 45-54'
ELSE 'Above 55'
END AS Age_group,
COUNT(*) AS Total_employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS attrition_count,
ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)/COUNT(*)*100,2) AS Attrition_Rate_Pct
FROM hr_attrition
GROUP BY Age_group
ORDER BY Attrition_Rate_Pct DESC;


-- .How does attrition rate differ by gender and marital status?
SELECT 
Gender,
MaritalStatus,
COUNT(*) Total_employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS attrition_count,
ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)/COUNT(*)*100,2) AS Attrition_Rate_Pct
FROM hr_attrition
GROUP BY Gender, MaritalStatus
ORDER BY Gender, Attrition_Rate_Pct DESC;


-- .Does overtime correlate with higher attrition rates?
SELECT 
OverTime,
COUNT(*) AS Total_employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS attrition_count,
ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)/COUNT(*)*100,2) AS Attrition_Rate_Pct
FROM hr_attrition
GROUP BY OverTime;


-- .What is the average work-life balance rating of employees who quit versus those who stay?
SELECT 
Attrition,
ROUND(AVG(WorkLifeBalance),2) AS Avg_WorkLifeBalance
FROM hr_attrition
GROUP BY Attrition;


-- .Do employees who haven't been promoted in over 2 years have higher attrition rates?
SELECT 
CASE
WHEN YearsSinceLastPromotion>2 THEN 'More than 2 Years'
ELSE '2 Years or Less'
END AS promotion_status,
COUNT(*) AS Total_employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS attrition_count,
ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)/COUNT(*)*100,2) AS Attrition_Rate_Pct
FROM hr_attrition 
GROUP BY promotion_status;


-- .Which departments have the highest to lowest attrition rates?
SELECT 
Department,
COUNT(*) AS Total_employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)/COUNT(*)*100,2) AS Attrition_Rate_Pct
FROM hr_attrition
GROUP BY Department
ORDER BY Attrition_Rate_Pct DESC;


-- .Does business travel frequency correlate with higher attrition?

SELECT 
BusinessTravel,
COUNT(*) Total_employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS attrition_count,
ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)/COUNT(*)*100,2) AS Attrition_Rate_Pct
FROM hr_attrition
GROUP BY  BusinessTravel
ORDER BY Attrition_Rate_Pct DESC;


-- .Is monthly income significantly lower for employees who leave compared to those who stay?

SELECT 
Attrition,
ROUND(AVG(MonthlyIncome),2) AS Avg_income
FROM hr_attrition
GROUP BY Attrition
ORDER BY Avg_income DESC;







