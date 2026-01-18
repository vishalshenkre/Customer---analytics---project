create database customer_analytics;
use customer_analytics;
select * from customer_behavior_final limit 30;
select count(*) from customer_behavior_final;
rename table customer_behavior_final to cust_behavior;
show tables;


-- total customers
select count(*) as total_customers
from cust_behavior;

-- average income
select round(avg(income),0) as avg_income
from cust_behavior;

-- marital status wise customers
select marital_status, count(*) as total 
from cust_behavior
group by marital_status;

-- age group wise average spending
select age_group,
round(avg(total_spending),2) as 
avg_spending 
from cust_behavior
group by age_group;

-- compaign responce rate
select
round(sum(response)/count(*)*100,2) as
response_percentage
from cust_behavior;

-- customer with children vs no children
select
case 
when total_children >0 then 'with children'
else 'no children'
end as customer_type,
count(*) as total 
from cust_behavior
group by customer_type;

-- high value customers top 10
select *
from cust_behavior
order by total_spending desc
limit 10;

-- above average customers
select * 
from cust_behavior
where total_spending >
               (select avg(total_spending) from 
cust_behavior);

-- count of above average cusromers
select count(total_spending)
from cust_behavior
where total_spending >
               (select avg(total_spending) from 
cust_behavior);