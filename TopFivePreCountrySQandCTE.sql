/*Query to determine the number of customers per each country who are in the top 5 customers using CTE and subquery.*/

--Top five customers by total amount paid
with top_five_cust as 
(
	Select payment.customer_id as customer_id,
		country.country_id as country_id,
		sum(payment.amount) as total_amount_pd,
		round(avg(payment.amount),2) as avg_amount_pd
	From payment
	Inner Join customer on payment.customer_id = customer.customer_id
	Inner join address on customer.address_id = address.address_id
	Inner Join city on address.city_id = city.city_id
	Inner Join country on city.country_id = country.country_id
	Group by 
		payment.customer_id,
		country.country_id
	Order by total_amount_pd desc
	Limit 5
)

--Number of top 5 customers in each country
Select 
	all_customer_count.country,
	all_customer_count.customer_count,
	count (distinct top_five_cust.customer_id) as top_customer_count
From
  --Use subquery to create table with total customer counts for each country
  (
  Select 
		country.country_id as country_id,
		country.country as country,
		count (customer_id) as customer_count
	From customer
	inner join address on customer.address_id = address.address_id
	Inner Join city on address.city_id = city.city_id
	Inner Join country on city.country_id = country.country_id
	Group By 
		country.country_id,
		country.country
	Order by customer_count desc
  ) as all_customer_count
Left Join top_five_cust on all_customer_count.country_id = top_five_cust.country_id
Group by 
	all_customer_count.country,
	all_customer_count.customer_count
Order by 
	top_customer_count desc,
	all_customer_count.customer_count desc
