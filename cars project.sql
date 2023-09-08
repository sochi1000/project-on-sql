use carsonline;
select *
from car_types;
select *
from cars;
Write a query to display the car_id, price, car_make, car_model, and car_year for each car;
select c.car_id, c.price, ct.car_make, ct.car_model, ct.car_year
from cars c
inner join car_types ct
ON ct.car_type_id = c.car_type_id
where car_make = 'bmw' and car_year = '2019';

select ct.car_model,  AVG(c.price) as average_price
from cars c
inner join car_types ct
ON ct.car_type_id = c.car_type_id
where car_year = 2019
group by ct.car_model;
c. Display the average price for each car model during this year

Write a query to display the car_id, price and fuel_type_name for each car;
select *
from fuel_types;
select c.car_id, c.price, ft.fuel_type_name
from cars c
inner join fuel_types ft
ON c.fuel_type_id = ft.fuel_type_id;

b. Display the number of cars by each fuel_type_name. Sort the output by the number of cars (descending);
select fuel_type_name, count(*) AS number_of_cars
from cars c
inner join fuel_types ft
ON c.fuel_type_id = ft.fuel_type_id
group by fuel_type_name
order by count(*) desc;

Write a query to display the car_id, price and transmission_name for each car;
select *
from cars;
 select c.car_id, c.price, tt.transmission_name
 from cars c
INNER JOIN transmission_types tt
ON tt.transmission_type_id = c.transmission_type_id;

b. Display the average price for each transmission_name. Sort the output by the average price (descending);
SELECT tt.transmission_name, avg(c.price) AS average_price
from cars c
INNER JOIN transmission_types tt
ON tt.transmission_type_id = c.transmission_type_id
group by transmission_name
ORDER BY avg(price) desc;

Write a query to display the unique number of hybrid cars for each car_make. Sort the output by the number of cars (Descending);
[cars, car_types and fuel_types];

SELECT ct.car_make, COUNT(DISTINCT ct.car_model) AS 'number_of_hybrid_cars' 
FROM cars c JOIN fuel_types ft 
ON   c.fuel_type_id = ft.fuel_type_id
			JOIN car_types ct 
ON   c.car_type_id = ct.car_type_id
WHERE ft.fuel_type_name = 'Hybrid'
GROUP BY car_make
ORDER BY COUNT(DISTINCT car_model) DESC;

Write a query to display the number of manual-gearbox cars, by each car_year and car_make. Sort the output by the year (ascending)
[cars, car_types and transmission_types];
SELECT ct.car_year, ct.car_make, count(*) AS no_of_manual_gear_box_cars
from cars c
JOIN transmission_types tt
ON c.transmission_type_id =tt. transmission_type_id
join car_types ct
ON C.car_type_id = CT.car_type_id
Group BY ct.car_year, ct.car_make
order by ct.car_year;

 Write a query to display the customer_id, first_name, last_name, birth_date, and gender;
 select * from customers ;
 Select c.customer_id, c.first_name, c.last_name, c.birth_date, g.gender
 FROM customers c
 inner join genders g
 ON c.gender_code = g.gender_code;
 

b. Display the number of customers by each gender;
select gender, count(*) AS no_of_customers
FROM customers c
 inner join genders g
 ON c.gender_code = g.gender_code
 group by gender ;


c. Display the number of customers by each gender and age. Sort the output by the number of customers (descending);
select gender, 
count(*) AS number_of_customers, 
timestampdiff(year, birth_date,curdate()) AS age
FROM customers c
 inner join genders g
 ON c.gender_code = g.gender_code
 group by gender, age
 ORDER BY count(*) desc;

d. Restrict your query to for customers above the age 59;
select gender, 
count(*) AS number_of_customers, 
timestampdiff(year, birth_date,curdate()) AS age
FROM customers c
inner join genders g
 ON c.gender_code = g.gender_code
 where timestampdiff(year, birth_date,curdate()) > 59
 group by gender, age
 ORDER BY count(*) desc;
 Write a query to display the number of customers living in Australia;
 select * from locations;
select count(*) AS no_of_customers
from customers c
inner join locations l
on c.location_code = l.location_code
where l.country ='Australia';

b. Write another query to display the number of customers with updated phone_number 
living in Australia (customers who has value in phone_number);
select count(phone_number) AS n0_of_customers
from customers c
inner join locations l
on c.location_code = l.location_code
where l.country ='Australia';

c. Write another query to display the number of australian customers 
with NULL value in their phone_number, break down the result for each city, sort it by the count (descending).;
select city,count(*) AS n0_of_customers
from customers c
inner join locations l
on c.location_code = l.location_code
where country ='Australia' and phone_number is null
group by city
order by count(*) desc;

Write a query to display the customer_id and full name of customers who bought more than 5 cars;
select * from sales;
Select  c.customer_id, concat(c.first_name, ' ', c.last_name) AS full_name, count(*) AS no_of_cars
from customers c
inner join sales s
ON c.customer_id = s.customer_id
group by c.customer_id, concat(c.first_name, ' ', c.last_name)
Having count(*) >5;

Not every car on the cars table has been sold. Write a query to display the percent of sold cars;

SELECT COUNT(s.customer_id) / COUNT(*) * 100 AS 'percent_of_sold_cars'
FROM sales s RIGHT OUTER JOIN cars c 
ON s.car_id = c.car_id;

On 2019 (of purchase date), What was the average price of sold cars made by Audi?;
sales, cars and car types ;
select AVG(PRICE) AS average_price 
from sales s
join cars c
on c.car_id = s.car_id
JOIN 
car_types ct
ON c.car_type_id = ct.car_type_id
where year (s.purchase_date) = 2019 and car_make = 'Audi';



