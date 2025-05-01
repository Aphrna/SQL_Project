use practice;
select * from latest_data_science_salaries;
 -- TOP 10 ROWS  
 
SELECT * FROM latest_data_science_salaries LIMIT 10;

-- 'List all unique Job Titles avaliable'

select distinct `Job Title`from latest_data_science_salaries;

-- 'Count how many full-time jobs are listed.' 

select count(*)from  latest_data_science_salaries where `Employment Type`='Full-Time' ;

-- Find the average salary (USD) for all employees.

select avg(`Salary in USD`) from latest_data_science_salaries;

-- 	List all records where the employee is located in the United States. 
select * from  latest_data_science_salaries where `Employee Residence` = 'United States'; 

-- Sort all records by salary (USD) in descending order.
select * from latest_data_science_salaries order by `Salary in USD` desc;

-- Get the number of employees per company location. 
SELECT `Company Location`, COUNT(`Company Location`)
FROM latest_data_science_salaries
GROUP BY `Company Location`;

-- Show the minimum and maximum salaries by job title.

SELECT `Job Title`, MIN(`Salary`)
FROM latest_data_science_salaries
GROUP BY `Job Title`
ORDER BY `Job Title` DESC;

-- Count the number of jobs posted each year. 
select `Year` , count(distinct `Job Title`) from  latest_data_science_salaries group by `Year`;
select `Year` , count(`Job Title`) from  latest_data_science_salaries group by `Year`;

-- Find all employees with a salary (USD) greater than 150,000.
select * from  latest_data_science_salaries where `Salary in USD` > 150000 order by `Salary in USD` ;

-- 	Display all columns where the expertise level is 'Expert'. 
select * from latest_data_science_salaries where `Expertise Level` = 'Expert';