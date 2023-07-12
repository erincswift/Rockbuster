/*Query to list the number of customers in each country*/

Select 	
	country.country,
	count(customer.customer_id) as cust_country
From customer	
Inner Join address on customer.address_id = address.address_id	
Inner Join city on address.city_id = city.city_id	
Inner Join country on city.country_id = country.country_id	
Group by country.country	
Order by cust_country desc	


