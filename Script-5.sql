--1. List all customers who live in Texas (use JOINs)

select customer.first_name, customer.last_name, address.address, address.district
from customer
join address
on customer.address_id = address.address_id
where address.district = 'Texas';

--Kim Cruz, Jennifer Davis, Bryan Hardison, Ian Still, Richard Mccrary

--2. Get all payments above $6.99 with the Customer's Full Name

select customer.customer_id, customer.first_name, customer.last_name, payment.amount, payment.payment_date
from customer
join payment
on customer.customer_id = payment.customer_id
where amount > 6.99;

--Shows every payment made where amount is greater than 6.99 and the name on that payment(includes repeats because customer can have multiple transactions).

--3. Show all customers names who have made payments over $175(use subqueries)

select customer.customer_id, customer.first_name, customer.last_name
from customer
where customer.customer_id in (
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 175
);

--Table has 12 names no repeats with customers who have a total payment amount of 175+

--4. List all customers that live in Nepal (use the city table)

select customer.first_name, customer.last_name, address.address, city.city, country.country
from customer
join address
on customer.address_id = address.address_id
join city
on address.city_id = city.city_id
join country
on city.country_id = country.country_id
where country.country = 'Nepal';

--Only customer who has an address from nepal is Kevin Schuler

--5. Which staff member had the most transactions?

select count(staff.staff_id), staff.first_name, staff.last_name
from staff
join payment
on staff.staff_id = payment.staff_id
group by staff.staff_id
order by count(staff.staff_id) desc
limit 1;

-- Jon Stephens had the most transactions with 7,304

--6. How many movies of each rating are there?

select count(film_id), rating
from film
group by rating

--R: 195, NC-17: 209, PG-13: 223, PG: 194, G: 179 

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)

select customer.first_name, customer.last_name
from customer
where customer_id in (
	select customer_id
	from payment
	where amount > 6.99
);

--Table with 538 names of customers no repeats that had at least one payment amount > 6.99

--8.How many free rentals did our stores give away?

select count(payment_id) from payment
where amount = 0

-- Only 23 rentals where given by the store for free