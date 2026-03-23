# US Household Income Exploratory Data Analysis

SELECT * 
FROM us_income_project.us_household_income
;

SELECT * 
FROM us_income_project.us_household_income_statistics
;

SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_income_project.us_household_income
GROUP BY State_Name
Order by 3 Desc
LIMIT 10
;


SELECT * 
FROM us_income_project.us_household_income u
INNER JOIN us_income_project.us_household_income_statistics us
	ON u.id = us.id
WHERE mean <> 0
;


SELECT u.State_Name, 
	ROUND(AVG(Mean),1) AS avg_mean,
	ROUND(AVG(median),1) AS avg_median
FROM us_income_project.us_household_income u
INNER JOIN us_income_project.us_household_income_statistics us
	ON u.id = us.id
WHERE mean <> 0
GROUP BY u.State_Name
ORDER BY 3 
LIMit 10
;

SELECT Type,
	COUNT(Type),
	ROUND(AVG(Mean),1) AS avg_mean,
	ROUND(AVG(median),1) AS avg_median
FROM us_income_project.us_household_income u
INNER JOIN us_income_project.us_household_income_statistics us
	ON u.id = us.id
WHERE mean <> 0
GROUP BY Type
HAVING COUNT(Type) > 100
ORDER BY 4 DESC
;

SELECT *
FROM us_household_income
WHERE type = 'Community'
;


SELECT u.State_Name, City, ROUND(AVG(Mean),1), ROUND(AVG(median),1) 
FROM us_income_project.us_household_income u
INNER JOIN us_income_project.us_household_income_statistics us
	ON u.id = us.id
WHERE u.state_name = 'Georgia'
GROUP BY u.State_Name, City
ORDER BY ROUND(AVG(Median),1) DESC
;