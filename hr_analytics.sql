-- = n b 
create database project_3;
use project_3;
select * from hr_1;
alter table hr_1 rename column ï»¿Age to Age;
select * from hr_2;
alter table hr_2 rename column `ï»¿Employee ID` to Employee_ID;
-- = n b 
-- Average Attrition rate for all Departments
select department,(avg(case when attrition = "Yes" then 1
				  else 0 end )*100) as attrition_rate from hr_1 
                  group by department;

-- Average Hourly rate of Male Research Scientist
select gender,JobRole,avg(hourlyrate) from hr_1 where Gender="Male" and JobRole="Research Scientist" group by gender,JobRole;

-- Attrition rate Vs Monthly income stats
select (avg(case when attrition = "Yes" then 1
				  else 0 end )*100) as attrition_rate,avg(MonthlyIncome) from hr_1
join
hr_2 on(hr_1.EmployeeNumber=hr_2.Employee_ID);
                  

-- Average working years for each Department
select Department,avg(TotalWorkingYears) from hr_1
join
hr_2 on(hr_1.EmployeeNumber=hr_2.Employee_ID) group by department;

-- = n b
-- Job Role Vs Work life balance
select JobRole,avg(WorkLifeBalance) from hr_1
join
hr_2 on(hr_1.EmployeeNumber=hr_2.Employee_ID) group by JobRole;

-- Attrition rate Vs Year since last promotion relation
select (avg(case when attrition = "Yes" then 1
				  else 0 end )*100) as attrition_rate,avg(YearsSinceLastPromotion) from hr_1
join
hr_2 on(hr_1.EmployeeNumber=hr_2.Employee_ID);



