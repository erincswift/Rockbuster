/* Query to list all customers in order of lifetime spending */

--Determine the top cities for customers
with top_cities as 	
(	
Select 	
	country.country_id,
	country.country as country,
	city.city_id,
	city.city as city,
	count(customer.customer_id) as cust_count
From customer	
Inner Join address on customer.address_id = address.address_id	
Inner Join city on address.city_id = city.city_id	
Inner Join country on city.country_id = country.country_id	
Group by country.country_id,	
	country.country,
	city.city_id,
	city.city
Order by cust_count desc	
)	
	
-- Queary customer lifetime value	and average purchase amount
Select customer.customer_id,	
	customer.first_name,
	customer.last_name,
	top_cities.country,
	top_cities.city,
	sum(payment.amount) as lifetime_value,
	avg(payment.amount) as average_purchase
From customer	
Join payment on customer.customer_id = payment.customer_id	
Join address on customer.address_id = address.address_id	
Join top_cities on address.city_id = top_cities.city_id	
Group by customer.customer_id,	
	top_cities.country,
	top_cities.city
Order by lifetime_value desc	
