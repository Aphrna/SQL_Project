	-- Group jobs by job title and compute the average salary (USD) for each.
    
    use practice;
    select `Job Title` , avg(`Salary in USD`) as `Average Salary` from latest_data_science_salaries group by `Job Title`;
    
    -- List the top 5 highest-paying job titles by average salary. 
    
    select `Job Title`,avg(`Salary in USD`)as avg from latest_data_science_salaries group by`Job Title` order by avg desc limit 5;
    
    -- Find the number of employees by experience level and company size
    
   select  `Experience Level`,`Company Size`, count(*) 
   from latest_data_science_salaries group by `Experience Level`,`Company Size`;
  SELECT `Employment Type`, COUNT(*) 
FROM latest_data_science_salaries 
GROUP BY `Employment Type`;

    SELECT `Experience Level`, `Company Size`, COUNT(*) AS `Employee Count`
FROM latest_data_science_salaries
GROUP by `Experience Level`, `Company Size`;
select * from latest_data_science_salaries ;

-- Identify job titles with an average salary above the overall average.

    SELECT `Job Title`, AVG(`Salary in USD`) AS `Average Salary`
FROM latest_data_science_salaries
GROUP BY `Job Title`
HAVING `Average Salary` > (
    SELECT AVG(`Salary in USD`) FROM latest_data_science_salaries
);

-- Identify job titles with an average salary above the overall average.
WITH salary_trends AS (
    SELECT 
        `Job Title`,
        `Year`,
        ROUND(AVG(`Salary in USD`), 2) AS `Average_Salary`,
        ROUND(
            AVG(`Salary in USD`) - 
            LAG(AVG(`Salary in USD`)) OVER (PARTITION BY `Job Title` ORDER BY `Year`),
            2
        ) AS `Salary_Change`
    FROM latest_data_science_salaries
    GROUP BY `Job Title`, `Year`
)

SELECT * 
FROM salary_trends
WHERE `Salary_Change` IS NOT NULL;
-- Which job titles have consistently appeared across all available years?
SELECT `Job Title` 
FROM latest_data_science_salaries
GROUP BY `Job Title`
HAVING COUNT(DISTINCT `Year`) = (SELECT COUNT(DISTINCT `Year`) FROM latest_data_science_salaries);

 -- Which company locations offer the highest average salaries for each employment type?
 SELECT `Employment Type`, `Company Location`, AVG(`Salary in USD`) AS avg_salary
FROM latest_data_science_salaries
GROUP BY `Employment Type`, `Company Location`
ORDER BY `Employment Type`, avg_salary DESC;

 -- Which job title and company location combination appears most frequently in the dataset?
 SELECT `Job Title`, `Company Location`, COUNT(*) AS occurrences
FROM latest_data_science_salaries
GROUP BY `Job Title`, `Company Location`
ORDER BY occurrences DESC
LIMIT 1;



